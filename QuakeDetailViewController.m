//
//  QuakeDetailViewController.m
//  Quakes2
//
//  Created by Stephen L. McMahon on 8/18/14.
//  Copyright (c) 2014 Stephen L. McMahon. All rights reserved.
//

#import "QuakeDetailViewController.h"

@interface QuakeDetailViewController ()
@property (nonatomic, weak) IBOutlet UILabel *detail;
@property (nonatomic, weak) IBOutlet UILabel *magnitude;
@property (nonatomic, weak) IBOutlet UILabel *tsunami;

@end

@implementation QuakeDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_detail setText:_quakeDetail.header];
    [_magnitude setText:[NSString stringWithFormat:@"%f", _quakeDetail.magnitude]];
    [_tsunami setText:_quakeDetail.tsunami ? @"YES" : @"NO"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
