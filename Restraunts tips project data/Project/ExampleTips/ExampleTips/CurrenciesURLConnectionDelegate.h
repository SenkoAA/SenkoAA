//
//  CurrenciesURLConnectionDelegate.h
//  ExampleTips
//
//  Created by Alexey on 12/23/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CurrenciesXMLParserDelegate.h"
#import "CurrenciesTableViewController.h"

@interface CurrenciesURLConnectionDelegate : NSObject <NSURLConnectionDelegate, NSURLSessionDataDelegate> {
    NSMutableData *_responseData;
}

@property UIViewController *tableViewController;
@property NSMutableDictionary *courses;

-(id)initWithTableViewController:(UIViewController *)tableViewController;

@end
