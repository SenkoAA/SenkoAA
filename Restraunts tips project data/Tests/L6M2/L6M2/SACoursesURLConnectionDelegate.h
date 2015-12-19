//
//  SACoursesURLConnectionDelegate.h
//  L6M2
//
//  Created by Alexey on 11/19/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SAXMLParserDelegate.h"
#import "ViewController.h"

@interface SACoursesURLConnectionDelegate : NSObject <NSURLConnectionDelegate, NSURLSessionDataDelegate> {
    NSMutableData *_responseData;
}

@property UIViewController *tableViewController;
@property NSMutableDictionary *courses;

-(id)initWithTableViewController:(UIViewController *)tableViewController;

@end
