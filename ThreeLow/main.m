//
//  main.m
//  ThreeLow
//
//  Created by Frank Chen on 2019-05-01.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"Your Dices Are:");
        Dice *dice1 = [[Dice alloc]init];
        [dice1 randomizeDiceValue];
        NSLog(@"%@", dice1);
        Dice *dice2 = [[Dice alloc]init];
        [dice2 randomizeDiceValue];
        NSLog(@"%@", dice2);
        Dice *dice3 = [[Dice alloc]init];
        [dice3 randomizeDiceValue];
        NSLog(@"%@", dice3);
        Dice *dice4 = [[Dice alloc]init];
        [dice4 randomizeDiceValue];
        NSLog(@"%@", dice4);
        Dice *dice5 = [[Dice alloc]init];
        [dice5 randomizeDiceValue];
        NSLog(@"%@", dice5);
        
        GameController* gameController = [[GameController alloc]init];
        gameController.dices = [NSMutableArray arrayWithObjects:dice1,dice2,dice3,dice4,dice5, nil];
        gameController.dicesHeld = [[NSMutableArray alloc]init];
        
        BOOL gameFinished = NO;
        while(!gameFinished){
            NSLog(@"Please enter hold/roll to hold or roll dices:");
            char userInput[255];
            fgets(userInput, 255, stdin);
            NSString* userInputString = [NSString stringWithCString:userInput encoding:NSUTF8StringEncoding];
            NSString* userInputStringWithoutNewLine = [userInputString substringToIndex:[userInputString length]- 1];
            if ([userInputStringWithoutNewLine isEqualToString:@"roll"]) {
                NSLog(@"in roll");
                [dice1 randomizeDiceValue];
                [dice2 randomizeDiceValue];
                [dice3 randomizeDiceValue];
                [dice4 randomizeDiceValue];
                [dice5 randomizeDiceValue];
                for (Dice* dice in gameController.dices) {
                    NSLog(@"%@", dice.description);
                }
            }else if ([userInputStringWithoutNewLine isEqualToString:@"hold"]){
                NSLog(@"%@",gameController.holdDie);
                [gameController reroll];
                for (Dice* dice in gameController.dices) {
                    NSLog(@"%@", dice.description);
                }
                
                gameFinished = [gameController.dices[0] held] && [gameController.dices[1]held] && [gameController.dices[2]held] && [gameController.dices[3]held] && [gameController.dices[4]held];
                
//                //another way is to use a counter instead of boolean
//                BOOL isGameOver = YES;
//                for (Dice* dice in gameController.dices) {
//                    Dice* lastDice = gameController.dices[4];
//                    //if we are not holding the dice the game shold continue
//                    if (dice.held == YES && lastDice.held == YES ) {
//                        isGameOver = YES;
//                    }else{
//                        break;
//                    }
//                }
//                //if game is over
//                
//                if (isGameOver == YES) {
//                    gameFinished = YES;
//                } else{
//                    gameFinished = NO;
//                }
                
            }else if ([userInputStringWithoutNewLine isEqualToString:@"reset"]){
                [gameController resetDice];
                for (Dice* dice in gameController.dices) {
                    NSLog(@"%@", dice.description);
                }
            }
            
        }
        NSLog(@"Your score is : %ld", gameController.calculateScore);
    }
    return 0;
}
