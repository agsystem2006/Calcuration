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


int roop=0;
float input=0;
float downdot;
float output;
float result;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* ここから数値の入力 */

- (IBAction)key0:(id)sender {
    input=0;
    [self input];
    roop=0;
}

- (IBAction)key1:(id)sender {
    input=1;
    [self input];
}

- (IBAction)key2:(id)sender {
    input=2;
    [self input];
}

- (IBAction)key3:(id)sender {
    input=3;
    [self input];
}

- (IBAction)key4:(id)sender {
    input=4;
    [self input];
}

- (IBAction)key5:(id)sender {
    input=5;
    [self input];
}

- (IBAction)key6:(id)sender {
    input=6;
    [self input];
}

- (IBAction)key7:(id)sender {
    input=7;
    [self input];
}

- (IBAction)key8:(id)sender {
    input=8;
    [self input];
}

- (IBAction)key9:(id)sender {
    input=9;
    [self input];
}

/* ここまで数値の入力 */

/*
 ドットおよび小数点ボタンを押した場合、次の数字を入力するまで小数点以下の入力になる。
 このとき、表示の状態をDotにする。
 演算符号のボタンを押したときにNormalに戻す。
 */

- (IBAction)keydot:(id)sender {
    [self setInputStyle:Dot];
    [[self Calculate] setText:[NSString stringWithFormat:@"%g.", output]];
    downdot=1;
}

/* 演算の実行 */

/*
 等号の場合、計算を実行するが、その前に直前に入力したボタンが演算ボタンの場合、
 表示している数字を入力した数値とみなし、同じ演算を行うようにしている。
 繰り返し等号ボタンを押せば、同じ演算を繰り返す。
 例：
 　入力：２　＋　＝　＝　＝　　＝
 　出力：２　２　４　８　１６　３２
 */
- (IBAction)equal:(id)sender {
    if(roop==1 && output==0)
        output=result;
    [self RecentCalculation];
    [self setSTARTorEND:END];
}



- (void)Calculation_Contetns {
    if ([self STARTorEND] == START)
        [self RecentCalculation];
    [self output_initialization];
    [self setSTARTorEND:START];
    roop=1;
}

/*
 ＋ならばAdd、ーならばSub、×ならばMul、÷ならばDivという状態に変更する。
 四則演算を２つ以上入力する場合、直前の計算結果を表示させて、状態を変更する。
 */

- (IBAction)add:(id)sender {
    [self Calculation_Contetns];
    [self setCalculation:Add];

}

- (IBAction)substraction:(id)sender {
    [self Calculation_Contetns];
    [self setCalculation:Sub];
}

- (IBAction)multiply:(id)sender {
    [self Calculation_Contetns];
    [self setCalculation:Mul];
}

- (IBAction)division:(id)sender {
    [self Calculation_Contetns];
    [self setCalculation:Div];
}

/*
 パーセント計算は、
 */

- (IBAction)percent:(id)sender {
    if ([self Calculation] != Non && [self STARTorEND] == START) {
        result=result*output/100;
        [self setSTARTorEND:END];
    }
    else
        [self allclear:(id)sender];
    [self setTextToResult];
    [self setCalculation:Non];
}

- (IBAction)plus_minus:(id)sender {
    if ([self PLUSorMINUS] == Plus)
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
}

- (IBAction)allclear:(id)sender {
    [self output_initialization];
    roop=0;
    result=0;
    downdot=1;
    [self setTextToResult];
    [self setCalculation:Non];
    [self setSTARTorEND:START];
    [self setInputStyle:Normal];
    [self setPLUSorMINUS:Plus];
}

/*
 数字ボタンを押したときの処理
 整数入力時はoutputに１０をかけ、inputを足し、その数値をラベルに表示する。
 小数点以下入力時は、outputはそのまま足し、
 ０．１に（小数点を押した後に数字ボタンを押した回数）を乗数とし、
 それとinputの数値をかける。
 */

- (void)input {
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
                    [[self Calculate] setText:[NSString stringWithFormat:@"%g0", output]];
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
                    [[self Calculate] setText:[NSString stringWithFormat:@"%g0", output]];
                else
                    [self setTextToOutput];
                break;
        }
    }
}

/*
 output（ラベルに表示し、かつ現在保持している数値）の初期化
 */

- (void)output_initialization {
    output=0;
    [self setPLUSorMINUS:Plus];
}

- (void)setTextToOutput {
    [[self Calculate] setText:[NSString stringWithFormat:@"%g", output]];
}

- (void)setTextToResult {
    [[self Calculate] setText:[NSString stringWithFormat:@"%g", result]];
}

- (void)RecentCalculation {
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
}


// [[self Calculate] setText:@"%f",b];

@end
