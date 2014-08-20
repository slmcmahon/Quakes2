//
//  QuakeDetail.h
//  Quakes2
//
//  Created by Stephen L. McMahon on 8/18/14.
//  Copyright (c) 2014 Stephen L. McMahon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuakeDetail : NSObject

@property (nonatomic, copy) NSString *place;
@property (nonatomic, strong) NSDate *dateTime;
@property (nonatomic, assign) float magnitude;
@property (nonatomic, assign) BOOL tsunami;

- (id)initWithPlace:(NSString *)place date:(NSDate *)date magnitude:(float)mag andTsunami:(BOOL)tsu;

+ (NSArray *)parseQuakeData:(NSDictionary *)data;

@end
