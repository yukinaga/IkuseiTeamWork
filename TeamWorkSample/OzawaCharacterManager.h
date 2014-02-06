//
//  OzawaCharacterManager.h
//  TeamWorkSample
//
//  Created by 小澤寿晴 on 2014/02/06.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import "CharacterManager.h"

@interface OzawaCharacterManager : CharacterManager{
    int generationCount;

}

+ (OzawaCharacterManager *)sharedManager;
-(void)doAction;



@end
