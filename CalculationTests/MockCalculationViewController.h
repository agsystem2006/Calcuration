//
//  MockCalculationViewController.h
//  Calculation
//
//  Created by 荒井　利成 on 13/01/24.
//  Copyright (c) 2013年 Toshinaru Arai. All rights reserved.
//

#import "CalculationViewController.h"

#import <SenTestingKit/SenTestingKit.h>

@interface MockCalculationViewController : CalculationViewController

@property SenTestCase* testCode;

-(void)failWithException:(NSException *) e;

@end
