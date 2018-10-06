//
//  FracCalc.h
//  theFracCalc
//
//  Created by sli19 on 10/4/18.
//  Copyright © 2018 sli19. All rights reserved.
//

#ifndef FracCalc_h
#define FracCalc_h

#import "Fraction.h"

@interface FractionCalculator : NSObject

@property (strong, nonatomic) Fraction *fracBase;
@property (strong, nonatomic) Fraction *fracAnswer;

-(void) setBaseFraction: (Fraction *) fracGiven;
-(NSString *) addFraction: (Fraction *) fracGiven;
-(NSString *) subtractFraction: (Fraction *) fracGiven;
-(NSString *) multiplyFraction: (Fraction *) fracGiven;
-(NSString *) divideFraction: (Fraction *) fracGiven;
-(void) simplifyFraction: (Fraction *) fracGiven;




@end

#endif /* FracCalc_h */
