//
//  Trip.h
//  TaxiMeter-OO
//
//  Created by Sahil Gogna on 2018-12-09.
//  Copyright © 2018 Sahil Gogna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Taxi.h"

@interface Trip : NSObject{
    float stTimeHours;
    float edTimeHours;
    float cost;
    float fuelConsumption;
}
-(id)init;
-(float)calcFuelConsumption:(float)timeDiff taxiObject:(Taxi *)taxi;
-(float)calcTimeDifference;
-(void)calcCost:(float) difference taxiObject:(Taxi *)taxi;
-(float)absFloat:(float)f;
-(double)fact:(int)i;
-(double)sine:(double)x;
-(double) cosine:(double)x;
-(double) tangent:(double)x;
@end

