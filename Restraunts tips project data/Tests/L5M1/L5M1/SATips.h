//
//  SATips.h
//  L5M1
//
//  Created by Alexey on 11/12/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SATips : NSObject

@property NSDate *date;
@property NSString *restrauntName;
@property int foodQuality;
@property int serviceQuality;
@property int serviceSpeed;
@property int restrauntAtmosphere;
@property int paidForFood;

-(id)initWithRestrauntName:(NSString *)restrauntName andFoodQuality:(int)foodQuality andServiceQuality:(int)serviceQuality andServiceSpeed:(int)serviceSpeed andRestrauntAtmosphere:(int)restrauntAtmosphere andPaidForFood:(int)paidForFood;
-(NSDictionary *)getDictionary;
-(int)countTips;

@end
