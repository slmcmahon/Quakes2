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

@end
