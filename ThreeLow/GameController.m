//
//  GameController.m
//  ThreeLow
//
//  Created by Frank Chen on 2019-05-01.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"
#import "InputController.h"

@implementation GameController

- (NSString *)holdDie{
    InputController *inputController = [[InputController alloc]init];
    NSString* output = @"Held Dice:";
    NSLog(@"Enter the index of the dice you want to hold seperated by one space, i.e 1 2 to hold dice in position 1 and 2");
    char userInput[255];
    fgets(userInput, 255, stdin);
    NSString* userInputString = [NSString stringWithCString:userInput encoding:NSUTF8StringEncoding];
    NSString* userInputStringWithoutNewLine = [userInputString substringToIndex:[userInputString length] - 1];
    NSArray* diceIndexes = [userInputStringWithoutNewLine componentsSeparatedByString:@" "];
    NSMutableArray* heldDiceIndexes = [[NSMutableArray alloc]init];
    
    //convert diceIndexString into integers
    for (NSString* diceIndex in diceIndexes) {
        NSInteger diceIndexInt = [diceIndex integerValue];
        [heldDiceIndexes addObject:[NSNumber numberWithInteger:diceIndexInt]];
    }
    
    //add dice in index to heldDice Array
    for (NSNumber* diceIndex  in heldDiceIndexes) {
        int diceIntValue = [diceIndex intValue];
        [_dicesHeld addObject:_dices[diceIntValue - 1]];
        Dice* dice = _dices[diceIntValue - 1];
        dice.held = YES;
    }
    
    for (Dice* dice in _dicesHeld) {
        dice.held = YES;
    }
    
    //output string for user
    NSString* firstOutput = @"Held Dice:";
    for (Dice* dice in _dicesHeld) {
        firstOutput = [firstOutput stringByAppendingFormat:@"%@", dice];
    }
    NSLog(@"%@", firstOutput);
    
    NSLog(@"Do you want to unhold any dices? y/n");
    NSString* userInputs = [inputController getUserInput];
    if([userInputs isEqualToString:@"y"]){
        NSLog(@"Enter the index of the dice you want to unhold seperated by one space, i. 1 2");
        NSString* userInput = [inputController getUserInput];
        NSArray* dicesToUnholdInString = [userInput componentsSeparatedByString:@" "];
        NSMutableArray* diceIndexesToUnhold = [[NSMutableArray alloc]init];
        
        //add index of unhold dices into diceIndexToUnhold Array
        for (NSString* diceIndex in dicesToUnholdInString) {
            NSInteger diceIndexInt = [diceIndex integerValue];
            [diceIndexesToUnhold addObject: [NSNumber numberWithInteger:diceIndexInt]];
        }
        
        //turn flags to off
        for (NSNumber* diceIndex in diceIndexesToUnhold) {
            NSInteger diceIndexInt= [diceIndex integerValue] - 1;
            Dice* dice = _dicesHeld[diceIndexInt];
            dice.held = NO;
        }

        NSMutableArray* newHeldArray = [[NSMutableArray alloc]init];
        for (NSNumber* diceIndexToUnhold in diceIndexesToUnhold) {
            NSInteger diceIndexInInt = [diceIndexToUnhold integerValue] -1;
            if (_dicesHeld[diceIndexInInt] != nil) {
                [newHeldArray addObject:_dicesHeld[diceIndexInInt]];
            }
        }
        _dicesHeld = newHeldArray;
        
        for (Dice* dice in _dicesHeld) {
            if (dice.held == YES){
                output = [output stringByAppendingFormat:@"[%@]", dice];
            }
        }
        
    }else{
        output = firstOutput;
    }
    
    return output; 
}

-(void)resetDice{
    for (Dice* dice in _dices) {
        dice.held = NO;
    }
}

- (void)reroll{
    for (Dice* dice in _dices) {
        if (dice.held == NO) {
            dice.currentValue = dice.randomizeDiceValue;
        }
    }
}

-(NSInteger)calculateScore{
    NSInteger totalScore = 0;
    for (Dice* dice in _dices) {
        totalScore += dice.currentValue;
    }
    return totalScore;
}

@end
