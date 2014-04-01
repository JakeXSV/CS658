//
//  RostersPlayerWebViewViewController.h
//  Rosters
//
//  Created by Jake on 3/31/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RostersPlayerWebViewViewController : UIViewController
@property(nonatomic, strong) IBOutlet UIWebView* webView;
@property(nonatomic, weak) IBOutlet NSString* playerUrl;
@end
