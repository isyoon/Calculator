//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Yoon Kim on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
- (void) pushOpernad : (double) operand;
- (double)performOperation : (NSString *) operation;
- (double)popOperand;
@end
