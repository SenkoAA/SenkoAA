//
//  ViewController.h
//  L4M4
//
//  Created by Alexey on 10/24/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SAApple.h"
#import "SABasket.h"
#import "SAOrange.h"
#import "SABanana.h"

@interface ViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property SABasket *basket;
//@property SAIterator *it;

@end