//
//  ScoreManager.m
//  TeamWorkSample
//
//  Created by Yukinaga Azuma on 2014/02/06.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import "ScoreManager.h"

@implementation ScoreManager

static ScoreManager *sharedData_ = nil;

+ (ScoreManager *)sharedManager{
    @synchronized(self){
        if (!sharedData_) {
            sharedData_ = [[ScoreManager alloc] init];
        }
    }
    return sharedData_;
}

- (id)init
{
    self = [super init];
    if (self) {
        _allScoreArray = [NSMutableArray new];
        _displayedObjectsArray = [NSMutableArray new];
        _barArray = [NSMutableArray new];
    }
    return self;
}

-(void)displayScore{
    if (count >= 10) {
        for (UIView *view in _displayedObjectsArray) {
            [view removeFromSuperview];
        }
        [_displayedObjectsArray removeAllObjects];
        int i = 0;
        int sum = 0;
        for (NSArray *cArray in _allScoreArray) {
            
            UIImageView *iconView = [UIImageView new];
            iconView.image = cArray[0];
            iconView.frame = CGRectMake(15+30*i, 10, 20, 20);
            [_vC.view addSubview:iconView];
            
            [_displayedObjectsArray addObject:iconView];
            
            UILabel *numLabel= [UILabel new];
            numLabel.text = [NSString stringWithFormat:@"%d", [cArray[1] count]];
            numLabel.frame = CGRectMake(10+30*i, 30, 30, 30);
            numLabel.adjustsFontSizeToFitWidth = YES;
            numLabel.textAlignment = NSTextAlignmentCenter;
            [_vC.view addSubview:numLabel];
            
            [_displayedObjectsArray addObject:numLabel];
            
            sum += [cArray[1] count];

            i++;
        }
        if (sum>0) {
            for (UIView *view in _barArray) {
                [view removeFromSuperview];
            }
            [_barArray removeAllObjects];
            UIView *baseView = [UIView new];
            baseView.backgroundColor = [UIColor greenColor];
            baseView.frame = CGRectMake(150, 30, 150, 20);
            [_vC.view addSubview:baseView];
            [_barArray addObject:baseView];
            
            UIView *leftBarView = [UIView new];
            leftBarView.backgroundColor = [UIColor grayColor];
            float width = 150.0*[_allScoreArray[0][1] count]/sum;
            leftBarView.frame = CGRectMake(150, 30, width, 20);
            [_vC.view addSubview:leftBarView];
            [_barArray addObject:leftBarView];
        }

        
        count = 0;
    }
    count++;
}

@end
