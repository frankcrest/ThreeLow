//
//  GameController.h
//  ThreeLow
//
//  Created by Frank Chen on 2019-05-01.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

@property NSMutableArray* dices;
@property NSMutableArray* dicesHeld;

-(NSString*)holdDie;

-(void)resetDice;

-(void)reroll;
@end

NS_ASSUME_NONNULL_END
