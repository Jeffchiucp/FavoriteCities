//
//  WikiViewController.m
//  FavoriteCities
//
//  Created by Rockstar. on 3/20/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import "WikiViewController.h"

@interface WikiViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *dismissButton;

@end

@implementation WikiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
     NSURL *url = [NSURL URLWithString:self.urlString];
     NSURLRequest *request = [NSURLRequest requestWithURL:url];
     [_webView loadRequest:request];
    // Do any additional setup after loading the view.
}

#pragma mark - UIWebView
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityIndicator stopAnimating];
}


- (IBAction)onDismissButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.activityIndicator stopAnimating];
}

@end
