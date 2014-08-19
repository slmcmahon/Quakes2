//
//  QuakeDetail.m
//  Quakes2
//
//  Created by Stephen L. McMahon on 8/18/14.
//  Copyright (c) 2014 Stephen L. McMahon. All rights reserved.
//

#import "QuakeDetail.h"

@implementation QuakeDetail

- (id)initWithHeader:(NSString *)header magnitude:(float)mag andTsunami:(BOOL)tsu {
    if (self = [super init]) {
        _header = header;
        _magnitude = mag;
        _tsunami = tsu;
    }
    return self;
}

+ (NSArray *)parseQuakeData:(NSDictionary *)data {
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
    return tmp;
}

@end
