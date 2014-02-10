//
//  AzumaCharacterManager.m
//  TeamWorkSample
//
//  Created by Yukinaga Azuma on 2014/02/05.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import "AzumaCharacterManager.h"
#import "AzumaCharacterIamgeView.h"
#import "ViewController.h"
#import "ScoreManager.h"
#import "CollisionManager.h"

@implementation AzumaCharacterManager

static AzumaCharacterManager *sharedData_ = nil;

+ (AzumaCharacterManager *)sharedManager{
    @synchronized(self){
        if (!sharedData_) {
            sharedData_ = [[AzumaCharacterManager alloc] init];
        }
    }
    return sharedData_;
}

- (id)init
{
    self = [super init];
    if (self) {
        //発生地点
        self.gPoint = CGPointMake(ScreenW*0.25, ScreenH*0.25);
        //スコアに登録
        self.charaImage = [UIImage imageNamed:@"images.png"];
        self.charaDataArray[0] = self.charaImage;
        //衝突あり
        [[CollisionManager sharedManager].allCharaArray addObject:self.charaArray];
        //発生カウント
        generationCount = 0;
    }
    return self;
}

//発生
-(void)doAction{
    static const int generationInterval = 40;
    static const int charaSpeed = 1.0;
    
    //発生頻度
    if(generationCount > generationInterval){
        AzumaCharacterIamgeView *aCIV = [AzumaCharacterIamgeView new];
        aCIV.image = self.charaImage;
        aCIV.frame = CGRectMake(0, 0, ScreenW/15.0, ScreenW/15.0);
        aCIV.center = self.gPoint;
        aCIV.contentMode = UIViewContentModeScaleAspectFit;
        [self.vC.view addSubview:aCIV];
        aCIV.transform = CGAffineTransformMakeScale(0, 0);
        [UIView animateWithDuration:0.5 animations:^{
            aCIV.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }completion:^(BOOL finished){
            [self.charaArray addObject:aCIV];
        }];
        generationCount = 0;
    }
    generationCount++;
    
    //移動
    for(AzumaCharacterIamgeView *aCIV in self.charaArray){
        
        if (aCIV.isDead) {
            continue;
        }
                
        //ランダムな方向に移動、停止を繰り返す
        if(aCIV.count == 0){
            int randNum = arc4random()%360;
            float randAngle = 2*M_PI*randNum/360.0;
            aCIV.speed = CGVectorMake(charaSpeed*cosf(randAngle),
                                      charaSpeed*sinf(randAngle));
        }else if(aCIV.count == 100){
            aCIV.speed = CGVectorMake(0, 0);
        }else if(aCIV.count >= 200){
            aCIV.count = 0;
            continue;
        }
        aCIV.count++;
        
        //壁で反射
        [self reflection:aCIV];
        
        //移動
        aCIV.center = CGPointMake(aCIV.center.x+aCIV.speed.dx,
                                  aCIV.center.y+aCIV.speed.dy);
    }
}

@end
