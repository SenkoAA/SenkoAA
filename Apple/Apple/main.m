//
//  main.m
//  Apple
//
//  Created by Alexey on 9/10/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SATree.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World! My name is Alexey.");
        SATree *myTree = [[SATree alloc] init];
        [myTree growWithSort:@"Brina" andSeason:@"Early autumn"];
        NSLog([myTree getStatus]);
        NSLog(@"First shake:");
        [myTree shake];
        NSLog([myTree getStatus]);
        NSLog(@"Second shake:");
        [myTree shake];
        NSLog([myTree getStatus]);
        NSLog(@"Try to grow again:");
        [myTree growWithSort:@"Antonovka" andSeason:@"Late september"];
        NSLog([myTree getStatus]);
    }
    return 0;
}
