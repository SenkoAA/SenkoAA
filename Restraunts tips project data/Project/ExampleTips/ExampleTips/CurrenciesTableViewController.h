//
//  CurrenciesTableViewController.h
//  ExampleTips
//
//  Created by Alexey on 12/22/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CurrenciesURLConnectionDelegate.h"
#import "CurrenciesTableViewCell.h"
#import "CurrentCurrencyTableViewCell.h"
#import "CurrenciesDetailViewController.h"

static NSString *nativeCurrency = @"BYR";
static double nativeCours = 1.0;

static NSString *currentName = @"BYR";
static double currentCours = 1.0;

@interface CurrenciesTableViewController : UITableViewController <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property NSDictionary *courses;
+(void)setCurrentName:(NSString *)newCurrentName;
+(void)setCurrentCours:(double)newCurrentCours;

@end
