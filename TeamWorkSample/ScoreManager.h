//
//  ScoreManager.h
//  TeamWorkSample
//
//  Created by Yukinaga Azuma on 2014/02/06.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScoreManager : NSObject{
    int count;
}

@property(nonatomic) NSMutableArray *allScoreArray;
@property(nonatomic, readonly) NSMutableArray *displayedObjectsArray;
@property(nonatomic, readonly) NSMutableArray *barArray;
@property(nonatomic) UIViewController *vC;

+ (ScoreManager *)sharedManager;
-(void)displayScore;
@end
