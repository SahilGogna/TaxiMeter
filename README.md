# TaxiMeter 

This project has been implemented in 2 ways. One using basic functional approach of C and another object oriented approach.


The goal of this project is to implement a taximeter. The taximeter application is going to provide the following functionalities:
1. Pick up passengers
2. Fill up the gas tank

These functionalities must be accessible to the user of taximeter through a menu. The following information must be shown to the user of taximeter in the application:
1. Net income
2. Car’s fuel level
3. Car’s mileage
4. Total number of trips
Use case scenarios

Picking up passengers:
If the taxi driver chose to pick up a passenger, a new menu must be shown. In this menu, taxi driver must enter the start time and the end time for the trip and also the initial speed of the taxi (in km/h). The taximeter must then calculate the cost of that trip. A single trip cannot take more than 12 hours (An appropriate error message must be shown). 
Use the following rules to calculate the cost of trips based on the time:
1. From 00h00 to 8h00: $30 for every hour 
2. From 8h00 to 14h00: $20 for every hour 
3. From 14h00 to 00h00: $25 for every hour

Filling up the gas tank:
If the taxi driver chose to fill up the gas tank, a new menu must be shown. In this menu, taxi driver may enter how much gas he wants in litres. If the cost of the fuel is less than their account balance, the transaction will be processed, and the gas tank will be refueled and also the money will be withdrawn from their balance (An appropriate error message must be shown if the cost is more than their balance). The price of the fuel will be a random number between $1.15 and $1.45 (it must change each time the taxi driver choses to refuel).

Net Income:
Initial value of net income is zero when the application starts. Each time a trip is completed, the cost of trip is credited to the taxi driver’s account. Also, the cost of fuel must be debited from this balance, each time the taxi driver refuels their taxi.
 
 
Sample input
S:  9h00
E:  15h00
V0: 0.0
 
Sample output
Cost: $125

Car’s fuel level:
The taxi driver must enter the initial fuel level when the application starts. Then, each time a trip is done, the total fuel consumption of that trip will be calculated using the formula provided below. If the remaining fuel is not enough to conduct a trip, an appropriate message must be shown to the taxi driver (only a warning not an error) and the trip should NOT be blocked. However, whenever the taxi runs out of the fuel within a trip, the taxi driver must call an on-site gas refuelling service and will be charged with a service fee of $100.

Car’s mileage
After every trip, total car’s mileage will be added with the mileage of that trip calculated using the following formula. Also, the total number of tips must be increased by one.

Fuel consumption formula:
L: Taxi’s fuel level
t: total hours of the trip v0: initial speed of the taxi

Mileage formula:
K: Taxi’s mileage
t: total hours of the trip v0: initial speed of the taxi
𝐿= 𝐿−(𝑡 ×|tan(𝑣0×𝑡)|+|cos(𝑣0)|)
𝐾=𝐾+𝑣045 −𝑣0×𝑡
