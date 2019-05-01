//
//  Dice.h
//  ThreeLow
//
//  Created by Frank Chen on 2019-05-01.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dice : NSObject

@property NSInteger currentValue;

@property (nonatomic)BOOL held;

-(NSInteger) randomizeDiceValue;


@end

NS_ASSUME_NONNULL_END
