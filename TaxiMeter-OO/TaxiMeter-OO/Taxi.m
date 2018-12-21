//
//  Taxi.m
//  TaxiMeter-OO
//
//  Created by Sahil Gogna on 2018-12-09.
//  Copyright © 2018 Sahil Gogna. All rights reserved.
//

#import "Taxi.h"

@implementation Taxi

-(float)getFuelTankLevel{
    return fuelTankLevel;
}

-(int)getTripMeterCounter{
    return tripMeterCounter;
}

-(float)getMileage{
    return mileage;
}

-(float)getNetIncomeGenerated{
    return netIncomeGenerated;
}

-(float)getInitialVelocity{
    return initialVelocity;
}

-(void)setInitialVelocity:(float)initVelocity{
    initialVelocity = initVelocity;
}

-(void)setFuelTankLevel:(float)inputValue{
    fuelTankLevel = inputValue;
}

-(void)setTripMeterCounter:(int)inputValue{
    tripMeterCounter = inputValue;
}

-(void)setMileage:(float)inputValue{
    mileage = inputValue;
}

-(void)setNetIncomeGenerated:(float)inputValue{
    netIncomeGenerated = inputValue;
}

// refilling the tank
-(void)refilTank{
    printf("Please enter gas in liters\n");
    float gasQuantity;
    scanf("%f",&gasQuantity);
    float costOfFuel = gasQuantity* [self generateRandomNumber:1.45 lowerRange:1.15];
    if( costOfFuel < netIncomeGenerated){ // if user has enough money
        fuelTankLevel = fuelTankLevel + gasQuantity;
        netIncomeGenerated = netIncomeGenerated - costOfFuel;
        printf("The cost of %f fuel is %f\n",gasQuantity ,costOfFuel);
    }else{
        printf("\nNot enough money to buy gas\n");
    }
}

//calculating absolute value
-(float) absFloat:(float) f{
    if(f < 0){
        f = -1 * f;
    }
    return f;
}

//calculating mileage
-(float)calcMileage:(float)difference{
    return difference * ([self absFloat:(tanf(initialVelocity*difference)) + tanf(tanf(initialVelocity))]);
}

// generating random numbers between a range as fuel price
-(float)generateRandomNumber:(float)top lowerRange:(float)bottom{
    srand((unsigned int)time(0));
    int num = rand();
    float number = fmod((bottom+num), top-bottom) + bottom;
    return number;
}
@end
