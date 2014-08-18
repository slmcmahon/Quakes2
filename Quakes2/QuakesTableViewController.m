//
//  QuakesTableViewController.m
//  Quakes2
//
//  Created by Stephen L. McMahon on 8/18/14.
//  Copyright (c) 2014 Stephen L. McMahon. All rights reserved.
//

#import "QuakesTableViewController.h"
#import "QuakeCell.h"
#import "QuakesTableViewModel.h"
#import "QuakeDetail.h"
#import "QuakeDetailViewController.h"

@interface QuakesTableViewController ()
@property (nonatomic, strong) QuakesTableViewModel *viewModel;
@end

@implementation QuakesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _viewModel = [[QuakesTableViewModel alloc] init];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _viewModel = [[QuakesTableViewModel alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _viewModel.quakes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuakeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"quakeCell" forIndexPath:indexPath];
    
    QuakeDetail *detail = _viewModel.quakes[indexPath.row];
    
    [[cell quakeDetail] setText:detail.header];
    [[cell tsunami] setText:detail.tsunami ? @"YES" : @"NO"];
    [[cell magnitude] setText:[NSString stringWithFormat:@"%f", detail.magnitude]];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        QuakeDetail *quake = _viewModel.quakes[indexPath.row];
        QuakeDetailViewController *vc = [segue destinationViewController];
        [vc setQuakeDetail:quake];
        //[[segue destinationViewController] setQuakeDetail:quake];
    }
}

@end
