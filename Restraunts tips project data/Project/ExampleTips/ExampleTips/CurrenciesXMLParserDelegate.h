//
//  CurrenciesXMLParserDelegate.h
//  ExampleTips
//
//  Created by Alexey on 12/23/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrenciesXMLParserDelegate : NSObject<NSXMLParserDelegate>

@property NSMutableDictionary *courses;
@property BOOL charCodeFlag;
@property NSString *charCode;
@property BOOL rateFlag;

@end
