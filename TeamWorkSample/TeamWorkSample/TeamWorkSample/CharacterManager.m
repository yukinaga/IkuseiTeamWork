//
//  CharacterManager.m
//  TeamWorkSample
//
//  Created by Yukinaga Azuma on 2014/02/05.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import "CharacterManager.h"
#import "CharacterIamgeView.h"
#import "CollisionManager.h"
#import "ScoreManager.h"

@implementation CharacterManager

- (id)init
{
    self = [super init];
    if (self) {
        //キャラのイメージを格納する配列
        _charaArray = [NSMutableArray new];
        [[CollisionManager sharedManager].allCharaArray addObject:_charaArray];
        
        //キャラの画像と上記の配列を配列にしてScoreManagerに渡す
        _charaDataArray = [NSMutableArray new];

    }
    return self;
}

//壁で反射
-(void)reflection:(CharacterIamgeView *)view{
    if (view.center.x < 0) {
        view.speed = CGVectorMake(fabsf(view.speed.dx), view.speed.dy);
    }
    if (view.center.x > ScreenW) {
        view.speed = CGVectorMake(-fabsf(view.speed.dx), view.speed.dy);
    }
    if (view.center.y < 0) {
        view.speed = CGVectorMake(view.speed.dx, fabsf(view.speed.dy));
    }
    if (view.center.y >  ScreenH){
        view.speed = CGVectorMake(view.speed.dx, -fabsf(view.speed.dy));
    }
}

@end
