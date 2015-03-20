//
//  DetailViewController.h
//  FavoriteCities
//
//  Created by Rockstar. on 3/20/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@protocol DetailViewControllerDelegate <NSObject>

- (void)changeTitle:(NSString *)title;

@end

@interface DetailViewController : UIViewController
@property City *selected;

@property (nonatomic, assign) id<DetailViewControllerDelegate>delegate;

@end
