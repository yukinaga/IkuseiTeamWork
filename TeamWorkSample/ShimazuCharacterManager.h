//
//  ShimazuCharacterManager.h
//  TeamWorkSample
//
//  Created by 嶋津智章 on 2014/02/06.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import "CharacterManager.h"

@interface ShimazuCharacterManager : CharacterManager{
    int generationCount;
}

+ (ShimazuCharacterManager *)sharedManager;
-(void)doAction;

@end
