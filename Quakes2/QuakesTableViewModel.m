//
//  QuakesTableViewModel.m
//  Quakes2
//
//  Created by Stephen L. McMahon on 8/18/14.
//  Copyright (c) 2014 Stephen L. McMahon. All rights reserved.
//

#import "QuakesTableViewModel.h"
#import "QuakeDetail.h"

@implementation QuakesTableViewModel

-(id)init {
    if (self = [super init]) {
        [self initQuakes];
    }
    
    return self;
}

- (void)initQuakes {
    QuakeDetail *q1 = [[QuakeDetail alloc] initWithHeader:@"Quake 1" magnitude:1.2 andTsunami:NO];
    QuakeDetail *q2 = [[QuakeDetail alloc] initWithHeader:@"Quake 2" magnitude:6.5 andTsunami:YES];
    QuakeDetail *q3 = [[QuakeDetail alloc] initWithHeader:@"Quake 3" magnitude:7.1 andTsunami:NO];
    
    _quakes = [NSArray arrayWithObjects:q1, q2, q3, nil];
}

@end
