//
//  MockCalculationViewController.m
//  Calculation
//
//  Created by 荒井　利成 on 13/01/24.
//  Copyright (c) 2013年 Toshinaru Arai. All rights reserved.
//

#import "MockCalculationViewController.h"

@interface MockCalculationViewController ()

@end

@implementation MockCalculationViewController

@synthesize testCode;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)failWithException: (NSException *) e
{
    [testCode failWithException:e];
}

@end