//
//  TipsDetailViewController.h
//  ExampleTips
//
//  Created by Alexey on 11/20/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipsDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *streetLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *foodQualityLabel;
@property (weak, nonatomic) IBOutlet UILabel *serviceQualityLabel;
@property (weak, nonatomic) IBOutlet UILabel *serviceSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *restrauntAtmosphereLabel;
@property (weak, nonatomic) IBOutlet UILabel *paidForFoodLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *commonCostLabel;


@end
