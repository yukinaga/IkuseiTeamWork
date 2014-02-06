//
//  IwaseCharacterManager.h
//  TeamWorkSample
//
//  Created by Anri Iwase on 2014/02/06.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import "CharacterManager.h"


@interface IwaseCharacterManager : CharacterManager{
    int generationCount;
}

+ (IwaseCharacterManager *)sharedManager;
-(void)doAction;

@end
