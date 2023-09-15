//
//  DeliveryService.h
//  PizzaRestaurant
//
//  Created by Ts SaM on 15/9/2023.
//  Copyright © 2023 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Pizza;

NS_ASSUME_NONNULL_BEGIN

@interface DeliveryService : NSObject

@property (nonatomic, readonly) NSArray *deliveredPizzas;
- (void)deliverPizza:(Pizza *)pizza;
- (NSArray *)descriptionOfDeliveredPizzas;


@end

NS_ASSUME_NONNULL_END
