//
//  CameraOverlayView.h
//  UniversalApp
//
//  Created by Machine Test on 06.09.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CameraOverlayView;

@protocol CameraOverlayViewDelegate <NSObject>

- (void) cameraRotateRetake;

- (void) cameraTakePicture;

- (void) cameraFlash;

- (void) cameraBack;

- (void) cameraSavePicture;

@end

@interface CameraOverlayView : UIView {
    __weak IBOutlet UIView *_view;
}

@property (weak, nonatomic) id <CameraOverlayViewDelegate> delegate;

- (IBAction) takePictureButtonTouchUpInside: (id) sender;

- (IBAction) backButtonTouchUpInside: (id) sender;

- (IBAction) flashButtonTouchUpInside: (id) sender;

- (IBAction) rotateRetakeButtonTouchUpInside: (id) sender;

- (IBAction) saveButtonTouchUpInside: (id) sender;

@end
