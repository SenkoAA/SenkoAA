//
//  RestrauntsTableViewController.m
//  ExampleTips
//
//  Created by Alexey on 12/22/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "RestrauntsTableViewController.h"

@interface RestrauntsTableViewController ()

@end

@implementation RestrauntsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *plistPath = @"/Users/Alexey/Desktop/ExampleTips/ExampleTips/Restraunts.plist";
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    _restraunts  = (NSMutableDictionary *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    if (_restraunts) {
        if ([_restraunts count] == 0) {
            NSMutableDictionary *restrauntsDict = [[NSMutableDictionary alloc]init];
            for (int i = 0; i < 5; i++) {
                NSString *country = [NSString stringWithFormat:(@"Country%d"), i];
                NSString *city = [NSString stringWithFormat:(@"City%d"), i];
                NSString *street = [NSString stringWithFormat:(@"Street%d"), i];
                NSString *homeNumber = [NSString stringWithFormat:(@"HomeNumber%d"), i];
                NSString *restrauntName = [NSString stringWithFormat:(@"RestrauntName%d"), i];
                NSString *comment = [NSString stringWithFormat:(@"Comment%d"), i];
                Restraunt *r = [[Restraunt alloc] initWithCountry:country andCity:city andStreet:street andHomeNumber:homeNumber andRestrauntName:restrauntName andComment:comment];
                [restrauntsDict setObject:[r comment] forKey:[r createRestrauntKey]];
            }
            
            NSString *error;
            NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:restrauntsDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
            if (plistData) {
                [plistData writeToFile:plistPath atomically:YES];
                _restraunts  = restrauntsDict;
            }
        }
    } else {
        NSLog(@"Error reading plist: %@, format: %lu", errorDesc, format);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"restrauntsCellIdentifier";
    RestrauntsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    long row = [indexPath row];
    NSEnumerator *keyEnum = [_restraunts keyEnumerator];
    NSString *restrauntKey;
    for (int i = 0; i <= row; i++) {
        restrauntKey = [keyEnum nextObject];
    }
    Restraunt *r = [[Restraunt alloc]initWithRestrauntKey:restrauntKey andComment: [_restraunts valueForKey:restrauntKey]];
    cell.nameLabel.text = [r restrauntName];
    cell.addressLabel.text  = [r createRestrauntAddress];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_restraunts) {
        return [_restraunts count];
    } else {
        return 0;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"restrauntsSegue"]) {
        RestrauntsDetailViewController *restrauntsDVC = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        long row = [myIndexPath row];
        NSEnumerator *keyEnum = [_restraunts keyEnumerator];
        NSString *restrauntKey;
        for (int i = 0; i <= row; i++) {
            restrauntKey = [keyEnum nextObject];
        }
        Restraunt *r = [[Restraunt alloc]initWithRestrauntKey:restrauntKey andComment: [_restraunts valueForKey:restrauntKey]];
        restrauntsDVC.restraunt = r;
    }
}

@end
