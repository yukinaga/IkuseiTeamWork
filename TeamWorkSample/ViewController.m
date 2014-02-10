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


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Delegate of characters
    [AzumaCharacterManager sharedManager].vC = self;
    [KaigeCharacterManager sharedManager].vC = self;
    [HeartManager sharedManager].vC = self;

    //Delecate of score manager
    [ScoreManager sharedManager].vC = self;
    
    sTimer = [NSTimer scheduledTimerWithTimeInterval:0.02
                                              target:self
                                            selector:@selector(do:)
                                            userInfo:nil
                                             repeats:YES];
}

-(void)do:(NSTimer *)timer{
    //各キャラのムーブ
    [[AzumaCharacterManager sharedManager] doAction];
    [[KaigeCharacterManager sharedManager] doAction];
    [[HeartManager sharedManager] doAction];

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
