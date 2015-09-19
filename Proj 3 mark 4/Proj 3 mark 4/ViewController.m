//
//  ViewController.m
//  Proj 3 mark 4
//
//  Created by Alexey on 9/19/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)growTree:(id)sender {
    self.appleTree = nil;
    self.appleTree = [[SATree alloc] init];
    NSString *sorts[3];
    sorts[0] = @"Brina";
    sorts[1] = @"Antonovka";
    sorts[2] = @"Cvinti";
    
    NSString *seasons[3];
    seasons[0] = @"Early autumn";
    seasons[1] = @"Late september";
    seasons[2] = @"Early summer";
    
    int i = arc4random_uniform(3);
    [self.appleTree growWithSort:sorts[i] andSeason:seasons[i]];
    self->statusLabel.text = [self.appleTree getStatus];
    self->fallenApplesCountLabel.text = @"0";
}

- (IBAction)shakeTree:(id)sender {
    if (self.appleTree != nil) {
        int fallenApplesCount = [self.appleTree shake];
        self->fallenApplesCountLabel.text = [[NSNumber numberWithInt:fallenApplesCount]stringValue];
        self->statusLabel.text = [self.appleTree getStatus];
    }
}
@end
