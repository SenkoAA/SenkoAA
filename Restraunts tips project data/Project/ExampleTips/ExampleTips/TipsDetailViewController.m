//
//  TipsDetailViewController.m
//  ExampleTips
//
//  Created by Alexey on 11/20/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "TipsDetailViewController.h"

@interface TipsDetailViewController ()

@end

@implementation TipsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy HH:mm"];
    _dateLabel.text = [dateFormatter stringFromDate:[_tips date]];
    NSDictionary *dict = [Restraunt createDictionaryByRestrauntKey:[_tips restrauntKey]];
    _countryLabel.text = [dict valueForKey:@"Country"];
    _cityLabel.text = [dict valueForKey:@"City"];
    _streetLabel.text = [dict valueForKey:@"Street"];
    _homeNumberLabel.text = [dict valueForKey:@"HomeNumber"];
    _nameLabel.text = [dict valueForKey:@"RestrauntName"];
    _foodQualityLabel.text = [NSString stringWithFormat:@"%d", [_tips foodQuality]];
    _serviceQualityLabel.text = [NSString stringWithFormat:@"%d", [_tips serviceQuality]];
    _serviceSpeedLabel.text = [NSString stringWithFormat:@"%d", [_tips serviceSpeed]];
    _restrauntAtmosphereLabel.text = [NSString stringWithFormat:@"%d", [_tips restrauntAtmosphere]];
    int pff = (int)[_tips paidForFood]*currentCours/nativeCours;
    _paidForFoodLabel.text = [NSString stringWithFormat:@"%d", pff];
    int t = (int)[_tips countTips]*currentCours/nativeCours;
    _tipsLabel.text = [NSString stringWithFormat:@"%d", t];
    _commonCostLabel.text = [NSString stringWithFormat:@"%d", pff + t];
    _currencyLabel.text = currentName;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
