//
//  ViewController.m
//  L4M4
//
//  Created by Alexey on 10/24/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "ViewController.h"
#import "SADetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.basket = [[SABasket alloc] init];
    SAApple * apple1 = [[SAApple alloc] initWithBonesCount:7];
    [self.basket putFruit:apple1];
    SAOrange * orange1 = [[SAOrange alloc]initWithBonesCount:5];
    [self.basket putFruit:orange1];
    SAApple * apple2 = [[SAApple alloc] initWithBonesCount:3];
    [self.basket putFruit:apple2];
    SABanana * banana1 = [[SABanana alloc]init];
    [self.basket putFruit:banana1];
    SAApple * apple3 = [[SAApple alloc] initWithBonesCount:8];
    [self.basket putFruit:apple3];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.basket fruits] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"MyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [[[self.basket fruits] objectAtIndex:indexPath.row]getName];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        NSIndexPath *indexPath = nil;
        NSString *infoString = nil;
        NSString *titleString = nil;
        
        indexPath = [self.tableView indexPathForSelectedRow];
        infoString = [[[self.basket fruits] objectAtIndex:indexPath.row]getInfo];
        titleString = [[[self.basket fruits]objectAtIndex:indexPath.row]getName];
        
        [[segue destinationViewController] setInfoContent:infoString];
        [[segue destinationViewController] setTitleContent:titleString];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end