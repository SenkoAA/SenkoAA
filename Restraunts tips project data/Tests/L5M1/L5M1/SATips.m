//
//  SATips.m
//  L5M1
//
//  Created by Alexey on 11/12/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "SATips.h"

@implementation SATips

@synthesize date = _date;
@synthesize restrauntName = _restrauntName;
@synthesize foodQuality = _foodQuality;
@synthesize serviceQuality = _serviceQuality;
@synthesize serviceSpeed = _serviceSpeed;
@synthesize restrauntAtmosphere = _restrauntAtmosphere;
@synthesize paidForFood = _paidForFood;

-(id)initWithRestrauntName:(NSString *)restrauntName andFoodQuality:(int)foodQuality andServiceQuality:(int)serviceQuality andServiceSpeed:(int)serviceSpeed andRestrauntAtmosphere:(int)restrauntAtmosphere andPaidForFood:(int)paidForFood {
    self = [super init];
    if (self) {
        _date = [[NSDate alloc]init];
        _restrauntName = [[NSString alloc]initWithString:restrauntName];
        _foodQuality = foodQuality;
        _serviceQuality = serviceQuality;
        _serviceSpeed = serviceSpeed;
        _restrauntAtmosphere = restrauntAtmosphere;
        _paidForFood = paidForFood;
    }
    return self;
}

-(NSDictionary *)getDictionary {
    NSMutableDictionary *tipsDict = [[NSMutableDictionary alloc] init];
    [tipsDict setObject:_date forKey:@"Date"];
    [tipsDict setObject:[NSNumber numberWithInt:_foodQuality] forKey:@"FoodQuality"];
    [tipsDict setObject:[NSNumber numberWithInt:_serviceQuality] forKey:@"ServiceQuality"];
    [tipsDict setObject:[NSNumber numberWithInt:_serviceSpeed] forKey:@"ServiceSpeed"];
    [tipsDict setObject:[NSNumber numberWithInt:_restrauntAtmosphere] forKey:@"RestrauntAtmosphere"];
    [tipsDict setObject:[NSNumber numberWithInt:_paidForFood] forKey:@"PaidForFood"];
    return tipsDict;
}

-(int)countTips {
    return (int)_paidForFood * (0.3 * _foodQuality + 0.3 * _serviceQuality + 0.2 * _serviceSpeed + 0.2 * _restrauntAtmosphere) / 100;
}

@end
