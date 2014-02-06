//
//  KaigeCharacterManager.h
//  TeamWorkSample
//
//  Created by Yukinaga Azuma on 2014/02/05.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import "CharacterManager.h"

@interface KaigeCharacterManager : CharacterManager{
    int generationCount;
}

+ (KaigeCharacterManager *)sharedManager;
-(void)doAction;

@end
