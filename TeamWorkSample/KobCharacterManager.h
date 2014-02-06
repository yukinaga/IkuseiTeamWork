//
//  KobCharacterManager.h
//  TeamWorkSample
//
//  Created by 小林 佑太郎 on 2014/02/06.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import "CharacterManager.h"

@interface KobCharacterManager : CharacterManager{
    int generationCount;
}

+ (KobCharacterManager *)sharedManager;
-(void)doAction;

@end

