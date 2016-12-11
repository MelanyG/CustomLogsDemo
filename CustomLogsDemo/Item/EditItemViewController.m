//
//  EditItemViewController.m
//  CustomLogsDemo
//
//  Created by Melany Gulianovych on 12/8/16.
//  Copyright © 2016 Melany Gulianovych. All rights reserved.
//

#import "EditItemViewController.h"

@interface EditItemViewController ()

@end

@implementation EditItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.tintColor = self.navigationItem.rightBarButtonItem.tintColor;
    self.itemName.delegate = self;
    self.itemQuantity.delegate = self;
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"SimpleDB.sql"];
    // Check if should load specific record for editing.
    if (self.itemToEdit != -1) {
        // Load the record with the specific ID from the database.
        [self loadInfoToEdit];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}

-(void)loadInfoToEdit{
    // Create the query.
    NSString *query = [NSString stringWithFormat:@"select * from Item where idItem=%ld", (long)self.itemToEdit];
    
    // Load the relevant data.
    NSArray *results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    
    // Set the loaded data to the textfields.
    self.itemName.text = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"itemName"]];
    self.itemQuantity.text = [NSString stringWithFormat:@"%@ kg",[[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"quantity"]]];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backButtonPressed:(id)sender {
       [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addButtonPressed:(id)sender {
    NSString *query;
    if (self.itemToEdit == -1) {
        query = [NSString stringWithFormat:@"INSERT INTO Item (itemName, quantity, shopRelation) VALUES ('%@', '%f', %ld)", self.itemName.text, [self.itemQuantity.text floatValue], self.shopID];
    }
    else{
        query = [NSString stringWithFormat:@"update Item set itemName='%@', quantity='%f', shopRelation=%ld where idItem=%ld", self.itemName.text, [self.itemQuantity.text floatValue], self.shopID, self.itemToEdit];
    }
    
    
    // Execute the query.
    [self.dbManager executeQuery:query];
    
    // If the query was successfully executed then pop the view controller.
    if (self.dbManager.affectedRows != 0) {
        DDLogItem(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        
        // Inform the delegate that the editing was finished.
        [self.delegate editingItemWasFinished];
        
        // Pop the view controller.
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else{
        DDLogItem(@"Could not execute the query.");
    }

}

@end
