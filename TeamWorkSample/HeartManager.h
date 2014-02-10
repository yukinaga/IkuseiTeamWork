//
//  HeartManager.h
//  IkuseiTeamWork
//
//  Created by Yukinaga Azuma on 2014/02/10.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  ViewController;

@interface HeartManager : NSObject{
    int     generationCount;
}

@property(nonatomic, weak) ViewController *vC;
@property(nonatomic) NSMutableArray *imageArray;

+ (HeartManager *)sharedManager;
-(void)doAction;

@end
