//
//  CameraViewController.m
//  UniversalApp
//
//  Created by Machine Test on 05.09.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController () {
    UIImagePickerController *_picker;
}

@end

@implementation CameraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Camera";
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self showCamera];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showCamera
{
    _picker = [[UIImagePickerController alloc] init];
    _picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    CameraOverlayView *overlay = [[CameraOverlayView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    
    overlay.delegate = self;
    
    
    
    _picker.showsCameraControls = NO;
    _picker.navigationBarHidden = YES;
    _picker.toolbarHidden = YES;
    _picker.wantsFullScreenLayout = YES;
    _picker.cameraViewTransform =
    CGAffineTransformScale(_picker.cameraViewTransform,
                           1,
                           1.12412);
    _picker.cameraOverlayView = overlay;
    
    [self presentModalViewController:_picker animated:NO];
    
    
}

#pragma mark - Camera image picker delegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
}

#pragma mark - Action methods

- (void) cameraBack
{
    
}

- (void) cameraFlash
{
    
}

- (void) cameraRotateRetake
{
    if(_picker.cameraDevice == UIImagePickerControllerCameraDeviceFront)
    {
        _picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    }
    else {
        _picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    }
    _picker.cameraViewTransform = CGAffineTransformScale(_picker.cameraViewTransform, -1,     1);
}

- (void) cameraSavePicture
{
    
}

- (void) cameraTakePicture
{
    
}

@end
