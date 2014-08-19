//
//  QuakesViewModel.h
//  Quakes2
//
//  Created by Stephen L. McMahon on 8/18/14.
//  Copyright (c) 2014 Stephen L. McMahon. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QuakesTableViewModelDelegate<NSObject>
- (void)quakeDataLoaded;
@end

@interface QuakesViewModel : NSObject

@property (nonatomic, readonly, strong) NSArray *quakes;
@property (nonatomic, weak) id<QuakesTableViewModelDelegate> quakesLoadedDelegate;

- (void)loadQuakeData;

@end
