//
//  QuakesViewModel.m
//  Quakes2
//
//  Created by Stephen L. McMahon on 8/18/14.
//  Copyright (c) 2014 Stephen L. McMahon. All rights reserved.
//

#import "QuakesViewModel.h"
#import "QuakeDetail.h"
#import "AFNetworking.h"

NSString *const earthQuakeDataUrl = @"http://earthquake.usgs.gov/earthquakes/feed/v0.1/summary/significant_month.geojson";

@implementation QuakesViewModel

-(id)init {
    if (self = [super init]) {
        [self loadQuakeData];
    }
    
    return self;
}

- (void)loadQuakeData {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:earthQuakeDataUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Response:\n%@", [responseObject description]);
        _quakes = [QuakeDetail parseQuakeData:responseObject];
        [self quakesLoaded];
    } failure:nil];
}

- (void)quakesLoaded {
    if (_quakesLoadedDelegate && [_quakesLoadedDelegate respondsToSelector:@selector(quakeDataLoaded)]) {
        [_quakesLoadedDelegate quakeDataLoaded];
    }
}

@end
