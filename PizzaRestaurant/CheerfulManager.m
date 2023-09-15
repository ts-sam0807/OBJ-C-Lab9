//
//  CheerfulManager.m
//  PizzaRestaurant
//
//  Created by Ts SaM on 15/9/2023.
//  Copyright © 2023 Lighthouse Labs. All rights reserved.
//

#import "CheerfulManager.h"

@implementation CheerfulManager {
    DeliveryService *_deliveryService;
}

- (instancetype)initWithDeliveryService:(DeliveryService *)deliveryService {
    self = [super init];
    if (self) {
        _deliveryService = deliveryService;
    }
    return self;
}

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
    return YES;
}

- (void)kitchenDidMakePizza:(Pizza *)pizza {
    NSLog(@"Enjoy your delicious pizza!");
}

@end
