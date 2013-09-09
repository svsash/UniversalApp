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
    
    CameraOverlayView *_overlay;
    
    UIImage *_image;
    
}

@end

@implementation CameraViewController

@synthesize library;

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
    
    self.library = [[ALAssetsLibrary alloc] init];
    
    [self showCamera];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self setState:CameraStateCamera];
}

- (void) setPreviewUIElementsEnable:(BOOL)needEnable
{
    [_overlay.rotateRetakeButton setEnabled:needEnable];
    [_overlay.backButton setEnabled:needEnable];
    [_overlay.saveButton setEnabled:needEnable];
}

- (void) setState:(int) state
{
    [self.navigationController setNavigationBarHidden:NO];
    
    if (state == CameraStateCamera) {
        //Camera
        _image = nil;
        
        [_overlay.previewImageView setImage:nil];
        
        _picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        
        [_overlay.saveButton setHidden:YES];
        [_overlay.takePictureButton setHidden:NO];
        [_overlay.flashButton setHidden:NO];
        
        [_overlay.rotateRetakeButton setTitle:@"Rotate"];
    }
    else if (state == CameraStatePreview) {
        //Preview
        [_overlay.previewImageView setImage:_image];
    
        [_overlay.saveButton setHidden:NO];
        [_overlay.takePictureButton setHidden:YES];
        [_overlay.flashButton setHidden:YES];
        
        [_overlay.rotateRetakeButton setTitle:@"Retake"];
    }
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
    
    _picker.delegate = (id) self;
    _picker.editing = YES;
    
    _overlay = [[CameraOverlayView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    
    _overlay.delegate = self;
    
    _picker.showsCameraControls = NO;
    _picker.navigationBarHidden = YES;
    _picker.toolbarHidden = YES;
    _picker.wantsFullScreenLayout = YES;
    _picker.cameraOverlayView = _overlay;
    
    [self presentModalViewController:_picker animated:NO];
}

#pragma mark - Action methods

- (void) cameraBack
{
    [self dismissModalViewControllerAnimated:NO];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) cameraFlash
{
    switch (_picker.cameraFlashMode) {
        case UIImagePickerControllerCameraFlashModeOn:
            [_overlay.flashButton setTitle:@"Flash Auto" forState:UIControlStateNormal];
            _picker.cameraFlashMode = UIImagePickerControllerCameraFlashModeAuto;
            break;
        case UIImagePickerControllerCameraFlashModeAuto:
            [_overlay.flashButton setTitle:@"Flash Off" forState:UIControlStateNormal];
            _picker.cameraFlashMode = UIImagePickerControllerCameraFlashModeOff;
            break;
        case UIImagePickerControllerCameraFlashModeOff:
            [_overlay.flashButton setTitle:@"Flash On" forState:UIControlStateNormal];
            _picker.cameraFlashMode = UIImagePickerControllerCameraFlashModeOn;
            break;
            
        default:
            break;
    }
}

- (void) cameraRotateRetake
{
    if ([_overlay.rotateRetakeButton.title isEqualToString:@"Rotate"]) {
        if(_picker.cameraDevice == UIImagePickerControllerCameraDeviceFront)
        {
            _picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        }
        else {
            _picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        }
    }
    else if ([_overlay.rotateRetakeButton.title isEqualToString:@"Retake"]) {
        [self setState:CameraStateCamera];
    }
}

- (void) cameraSavePicture
{
    [self setPreviewUIElementsEnable:NO];
    
    [library saveImage:_image toAlbum:@"Test Album" withCompletionBlock:^(NSError *error) {
        NSString *string = @"Image saved to Test Album";
        if (error) {
            string = @"Image doesn't saved to Test Album";
        }
        [[[UIAlertView alloc] initWithTitle:nil message:string delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    }];
}

- (void) cameraTakePicture
{
   [_picker takePicture];
}

#pragma mark - Camera delegate 

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:NO];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    _image = image;

    [self setState:CameraStatePreview];
}

#pragma mark - UIAlertView delegate

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self setPreviewUIElementsEnable:YES];
    
    [_picker dismissModalViewControllerAnimated:NO];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
