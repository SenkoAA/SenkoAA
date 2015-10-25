//
//  SABasket.h
//  L4M4
//
//  Created by Alexey on 10/24/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SAFruit.h"

@interface SABasket : NSObject

@property NSMutableArray * fruits;

- (bool)putFruit:(SAFruit *)fruit;

@end
