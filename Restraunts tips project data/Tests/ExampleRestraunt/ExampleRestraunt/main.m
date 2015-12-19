//
//  main.m
//  ExampleRestraunt
//
//  Created by Alexey on 11/19/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Restraunt.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        Restraunt *r1 = [[Restraunt alloc] initWithCountry:@"Russia" andCity:@"Moscow" andStreet:@"Pervaia" andHomeNumber:@"21a" andRestrauntName:@"Victor" andComment:@"Good at all!"];
        Restraunt *r2 = [[Restraunt alloc] initWithRestrauntKey:@"Belarus|Minsk|Novaia|75|Prostor" andComment:@"Not bad!"];
        NSLog(@"r1: %@", r1);
        NSLog(@"r2: %@", r2);
        NSLog(@"r1 key: %@,\nr1 address: %@,\nr1 comment: %@", [r1 createRestrauntKey], [r1 createRestrauntAddress], [r1 comment]);
        NSDictionary *dict1 = [Restraunt createDictionaryByRestrauntKey:[r1 createRestrauntKey]];
        [dict1 enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSLog(@"note1: %@ = %@", key, obj);
        }];
        NSLog(@"r2 key: %@,\nr2 address: %@,\nr2 comment: %@", [r2 createRestrauntKey],
            [r2 createRestrauntAddress], [r2 comment]);
        NSDictionary *dict2 = [Restraunt createDictionaryByRestrauntKey:[r2 createRestrauntKey]];
        [dict2 enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSLog(@"note2: %@ = %@", key, obj);
        }];
    }
    return 0;
}
