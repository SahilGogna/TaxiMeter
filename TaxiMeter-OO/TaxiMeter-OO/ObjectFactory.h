//
//  ObjectFactory.h
//  TaxiMeter-OO
//
//  Created by Sahil Gogna on 2018-12-09.
//  Copyright © 2018 Sahil Gogna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Taxi.h"
#import "Trip.h"

NS_ASSUME_NONNULL_BEGIN

@interface ObjectFactory : NSObject
@property Taxi *taxi;
-(id)init;
-(Taxi *)getTaxiObject;
@end

NS_ASSUME_NONNULL_END
