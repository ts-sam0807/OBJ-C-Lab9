//
//  NoAnchoviesManager.h
//  PizzaRestaurant
//
//  Created by Ts SaM on 15/9/2023.
//  Copyright © 2023 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Kitchen.h"
#import "DeliveryService.h"

NS_ASSUME_NONNULL_BEGIN

@interface NoAnchoviesManager : NSObject <KitchenDelegate>

- (instancetype)initWithDeliveryService:(DeliveryService *)deliveryService;

@end

NS_ASSUME_NONNULL_END
