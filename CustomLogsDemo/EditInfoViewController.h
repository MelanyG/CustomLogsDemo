//
//  EditInfoViewController.h
//  CustomLogsDemo
//
//  Created by Melany Gulianovych on 12/8/16.
//  Copyright © 2016 Melany Gulianovych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@protocol EditInfoViewControllerDelegate

-(void)editingInfoWasFinished;

@end

@interface EditInfoViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtShopname;
@property (weak, nonatomic) IBOutlet UITextField *txtCity;
@property (weak, nonatomic) IBOutlet UITextField *txtZKPO;
@property (nonatomic, strong) DBManager *dbManager;
@property (nonatomic, strong) id<EditInfoViewControllerDelegate> delegate;
@property (nonatomic) int recordIDToEdit;

- (IBAction)saveInfo:(id)sender;

@end
