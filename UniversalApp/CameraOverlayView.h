//
//  CameraOverlayView.h
//  UniversalApp
//
//  Created by Machine Test on 06.09.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CameraViewController.h"

@interface CameraOverlayView : UIView <UIImagePickerControllerDelegate> {
    __weak IBOutlet UIView *_view;
}

@property (nonatomic, weak) id <UIImagePickerControllerDelegate> delegate;

- (IBAction) takePictureButtonTouchUpInside: (id) sender;

- (IBAction) backButtonTouchUpInside: (id) sender;

@end
