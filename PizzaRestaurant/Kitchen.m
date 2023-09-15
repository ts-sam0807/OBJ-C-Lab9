//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen

/*- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings
 {
 
 }*/

- (Pizza *)makePizzaWithSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    //    if ([toppings containsObject:@"pepperoni"]) {
    //        return [Pizza largePepperoni];
    //    } else if ([toppings containsObject:@"meatlovers"]) {
    //        return [Pizza meatLoversWithSize:size];
    //    } else {
    //        return [[Pizza alloc] initWithSize:size toppings:toppings];
    //    }
    
    BOOL shouldMakePizza = YES;
    BOOL shouldUpgradeOrder = NO;
    
    if ([self.delegate respondsToSelector:@selector(kitchen:shouldMakePizzaOfSize:andToppings:)]) {
        shouldMakePizza = [self.delegate kitchen:self shouldMakePizzaOfSize:size andToppings:toppings];
    }
    
    if ([self.delegate respondsToSelector:@selector(kitchenShouldUpgradeOrder:)]) {
        shouldUpgradeOrder = [self.delegate kitchenShouldUpgradeOrder:self];
    }
    
    if (shouldMakePizza) {
        if (shouldUpgradeOrder) {
            size = Large; // Upgrade to a large pizza
        }
        
        Pizza *pizza = [[Pizza alloc] initWithSize:size toppings:toppings];
        
        if ([self.delegate respondsToSelector:@selector(kitchenDidMakePizza:)]) {
            [self.delegate kitchenDidMakePizza:pizza];
        }
        
        return pizza;
        
    } else {
        
        NSLog(@"Pizza order declined by the delegate.");
        return nil;
    }
    
}


@end
