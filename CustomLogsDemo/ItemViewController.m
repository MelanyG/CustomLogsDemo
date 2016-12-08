//
//  ItemViewController.m
//  CustomLogsDemo
//
//  Created by Melany Gulianovych on 12/8/16.
//  Copyright © 2016 Melany Gulianovych. All rights reserved.
//

#import "ItemViewController.h"
#import "DBManager.h"

@interface ItemViewController ()

@property (nonatomic, strong) DBManager *dbManager;
@property (nonatomic, strong) NSArray *itemsArray;

@end


@implementation ItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tblItems.delegate = self;
    self.tblItems.dataSource = self;
    // Initialize the dbManager property.
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"SimpleDB.sql"];
    // Load the data.
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData {
    // Form the query.
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM Item WHERE shopRelation = %ld", (long)self.shopID];
    
    // Get the results.
    if (self.itemsArray != nil) {
        self.itemsArray = nil;
    }
    self.itemsArray = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    
    // Reload the table view.
    [self.tblItems reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemsArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Dequeue the cell.
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell" forIndexPath:indexPath];
    
    NSInteger indexOfName = [self.dbManager.arrColumnNames indexOfObject:@"itemName"];
    NSInteger indexOfQuantity = [self.dbManager.arrColumnNames indexOfObject:@"quantity"];
    
    // Set the loaded data to the appropriate cell labels.
    cell.itemName.text = [NSString stringWithFormat:@"%@", [[self.itemsArray objectAtIndex:indexPath.row] objectAtIndex:indexOfName]];
    
    cell.availableQuantity.text = [NSString stringWithFormat:@"Quantity: %@", [[self.itemsArray objectAtIndex:indexPath.row] objectAtIndex:indexOfQuantity]];
    
    return cell;
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
    
}
@end
