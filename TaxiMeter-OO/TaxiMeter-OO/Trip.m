//
//  Trip.m
//  TaxiMeter-OO
//
//  Created by Sahil Gogna on 2018-12-09.
//  Copyright © 2018 Sahil Gogna. All rights reserved.
//

#import "Trip.h"

@implementation Trip

-(id)init{
    self = [super init];
    cost = 0;
    fuelConsumption = 0;
    return self;
}

-(float) absFloat:(float) f{
    if(f < 0){
        f = -1 * f;
    }
    return f;
}

-(int)fact:(int)i{
    int fact = 1;
    int j=1;
    while(j <= i){
        fact = fact *j;
        j++;
    }
    return fact;
}

-(double)sine:(double)x{
    double ret = 0.0;
    for(int i = 1; i < 10; i+=2)
        if(i % 4 == 1)
            ret +=(pow(x,i))/([self fact:i]);
        else if(i % 4 == 3)
            ret -=(pow(x,i))/([self fact:i]);
    return ret;
}

//1-x^2/2!+x^4/4!.......cosine(x)

-(double) cosine:(double) x{
    double ret = 1.0;
    int l = 2;
    for(int i= 1; i<10; i++){
        if(i%2 != 0){
            ret-=(pow (x,l)/[self fact:i]);
            l+=2;
        }
        else{
            ret+= (pow (x,l)/[self fact:i]);
            l+=2;
        }
    }
    return ret;
}

-(double) tangent:(double)x{
    return [self sine:x]/[self cosine:x];
}
-(float)calcFuelConsumption:(float)timeDiff taxiObject:(Taxi *)taxi{
    return timeDiff * (([self absFloat:tanf([taxi getInitialVelocity]*timeDiff)]) + [self absFloat:tanf([taxi getInitialVelocity])]);
}

-(float)calcTimeDifference{
    char stTime[6] = {0};       // init all to 0
    char eTime[6] = {0};
    float difference = 0.0;
    
    printf("Enter start time");
    scanf("%s", stTime);        // read and format into the str buffer
    printf("Enter End time");
    scanf("%s", eTime);
    
    //converting to NSString and then splitting them
    NSString *startTime = [NSString stringWithUTF8String:stTime];
    NSArray *startTimeArray = [startTime componentsSeparatedByString:@"h"];
    NSString *endTime = [NSString stringWithUTF8String:eTime];
    NSArray *endTimeArray = [endTime componentsSeparatedByString:@"h"];
    
    // converting the values to float
    CGFloat stHours = [[startTimeArray objectAtIndex:0] floatValue];
    CGFloat stMins = [[startTimeArray objectAtIndex:1] floatValue];
    CGFloat edHours = [[endTimeArray objectAtIndex:0] floatValue];
    CGFloat edMins = [[endTimeArray objectAtIndex:1] floatValue];
    
    stTimeHours = (stHours + stMins/60); // combining hours and minutes to get the time
    edTimeHours = (edHours + edMins/60);
    
    if(edTimeHours > stTimeHours){
        difference = edTimeHours - stTimeHours;
    }else{ // if user starts at night and ends next day, eg at 23 and ends at 7
        difference = (24- stTimeHours) +edTimeHours;
    }
    
    return difference;
}

-(void)calcCost:(float) difference taxiObject:(Taxi *)taxi;{
    if(difference <=12){
        fuelConsumption = [self calcFuelConsumption:difference taxiObject:taxi];
        printf("\nfuelConsumption = %f \n",fuelConsumption);
        if( fuelConsumption < [taxi getFuelTankLevel] ){ // if tank has enough fuel
            do{
                if( stTimeHours >= 0 && stTimeHours < 8 && difference != 0){ //calculating the ranges and finding the cost
                    float subtractor = edTimeHours < 8 ? edTimeHours :8 ; // this variable is to find the difference in the particular range of the time
                    cost = cost + (( subtractor - stTimeHours) * 30);
                    difference = difference - ( subtractor - stTimeHours); // we keeps on decreasing the number of hours from this variable for which cost is calculated
                    stTimeHours = 8;
                }else if( stTimeHours>=8 && stTimeHours < 14 && difference != 0){
                    float subtractor = edTimeHours < 14 ? edTimeHours :14 ;
                    cost = cost + (( subtractor - stTimeHours) * 20);
                    difference = difference - ( subtractor - stTimeHours);
                    stTimeHours = 14;
                }else if ( stTimeHours >=14 && stTimeHours <=  24 && difference!=0){
                    float subtractor = (edTimeHours < 24 && edTimeHours > 14 )  ? edTimeHours :24 ;
                    cost = cost + (( subtractor - stTimeHours) * 25);
                    difference = difference - ( subtractor - stTimeHours);
                    stTimeHours = 0;
                }
            } while(difference!=0);
            [taxi setNetIncomeGenerated:([taxi getNetIncomeGenerated] + cost)];
            [taxi setFuelTankLevel:([taxi getFuelTankLevel] - fuelConsumption)];
            [taxi setTripMeterCounter:([taxi getTripMeterCounter] + 1)];
            [taxi setMileage:([taxi getMileage] + [taxi calcMileage:difference])];
        }else{ // fuel consumption else loop
            printf("\nNot enough fuel. Please fill the tank\n");
        }
    }else{ // time diff else loop
        printf("\nTrip duration greater than 12 hours\n");
    }
}


@end
