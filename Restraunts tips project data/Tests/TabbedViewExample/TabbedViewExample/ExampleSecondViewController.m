//
//  ExampleSecondViewController.m
//  TabbedViewExample
//
//  Created by Alexey on 11/19/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "ExampleSecondViewController.h"

@interface ExampleSecondViewController ()

@end

@implementation ExampleSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _countriesLabel.text = _country;
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
