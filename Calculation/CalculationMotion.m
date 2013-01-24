//
//  CalculationMotion.m
//  Calculation
//
//  Created by 荒井　利成 on 13/01/10.
//  Copyright (c) 2013年 Toshinaru Arai. All rights reserved.
//

#import "CalculationMotion.h"
#import "CalculationViewController.h"

@implementation CalculationMotion

int roop=0;
float input=0;
float downdot;
float output;
float result;

- (void)key0:(id)sender controller:(CalculationViewController*)controller
{
    input=0;
    [self input:(id)sender controller:(CalculationViewController*)controller];
    roop=0;
}

- (void)key1:(id)sender controller:(CalculationViewController*)controller
{
    input=1;
    [self input:(id)sender controller:(CalculationViewController*)controller];
}

- (void)key2:(id)sender controller:(CalculationViewController*)controller
{
    input=2;
    [self input:(id)sender controller:(CalculationViewController*)controller];
}

- (void)key3:(id)sender controller:(CalculationViewController*)controller
{
    input=3;
    [self input:(id)sender controller:(CalculationViewController*)controller];
}

- (void)key4:(id)sender controller:(CalculationViewController*)controller
{
    input=4;
    [self input:(id)sender controller:(CalculationViewController*)controller];
}

- (void)key5:(id)sender controller:(CalculationViewController*)controller
{
    input=5;
    [self input:(id)sender controller:(CalculationViewController*)controller];
}

- (void)key6:(id)sender controller:(CalculationViewController*)controller
{
    input=6;
    [self input:(id)sender controller:(CalculationViewController*)controller];
}

- (void)key7:(id)sender controller:(CalculationViewController*)controller
{
    input=7;
    [self input:(id)sender controller:(CalculationViewController*)controller];
}

- (void)key8:(id)sender controller:(CalculationViewController*)controller
{
    input=8;
    [self input:(id)sender controller:(CalculationViewController*)controller];
}

- (void)key9:(id)sender controller:(CalculationViewController*)controller
{
    input=9;
    [self input:(id)sender controller:(CalculationViewController*)controller];
}

/* ここまで数値の入力 */

/*
 ドットおよび小数点ボタンを押した場合、次の数字を入力するまで小数点以下の入力になる。
 このとき、表示の状態をDotにする。
 演算符号のボタンを押したときにNormalに戻す。
 */

- (void)keydot:(id)sender controller:(CalculationViewController*)controller
{
    [self setInputStyle:Dot];
    [controller setTextToOutput_PushDot];
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

- (void)equal:(id)sender controller:(CalculationViewController*)controller
{
    if(roop==1 && output==0)
        output=result;
    [self RecentCalculation:(id)sender controller:(CalculationViewController*)controller];
    [self setSTARTorEND:END];
}


/*
 ＋ならばAdd、ーならばSub、×ならばMul、÷ならばDivという状態に変更する。
 四則演算を２つ以上入力する場合、直前の計算結果を表示させて、状態を変更する。
 */

- (void)add:(id)sender controller:(CalculationViewController*)controller
{
    [self Calculation_Contetns:(id)sender controller:(CalculationViewController*)controller];
    [self setCalculation:Add];
}

- (void)substraction:(id)sender controller:(CalculationViewController*)controller
{
    [self Calculation_Contetns:(id)sender controller:(CalculationViewController*)controller];
    [self setCalculation:Sub];
}

- (void)multiply:(id)sender controller:(CalculationViewController*)controller
{
    [self Calculation_Contetns:(id)sender controller:(CalculationViewController*)controller];
    [self setCalculation:Mul];
}

- (void)division:(id)sender controller:(CalculationViewController*)controller
{
    [self Calculation_Contetns:(id)sender controller:(CalculationViewController*)controller];
    [self setCalculation:Div];
}

/*
 パーセント計算は、演算符号を押した後が有効である。
 演算符号を押してない状態でパーセントボタンを押せば
 一度入力を初期状態（AllClearボタンを押した状態）に戻し、
 入力したボタンを
 */

- (void)percent:(id)sender controller:(CalculationViewController*)controller
{
    if ([self Calculation] != Non && [self STARTorEND] == START) {
        result=result*output/100;
        [self setSTARTorEND:END];
    }
    else
        [self allclear:(id)sender controller:(CalculationViewController*)controller];
    [controller setTextToResult];
    [self setCalculation:Non];
}

- (void)plus_minus:(id)sender controller:(CalculationViewController*)controller
{
    if ([self PLUSorMINUS] == Plus)
        [self setPLUSorMINUS:Minus];
    else
        [self setPLUSorMINUS:Plus];
    
    if ([self STARTorEND] == START) {
        output=0-output;
        [controller setTextToOutput];
    }
    else {
        result=0-result;
        [controller setTextToResult];
    }
}

- (void)allclear:(id)sender controller:(CalculationViewController*)controller
{
    roop=0;
    result=0;
    downdot=1;
    [self output_initialization];
    [controller setTextToResult];
    [self setCalculation:Non];
    [self setSTARTorEND:START];
    [self setInputStyle:Normal];
    [self setPLUSorMINUS:Plus];
}

- (void)Calculation_Contetns:(id)sender controller:(CalculationViewController*)controller
{
    if ([self STARTorEND] == START)
        [self RecentCalculation:(id)sender controller:(CalculationViewController*)controller];
    [self output_initialization];
    [self setSTARTorEND:START];
    roop=1;
}

/*
 数字ボタンを押したときの処理
 整数入力時はoutputに１０をかけ、inputを足し、その数値をラベルに表示する。
 小数点以下入力時は、outputはそのまま足し、
 ０．１に（小数点を押した後に数字ボタンを押した回数）を乗数とし、
 それとinputの数値をかける。
 */

- (void)input:(id)sender controller:(CalculationViewController*)controller
{
    if ([self STARTorEND] == END)
    {
        [self allclear:(id)sender controller:(CalculationViewController*)controller];
        [self setSTARTorEND:START];
    }
    if ([self PLUSorMINUS] == Plus){
        switch([self InputStyle]) {
            case Normal:
                output=output*10+input;
                [controller setTextToOutput];
                break;
            case Dot:
                output=output+input*pow(0.1,downdot);
                downdot++;
                if (input == 0)
                    [controller setTextToOutput_PushDotAnd0];
                else
                    [controller setTextToOutput];
                break;
        }
    }
    else {
        switch([self InputStyle]) {
            case Normal:
                output=output*10-input;
                [controller setTextToOutput];
                break;
            case Dot:
                output=output-input*pow(0.1,downdot);
                downdot++;
                if (input == 0)
                    [controller setTextToOutput_PushDotAnd0];
                else
                    [controller setTextToOutput];
                break;
        }
    }
}

- (void)output_initialization
{
    output=0;
    [self setPLUSorMINUS:Plus];
}

- (void)RecentCalculation:(id)sender controller:(CalculationViewController*)controller
{
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
    [controller setTextToResult];
    downdot=1;
}

-(double)funcResult
{
    return result;
}

-(double)funcOutput
{
    return output;
}
@end
