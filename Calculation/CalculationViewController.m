//
//  CalculationViewController.m
//  Calculation
//
//  Created by 荒井　利成 on 12/10/23.
//  Copyright (c) 2012年 Toshinaru Arai. All rights reserved.
//

#import "CalculationViewController.h"

@interface CalculationViewController ()

@end

@implementation CalculationViewController

@synthesize motion;

- (void)viewDidLoad
{
    [super viewDidLoad];
    motion = [[CalculationMotion alloc] init];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)key0:(id)sender {
    [motion key0:sender controller:self];
}

- (IBAction)key1:(id)sender {
    [motion key1:sender controller:self];
}

- (IBAction)key2:(id)sender {
    [motion key2:sender controller:self];
}

- (IBAction)key3:(id)sender {
    [motion key3:sender controller:self];
}

- (IBAction)key4:(id)sender {
    [motion key4:sender controller:self];
}

- (IBAction)key5:(id)sender {
    [motion key5:sender controller:self];
}

- (IBAction)key6:(id)sender {
    [motion key6:sender controller:self];
}

- (IBAction)key7:(id)sender {
    [motion key7:sender controller:self];
}

- (IBAction)key8:(id)sender {
    [motion key8:sender controller:self];
}

- (IBAction)key9:(id)sender {
    [motion key9:sender controller:self];
}

- (IBAction)keydot:(id)sender {
    [motion keydot:sender controller:self];
}

- (IBAction)equal:(id)sender {
    [motion equal:sender controller:self];
}

- (IBAction)add:(id)sender {
    [motion add:sender controller:self];
}

- (IBAction)substraction:(id)sender {
    [motion substraction:sender controller:self];
}

- (IBAction)multiply:(id)sender {
    [motion multiply:sender controller:self];
}

- (IBAction)division:(id)sender {
    [motion division:sender controller:self];
}



- (IBAction)percent:(id)sender {
    [motion percent:sender controller:self];
}

- (IBAction)plus_minus:(id)sender {
    [motion plus_minus:sender controller:self];
}

- (IBAction)allclear:(id)sender {
    [motion allclear:sender controller:self];
}

- (void)setTextToOutput_PushDotAnd0
{
    output = [motion funcOutput];
    [[self Calculate] setText:[NSString stringWithFormat:@"%g0", output]];
}

- (void)setTextToOutput_PushDot
{
    output = [motion funcOutput];
    [[self Calculate] setText:[NSString stringWithFormat:@"%g.", output]];
}

- (void)setTextToOutput {
    output = [motion funcOutput];
    [[self Calculate] setText:[NSString stringWithFormat:@"%g", output]];
}

- (void)setTextToResult {
    result = [motion funcResult];
    [[self Calculate] setText:[NSString stringWithFormat:@"%g", result]];
}

@end
