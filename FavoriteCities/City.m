//
//  City.m
//  FavoriteCities
//
//  Created by Rockstar. on 3/20/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import "City.h"

@implementation City

- (instancetype)initWithCityName:(NSString *)name cityState:(NSString *)state andCityImage:(UIImage *)image {
    if ((self = [super init])) {
        self.cityName = name;
        self.cityState = state;
        self.cityImage = image;
    }
    return self;
}

- (void)setNewName:(NSString *)newName {
    self.cityName = newName;
}

- (void)setNewState:(NSString *)newState {
    self.cityState = newState;
}

-(NSString *)getNewName {
    return self.cityName;
}

-(NSString *)getNewState {
    return self.cityState;
}

@end
