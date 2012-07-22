//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Yoon Kim on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain
@synthesize operandStack = _operandStack;

- (NSMutableArray *)operandStack
{
    if(_operandStack == nil) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

- (void) pushOpernad : (double) operand
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double)popOperand
{
    NSNumber *oprandObject = [self.operandStack lastObject];
    if(oprandObject) [self.operandStack removeLastObject];
    return [oprandObject doubleValue];
}
- (double) performOperation : (NSString *) operation
{
    double result = 0;
        NSLog(@"operation = %@",operation);

    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand]  + [self popOperand];
    }else if([@"*" isEqualToString:operation]) {
        result = [self popOperand] * [self popOperand];
    }
    // calculate result
    return result;
    
}
@end
