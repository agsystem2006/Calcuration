//
//  CalculationViewController.h
//  Calculation
//
//  Created by 荒井　利成 on 12/10/23.
//  Copyright (c) 2012年 Toshinaru Arai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculationMotion.h"

@interface CalculationViewController : UIViewController
{

    int roop;
    float output,input,downdot,result;
    
}
@property (weak, nonatomic) IBOutlet UILabel *Calculate;

@property(readonly) CalculationMotion* motion;

- (IBAction)key0:(id)sender;
- (IBAction)key1:(id)sender;
- (IBAction)key2:(id)sender;
- (IBAction)key3:(id)sender;
- (IBAction)key4:(id)sender;
- (IBAction)key5:(id)sender;
- (IBAction)key6:(id)sender;
- (IBAction)key7:(id)sender;
- (IBAction)key8:(id)sender;
- (IBAction)key9:(id)sender;
- (IBAction)keydot:(id)sender;
- (IBAction)equal:(id)sender;
- (IBAction)add:(id)sender;
- (IBAction)substraction:(id)sender;
- (IBAction)multiply:(id)sender;
- (IBAction)division:(id)sender;
- (IBAction)percent:(id)sender;
- (IBAction)plus_minus:(id)sender;
- (IBAction)allclear:(id)sender;
- (void)setTextToOutput_PushDotAnd0;
- (void)setTextToOutput_PushDot;
- (void)setTextToOutput;
- (void)setTextToResult;


@end
