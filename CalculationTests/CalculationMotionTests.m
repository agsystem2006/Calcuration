//
//  CalculationMotionTests.m
//  Calculation
//
//  Created by 荒井　利成 on 13/01/24.
//  Copyright (c) 2013年 Toshinaru Arai. All rights reserved.
//

#import "CalculationMotionTests.h"

#import "CalculationMotion.h"
#import "MockCalculationViewController.h"

@implementation CalculationMotionTests

CalculationMotion* Motion;
MockCalculationViewController* mock;

- (void)setUp
{
    [super setUp];
    
    mock = [[MockCalculationViewController alloc] init];
    [mock setTestCode:self];
    [mock viewDidLoad];
    Motion = [mock motion];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testPushButtonNumber
{
    [mock key1:self];
    STAssertEqualsWithAccuracy(1.0, [Motion funcOutput], 0.00001, @"Button1 error");
    [mock allclear:self];
    [mock key2:self];
    STAssertEqualsWithAccuracy(2.0, [Motion funcOutput], 0.00001, @"Button2 error");
    [mock allclear:self];
    [mock key3:self];
    STAssertEqualsWithAccuracy(3.0, [Motion funcOutput], 0.00001, @"Button3 error");
    [mock allclear:self];
    [mock key4:self];
    STAssertEqualsWithAccuracy(4.0, [Motion funcOutput], 0.00001, @"Button4 error");
    [mock allclear:self];
    [mock key5:self];
    STAssertEqualsWithAccuracy(5.0, [Motion funcOutput], 0.00001, @"Button5 error");
    [mock allclear:self];
    [mock key6:self];
    STAssertEqualsWithAccuracy(6.0, [Motion funcOutput], 0.00001, @"Button6 error");
    [mock allclear:self];
    [mock key7:self];
    STAssertEqualsWithAccuracy(7.0, [Motion funcOutput], 0.00001, @"Button7 error");
    [mock allclear:self];
    [mock key8:self];
    STAssertEqualsWithAccuracy(8.0, [Motion funcOutput], 0.00001, @"Button8 error");
    [mock allclear:self];
    [mock key9:self];
    STAssertEqualsWithAccuracy(9.0, [Motion funcOutput], 0.00001, @"Button9 error");
    
    /*
     押した数字がラベルに表示されるかどうかの確認
     */
}

- (void)testPushCalculationAndAgainCalculation
{
    [mock key1:self];
    [mock add:self];
    STAssertEquals(Add, [Motion Calculation], @"Calculation's state is not Add.");
    STAssertEqualsWithAccuracy(1.0, [Motion funcResult], 0.00001, @"Result is not true.");
    [mock key2:self];
    STAssertEqualsWithAccuracy(2.0, [Motion funcOutput], 0.00001, @"Output is not true.");
    [mock equal:self];
    STAssertEqualsWithAccuracy(3.0, [Motion funcResult], 0.00001, @"Result is not true.");
    [mock equal:self];
    STAssertEqualsWithAccuracy(5.0, [Motion funcResult], 0.00001, @"Result is not true.");
    [mock equal:self];
    STAssertEqualsWithAccuracy(7.0, [Motion funcResult], 0.00001, @"Result is not true.");
    [mock equal:self];
    STAssertEqualsWithAccuracy(9.0, [Motion funcResult], 0.00001, @"Result is not true.");
    /*
     主に入力から計算までの過程である。ループ演算も含まれる。
     ①＋を押すと、Calculationの状態がAddに変わることの確認
     ②同時に１がResultに格納されているかの確認
     ③その後、２を押すと、Outputは一旦ゼロになり、押した数字(ここでは２)がOutputの値となるかどうか
     ④＝ボタンを押し、３の値となっているかどうか
     ⑤さらにこの後、＝ボタンを押すと、繰り返し演算となり、Resultが２ずつ増加しているかどうか。
     */
}

- (void)testAgainCalculation_if2ndInputIsZero
{
    [mock key5:self];
    [mock add:self];
    [mock key0:self];
    STAssertEqualsWithAccuracy(0.0, [Motion funcOutput], 0.00001, @"Output is not true.");
    [mock equal:self];
    STAssertEqualsWithAccuracy(5.0, [Motion funcResult], 0.00001, @"Result is not true.");
    [mock equal:self];
    STAssertEqualsWithAccuracy(5.0, [Motion funcResult], 0.00001, @"Run to calculation.");
    [mock equal:self];
    STAssertEqualsWithAccuracy(5.0, [Motion funcResult], 0.00001, @"Run to calculation.");
    [mock equal:self];
    STAssertEqualsWithAccuracy(5.0, [Motion funcResult], 0.00001, @"Run to calculation.");
    /*
     繰り返し演算において、２番目の数値入力が０の場合もプログラムに書いたので、
     数値が変化しないかを見直すためのテストである。さすがに３回も繰り返しやれば…
     */
}

- (void)testCalculationType
{
    [mock key5:self];
    [mock add:self];
    [mock key5:self];
    [mock equal:self];
    STAssertEqualsWithAccuracy(10.0, [Motion funcResult], 0.00001, @"Addition is not true.");
    [mock substraction:self];
    [mock key5:self];
    [mock equal:self];
    STAssertEqualsWithAccuracy(5.0, [Motion funcResult], 0.00001, @"Substruction is not true.");
    [mock multiply:self];
    [mock key5:self];
    [mock equal:self];
    STAssertEqualsWithAccuracy(25.0, [Motion funcResult], 0.00001, @"Multiply is not true.");
    [mock division:self];
    [mock key5:self];
    [mock equal:self];
    STAssertEqualsWithAccuracy(5.0, [Motion funcResult], 0.00001, @"Division is not true.");
    /*
     四則演算それぞれを実行する。
     */
}

- (void)testPersent
{
    [mock key5:self];
    [mock add:self];
    [mock key8:self];
    [mock key0:self];
    [mock percent:self];
    STAssertEqualsWithAccuracy(4.0, [Motion funcResult], 0.00001, @"Result is not true.");
    [mock key9:self];
    STAssertEqualsWithAccuracy(9.0, [Motion funcOutput], 0.00001, @"Percent is not true.");
    [mock allclear:self];
    [mock key2:self];
    [mock percent:self];
    STAssertEqualsWithAccuracy(0.0, [Motion funcResult], 0.00001, @"This is not 0.");
    [mock allclear:self];
    [mock key2:self];
    [mock add:self];
    [mock percent:self];
    STAssertEqualsWithAccuracy(0.0, [Motion funcResult], 0.00001, @"This is not 0.");
    /*
     パーセントボタンに関するテストである。
     ①演算キーを押し、数値を入力してからパーセントボタンを押すと、最初の入力のパーセント分がその結果になっているか
     ②一度初期状態に戻し、演算キーを押さないでパーセントを押すと、初期状態に戻っているか
     ③また初期状態に戻し、演算キーを押したが、数値を押さずにパーセントを押すと、これも初期状態に戻っているか
     */
}

- (void)testInputDotAndCalculation
{
    [mock key5:self];
    [mock keydot:self];
    STAssertEquals(Dot, [Motion InputStyle], @"InputStyle is not Dot");
    [mock key3:self];
    STAssertEqualsWithAccuracy(5.3, [Motion funcOutput], 0.00001, @"Output is not true.");
    [mock key7:self];
    STAssertEqualsWithAccuracy(5.37, [Motion funcOutput], 0.00001, @"Output is not true.");
    [mock substraction:self];
    STAssertEquals(Normal, [Motion InputStyle], @"InputStyle is not Normal");
    [mock key5:self];
    [mock equal:self];
    STAssertEqualsWithAccuracy(0.37, [Motion funcResult], 0.00001, @"Result is not true.");
    /*
     小数点入力に関するテストである。
     ①ドットボタンを押したとき、InputStyleの状態がDotになっているか
     ②数値を入力し、小数点の入力が正しい値になっているか
     ③演算キーを押すと、通常の入力になるNormalの状態になっているか
     ④小数点との計算結果が正しい値になっているか
     */
}

- (void)testPlusMinus
{
    [mock key8:self];
    [mock plus_minus:self];
    STAssertEquals(Minus, [Motion PLUSorMINUS], @"InputStyle is not Normal");
    STAssertEqualsWithAccuracy(-8.0, [Motion funcOutput], 0.00001, @"Output is not true.");
    [mock plus_minus:self];
    STAssertEquals(Plus, [Motion PLUSorMINUS], @"InputStyle is not Normal");
    STAssertEqualsWithAccuracy(8.0, [Motion funcOutput], 0.00001, @"Output is not true.");
    [mock plus_minus:self];
    [mock key8:self];
    STAssertEqualsWithAccuracy(-88.0, [Motion funcOutput], 0.00001, @"Output is not true.");
    [mock multiply:self];
    STAssertEquals(Plus, [Motion PLUSorMINUS], @"InputStyle is not Normal");
    [mock key5:self];
    [mock equal:self];
    STAssertEqualsWithAccuracy(-440.0, [Motion funcResult], 0.00001, @"Multiply is not true.");
    /*
     符号変換に関するテストである。
     ①プラスマイナスボタンを押すと、入力した数値が負の値になり、入力モードがマイナス状態になっているか
     ②再びプラスマイナスボタンを押すと、入力した数値が正の値になり、入力モードがプラス状態になっているか
     ③再びプラスマイナスボタンを押し、数字ボタンを押すと、正しい値の入力になっているか
     ④演算キーを押すと、状態がプラス状態に戻っているか
     ⑤演算結果が正しい値になっているか
     */
}


@end
