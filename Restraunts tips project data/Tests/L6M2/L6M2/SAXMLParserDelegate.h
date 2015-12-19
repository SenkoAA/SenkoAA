//
//  SAXMLParserDelegate.h
//  L6M2
//
//  Created by Alexey on 11/19/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SAXMLParserDelegate : NSObject<NSXMLParserDelegate>

@property NSMutableDictionary *courses;
@property BOOL charCodeFlag;
@property NSString *charCode;
@property BOOL rateFlag;

@end
