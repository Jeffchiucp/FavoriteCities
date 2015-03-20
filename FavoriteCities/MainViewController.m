//
//  MainViewController.m
//  FavoriteCities
//
//  Created by Rockstar. on 3/20/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import "MainViewController.h"
#import "City.h"
#import "DetailViewController.h"

@interface MainViewController ()<UITableViewDataSource, UITableViewDelegate, DetailViewControllerDelegate>
@property NSMutableArray *cities;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.cities = [NSMutableArray new];

    [self.cities addObject:[[City alloc] initWithCityName:@"Austin" cityState:@"TX" andCityImage:[UIImage imageNamed:@"austin"]]];
    [self.cities addObject:[[City alloc] initWithCityName:@"New York" cityState:@"NY" andCityImage:[UIImage imageNamed:@"newyork"]]];
    [self.cities addObject:[[City alloc] initWithCityName:@"Chicago" cityState:@"IL" andCityImage:[UIImage imageNamed:@"chicago"]]];
    [self.cities addObject:[[City alloc] initWithCityName:@"San Francisco" cityState:@"CA" andCityImage:[UIImage imageNamed:@"sanfran"]]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cities.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    City *cities = [self.cities objectAtIndex:indexPath.row];
    cell.textLabel.text = cities.cityName;
    cell.detailTextLabel.text = cities.cityState;
    cell.imageView.image = cities.cityImage;

    return cell;
}

#pragma mark - UITableViewDelegate
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.cities removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}


#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailView"]) {
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        City *city = [self.cities objectAtIndex:index.row];
        DetailViewController *vc = segue.destinationViewController;
        vc.selected = city;
        vc.delegate = self;
    }
}


#pragma mark - Actions
- (void)changeTitle:(NSString *)title {
    self.navigationItem.title = title;
}
@end
