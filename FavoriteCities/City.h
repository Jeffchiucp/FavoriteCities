//
//  City.h
//  FavoriteCities
//
//  Created by Rockstar. on 3/20/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface City : NSObject

@property NSString *cityName;
@property NSString *cityState;
@property UIImage *cityImage;

- (instancetype)initWithCityName:(NSString *)name cityState:(NSString *)state andCityImage:(UIImage *)image;
- (void)setNewName:(NSString *)newName;
- (void)setNewState:(NSString *)newState;

@end
