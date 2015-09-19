//
//  SABasket.h
//  Basket
//
//  Created by Alexey on 9/18/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SAFruit.h"
#import "SAIterator.h"

@interface SABasket : NSObject

@property NSMutableArray * fruits;

- (bool)putFruit:(SAFruit *)fruit;
- (SAIterator *)iterator;

@end
