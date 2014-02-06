//
//  CollisionManager.m
//  TeamWorkSample
//
//  Created by Yukinaga Azuma on 2014/02/05.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import "CollisionManager.h"
#import "CharacterIamgeView.h"

@implementation CollisionManager

static CollisionManager *sharedData_ = nil;

+ (CollisionManager *)sharedManager{
    @synchronized(self){
        if (!sharedData_) {
            sharedData_ = [[CollisionManager alloc] init];
        }
    }
    return sharedData_;
}

- (id)init
{
    self = [super init];
    if (self) {
        _allCharaArray = [NSMutableArray new];
    }
    return self;
}

//衝突
-(void)collision{
    for (NSMutableArray *charaGroupArray in _allCharaArray) {
        for (CharacterIamgeView *cIV in charaGroupArray) {
            BOOL isCollision = NO;
            for (NSMutableArray *opponentCharaArray in _allCharaArray) {
                if (charaGroupArray == opponentCharaArray) {
                    continue;
                }
                for (CharacterIamgeView *oIV in opponentCharaArray) {
                    if (oIV.isDead || cIV.isDead)continue;
                    if (fabsf(cIV.center.x-oIV.center.x) > 60 ||
                        fabsf(cIV.center.y-oIV.center.y) > 60) {
                        continue;
                    }
                    float distance = sqrtf(powf(cIV.center.x-oIV.center.x, 2)+
                                           powf(cIV.center.y-oIV.center.y, 2));
                    if (distance < (cIV.frame.size.width+
                                    cIV.frame.size.height+
                                    oIV.frame.size.width+
                                    oIV.frame.size.height)/4){
                        isCollision = YES;
                        cIV.isDead = YES;
                        oIV.isDead = YES;
                        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
                            cIV.transform = CGAffineTransformMakeScale(1.5, 1.5);
                            oIV.transform = CGAffineTransformMakeScale(1.5, 1.5);
                        }completion:^(BOOL finished){
                            [UIView animateWithDuration:0.5 animations:^{
                                cIV.transform = CGAffineTransformMakeScale(0, 0);
                                oIV.transform = CGAffineTransformMakeScale(0, 0);
                            }completion:^(BOOL finished){
                                [cIV removeFromSuperview];
                                [charaGroupArray removeObject:cIV];
                                [oIV removeFromSuperview];
                                [opponentCharaArray removeObject:oIV];
                            }];
                        }];
                    }
                    if (isCollision) {
                        break;
                    }
                }
                if (isCollision) {
                    break;
                }
            }
        }
    }
}
@end
