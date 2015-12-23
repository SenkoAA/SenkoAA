//
//  CurrenciesDetailViewController.h
//  ExampleTips
//
//  Created by Alexey on 12/22/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrenciesTableViewController.h"
#import "TipsTableViewController.h"
#import "ProjectTabBarControllerViewController.h"

@interface CurrenciesDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property NSString *nameLabelContent;
@property (weak, nonatomic) IBOutlet UILabel *coursLabel;
@property double coursLabelContent;
@property UITableViewController *currenciesTableViewController;
- (IBAction)makeCurrent:(id)sender;

@end
