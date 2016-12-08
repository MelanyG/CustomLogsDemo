//
//  ViewController.m
//  CustomLogsDemo
//
//  Created by Melany Gulianovych on 12/7/16.
//  Copyright © 2016 Melany Gulianovych. All rights reserved.
//

#import "ShopViewController.h"
#import "DBManager.h"
#import "ItemViewController.h"


@interface ShopViewController ()
@property (nonatomic, strong) DBManager *dbManager;
@property (nonatomic) int recordIDToEdit;
@property (nonatomic, strong) NSArray *arrShopsInfo;

-(void)loadData;

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tblShops.delegate = self;
    self.tblShops.dataSource = self;
    // Initialize the dbManager property.
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"SimpleDB.sql"];
    // Load the data.
    [self loadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addNewRecord:(id)sender {
    // Before performing the segue, set the -1 value to the recordIDToEdit. That way we'll indicate that we want to add a new record and not to edit an existing one.
    self.recordIDToEdit = -1;
    [self performSegueWithIdentifier:@"idSegueEditInfo" sender:self];
}

-(void)loadData {
    // Form the query.
    NSString *query = @"select * from Shop";
    
    // Get the results.
    if (self.arrShopsInfo != nil) {
        self.arrShopsInfo = nil;
    }
    self.arrShopsInfo = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    
    // Reload the table view.
    [self.tblShops reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrShopsInfo.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Dequeue the cell.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellRecord" forIndexPath:indexPath];
    
    NSInteger indexOfName = [self.dbManager.arrColumnNames indexOfObject:@"shopName"];
    NSInteger indexOfCity = [self.dbManager.arrColumnNames indexOfObject:@"shopCity"];
    NSInteger indexOfZKPO = [self.dbManager.arrColumnNames indexOfObject:@"shopZKPO"];
    
    // Set the loaded data to the appropriate cell labels.
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [[self.arrShopsInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfName], [[self.arrShopsInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfCity]];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"ZKPO: %@", [[self.arrShopsInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfZKPO]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    // Get the record ID of the selected name and set it to the recordIDToEdit property.
    self.recordIDToEdit = [[[self.arrShopsInfo objectAtIndex:indexPath.row] objectAtIndex:2] intValue];
    // Perform the segue.
    [self performSegueWithIdentifier:@"idSegueEditInfo" sender:self];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.recordIDToEdit = [[[self.arrShopsInfo objectAtIndex:indexPath.row] objectAtIndex:2] intValue];
    [self performSegueWithIdentifier:@"idSegueItemInfo" sender:self];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        int recordIDToDelete = [[[self.arrShopsInfo objectAtIndex:indexPath.row] objectAtIndex:2] intValue];
        NSString *query = [NSString stringWithFormat:@"delete from Shop where idShop=%d", recordIDToDelete];

        [self.dbManager executeQuery:query];

        [self loadData];
    }
}

-(void)editingInfoWasFinished{
    // Reload the data.
    [self loadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"idSegueEditInfo"]){
        EditInfoViewController *editInfoViewController = [segue destinationViewController];
        editInfoViewController.recordIDToEdit = self.recordIDToEdit;
        editInfoViewController.delegate = self;
    } else  if([[segue identifier] isEqualToString:@"idSegueItemInfo"]){
        ItemViewController *itemViewController = [segue destinationViewController];
        itemViewController.shopID = self.recordIDToEdit;
    }
}

@end
