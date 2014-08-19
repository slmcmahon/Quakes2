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

NSString *const quakeCellId = @"quakeCell";
NSString *const showDetailSequeId = @"showDetail";

@interface QuakesTableViewController ()<QuakesTableViewModelDelegate>
@property (nonatomic, strong) QuakesTableViewModel *viewModel;
@end

@implementation QuakesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _viewModel = [[QuakesTableViewModel alloc] init];
    [_viewModel setQuakesLoadedDelegate:self];
    
    self.clearsSelectionOnViewWillAppear = NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _viewModel.quakes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QuakeCell *cell = [tableView dequeueReusableCellWithIdentifier:quakeCellId forIndexPath:indexPath];
    [cell loadQakeDetail:_viewModel.quakes[indexPath.row]];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:showDetailSequeId]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        QuakeDetail *quake = _viewModel.quakes[indexPath.row];
        QuakeDetailViewController *vc = [segue destinationViewController];
        [vc setQuakeDetail:quake];
    }
}

- (void)quakeDataLoaded {
    [[self tableView] reloadData];
}

@end
