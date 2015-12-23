//
//  RestrauntsDetailViewController.m
//  ExampleTips
//
//  Created by Alexey on 12/22/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "RestrauntsDetailViewController.h"

@interface RestrauntsDetailViewController ()

@end

@implementation RestrauntsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _countryLabel.text = [_restraunt country];
    _cityLabel.text = [_restraunt city];
    _streetLabel.text = [_restraunt street];
    _homeLabel.text = [_restraunt homeNumber];
    _nameLabel.text = [_restraunt restrauntName];
    _commentTextView.text = [_restraunt comment];
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
