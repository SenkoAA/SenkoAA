//
//  SATree.m
//  Apple
//
//  Created by Alexey on 9/10/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "SATree.h"

@implementation SATree

- (int)growWithSort:(NSString *)sort andSeason:(NSString *)season {
    if (self.apples == nil || [self.apples count] == 0) {
        self.apples = nil;
        self.apples = [[NSMutableArray alloc] init];
        int minApplesCount = 10;
        int maxApplesCount = 100;
        int applesCount = arc4random_uniform((maxApplesCount - minApplesCount) + 1) + minApplesCount;
        int minBonesCount = 3;
        int maxBonesCount = 7;
        int bonesCount;
        for (int i = 0; i < applesCount; i++) {
            SAApple* apple = [[SAApple alloc] init];
            apple.sort = sort;
            apple.season = season;
            bonesCount = arc4random_uniform((maxBonesCount - minBonesCount) + 1) + minBonesCount;
            apple.bonesCount = bonesCount;
            [self.apples addObject: apple];
        }
        return applesCount;
    } else {
        return 0;
    }
}

- (int)shake {
    if (self.apples != nil && ([self.apples count] != 0)) {
        int curApplesCount = (int)[self.apples count];
        int removeApplesCount = arc4random_uniform(curApplesCount) + 1;
        for (int i = 0; i < removeApplesCount; i++) {
            [self.apples removeLastObject];
        }
        return removeApplesCount;
    } else {
        return 0;
    }
}

- (NSString *)getStatus {
    NSMutableString *curStatus = [[NSMutableString alloc] init];
    int applesCount = 0;
    if (self.apples != nil) {
        applesCount = (int)[self.apples count];
    }
    [curStatus appendString: @"Apples' count: "];
    NSNumber *count = [[NSNumber alloc] initWithInt: applesCount];
    [curStatus appendString: [count stringValue]];
    if (applesCount > 0) {
        SAApple *apple = (SAApple *)[self.apples firstObject];
        [curStatus appendString: @"; Sort: "];
        [curStatus appendString: apple.sort];
        [curStatus appendString: @"; Season: "];
        [curStatus appendString: apple.season];
    }
    [curStatus appendString: @";"];
    return (NSString *)curStatus;
}

 @end
