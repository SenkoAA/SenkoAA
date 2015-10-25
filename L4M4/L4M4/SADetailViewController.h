//
//  SADetailDelegate.h
//  L4M4
//
//  Created by Alexey on 10/24/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SADetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property NSString *infoContent;
@property NSString *titleContent;

@end
