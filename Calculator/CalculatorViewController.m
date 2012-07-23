//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Yoon Kim on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"
@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end
@implementation CalculatorViewController

@synthesize display = _display;
@synthesize brain = _brain;
-(CalculatorBrain *)brain
{
    if(!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;

- (IBAction)digitPressed:(UIButton *)sender 
{
    NSString *digit = sender.currentTitle;

    if(self.userIsInTheMiddleOfEnteringANumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
    }else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }    
}
- (IBAction)operation:(UIButton *)sender 
{
    if(self.userIsInTheMiddleOfEnteringANumber) [self Enter];   
    double result = [self.brain performOperation: sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
}
- (IBAction) Enter 
{
    [self.brain pushOpernad:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.display.text = [NSString stringWithFormat:@"%g", [self.brain popOperand]];
}

@end
