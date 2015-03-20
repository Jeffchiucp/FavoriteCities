//
//  DetailViewController.m
//  FavoriteCities
//
//  Created by Rockstar. on 3/20/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import "DetailViewController.h"
#import "WikiViewController.h"

@interface DetailViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UIImageView *cityImageView;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *wikiLabel;
@property (weak, nonatomic) IBOutlet UIButton *changeTitle;
@property WikiViewController *wikiViewConroller;
@property BOOL isEditPressed;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cityNameLabel.text = self.selected.cityName;
    self.cityStateLabel.text = self.selected.cityState;
    self.cityImageView.image = self.selected.cityImage;

    self.isEditPressed = NO;
}

#pragma mark - UITextField
- (BOOL)textFieldShouldClear:(UITextField *)textField {
    return YES;
}


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"modalView"]) {

        UINavigationController *vc = segue.destinationViewController;
        self.wikiViewConroller = vc.viewControllers[0];
        self.wikiViewConroller.urlString = [NSString stringWithFormat:@"http://en.wikipedia.org/wiki/%@%@", self.selected.cityName, self.selected.cityState];
    }
}

-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue
{
}

#pragma mark - Actions

- (IBAction)onEditButtonTapped:(UIBarButtonItem *)sender {

    if (!self.isEditPressed) {
        sender.title = @"Done";
        self.cityTextField.text = self.cityNameLabel.text;
        self.stateTextField.text = self.cityStateLabel.text;
    }
    else {
        sender.title = @"Edit";
        self.cityNameLabel.text = self.cityTextField.text;
        self.cityStateLabel.text = self.stateTextField.text;
        [self.selected setNewName:self.cityTextField.text];
        [self.selected setNewState:self.stateTextField.text];
    }
    
    self.cityNameLabel.hidden = !self.isEditPressed;
    self.cityStateLabel.hidden = !self.isEditPressed;
    self.cityTextField.hidden = self.isEditPressed;
    self.stateTextField.hidden = self.isEditPressed;
    self.isEditPressed = !self.isEditPressed;

}

#pragma mark - Actions
- (IBAction)onChangeTitleTapped:(id)sender {
    [self.delegate changeTitle:self.selected.cityName];
}


@end
