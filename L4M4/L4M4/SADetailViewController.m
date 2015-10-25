//
//  SADetailDelegate.m
//  L4M4
//
//  Created by Alexey on 10/24/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "SADetailViewController.h"

@implementation SADetailViewController
@synthesize infoContent;
@synthesize titleContent;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.infoLabel.text = self.infoContent;
    self.navBar.title = self.titleContent;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end