//
//  main.m
//  Basket
//
//  Created by Alexey on 9/18/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SAApple.h"
#import "SABasket.h"
#import "SAOrange.h"
#import "SABanana.h"
#import "SAIterator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SABasket * basket = [[SABasket alloc] init];
        SAApple * apple1 = [[SAApple alloc] initWithBonesCount:7];
        [basket putFruit:apple1];
        SAOrange * orange1 = [[SAOrange alloc]initWithBonesCount:5];
        [basket putFruit:orange1];
        SAApple * apple2 = [[SAApple alloc] initWithBonesCount:3];
        [basket putFruit:apple2];
        SABanana * banana1 = [[SABanana alloc]init];
        [basket putFruit:banana1];
        SAApple * apple3 = [[SAApple alloc] initWithBonesCount:8];
        [basket putFruit:apple3];
        SAIterator * it = [basket iterator];
        while ([it hasNext]) {
            SAFruit * fruit = [it next];
            NSLog([fruit getInfo]);
        }
    }
    return 0;
}
