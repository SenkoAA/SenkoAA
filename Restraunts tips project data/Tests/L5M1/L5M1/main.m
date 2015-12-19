//
//  main.m
//  L5M1
//
//  Created by Alexey on 11/12/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SATips.h"

NSDictionary *loadTipsToPropertyList(NSString *plistPath) {
    SATips *t1 = [[SATips alloc] initWithRestrauntName:@"Victor" andFoodQuality:7 andServiceQuality:9 andServiceSpeed:7 andRestrauntAtmosphere:9 andPaidForFood:250000];
    //[tipsDict setObject:[t1 getDictionary] forKey:[t1 date]];
    SATips *t2 = [[SATips alloc] initWithRestrauntName:@"Eleon" andFoodQuality:9 andServiceQuality:9 andServiceSpeed:10 andRestrauntAtmosphere:9 andPaidForFood:510000];
    //[tipsDict setObject:[t2 getDictionary] forKey:[t2 date]];
    SATips *t3 = [[SATips alloc] initWithRestrauntName:@"Argon" andFoodQuality:10 andServiceQuality:7 andServiceSpeed:7 andRestrauntAtmosphere:10 andPaidForFood:1200000];
    //[tipsDict setObject:[t3 getDictionary] forKey:[t3 date]];
    SATips *t4 = [[SATips alloc] initWithRestrauntName:@"Primor" andFoodQuality:9 andServiceQuality:10 andServiceSpeed:10 andRestrauntAtmosphere:9 andPaidForFood:2700000];
    //[tipsDict setObject:[t4 getDictionary] forKey:[t4 date]];
    SATips *t5 = [[SATips alloc] initWithRestrauntName:@"Klorina" andFoodQuality:10 andServiceQuality:10 andServiceSpeed:9 andRestrauntAtmosphere:9 andPaidForFood:478000];
    //[tipsDict setObject:[t5 getDictionary] forKey:[t5 date]];
    NSDictionary *tipsDict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects: [t1 getDictionary], [t2 getDictionary], [t3 getDictionary], [t4 getDictionary], [t5 getDictionary], nil] forKeys:[NSArray arrayWithObjects: [t1 restrauntName], [t2 restrauntName], [t3 restrauntName], [t4 restrauntName], [t5 restrauntName], nil]];
    
    NSString *error;
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:tipsDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    if (plistData) {
        [plistData writeToFile:plistPath atomically:YES];
    }
    return tipsDict;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSDictionary *myTips = nil;
        NSString *errorDesc = nil;
        NSPropertyListFormat format;
        NSString *plistPath;
        NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        plistPath = [rootPath stringByAppendingPathComponent:@"L5M1"];
        plistPath = [plistPath stringByAppendingPathComponent:@"L5M1"];
        plistPath = [plistPath stringByAppendingPathComponent:@"Tips.plist"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
            NSBundle *bundle = [NSBundle mainBundle];
            plistPath = [bundle pathForResource:@"Tips" ofType:@"plist"];
        }
        /*plistPath = [[NSBundle bundleForClass:[SATips class]] bundlePath];*/
        NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
        myTips = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
        if (myTips) {
            if ([myTips count] == 0) {
                myTips = loadTipsToPropertyList(plistPath);
            }
            [myTips enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL* stop){
                    SATips *tips = [[SATips alloc] init];
                    NSDictionary *tipsDict = (NSDictionary *)obj;
                    [tips setRestrauntName: key];
                    [tips setDate: [tipsDict objectForKey:@"Date"]];
                    [tips setFoodQuality: [(NSNumber *)[tipsDict objectForKey:@"FoodQuality"] intValue]];
                    [tips setServiceQuality: [(NSNumber *)[tipsDict objectForKey:@"ServiceQuality"] intValue]];
                    [tips setServiceSpeed: [(NSNumber *)[tipsDict objectForKey:@"ServiceSpeed"] intValue]];
                    [tips setRestrauntAtmosphere: [(NSNumber *)[tipsDict objectForKey:@"RestrauntAtmosphere"] intValue]];
                    [tips setPaidForFood: [(NSNumber *)[tipsDict objectForKey:@"PaidForFood"] intValue]];
                    NSLog(@"Restraunt name: %@;\nDate: %@;\nFoodQuality: %d;\nServiceQuality: %d;\nServiceSpeed: %d;\nRestrauntAtmosphere: %d;\nPaidForFood: %d;\nTips: %d.\n\n", [tips restrauntName], [tips date], [tips foodQuality], [tips serviceQuality], [tips serviceSpeed], [tips restrauntAtmosphere], [tips paidForFood], [tips countTips]);
            }];
        } else {
            NSLog(@"Error reading plist: %@, format: %lu", errorDesc, format);
        }
    }
    return 0;
}
