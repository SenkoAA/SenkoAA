//
//  SATemperatureURLConnectionDelegate.h
//  L6M2
//
//  Created by Alexey on 11/19/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SATemperatureXMLParserDelegate.h"
#import "ViewController.h"

@interface SATemperatureURLConnectionDelegate : NSObject <NSURLConnectionDelegate, NSURLSessionDataDelegate> {
    NSMutableData *_responseData;
}

@property UIViewController *tableViewController;
@property NSMutableDictionary *temperatures;

-(id)initWithTableViewController:(UIViewController *)tableViewController;

@end
