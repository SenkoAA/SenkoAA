//
//  SAOrange.m
//  Basket
//
//  Created by Alexey on 9/18/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "SAOrange.h"

@implementation SAOrange

- (id)initWithBonesCount:(int)bonesCount{
    self = [super init];
    if (self) {
        self.bonesCount = bonesCount;
    }
    return self;
}

- (NSString *)getInfo{
    NSMutableString * str = [[NSMutableString alloc]initWithString:@"Orange, bonesCount: "];
    NSNumber * bonesCount = [[NSNumber alloc]initWithInt:self.bonesCount];
    [str appendString:[bonesCount stringValue]];
    [str appendString:@";"];
    return str;
}

@end
