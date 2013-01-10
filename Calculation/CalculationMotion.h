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

@end
