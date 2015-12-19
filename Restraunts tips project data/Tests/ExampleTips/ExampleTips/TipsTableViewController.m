//
//  ViewController.m
//  ExampleTips
//
//  Created by Alexey on 11/20/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "TipsTableViewController.h"

@interface TipsTableViewController ()

@end

@implementation TipsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Tips" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    /*NSPredicate *pred = [NSPredicate predicateWithFormat:@""];
    [request setPredicate:pred];*/
    
    NSError *error;
    _tips = [context executeFetchRequest:request error:&error];
    if (_tips == nil || [_tips count] == 0) {
        NSManagedObject *newTips;
        for (int i = 0; i < 5; i++) {
            newTips = [NSEntityDescription insertNewObjectForEntityForName:@"Tips" inManagedObjectContext:context];
            [newTips setValue:[[NSDate alloc] init] forKey:@"date"];
            NSString *country = [NSString stringWithFormat:(@"Country%d"), i];
            NSString *city = [NSString stringWithFormat:(@"City%d"), i];
            NSString *street = [NSString stringWithFormat:(@"Street%d"), i];
            NSString *homeNumber = [NSString stringWithFormat:(@"HomeNumber%d"), i];
            NSString *restrauntName = [NSString stringWithFormat:(@"RestrauntName%d"), i];
            NSString *comment = [NSString stringWithFormat:(@"Comment%d"), i];
            Restraunt *r = [[Restraunt alloc] initWithCountry:country andCity:city andStreet:street andHomeNumber:homeNumber andRestrauntName:restrauntName andComment:comment];
            [newTips setValue:[r createRestrauntKey] forKey:@"restrauntKey"];
            [newTips setValue:[NSNumber numberWithInt:10] forKey:@"foodQuality"];
            [newTips setValue:[NSNumber numberWithInt:10] forKey:@"serviceQuality"];
            [newTips setValue:[NSNumber numberWithInt:10] forKey:@"serviceSpeed"];
            [newTips setValue:[NSNumber numberWithInt:10] forKey:@"restrauntAtmosphere"];
            [newTips setValue:[NSNumber numberWithInt:10] forKey:@"paidForFood"];
        }
        [context save:&error];
        _tips = [context executeFetchRequest:request error:&error];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"exampleTipsCellIdentifier";
    TipsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    long row = [indexPath row];
    NSManagedObject *object = _tips[row];
    NSDate *date = [object valueForKey:@"date"];
    NSString *restrauntKey = [object valueForKey:@"restrauntKey"];
    NSNumber *paidForFood = [object valueForKey:@"paidForFood"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy HH:mm"];
    cell.dateLabel.text = [dateFormatter stringFromDate:date];
    cell.restrauntNameLabel.text  = [[Restraunt createDictionaryByRestrauntKey:restrauntKey] valueForKey:@"RestrauntName"];
    cell.paidForFoodLabel.text = [paidForFood stringValue];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_tips) {
        return [_tips count];
    } else {
        return 0;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"firstSegue"]) {
        TipsDetailViewController *tipsDVC = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        long row = [myIndexPath row];
        NSManagedObject *object = _tips[row];
        
    }
}

@end
