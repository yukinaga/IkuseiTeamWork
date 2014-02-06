//
//  CollisionManager.h
//  TeamWorkSample
//
//  Created by Yukinaga Azuma on 2014/02/05.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollisionManager : NSObject

@property(nonatomic) NSMutableArray *allCharaArray;

+ (CollisionManager *)sharedManager;
-(void)collision;

@end
