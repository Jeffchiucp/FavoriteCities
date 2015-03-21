//
//  CityTableViewCell.h
//  FavoriteCities
//
//  Created by Rockstar. on 3/20/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *cityName;
@property (nonatomic, weak) IBOutlet UILabel *cityState;
@property (nonatomic, weak) IBOutlet UIImageView *cityImage;


@end
