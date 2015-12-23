//
//  CurrenciesDetailViewController.m
//  ExampleTips
//
//  Created by Alexey on 12/22/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "CurrenciesDetailViewController.h"

@interface CurrenciesDetailViewController ()

@end

@implementation CurrenciesDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _nameLabel.text = _nameLabelContent;
    _coursLabel.text = [NSString stringWithFormat:@"%f", _coursLabelContent];
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

- (IBAction)makeCurrent:(id)sender {
    [CurrenciesTableViewController setCurrentName:[_nameLabelContent copy]];
    [CurrenciesTableViewController setCurrentCours:_coursLabelContent];
    [[_currenciesTableViewController tableView]reloadData];
}
@end
