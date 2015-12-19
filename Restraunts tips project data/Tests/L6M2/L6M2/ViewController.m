//
//  ViewController.m
//  L6M2
//
//  Created by Alexey on 11/12/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURLRequest *requestC = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://nbrb.by/Services/XmlExRates.aspx"]];
    SACoursesURLConnectionDelegate *_coursesDelegate = [[SACoursesURLConnectionDelegate alloc] initWithTableViewController:self];
    NSURLConnection *connC = [[NSURLConnection alloc] initWithRequest:requestC delegate:_coursesDelegate];
    [connC start];
    NSURLRequest *requestT = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://eurometeo.ru/belarus/minskaya-oblast/minsk/export/xml/data"]];
    SATemperatureURLConnectionDelegate *_temperaturesDelegate = [[SATemperatureURLConnectionDelegate alloc] initWithTableViewController:self];
    NSURLConnection *connT = [[NSURLConnection alloc] initWithRequest:requestT delegate:_temperaturesDelegate];
    [connT start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier;
    long section = [indexPath section];
    long row = [indexPath row];
    if (section == 0) {
        cellIdentifier = @"coursesCell";
        
        SATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        NSArray *keys;
        keys = [[_courses allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            NSString *str1 = (NSString *)obj1;
            NSString *str2 = (NSString *)obj2;
            return [str1 compare:str2];
        }];
        NSString *key =keys[row];
        cell.namesLabel.text = key;
        NSNumber *number = [_courses objectForKey:key];
        cell.coursesLabel.text = [number stringValue];
        return cell;
    }
    else {
        cellIdentifier = @"temperaturesCell";
        
        SATemperatureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        NSArray *keys;
        keys = [[_temperatures allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            NSString *str1 = (NSString *)obj1;
            NSString *str2 = (NSString *)obj2;
            return [str1 compare:str2];
        }];
        NSString *key = keys[row];
        cell.date.text = key;
        NSNumber *number = [_temperatures objectForKey:key];
        cell.temperature.text = [number stringValue];
        return cell;
    }
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Courses";
    } else {
        return @"Temperatures";
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        if (_courses == nil) {
            return 0;
        } else {
            return [_courses count];
        }
    }
    else {
        if (_temperatures == nil) {
            return 0;
        } else {
            return [_temperatures count];
        }
    }
}

@end
