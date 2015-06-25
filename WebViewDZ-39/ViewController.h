//
//  ViewController.h
//  WebViewDZ-39
//
//  Created by Александр on 23.06.15.
//  Copyright (c) 2015 Alex Bukharov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicater;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardButtonItem;

@property (strong, nonatomic) NSString *stringViewController;



- (IBAction)actionBack:(id)sender;

- (IBAction)actionForward:(id)sender;

- (IBAction)actionRefresh:(id)sender;


@end

