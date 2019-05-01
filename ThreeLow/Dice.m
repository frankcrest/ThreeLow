//
//  Dice.m
//  ThreeLow
//
//  Created by Frank Chen on 2019-05-01.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (NSInteger)randomizeDiceValue{
    _currentValue = arc4random_uniform(6) + 1;
    return _currentValue;
}

- (NSString *)description
{
    NSString* diceDescription = [NSString string];
    switch (_currentValue) {
        case 1:
            diceDescription = @"⚀";
            break;
        case 2:
            diceDescription = @"⚁";
            break;
        case 3:
            diceDescription = @"⚂";
            break;
        case 4:
            diceDescription = @"⚃";
            break;
        case 5 :
            diceDescription = @"⚄";
            break;
        case 6:
            diceDescription = @"⚅";
            break;
        default:
            break;
    }
    
    if (self.held) {
        diceDescription = [NSString stringWithFormat:@"[%@]", diceDescription];
    }
    
    return diceDescription;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _held = NO;
    }
    return self;
}

@end
