//
//  ViewController.m
//  TeamWorkSample
//
//  Created by Yukinaga Azuma on 2014/02/05.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import "ViewController.h"
#import "CollisionManager.h"
#import "ScoreManager.h"
#import "AzumaCharacterManager.h"
#import "KaigeCharacterManager.h"
#import "HeartManager.h"
#import "StarManager.h"


@interface ViewController ()

@end

@implementation ViewController


//iwasedesu

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Delegate of characters
    [AzumaCharacterManager sharedManager].vC = self;
    [KaigeCharacterManager sharedManager].vC = self;
    [HeartManager sharedManager].vC = self;
    [StarManager sharedManager].vC = self;

    //Delecate of score manager
    [ScoreManager sharedManager].vC = self;
    
    sTimer = [NSTimer scheduledTimerWithTimeInterval:0.02
                                              target:self
                                            selector:@selector(do:)
                                            userInfo:nil
                                             repeats:YES];
    
    UIImage *background = [UIImage imageNamed:@"background.jpeg"];
    self.view
    .backgroundColor = [UIColor colorWithPatternImage:background];
    
    
    
}

//yuzawaです,yuzawaです

-(void)do:(NSTimer *)timer{
    //各キャラのムーブ
    [[AzumaCharacterManager sharedManager] doAction];
    [[KaigeCharacterManager sharedManager] doAction];
    [[HeartManager sharedManager] doAction];
    [[StarManager sharedManager] doAction];

    //衝突
    [[CollisionManager sharedManager] collision];
    
    //スコア表示
    [[ScoreManager sharedManager] displayScore];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
