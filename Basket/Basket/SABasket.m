//
//  SABasket.m
//  Basket
//
//  Created by Alexey on 9/18/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "SABasket.h"

@implementation SABasket

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

- (SAIterator *)iterator{
    if (self.fruits != nil) {
        return [[SAIterator alloc]initWithFruits:self.fruits];
    } else {
        return nil;
    }
}

@end
