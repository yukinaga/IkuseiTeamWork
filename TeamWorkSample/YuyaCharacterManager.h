//
//  YuyaCharacterManager.h
//  TeamWorkSample
//
//  Created by 松島 祐也 on 2014/02/06.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CharacterManager.h"

@interface YuyaCharacterManager : CharacterManager{
    int generationCount;
}

+ (YuyaCharacterManager *)sharedManager;
-(void)doAction;

@end
