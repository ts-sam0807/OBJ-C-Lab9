//
//  DeliveryService.m
//  PizzaRestaurant
//
//  Created by Ts SaM on 15/9/2023.
//  Copyright © 2023 Lighthouse Labs. All rights reserved.
//

#import "DeliveryService.h"
#import "Pizza.h"

@implementation DeliveryService {
    NSMutableArray *_deliveredPizzas;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _deliveredPizzas = [NSMutableArray array];
    }
    return self;
}

- (void)deliverPizza:(Pizza *)pizza {
    if (pizza) {
        [_deliveredPizzas addObject:pizza];
    }
}

- (NSArray *)descriptionOfDeliveredPizzas {
    NSMutableArray *pizzaDescriptions = [NSMutableArray array];
    for (Pizza *pizza in _deliveredPizzas) {
        NSString *sizeString = [Pizza pizzaSizeToString:pizza.size];
        NSString *toppingsString = [pizza.toppings componentsJoinedByString:@", "];
        NSString *description = [NSString stringWithFormat:@"%@ pizza with toppings: %@", sizeString, toppingsString];
        [pizzaDescriptions addObject:description];
    }
    return [pizzaDescriptions copy];
}

@end
