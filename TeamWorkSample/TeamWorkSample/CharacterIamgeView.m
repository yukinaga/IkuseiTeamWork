//
//  CharacterIamgeView.m
//  TeamWorkSample
//
//  Created by Yukinaga Azuma on 2014/02/05.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import "CharacterIamgeView.h"

@implementation CharacterIamgeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _count = 0;
        _isDead = NO;
    }
    return self;
}

@end
