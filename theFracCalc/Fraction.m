//
//  Fraction.m
//  theFracCalc
//
//  Created by sli19 on 10/4/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Fraction.h"

@implementation Fraction

-(id) init
{
    self = [super init];
    if(self){
        self.numerator = 1;
        self.denominator = 1;
    }
    return self;
}


-(void) setNumerator: (int) n setDenominator: (int) d {
    self.numerator = n;
    self.denominator = d;
}

@end
