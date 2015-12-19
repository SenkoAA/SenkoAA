//
//  TipsTableViewCell.h
//  ExampleTips
//
//  Created by Alexey on 11/20/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *restrauntNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *paidForFoodLabel;

@end
