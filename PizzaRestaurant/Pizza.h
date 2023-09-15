//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by Ts SaM on 14/9/2023.
//  Copyright © 2023 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, PizzaSize) {
    Small,
    Medium,
    Large
};

@interface Pizza : NSObject

@property (nonatomic, assign) PizzaSize size;
@property (nonatomic, strong) NSArray *toppings;

- (instancetype)initWithSize:(PizzaSize)size toppings:(NSArray *)toppings;

// Class methods to convert between string And enum
+ (PizzaSize)pizzaSizeFromString:(NSString *)sizeString;
+ (NSString *)pizzaSizeToString:(PizzaSize)size;

// Stretch Goals
+ (Pizza *)largePepperoni;
+ (Pizza *)meatLoversWithSize:(PizzaSize)size;

@end

NS_ASSUME_NONNULL_END
