//
//  HeartManager.m
//  IkuseiTeamWork
//
//  Created by Yukinaga Azuma on 2014/02/10.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import "HeartManager.h"
#import "ViewController.h"
#import "HeartImageView.h"

@implementation HeartManager

static HeartManager *sharedData_ = nil;

+ (HeartManager *)sharedManager{
    @synchronized(self){
        if (!sharedData_) {
            sharedData_ = [HeartManager new];
        }
    }
    return sharedData_;
}

- (id)init
{
    self = [super init];
    if (self) {
        _imageArray = [NSMutableArray new];
    }
    return self;
}

-(void)doAction{
    static const int generationInterval = 100;
    static const float speed = 0.5;
    
    //発生頻度
    if(generationCount > generationInterval){
        HeartImageView *hIV = [HeartImageView new];
        hIV.image = [UIImage imageNamed:@"heart.png"];
        hIV.frame = CGRectMake(0, 0, ScreenW/15.0, ScreenW/15.0);
        int randNum = arc4random()%(int)ScreenW;
        hIV.center = CGPointMake(randNum, ScreenH+20);
        hIV.contentMode = UIViewContentModeScaleAspectFit;
        [_vC.view addSubview:hIV];
        [_imageArray addObject:hIV];
        generationCount = 0;
    }
    generationCount++;
    
    //移動
    NSMutableArray *removeArray = [NSMutableArray new];
    for(HeartImageView *hIV in _imageArray){
        
        //変形しながら上に移動
        hIV.center = CGPointMake(hIV.center.x + 1.5*cosf(0.05*hIV.count),
                                 hIV.center.y - speed);
        float size = 1.0+0.1*cosf(0.1*hIV.count);
        hIV.transform = CGAffineTransformMakeScale(size, size);
        if (hIV.center.y < -20) {
            [removeArray addObject:hIV];
        }
        hIV.count++;
    }
    //削除
    for (HeartImageView *hIV in removeArray) {
        [_imageArray removeObject:hIV];
        [hIV removeFromSuperview];
    }
}

@end
