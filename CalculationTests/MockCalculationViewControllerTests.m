//
//  MockCalculationViewControllerTests.m
//  Calculation
//
//  Created by 荒井　利成 on 13/01/24.
//  Copyright (c) 2013年 Toshinaru Arai. All rights reserved.
//

#import "MockCalculationViewControllerTests.h"

@interface MockCalcurationViewController ()

@end

@implementation MockHelloGoodByeViewController

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

- (void)setTextToGoodBye
{
    
    //    STAssertTrue(willGoodBye, @"unexpected setTextToGoodBye called.");
    //    if(willGoodBye)
    //        done = true;
}

- (void)setTextToHello
{
    //    STAssertTrue(willHello, @"unexpected setTextToHello called.");
    //    if(willHello)
    //        done = true;
}

@end

#import "CalculationMotion.h"
#import "CalculationViewController.h"

@implementation MockCalculationViewControllerTests

CalculationMotion* Motion;
MockCalculationViewControllerTests* mock;

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    Motion = [[CalculationMotion alloc] init];
    
    mock = [[MockCalculationViewControllerTests alloc] init];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

@end
