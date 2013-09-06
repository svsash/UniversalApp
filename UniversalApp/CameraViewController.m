//
//  CameraViewController.m
//  UniversalApp
//
//  Created by Machine Test on 05.09.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import "CameraViewController.h"

#import "CameraOverlayView.h"

@interface CameraViewController ()

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
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    CameraOverlayView *overlay = [[CameraOverlayView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    
    
    
    picker.showsCameraControls = NO;
    picker.navigationBarHidden = YES;
    picker.toolbarHidden = YES;
    picker.wantsFullScreenLayout = YES;
    picker.cameraViewTransform =
    CGAffineTransformScale(picker.cameraViewTransform,
                           1,
                           1.12412);
    picker.cameraOverlayView = overlay;
    
    [self presentModalViewController:picker animated:NO];
    
    
}

#pragma mark - Camera image picker delegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
}


@end
