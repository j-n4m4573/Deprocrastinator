//
//  DeprocrastinatorVC.m
//  Deprocrastinator
//
//  Created by Jamar Gibbs on 1/18/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

#import "DeprocrastinatorVC.h"

@interface DeprocrastinatorVC ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSMutableArray *todoItems;
@end

@implementation DeprocrastinatorVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.todoItems = [[NSMutableArray alloc]initWithObjects:@"todo Item", nil];

}
- (IBAction)onSwipeRight:(id)sender {
    
    
}

- (IBAction)addTapped:(id)sender {
    
    [self.todoItems addObject:self.textField.text];
    [self.tableView reloadData];
}
- (IBAction)onEditButtonPressed:(id)sender {
    [self.tableView setEditing:YES animated:YES];
     //    [self.tableView  deleteRowsAtIndexPaths:indexPath.row];
    
    [self.tableView endUpdates];    }

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
{
    UIAlertViewStyle *deleteAlert = [UIAlertViewStyle new];
}
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.todoItems objectAtIndex:indexPath.row]];
  //  cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    UIView *bgColorView =[[ UIView alloc]init];
    bgColorView.backgroundColor = [UIColor greenColor];
    cell.selectedBackgroundView = bgColorView;
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todoItems.count;
    
}












@end
