//
//  ViewController.h
//  L6M2
//
//  Created by Alexey on 11/12/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SACoursesURLConnectionDelegate.h"
#import "SATemperatureURLConnectionDelegate.h"
#import "SATableViewCell.h"
#import "SATemperatureTableViewCell.h"

@interface ViewController : UITableViewController <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

//{
    //NSMutableData *_responseData;
    //SACoursesURLConnectionDelegate *_coursesDelegate;
    //NSMutableData *_responseDataForTemperature;
    //SATemperatureURLConnectionDelegate *_temperaturesDelegate;
//}

@property NSDictionary *courses;
@property NSDictionary *temperatures;


@end

