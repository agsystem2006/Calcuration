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

@synthesize motion;//

//int roop=0;
//float input=0;
//float downdot;
//float output;
//float result;


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
    //input=0;
    //[self input];
    //roop=0;
    [motion key0:sender controller:self];
}

- (IBAction)key1:(id)sender {
    //input=1;
    //[self input];
    [motion key1:sender controller:self];
}

- (IBAction)key2:(id)sender {
    //input=2;
    //[self input];
    [motion key2:sender controller:self];
}

- (IBAction)key3:(id)sender {
    //input=3;
    //[self input];
    [motion key3:sender controller:self];
}

- (IBAction)key4:(id)sender {
    //input=4;
    //[self input];
    [motion key4:sender controller:self];
}

- (IBAction)key5:(id)sender {
    //input=5;
    //[self input];
    [motion key5:sender controller:self];
}

- (IBAction)key6:(id)sender {
    //input=6;
    //[self input];
    [motion key6:sender controller:self];
}

- (IBAction)key7:(id)sender {
    //input=7;
    //[self input];
    [motion key7:sender controller:self];
}

- (IBAction)key8:(id)sender {
    //input=8;
    //[self input];
    [motion key8:sender controller:self];
}

- (IBAction)key9:(id)sender {
    //input=9;
    //[self input];
    [motion key9:sender controller:self];
}

- (IBAction)keydot:(id)sender {
    //[self setInputStyle:Dot];
    //[self setTextToOutput_PushDot];
    //downdot=1;
    [motion keydot:sender controller:self];
}


- (IBAction)equal:(id)sender {
    /*if(roop==1 && output==0)
        output=result;
    [self RecentCalculation];
    [self setSTARTorEND:END];*/
    [motion equal:sender controller:self];
}



- (void)Calculation_Contetns {
    /*if ([self STARTorEND] == START)
        [self RecentCalculation];
    [self output_initialization];
    [self setSTARTorEND:START];
    roop=1;*/
    
}

- (IBAction)add:(id)sender {
    //[self Calculation_Contetns];
    //[self setCalculation:Add];
    [motion add:sender controller:self];
}

- (IBAction)substraction:(id)sender {
    //[self Calculation_Contetns];
    //[self setCalculation:Sub];
    [motion substraction:sender controller:self];
}

- (IBAction)multiply:(id)sender {
    //[self Calculation_Contetns];
    //[self setCalculation:Mul];
    [motion multiply:sender controller:self];
}

- (IBAction)division:(id)sender {
    //[self Calculation_Contetns];
    //[self setCalculation:Div];
    [motion division:sender controller:self];
}



- (IBAction)percent:(id)sender {
    /*if ([self Calculation] != Non && [self STARTorEND] == START) {
        result=result*output/100;
        [self setSTARTorEND:END];
    }
    else
        [self allclear:(id)sender];
    [self setTextToResult];
    [self setCalculation:Non];*/
    [motion percent:sender controller:self];
}

- (IBAction)plus_minus:(id)sender {
    /*if ([self PLUSorMINUS] == Plus)
        [self setPLUSorMINUS:Minus];
    else
        [self setPLUSorMINUS:Plus];
    
    if ([self STARTorEND] == START) {
        output=0-output;
        [self setTextToOutput];
    }
    else {
        result=0-result;
        [self setTextToResult];
    }
     */
    [motion plus_minus:sender controller:self];
}

- (IBAction)allclear:(id)sender {
    /*
     roop=0;
    result=0;
    downdot=1;
    [self output_initialization];
    [self setTextToResult];
    [self setCalculation:Non];
    [self setSTARTorEND:START];
    [self setInputStyle:Normal];
    [self setPLUSorMINUS:Plus];
    [_motion allclear:sender controller:self];
     */
    [motion allclear:sender controller:self];
}

/*
 数字ボタンを押したときの処理
 整数入力時はoutputに１０をかけ、inputを足し、その数値をラベルに表示する。
 小数点以下入力時は、outputはそのまま足し、
 ０．１に（小数点を押した後に数字ボタンを押した回数）を乗数とし、
 それとinputの数値をかける。
 */

- (void)input {
    /*
    if ([self PLUSorMINUS] == Plus){
        switch([self InputStyle]) {
            case Normal:
                output=output*10+input;
                [self setTextToOutput];
                break;
            case Dot:
                output=output+input*pow(0.1,downdot);
                downdot++;
                if (input == 0)
                    [self setTextToOutput_PushDotAnd0];
                else
                    [self setTextToOutput];
                break;
        }
    }
    else {
        switch([self InputStyle]) {
            case Normal:
                output=output*10-input;
                    [self setTextToOutput];
                break;
            case Dot:
                output=output-input*pow(0.1,downdot);
                downdot++;
                if (input == 0)
                    [self setTextToOutput_PushDotAnd0];
                else
                    [self setTextToOutput];
                break;
        }
    }
     */
    
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

/*
 output（ラベルに表示し、かつ現在保持している数値）の初期化
 */

- (void)output_initialization {
    //output=0;
    //[self setPLUSorMINUS:Plus];
}

- (void)setTextToOutput {
    output = [motion funcOutput];
    [[self Calculate] setText:[NSString stringWithFormat:@"%g", output]];
}

- (void)setTextToResult {
    result = [motion funcResult];
    [[self Calculate] setText:[NSString stringWithFormat:@"%g", result]];
}

- (void)RecentCalculation {
    /*
        switch([self Calculation]) {
            case Non:
                result=output;
                break;
            case Add:
                result=result+output;
                break;
            case Sub:
                result=result-output;
                break;
            case Mul:
                result=result*output;
                break;
            case Div:
                result=result/output;
                break;
        }
    [self setInputStyle:Normal];
    [self setTextToResult];
    downdot=1;
     */
}


// [[self Calculate] setText:@"%f",b];

@end
