//
//  SAIterator.m
//  Basket
//
//  Created by Alexey on 9/18/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "SAIterator.h"

@implementation SAIterator

- (bool)hasNext{
    if (self.side) {
        return (self.firstId <= self.maxFirstId);
    } else {
        return (self.lastId >= self.minLastId);
    }
}

- (id)initWithFruits:(NSMutableArray *)fruits{
    self = [super init];
    if (self) {
        self.fruits = fruits;
        NSUInteger fruitsCount = [self.fruits count];
        if (fruitsCount == 0) {
            self.firstId = -1;
            self.maxFirstId  = -2;
            self.lastId = -1;
            self.minLastId = 0;
            self.side = true;
        } else {
            self.firstId = 0;
            self.lastId = (int)fruitsCount - 1;
            if (fruitsCount%2 == 0) {
                self.maxFirstId  = (int)fruitsCount/2 - 1;
                self.minLastId = (int)fruitsCount - 1 - self.maxFirstId;
            } else {
                self.maxFirstId  = (int)fruitsCount/2;
                self.minLastId = (int)fruitsCount - self.maxFirstId;
            }
            if (self.firstId == self.lastId) {
                self.lastId = -1;
                self.minLastId = 0;
            }
            self.side = true;
        }
    }
    return self;
}

- (id)next{
    int index;
    if (self.side) {
        index = self.firstId++;
    } else {
        index = self.lastId--;
    }
    self.side = !self.side;
    if (index >= 0 && index < [self.fruits count]) {
        return [self.fruits objectAtIndex:index];
    } else {
        return nil;
    }
}

@end
