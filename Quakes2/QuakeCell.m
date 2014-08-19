//
//  QuakeCell.m
//  Quakes2
//
//  Created by Stephen L. McMahon on 8/18/14.
//  Copyright (c) 2014 Stephen L. McMahon. All rights reserved.
//

#import "QuakeCell.h"
#import "QuakeDetail.h"

@implementation QuakeCell

- (void)loadQakeDetail:(QuakeDetail *)detail {
    [_quakeDetail setText:[detail header]];
    [_tsunami setText:(detail.tsunami ? @"YES" : @"NO")];
    [_magnitude setText:[NSString stringWithFormat:@"%.01f", detail.magnitude]];
}
@end
