//
//  SABasket.m
//  L4M4
//
//  Created by Alexey on 10/24/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "SABasket.h"

@implementation SABasket
@synthesize fruits;

- (id)init {
    self = [super init];
    if (self) {
        self.fruits = [[NSMutableArray alloc]init];
    }
    return self;
}

- (bool)putFruit:(SAFruit *)fruit {
    if (self.fruits != nil && fruit != nil) {
        [self.fruits addObject:fruit];
        return true;
    }
    return false;
}

@end