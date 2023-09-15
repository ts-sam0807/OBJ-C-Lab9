//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by Ts SaM on 14/9/2023.
//  Copyright © 2023 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza

- (instancetype)initWithSize:(PizzaSize)size toppings:(NSArray *)toppings {
    self = [super init];
    if (self) {
        _size = size;
        _toppings = toppings;
    }
    return self;
}

+ (PizzaSize)pizzaSizeFromString:(NSString *)sizeString {
    if ([sizeString isEqualToString:@"small"]) {
        return Small;
    } else if ([sizeString isEqualToString:@"medium"]) {
        return Medium;
    } else if ([sizeString isEqualToString:@"large"]) {
        return Large;
    } else {
        return Small;
    }
}

+ (NSString *)pizzaSizeToString:(PizzaSize)size {
    switch (size) {
        case Small:
            return @"small";
        case Medium:
            return @"medium";
        case Large:
            return @"large";
    }
}

+ (Pizza *)largePepperoni {
    return [[Pizza alloc] initWithSize:Large toppings:@[@"pepperoni"]];
}

+ (Pizza *)meatLoversWithSize:(PizzaSize)size {
    NSArray *meatLoversToppings = @[@"sausage", @"bacon", @"pepperoni", @"ham"];
    return [[Pizza alloc] initWithSize:size toppings:meatLoversToppings];
}

@end
