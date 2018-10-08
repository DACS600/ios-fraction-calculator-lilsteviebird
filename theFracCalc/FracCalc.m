//
//  FracCalc.m
//  theFracCalc
//
//  Created by sli19 on 10/4/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FracCalc.h"

@implementation FractionCalculator


-(id) init{
    self = [super init];
    if(self){
        self.fracAnswer = [[Fraction alloc] init];
        self.fracBase = [[Fraction alloc] init];
    }
    return self;
}



-(void) setBaseFraction: (Fraction *) fracGiven{
    self.fracBase.numerator = fracGiven.numerator;
    self.fracBase.denominator = fracGiven.denominator;
}


-(NSString *) addFraction: (Fraction *) fracGiven {
    self.fracAnswer.numerator = self.fracBase.numerator * fracGiven.denominator + self.fracBase.denominator * fracGiven.numerator;
    printf(" numerator here %i", self.fracAnswer.numerator);
    self.fracAnswer.denominator = self.fracBase.denominator * fracGiven.denominator;
    [self simplifyFraction: self.fracAnswer];
    printf(" Addition Your fraction is %i / %i \n", self.fracAnswer.numerator, self.fracAnswer.denominator);
    return [NSString stringWithFormat:@"%i/%i", self.fracAnswer.numerator, self.fracAnswer.denominator];
}

-(NSString *) subtractFraction: (Fraction *) fracGiven{
    self.fracAnswer.numerator = self.fracBase.numerator * fracGiven.denominator - self.fracBase.denominator * fracGiven.numerator;
    self.fracAnswer.denominator = self.fracBase.denominator * fracGiven.denominator;
    [self simplifyFraction: self.fracAnswer];
    printf("Subtraction Your fraction is %i / %i \n", self.fracAnswer.numerator, self.fracAnswer.denominator);
    return [NSString stringWithFormat:@"%i/%i", self.fracAnswer.numerator, self.fracAnswer.denominator];
}

-(NSString *) multiplyFraction: (Fraction *) fracGiven{
    self.fracAnswer.numerator = self.fracBase.numerator * fracGiven.numerator;
    self.fracAnswer.denominator = self.fracBase.denominator * fracGiven.denominator;
    [self simplifyFraction: self.fracAnswer];
    printf(" Multiplication Your fraction is %i / %i \n", self.fracAnswer.numerator, self.fracAnswer.denominator);
    return [NSString stringWithFormat:@"%i/%i", self.fracAnswer.numerator, self.fracAnswer.denominator];
    
}

-(NSString *) divideFraction: (Fraction *) fracGiven{
    self.fracAnswer.numerator = self.fracBase.numerator * fracGiven.denominator;
    self.fracAnswer.denominator = self.fracBase.denominator * fracGiven.numerator;
    [self simplifyFraction: self.fracAnswer];
    printf("Division Your fraction is %i / %i \n", self.fracAnswer.numerator, self.fracAnswer.denominator);
    return [NSString stringWithFormat:@"%i/%i", self.fracAnswer.numerator, self.fracAnswer.denominator];
}

-(void) simplifyFraction: (Fraction *) fracGiven{
    int tempHighestFactor;
    int highestFactor = 1;
    for(int i = 1; i <= fracGiven.numerator; i++){
        if(fracGiven.numerator % i == 0 && fracGiven.denominator % i == 0){
            tempHighestFactor = i;
            if(tempHighestFactor >= highestFactor){
                highestFactor = tempHighestFactor;
            }
        }
    }
    self.fracAnswer.numerator = fracGiven.numerator / highestFactor;
    self.fracAnswer.denominator = fracGiven.denominator / highestFactor;
    printf("Your simplified fraction is: %i/%i", self.fracAnswer.numerator, self.fracAnswer.denominator);
}




@end
