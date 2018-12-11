//
//  ObjectFactory.m
//  TaxiMeter-OO
//
//  Created by Sahil Gogna on 2018-12-09.
//  Copyright © 2018 Sahil Gogna. All rights reserved.
//

#import "ObjectFactory.h"

@implementation ObjectFactory

@synthesize taxi;
-(id)init {
    self = [super init];
    taxi = nil;
    return self;
}
-(Taxi *)getTaxiObject{
    if(taxi == nil){
        NSLog(@"Returning new taxi object!");
        taxi = [[Taxi alloc]init];
    }
    return taxi;
}
@end
