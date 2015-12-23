//
//  TipsCreationViewController.h
//  ExampleTips
//
//  Created by Alexey on 12/22/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrenciesTableViewController.h"

@interface TipsCreationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *foodQualitySlider;
@property (weak, nonatomic) IBOutlet UISlider *serviceSpeedSlider;
@property (weak, nonatomic) IBOutlet UISlider *serviceQualitySlider;
@property (weak, nonatomic) IBOutlet UISlider *atmosphereSlider;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (weak, nonatomic) IBOutlet UITextField *paidForFoodTextField;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *restrauntPickerView;
- (IBAction)createTips:(id)sender;

@end
