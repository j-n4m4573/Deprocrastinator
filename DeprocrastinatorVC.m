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
    
    self.todoItems = [[NSMutableArray alloc]initWithObjects:@"Add Something", nil];
}

- (IBAction)addTapped:(id)sender {
    
    [self.todoItems addObject:self.textField.text];
    [self.tableView reloadData];
}

- (IBAction)onEditButtonPressed:(id)sender {
    [self.tableView beginUpdates];
    [self.tableView setEditing:YES animated:YES];
    [self.tableView endUpdates];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.todoItems objectAtIndex:indexPath.row]];
    
    UIView *bgColorView =[[ UIView alloc]init];
    bgColorView.backgroundColor = [UIColor greenColor];
    cell.selectedBackgroundView = bgColorView;
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todoItems.count;
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.todoItems removeObjectAtIndex:indexPath.row];
        [tableView setEditing:NO];
        [tableView reloadData];
    }
}


@end
