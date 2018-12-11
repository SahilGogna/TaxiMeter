
#import <Foundation/Foundation.h>

float netIncome = 0;
float taxiTank = 10;
float carMileage = 0;
int numberOfTrips = 0;

float randomNumber(float top, float bottom){
    srand((unsigned int)time(0));
    int num = rand();
    float number = fmod((bottom+num), top-bottom) + bottom;
    return number;
}


float absFloat(float f){
    if(f < 0){
        f = -1 * f;
    }
    return f;
}

int fact(int i){
    int fact = 1;
    int j=1;
    while(j <= i){
        fact = fact *j;
        j++;
    }
    return fact;
}

double sine(double x){
    double ret = 0.0;
    for(int i = 1; i < 10; i+=2)
        if(i % 4 == 1)
            ret +=(pow(x,i))/(fact(i));
    else if(i % 4 == 3)
        ret -=(pow(x,i))/(fact(i));
    return ret;
}

//1-x^2/2!+x^4/4!.......cosine(x)

double cosine(double x){
    double ret = 1.0;
    int l = 2;
    for(int i= 1; i<10; i++){
        if(i%2 != 0){
            ret-=(pow (x,l)/fact(l));
            l+=2;
        }
        else{
            ret+= (pow (x,l)/fact(l));
            l+=2;
        }
    }
    return ret;
}

double tangent(double x){
    return sine(x)/cosine(x);
}

float calcFuelConsumption(float time, float v0){
    return time * (absFloat(tanf(v0*time)) + tanf(tanf(v0)));
}

float calculateCarMilege(float time, float v0){
    float mileage = powf(v0, 2*time) - (v0*time);
    return mileage;
}

void managePickup(){
    char stTime[6] = {0};       // init all to 0
    char eTime[6] = {0};
    float fuelConsumption;
    float cost = 0;
    float difference; // this variable hold the difference between Start time and end time
    float v0;
    
    printf("Enter start time");
    scanf("%s", stTime);        // read and format into the str buffer
    printf("Enter End time");
    scanf("%s", eTime);
    printf("Enter initial velocity");
    scanf("%f",&v0);
    
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
    
    float stTimeHours = (stHours + stMins/60); // combining hours and minutes to get the time
    float edTimeHours = (edHours + edMins/60);
    
    if(edTimeHours > stTimeHours){
        difference = edTimeHours - stTimeHours;
    }else{ // if user starts at night and ends next day, eg at 23 and ends at 7
        difference = (24- stTimeHours) +edTimeHours;
    }
    
    
    if(difference <=12){
        fuelConsumption = calcFuelConsumption(difference,v0);
        printf("\nfuelConsumption = %f \n",fuelConsumption);
        if( fuelConsumption < taxiTank ){ // if tank has enough fuel
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
            netIncome = netIncome + cost;
            taxiTank = taxiTank - fuelConsumption;
            numberOfTrips ++;
            carMileage = carMileage + calculateCarMilege(difference, v0);
            printf("\ncost = %f\n", cost);
            printf("\ncarMileage = %f\n", carMileage);
            printf("\nnet income = %f\n", netIncome);
        }else{ // fuel consumption else loop
            printf("\nNot enough fuel. Please fill the tank\n");
        }
    }else{ // time diff else loop
        printf("\nTrip duration greater than 12 hours\n");
    }
}

float getRandomPrice(){
    return 1.25;
}

void refil(){
    printf("Please enter gas in liters\n");
    float gasQuantity;
    scanf("%f",&gasQuantity);
    float costOfFuel = gasQuantity* getRandomPrice();
    if( costOfFuel < netIncome){
        taxiTank = taxiTank + gasQuantity;
        netIncome = netIncome - costOfFuel;
        printf("The cost of %f fuel is %f\n",gasQuantity ,costOfFuel);
    }else{
        printf("\nNot enough money to buy gas\n");
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int choice = 1;
        do{
            printf("Please enter \n 1 to pickup \n 2 to refule \n 3 to Get net Income \n 4 to Car's fule level \n 5 Car's Mileage \n 6 Total number of trips \n 7 to exit");
            scanf("%d",&choice);
            switch (choice) {
                case 1:
                    managePickup();
                    break;

                case 2:
                    refil();
                    break;
                case 3:
                    printf("\nNet Income is %f \n\n", netIncome);
                    break;
                case 4:
                    printf("\nCar's current Fuel level %f \n\n", taxiTank);
                    break;
                case 5:
                    printf("\nCar's Mileage %f \n\n", carMileage);
                    break;
                case 6:
                    printf("\nTotal number of trips %d \n\n", numberOfTrips);
                    break;
                case 7:
                    break;
            }

        }while(choice != 7);
        printf("Total number of trips are %d\n", numberOfTrips);

    }
    return 0;
}
