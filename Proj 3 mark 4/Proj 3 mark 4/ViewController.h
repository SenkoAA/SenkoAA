//
//  ViewController.h
//  Proj 3 mark 4
//
//  Created by Alexey on 9/19/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SATree.h"

@interface ViewController : UIViewController {
    
    
    IBOutlet UILabel *statusLabel;
    IBOutlet UILabel *fallenApplesCountLabel;
}

@property SATree *appleTree;

- (IBAction)growTree:(id)sender;
- (IBAction)shakeTree:(id)sender;
@end

