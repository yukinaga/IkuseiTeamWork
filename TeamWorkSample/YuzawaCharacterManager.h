//
//  YuzawaCharacterManager.h
//  TeamWorkSample
//
//  Created by TomoyaYuzawa on 2014/02/06.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CharacterManager.h"

@interface YuzawaCharacterManager : CharacterManager{
    int generationCount;
}

+ (YuzawaCharacterManager *)sharedManager;
-(void)doAction;

@end
