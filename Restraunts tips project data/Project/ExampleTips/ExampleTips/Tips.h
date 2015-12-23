//
//  Tips.h
//  ExampleTips
//
//  Created by Alexey on 12/22/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tips : NSObject

@property NSDate *date;
@property NSString *restrauntKey;
@property int foodQuality;
@property int serviceQuality;
@property int serviceSpeed;
@property int restrauntAtmosphere;
@property int paidForFood;

-(id)initWithRestrauntName:(NSString *)restrauntKey andFoodQuality:(int)foodQuality andServiceQuality:(int)serviceQuality andServiceSpeed:(int)serviceSpeed andRestrauntAtmosphere:(int)restrauntAtmosphere andPaidForFood:(int)paidForFood;
-(NSDictionary *)getDictionary;
-(int)countTips;

@end
