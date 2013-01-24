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

float input=0;
float downdot;
float output;
float result;

- (void)key0:(id)sender controller:(CalculationViewController*)controller
{
    input=0;
    [self input:(id)sender controller:(CalculationViewController*)controller];
    [self setRoop:Disable];
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

/*
 ここまで数値の入力。inputに数字を格納するのみで、残りはinputの関数で処理する。
 ただし、０を入力した場合は、イコールボタンの仕様で、
 ０を入力する前に保存した数値がループ演算の対象となってしまうため、
 ループをさせないように状態をDisableに戻す。
 これにより、イコールボタンの関数で、演算の関数(RecentCalculation)を避けるようにすることができる。
 */

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
    if([self Roop]==Enable && output==0)
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
 １００　＋　２０　％
 と押せば、１００の２０パーセント、すなわち２０と表示するような動作が起こる。
 演算符号を押してない状態でパーセントボタンを押せば
 初期状態（AllClearボタンを押した状態）に戻す。
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

/*
 プラスマイナスボタンにより、
 プラス⇨マイナスの場合は、状態をMinusにし、０から格納している数値を引く。
 マイナス⇨プラスの場合は、状態をPlusにし、０から格納している数値を引くが、
 このときの数値はマイナスなので、結果的にプラスとなる。
 演算符号、およびAllClearボタンを押したとき、この状態は必ずPlusに戻る。
 */

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

/*
 AllClearボタンは全ての状態を初期状態に戻す最終兵器。
 表示は０であり、そして全ての状態も最初の状態に戻る。
 */
- (void)allclear:(id)sender controller:(CalculationViewController*)controller
{
    [self setRoop:Disable];
    result=0;
    downdot=1;
    output=0;
    [controller setTextToResult];
    [self setCalculation:Non];
    [self setSTARTorEND:START];
    [self setInputStyle:Normal];
    [self setPLUSorMINUS:Plus];
}

/*
 演算記号を押したときに、どのような判定を行うかという部分である。
 もし、イコールを押せば、演算を行う。STARTorENDはSTARTの状態になるが、equalボタンの中では、結果的にこの状態はENDとなる。
 四則演算のボタンを押せば、一度そこまでの計算を行い、その時点での結果をラベルに表示する。
 */

- (void)Calculation_Contetns:(id)sender controller:(CalculationViewController*)controller
{
    if ([self STARTorEND] == START)
        [self RecentCalculation:(id)sender controller:(CalculationViewController*)controller];
    [self output_initialization];
    [self setSTARTorEND:START];
    [self setRoop:Enable];
}

/*
 数字ボタンを押したときの処理
 整数入力時はoutputに１０をかけ、inputを足し、その数値をラベルに表示する。
 小数点以下入力時は、outputはそのまま足し、
 ０．１に「小数点を押した後に数字ボタンを押した回数」を乗数とし、
 それと入力した数字ボタン（=input）の数値をかける。
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

/*
 演算キーを押した後、この関数に移る。
 単純にoutputを0にするだけでなく、直前の入力状態がマイナス状態の場合、
 次の入力はプラス入力から始まるので、 状態をPlusに戻す必要がある。
 */
- (void)output_initialization
{
    output=0;
    [self setPLUSorMINUS:Plus];
}

/*
 ここで演算を行う。演算の判別は、演算キーを押したときにCalculateという状態が変更されるので、そこを見て判別される。
 演算符号を押していない状態は全てNonという状態である。
 演算が終わると、入力状態は小数点入力ではなく整数入力に戻し、小数点の桁数も１に戻しておく
 */

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

/*
 以下の二つは、コントローラーからの呼び出しのために使う変数である。
 outputを呼びたい場合は[motion funcOutput]、
 resultを呼びたい場合は[motion funcResult]を使う。
 */

-(double)funcResult
{
    return result;
}

-(double)funcOutput
{
    return output;
}
@end

/*
 「感想」
 今回工夫した点は、２つあると考えた。
 一つ目は、判別を行うような内容の場合は、できるだけ状態の変化を使うことである。
 これを使うことにより、使う変数を４つに押さえることができた。
 二つ目は、繰り返し演算だと思う。ここは数値を入力しなくても、直前で演算符号を押せば、
 その前の数字で計算を行うことができる部分である。この部分もよく考えたなぁと思った。
 この電卓は、関数電卓ではなく、一般的な四則演算用の電卓としてプログラムを完成させた。
 関数電卓は、このオーソドックスな電卓から、三角関数や、組み合わせ演算など、いろいろな機能を追加した部分なので、
 このオーソドックスな電卓を作ることが前提条件だと考えた。
 まだ時間があれば、関数電卓まで考えることも可能だったと思う。そう考えると、いろいろ機能を追加していくことも楽しいと思った。
 */





