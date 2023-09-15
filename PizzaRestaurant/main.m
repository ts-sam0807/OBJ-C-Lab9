//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"
#import "Kitchen.h"
#import "NoAnchoviesManager.h"
#import "CheerfulManager.h"
#import "DeliveryService.h"
#import "DeliveryCar.h"

// // (Part 2)
//@interface PizzaShop : NSObject <KitchenDelegate>
//
//@end
//
//@implementation PizzaShop
//
//- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {
//    return YES;
//}
//
//- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
//    return NO;
//}
//
//- (void)kitchenDidMakePizza:(Pizza *)pizza {
//    NSLog(@"Pizza is ready!");
//}
//
//@end

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        NSLog(@"Please pick your pizza size and toppings:");
        
//        // (Part 1)
//        Kitchen *restaurantKitchen = [Kitchen new];
//        PizzaShop *shop = [PizzaShop new];
//        restaurantKitchen.delegate = shop;
        
//        // // (Part 2)
//        NoAnchoviesManager *noAnchoviesManager = [NoAnchoviesManager new];
//        CheerfulManager *cheerfulManager = [CheerfulManager new];
        
//        id<KitchenDelegate> currentManager = nil;
//        static dispatch_once_t onceToken;
//        static NoAnchoviesManager *noAnchoviesManager = nil;
//        static CheerfulManager *cheerfulManager = nil;
        
        // (Part 3)
        Kitchen *restaurantKitchen = [Kitchen new];
        DeliveryService *deliveryService = [DeliveryService new];
        NoAnchoviesManager *noAnchoviesManager = [[NoAnchoviesManager alloc] initWithDeliveryService:deliveryService];
        CheerfulManager *cheerfulManager = [[CheerfulManager alloc] initWithDeliveryService:deliveryService];

        while (TRUE) {
            // Loop forever
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"Input was %@", inputString);
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            
            NSLog(@"Select a manager: ");
            NSLog(@"1. No Anchovies Manager");
            NSLog(@"2. Cheerful Manager");
            NSLog(@"3. No Manager");
            NSLog(@"4. Show Delivered Pizzas");
            NSLog(@"> ");
            char managerChoice[100];
            fgets (managerChoice, 100, stdin);

            NSString *managerChoiceString = [[NSString alloc] initWithUTF8String:managerChoice];
            managerChoiceString = [managerChoiceString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

            if ([managerChoiceString isEqualToString:@"1"]) {
                restaurantKitchen.delegate = noAnchoviesManager;
            } else if ([managerChoiceString isEqualToString:@"2"]) {
                restaurantKitchen.delegate = cheerfulManager;
            } else if ([managerChoiceString isEqualToString:@"3"]) {
                restaurantKitchen.delegate = nil; // No manager
            } else if ([managerChoiceString isEqualToString:@"4"]) {
                NSArray *deliveredPizzas = [deliveryService descriptionOfDeliveredPizzas];
                NSLog(@"Delivered Pizzas:\n%@", [deliveredPizzas componentsJoinedByString:@"\n"]);
            } else {
                NSLog(@"Invalid manager choice.");
            }
            
//            // (Part 2)
//            restaurantKitchen.delegate = currentManager;
            
            // And then send some message to the kitchen...
            if ([commandWords count] > 1) {
                NSString *sizeString = [commandWords objectAtIndex:0];
                PizzaSize size = [Pizza pizzaSizeFromString:sizeString];
                NSArray *toppings = [commandWords subarrayWithRange:NSMakeRange(1, [commandWords count] - 1)];
                Pizza *pizza = [restaurantKitchen makePizzaWithSize:size andToppings:toppings];
                NSLog(@"You ordered a %@ pizza with toppings: %@", [Pizza pizzaSizeToString:pizza.size], [pizza.toppings componentsJoinedByString:@", "]);
            } else {
                NSLog(@"Invalid input. Please specify the size and toppings.");
            }
            
        }
        
    }
    return 0;
}

