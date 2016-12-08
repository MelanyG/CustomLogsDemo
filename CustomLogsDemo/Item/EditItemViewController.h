//
//  EditItemViewController.h
//  CustomLogsDemo
//
//  Created by Melany Gulianovych on 12/8/16.
//  Copyright © 2016 Melany Gulianovych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@protocol EditItemViewControllerDelegate

-(void)editingItemWasFinished;

@end

@interface EditItemViewController : UIViewController <UITextFieldDelegate>

@property (assign, nonatomic)NSInteger itemToEdit;
@property (nonatomic, strong) DBManager *dbManager;
@property (weak, nonatomic) IBOutlet UITextField *itemName;
@property (weak, nonatomic) IBOutlet UITextField *itemQuantity;
@property (nonatomic, weak) id <EditItemViewControllerDelegate> delegate;
@property (assign, nonatomic) NSInteger shopID;

- (IBAction)backButtonPressed:(id)sender;
- (IBAction)addButtonPressed:(id)sender;

@end
