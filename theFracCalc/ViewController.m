//
//  ViewController.m
//  theFracCalc
//
//  Created by sli19 on 10/2/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#import "ViewController.h"
#import "FracCalc.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@property FractionCalculator *fractionComputed;
@property Fraction *firstFraction;
@property Fraction *secondFraction;
@property Fraction *fractionAnswer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    self.fractionComputed = [[FractionCalculator alloc] init];
    self.firstFraction = [[Fraction alloc] init];
    self.secondFraction = [[Fraction alloc] init];
    self.fractionAnswer = [[Fraction alloc] init];
    opCount = 0;
    fracOpPressed = false;
    firstFracNum = NULL;
    firstFracDenom = NULL;
    secondFracNum = NULL;
    secondFracDenom = NULL;
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)numberPressed:(UIButton *)sender{
    int numSent = sender.tag;
    if(opCount <= 1){
        if(fracOpPressed == false){
            if(firstFracNum == NULL){
            firstFracNum = [NSString stringWithFormat: @"%i", numSent];
            self.firstFraction.numerator = [firstFracNum intValue];
            self.myLabel.text = firstFracNum;
            }else{
                firstFracNum = [NSString stringWithFormat:@"%@%i", firstFracNum, numSent];
                self.firstFraction.numerator = [firstFracNum intValue];
                self.myLabel.text = firstFracNum;
            }
        }else{

            if(firstFracDenom == NULL){
                firstFracDenom = [NSString stringWithFormat: @"%i", numSent];
                self.myLabel.text = [NSString stringWithFormat: @"%@/",firstFracNum];
            }else{
                firstFracDenom = [NSString stringWithFormat:@"%@%i", firstFracDenom, numSent];
                NSString *realFirstFracDenom = [firstFracDenom substringFromIndex: 1];
                self.firstFraction.denominator = [realFirstFracDenom intValue];
                self.myLabel.text = [NSString stringWithFormat:@"%@/%@", firstFracNum, realFirstFracDenom];
            }
        }
    
    }

    else if(opCount > 1){
        if(fracOpPressed == false){
            if(secondFracNum == NULL){
                secondFracNum = [NSString stringWithFormat: @"%i", numSent];
                self.secondFraction.numerator = [secondFracNum intValue];
                self.myLabel.text = secondFracNum;
            }else{
                secondFracNum = [NSString stringWithFormat:@"%@%i", secondFracNum, numSent];
                self.secondFraction.numerator = [secondFracNum intValue];
                self.myLabel.text = secondFracNum;
            }
        }else{

            if(secondFracDenom == NULL){
                secondFracDenom = [NSString stringWithFormat: @"%i", numSent];
                self.myLabel.text = [NSString stringWithFormat: @"%@/",secondFracNum];
                self.secondFraction.denominator = [secondFracDenom intValue];
            }else{
                secondFracDenom = [NSString stringWithFormat:@"%@%i", secondFracDenom, numSent];
                NSString *realSecondFracDenom = [secondFracDenom substringFromIndex: 1];
                self.secondFraction.denominator = [realSecondFracDenom intValue];
                self.myLabel.text = [NSString stringWithFormat:@"%@/%@", secondFracNum, realSecondFracDenom];
            }
        }
    }

}

- (IBAction)clearPressed:(id)sender {
    opCount = 0;
    fracCount = 0;
    fracOpPressed = false;
    firstFracNum = NULL;
    firstFracDenom = NULL;
    secondFracNum = NULL;
    secondFracDenom = NULL;
    self.myLabel.text = [NSString stringWithFormat: @"input numbers"];
    addPressed = 0;
    minusPressed = 0;
    timesPressed = 0;
    divPressed = 0;
}

- (IBAction)addFrac:(id)sender {
    addPressed = 1;
    opCount++;
    fracOpPressed = false;
    self.myLabel.text = [NSString stringWithFormat:@"+"];
    
}

- (IBAction)minusFrac:(id)sender {
    minusPressed = 1;
    opCount++;
    fracOpPressed = false;
    self.myLabel.text = [NSString stringWithFormat:@"-"];
}

- (IBAction)timesFrac:(id)sender {
    timesPressed = 1;
    opCount++;
    fracOpPressed = false;
    self.myLabel.text = [NSString stringWithFormat:@"x"];
}

- (IBAction)divFrac:(id)sender {
    divPressed = 1;
    opCount++;
    fracOpPressed = false;
    self.myLabel.text = [NSString stringWithFormat:@"÷"];
    
}

- (IBAction)defineFrac:(id)sender {
    fracOpPressed = true;
    opCount++;
    
    
}

- (IBAction)equalsPressed:(id)sender {
    if(addPressed == 1){
        [self.fractionComputed setBaseFraction: self.firstFraction];
       // [self.fractionComputed addFraction: self.secondFraction];
        self.myLabel.text = [self.fractionComputed addFraction: self.secondFraction];
        
    }else if(minusPressed == 1){
        [self.fractionComputed setBaseFraction: self.firstFraction];
        //[self.fractionComputed subtractFraction: self.secondFraction];
        self.myLabel.text = [self.fractionComputed subtractFraction: self.secondFraction];
        
        
    }else if(timesPressed == 1){
        [self.fractionComputed setBaseFraction: self.firstFraction];
        printf("is his one that is playing");
        //[self.fractionComputed multiplyFraction: self.secondFraction];
        printf(" 2123 is his one that is playing");
        self.myLabel.text = [self.fractionComputed multiplyFraction: self.secondFraction];
        
    }else if(divPressed){
        [self.fractionComputed setBaseFraction: self.firstFraction];
        //[self.fractionComputed divideFraction: self.secondFraction];
        self.myLabel.text = [self.fractionComputed divideFraction: self.secondFraction];
        
    }
}



@end
