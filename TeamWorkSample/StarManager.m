//
//  StarManager.m
//  IkuseiTeamWork
//
//  Created by Anri Iwase on 2014/02/10.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import "StarManager.h"
#import "ViewController.h"
#import "StarImageView.h"

@implementation StarManager

static StarManager *sharedData_ = nil;

+ (StarManager *)sharedManager{
    @synchronized(self){
        if (!sharedData_) {
            sharedData_ = [StarManager new];
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
        StarImageView *hIV = [StarImageView new];
        hIV.image = [UIImage imageNamed:@"star2.png"];
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
    for(StarImageView *hIV in _imageArray){
        
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
    for (StarImageView *hIV in removeArray) {
        [_imageArray removeObject:hIV];
        [hIV removeFromSuperview];
    }
}

@end
