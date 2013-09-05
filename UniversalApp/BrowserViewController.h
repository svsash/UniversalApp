//
//  BrowserViewController.h
//  UniversalApp
//
//  Created by Machine Test on 05.09.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowserViewController : UIViewController <UITextFieldDelegate> {

    __weak IBOutlet UIWebView *_myWebView;
    
    __weak IBOutlet UIButton *_backButton;
    __weak IBOutlet UIButton *_forwardButton;
    
    __weak IBOutlet UITextField *_urlTextField;
    
}

@end
