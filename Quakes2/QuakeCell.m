//
//  QuakeCell.m
//  Quakes2
//
//  Created by Stephen L. McMahon on 8/18/14.
//  Copyright (c) 2014 Stephen L. McMahon. All rights reserved.
//

#import "QuakeCell.h"
#import "QuakeDetail.h"

NSString *const dateFormat = @"dd-MMM-yyyy HH:mm";

@implementation QuakeCell

- (void)loadQakeDetail:(QuakeDetail *)detail {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    NSString *fmtd = [formatter stringFromDate:[detail dateTime]];
    
    [_quakeDetail setText:[detail place]];
    [_date setText:fmtd];
    [_tsunami setText:(detail.tsunami ? @"Yes" : @"No")];
    [_magnitude setText:[NSString stringWithFormat:@"%.01f", detail.magnitude]];
}
@end
