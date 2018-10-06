//
//  ViewController.h
//  theFracCalc
//
//  Created by sli19 on 10/2/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    bool fracOpPressed;
    char sign;
    NSString *firstFracNum;
    NSString *firstFracDenom;
    NSString *secondFracNum;
    NSString *secondFracDenom;
    int opCount;
    int fracCount;
    int addPressed;
    int minusPressed;
    int timesPressed;
    int divPressed;

}


- (IBAction)numberPressed:(UIButton*)sender;
- (IBAction)clearPressed:(id)sender;
- (IBAction)addFrac:(id)sender;
- (IBAction)minusFrac:(id)sender;
- (IBAction)timesFrac:(id)sender;
- (IBAction)divFrac:(id)sender;
- (IBAction)defineFrac:(id)sender;
- (IBAction)equalsPressed:(id)sender;




@end

