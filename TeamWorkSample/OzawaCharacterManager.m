//
//  OzawaCharacterManager.m
//  TeamWorkSample
//
//  Created by 小澤寿晴 on 2014/02/06.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import "OzawaCharacterManager.h"
#import "OzawaCharacterImageView.h"
#import "ViewController.h"
#import "ScoreManager.h"

@implementation OzawaCharacterManager


static OzawaCharacterManager *sharedData_ = nil;

+ (OzawaCharacterManager *)sharedManager{
    @synchronized(self){
        if (!sharedData_) {
            sharedData_ = [[OzawaCharacterManager alloc] init];
        }
    }
    return sharedData_;
}

- (id)init
{
    self = [super init];
    if (self) {
        //発生地点
        self.gPoint = CGPointMake(ScreenW*0.15, ScreenH*0.15);
        //スコアに登録
        self.charaImage = [UIImage imageNamed:@"ozawa.png"];
        self.charaDataArray = @[self.charaImage, self.charaArray];
        [[ScoreManager sharedManager].allScoreArray addObject:self.charaDataArray];
        //発生カウント
        generationCount = 0;
    }
    return self;
}

//発生頻度
-(void)doAction{
    static const int generationInterval = 40;
    static const int charaSpeed = 1.0;
    
    //発生
    if(generationCount > generationInterval){
        OzawaCharacterImageView *aCIV = [OzawaCharacterImageView new];
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
    for(OzawaCharacterImageView *aCIV in self.charaArray){
        
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
