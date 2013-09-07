//
//  CameraOverlayView.m
//  UniversalApp
//
//  Created by Machine Test on 06.09.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import "CameraOverlayView.h"

@implementation CameraOverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [[NSBundle mainBundle] loadNibNamed:@"CameraOverlayView" owner:self options:nil];
        
        [self addSubview:_view];
    }
    return self;
}


- (IBAction) takePictureButtonTouchUpInside: (id) sender
{
    if ([_delegate respondsToSelector:@selector(cameraTakePicture)]) {
        [_delegate cameraTakePicture];
    }
}

- (IBAction) backButtonTouchUpInside: (id) sender
{
    if ([_delegate respondsToSelector:@selector(cameraBack)]) {
        [_delegate cameraBack];
    }
}

- (IBAction) rotateRetakeButtonTouchUpInside: (id) sender
{
    if ([_delegate respondsToSelector:@selector(cameraRotateRetake)]) {
        [_delegate cameraRotateRetake];
    }
}

- (IBAction) flashButtonTouchUpInside: (id) sender
{
    if ([_delegate respondsToSelector:@selector(cameraFlash)]) {
        [_delegate cameraFlash];
    }
}

- (IBAction) saveButtonTouchUpInside: (id) sender{
    if ([_delegate respondsToSelector:@selector(cameraSavePicture)]) {
        [_delegate cameraSavePicture];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
