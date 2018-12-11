//
//  Taxi.h
//  TaxiMeter-OO
//
//  Created by Sahil Gogna on 2018-12-09.
//  Copyright © 2018 Sahil Gogna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Taxi.h"


@interface Taxi : NSObject{
    float fuelTankLevel;
    int tripMeterCounter;
    float mileage;
    float netIncomeGenerated;
    float initialVelocity;
}

-(void)refilTank;
-(float)generateRandomNumber:(float)top lowerRange:(float)bottom;
-(float)calcMileage:(float)difference;
-(float)absFloat:(float)f;
-(float)getFuelTankLevel;
-(int)getTripMeterCounter;
-(float)getMileage;
-(float)getNetIncomeGenerated;
-(void)setFuelTankLevel:(float)inputValue;
-(void)setTripMeterCounter:(int)inputValue;
-(void)setMileage:(float)inputValue;
-(void)setNetIncomeGenerated:(float)inputValue;
-(float)getInitialVelocity;
-(void)setInitialVelocity:(float)initVelocity;
@end

