//
//  ItemViewController.h
//  CustomLogsDemo
//
//  Created by Melany Gulianovych on 12/8/16.
//  Copyright © 2016 Melany Gulianovych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemTableViewCell.h"
#import "DBManager.h"

@interface ItemViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(assign, nonatomic)NSInteger shopID;
@property (weak, nonatomic) IBOutlet UITableView *tblItems;
@property (assign, nonatomic) NSInteger shopId;

- (IBAction)backButtonPressed:(id)sender;
- (IBAction)addButtonPressed:(id)sender;

@end
