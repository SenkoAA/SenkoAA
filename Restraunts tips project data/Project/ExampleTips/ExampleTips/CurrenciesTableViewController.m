//
//  CurrenciesTableViewController.m
//  ExampleTips
//
//  Created by Alexey on 12/22/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "CurrenciesTableViewController.h"

@interface CurrenciesTableViewController ()

@end

@implementation CurrenciesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSURLRequest *requestC = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://nbrb.by/Services/XmlExRates.aspx"]];
    CurrenciesURLConnectionDelegate *_coursesDelegate = [[CurrenciesURLConnectionDelegate alloc] initWithTableViewController:self];
    NSURLConnection *connC = [[NSURLConnection alloc] initWithRequest:requestC delegate:_coursesDelegate];
    [connC start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (section == 0) {
        return 1;
    } else {
        if (_courses) {
            return [_courses count];
        } else {
            return 0;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier;
    long section = [indexPath section];
    long row = [indexPath row];
    if (section == 0) {
        cellIdentifier = @"currentCurrencyIdentifier";
        
        CurrentCurrencyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        cell.nameLabel.text = currentName;
        cell.coursLabel.text = [NSString stringWithFormat:@"%f", currentCours];
        return cell;
    }
    else {
        cellIdentifier = @"currenciesIdentifier";
        
        CurrenciesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        NSArray *keys;
        keys = [[_courses allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            NSString *str1 = (NSString *)obj1;
            NSString *str2 = (NSString *)obj2;
            return [str1 compare:str2];
        }];
        NSString *key = keys[row];
        cell.nameLabel.text = key;
        NSNumber *number = [_courses objectForKey:key];
        cell.coursLabel.text = [number stringValue];
        return cell;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Current currency";
    } else {
        return @"Currencies";
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"currenciesSegue"]) {
        CurrenciesDetailViewController *currenciesDVC = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        long section = [myIndexPath section];
        if (section == 1) {
            CurrenciesTableViewCell *cell = (CurrenciesTableViewCell *)[self.tableView cellForRowAtIndexPath:myIndexPath];
            NSString *currencyName = cell.nameLabel.text;
            NSString *currencyCours = cell.coursLabel.text;
            currenciesDVC.nameLabelContent = currencyName;
            currenciesDVC.coursLabelContent = [currencyCours doubleValue];
            currenciesDVC.currenciesTableViewController = self;
        }
    }
}

+(void)setCurrentName:(NSString *)newCurrentName {
    currentName = newCurrentName;
}
+(void)setCurrentCours:(double)newCurrentCours {
    currentCours = newCurrentCours;
}

@end
