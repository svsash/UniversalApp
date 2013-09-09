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

@property (nonatomic, strong) IBOutlet UIBarButtonItem *backButton;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *rotateRetakeButton;
@property (nonatomic, strong) IBOutlet UIButton *saveButton;
@property (nonatomic, strong) IBOutlet UIButton *flashButton;
@property (nonatomic, strong) IBOutlet UIButton *takePictureButton;

@property (nonatomic, strong) IBOutlet UIImageView *previewImageView;

- (IBAction) takePictureButtonTouchUpInside: (id) sender;

- (IBAction) backButtonTouchUpInside: (id) sender;

- (IBAction) flashButtonTouchUpInside: (id) sender;

- (IBAction) rotateRetakeButtonTouchUpInside: (id) sender;

- (IBAction) saveButtonTouchUpInside: (id) sender;


@end
