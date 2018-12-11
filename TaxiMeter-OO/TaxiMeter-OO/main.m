
#import <Foundation/Foundation.h>
#import "Trip.h"
#import "ObjectFactory.h"
#import "Taxi.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ObjectFactory *of = [[ObjectFactory alloc]init];
        Taxi *taxi = [of getTaxiObject];
        [taxi setFuelTankLevel:10];
        [taxi setTripMeterCounter:0];
        int choice = 1;
        do{
            printf("Please enter \n 1 to pickup \n 2 to refule \n 3 to Get net Income \n 4 to Car's fule level \n 5 Car's Mileage \n 6 Total number of trips \n 7 to exit");
            scanf("%d",&choice);
            switch (choice) {
                case 1: {
                    printf("Please Enter initial Velocity");
                    float initVelo;
                    scanf("%f",&initVelo);
                    [taxi setInitialVelocity:initVelo];
                    Trip *trip = [[Trip alloc]init];
                    float diff = [trip calcTimeDifference];
                    [trip calcCost:diff taxiObject: taxi];
                }
                break;
                    
                case 2:{
                    [taxi refilTank];
                }break;
                    
                case 3:
                    printf("\nNet Income is %f \n\n", [taxi getNetIncomeGenerated]);
                    break;
                    
                case 4:
                    printf("\nCar's current Fuel level %f \n\n", [taxi getFuelTankLevel]);
                    break;
                    
                case 5:
                    printf("\nCar's Mileage %f \n\n", [taxi getMileage]);
                    break;
                    
                case 6:
                    printf("\nTotal number of trips %d \n\n", [taxi getTripMeterCounter]);
                    break;
                    
                case 7:
                    break;
            }
        }while(choice != 7);
        printf("Exiting...");
    }
    return 0;
}
