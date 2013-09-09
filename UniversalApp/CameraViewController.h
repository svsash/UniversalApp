//
//  CameraViewController.h
//  UniversalApp
//
//  Created by Machine Test on 05.09.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CameraOverlayView.h"

#import <AssetsLibrary/AssetsLibrary.h>

#import "ALAssetsLibrary+CustomPhotoAlbum.h"

enum CameraState {
    CameraStateCamera = 0,
    CameraStatePreview = 1
};

@interface CameraViewController : UIViewController <CameraOverlayViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate>

@property (strong, atomic) ALAssetsLibrary* library;
    
@end
