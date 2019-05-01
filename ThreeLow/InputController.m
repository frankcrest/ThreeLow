//
//  InputController.m
//  ThreeLow
//
//  Created by Frank Chen on 2019-05-01.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "InputController.h"

@implementation InputController

-(NSString *)getUserInput{
    char userInput[255];
    fgets(userInput, 255, stdin);
    NSString *userInputString = [NSString stringWithCString:userInput encoding:NSUTF8StringEncoding];
    NSCharacterSet *newLineChar = [NSCharacterSet characterSetWithCharactersInString:@"\n"];
    NSString *userInputStringWithoutNewLine = [userInputString stringByTrimmingCharactersInSet:newLineChar];
    return userInputStringWithoutNewLine;
}

@end
