//
//  CharacterManager.h
//  TeamWorkSample
//
//  Created by Yukinaga Azuma on 2014/02/05.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  ViewController;
@class  CharacterIamgeView;

@interface CharacterManager : NSObject
@property(nonatomic) ViewController *vC;
@property(nonatomic) NSMutableArray *charaArray;
@property(nonatomic) CGPoint gPoint;
@property(nonatomic) UIImage *charaImage;
@property(nonatomic) NSArray *charaDataArray;

-(void)reflection:(CharacterIamgeView *)view;

@end
