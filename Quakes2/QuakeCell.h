//
//  QuakeCell.h
//  Quakes2
//
//  Created by Stephen L. McMahon on 8/18/14.
//  Copyright (c) 2014 Stephen L. McMahon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuakeCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *quakeDetail;
@property (nonatomic, weak) IBOutlet UILabel *magnitude;
@property (nonatomic, weak) IBOutlet UILabel *tsunami;
@end
