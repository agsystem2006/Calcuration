//
//  CalculationMotion.h
//  Calculation
//
//  Created by 荒井　利成 on 13/01/10.
//  Copyright (c) 2013年 Toshinaru Arai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CalculationViewController;

@interface CalculationMotion : NSObject
{

    float output,input,downdot,result;
    
}

@property enum {START, END} STARTorEND;
@property enum {Normal, Dot} InputStyle;
@property enum {Plus, Minus} PLUSorMINUS;
@property enum {Non, Add, Sub, Mul, Div} Calculation;
@property enum {Enable, Disable} Roop;

- (void)key0:(id)sender controller:(CalculationViewController*)controller;
- (void)key1:(id)sender controller:(CalculationViewController*)controller;
- (void)key2:(id)sender controller:(CalculationViewController*)controller;
- (void)key3:(id)sender controller:(CalculationViewController*)controller;
- (void)key4:(id)sender controller:(CalculationViewController*)controller;
- (void)key5:(id)sender controller:(CalculationViewController*)controller;
- (void)key6:(id)sender controller:(CalculationViewController*)controller;
- (void)key7:(id)sender controller:(CalculationViewController*)controller;
- (void)key8:(id)sender controller:(CalculationViewController*)controller;
- (void)key9:(id)sender controller:(CalculationViewController*)controller;
- (void)keydot:(id)sender controller:(CalculationViewController*)controller;
- (void)equal:(id)sender controller:(CalculationViewController*)controller;
- (void)add:(id)sender controller:(CalculationViewController*)controller;
- (void)substraction:(id)sender controller:(CalculationViewController*)controller;
- (void)multiply:(id)sender controller:(CalculationViewController*)controller;
- (void)division:(id)sender controller:(CalculationViewController*)controller;
- (void)percent:(id)sender controller:(CalculationViewController*)controller;
- (void)plus_minus:(id)sender controller:(CalculationViewController*)controller;
- (void)allclear:(id)sender controller:(CalculationViewController*)controller;
- (void)input:(id)sender controller:(CalculationViewController*)controller;
- (void)Calculation_Contetns:(id)sender controller:(CalculationViewController*)controller;
- (void)RecentCalculation:(id)sender controller:(CalculationViewController*)controller;
-(double)funcResult;
-(double)funcOutput;
@end
