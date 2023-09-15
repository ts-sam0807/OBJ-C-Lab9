//
//  DeliveryCar.m
//  PizzaRestaurant
//
//  Created by Ts SaM on 15/9/2023.
//  Copyright © 2023 Lighthouse Labs. All rights reserved.
//

#import "DeliveryCar.h"
#import "Pizza.h"

@implementation DeliveryCar

- (void)deliverPizza:(Pizza *)pizza {
    NSLog(@"Delivering %@ pizza to the customer.", [Pizza pizzaSizeToString:pizza.size]);
}

@end
