//
//  SATemperatureXMLParserDelegate.h
//  L6M2
//
//  Created by Alexey on 11/20/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SATemperatureXMLParserDelegate : NSObject<NSXMLParserDelegate>

@property NSMutableDictionary *temperatures;
@property BOOL datetimeFlag;
@property NSString *datetime;
@property BOOL temperatureFlag;

@end
