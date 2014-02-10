//
//  StarManager.h
//  IkuseiTeamWork
//
//  Created by Anri Iwase on 2014/02/10.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  ViewController;

@interface StarManager : NSObject{
    int     generationCount;
}

@property(nonatomic, weak) ViewController *vC;
@property(nonatomic) NSMutableArray *imageArray;

+ (StarManager *)sharedManager;
-(void)doAction;

@end
