//
//  QuakesTableViewModel.m
//  Quakes2
//
//  Created by Stephen L. McMahon on 8/18/14.
//  Copyright (c) 2014 Stephen L. McMahon. All rights reserved.
//

#import "QuakesTableViewModel.h"
#import "QuakeDetail.h"
#import "AFNetworking.h"

@implementation QuakesTableViewModel

-(id)init {
    if (self = [super init]) {
        [self loadQuakeData];
    }
    
    return self;
}

- (void)initQuakes {
    QuakeDetail *q1 = [[QuakeDetail alloc] initWithHeader:@"Quake 1" magnitude:1.2 andTsunami:NO];
    QuakeDetail *q2 = [[QuakeDetail alloc] initWithHeader:@"Quake 2" magnitude:6.5 andTsunami:YES];
    QuakeDetail *q3 = [[QuakeDetail alloc] initWithHeader:@"Quake 3" magnitude:7.1 andTsunami:NO];
    
    _quakes = [NSArray arrayWithObjects:q1, q2, q3, nil];
}

- (void)loadQuakeData {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:@"http://earthquake.usgs.gov/earthquakes/feed/v0.1/summary/significant_month.geojson" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *data = (NSDictionary *)responseObject;
        NSArray *features = data[@"features"];
        NSMutableArray *tmp = [[NSMutableArray alloc] init];
        for (NSDictionary *feature in features) {
            NSDictionary *props = feature[@"properties"];
            NSString *place = props[@"place"];
            float magnitude = [props[@"mag"] floatValue];
            id tsunamiObject = props[@"tsunami"];
            BOOL tsunami = NO;
            if (tsunamiObject != [NSNull null]) {
                tsunami = [tsunamiObject boolValue];
            }
            
            QuakeDetail *q = [[QuakeDetail alloc] initWithHeader:place magnitude:magnitude andTsunami:tsunami];
            [tmp addObject:q];
        }
        _quakes = tmp;
        [self quakesLoaded];
        
    } failure:nil];
}

- (void)quakesLoaded {
    if (_quakesLoadedDelegate && [_quakesLoadedDelegate respondsToSelector:@selector(quakeDataLoaded)]) {
        [_quakesLoadedDelegate quakeDataLoaded];
    }
}

@end
