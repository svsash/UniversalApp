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

}

- (IBAction) backButtonTouchUpInside: (id) sender
{
    
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
