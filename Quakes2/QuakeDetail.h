//
//  QuakeDetail.h
//  Quakes2
//
//  Created by Stephen L. McMahon on 8/18/14.
//  Copyright (c) 2014 Stephen L. McMahon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuakeDetail : NSObject

@property (nonatomic, copy) NSString *header;
@property (nonatomic, assign) float magnitude;
@property (nonatomic, assign) BOOL tsunami;

- (id)initWithHeader:(NSString *)header magnitude:(float)mag andTsunami:(BOOL)tsu;

@end
