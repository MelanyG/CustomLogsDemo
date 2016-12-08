//
//  ItemTableViewCell.h
//  CustomLogsDemo
//
//  Created by Melany Gulianovych on 12/8/16.
//  Copyright © 2016 Melany Gulianovych. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *itemName;
@property (weak, nonatomic) IBOutlet UILabel *availableQuantity;

@end
