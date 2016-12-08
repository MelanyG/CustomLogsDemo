//
//  Item.h
//  CustomLogsDemo
//
//  Created by Melany Gulianovych on 12/8/16.
//  Copyright © 2016 Melany Gulianovych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property(assign, nonatomic)NSInteger idItem;
@property(strong, nonatomic)NSString *itemName;
@property(assign, nonatomic)double quantity;
@property(assign, nonatomic)NSInteger shopRelation;

@end
