//
//  ViewController.h
//  CustomLogsDemo
//
//  Created by Melany Gulianovych on 12/7/16.
//  Copyright © 2016 Melany Gulianovych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditInfoViewController.h"

@interface ShopViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, EditInfoViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tblShops;

- (IBAction)addNewRecord:(id)sender;


@end

