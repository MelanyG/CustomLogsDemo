//
//  ItemViewController.h
//  CustomLogsDemo
//
//  Created by Melany Gulianovych on 12/8/16.
//  Copyright © 2016 Melany Gulianovych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemTableViewCell.h"


@interface ItemViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(assign, nonatomic)NSInteger shopID;
@property (weak, nonatomic) IBOutlet UITableView *tblItems;

- (IBAction)backButtonPressed:(id)sender;
- (IBAction)addButtonPressed:(id)sender;

@end
