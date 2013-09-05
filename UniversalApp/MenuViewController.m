//
//  MenuViewController.m
//  UniversalApp
//
//  Created by Machine Test on 05.09.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import "MenuViewController.h"

#import "CameraViewController.h"
#import "PedometrViewController.h"
#import "AudioPlayerViewController.h"
#import "MyContactsViewController.h"
#import "BrowserViewController.h"
#import "MapViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cameraButtonTouchUpInside:(id)sender
{
    CameraViewController *cameraVC = [[CameraViewController alloc] initWithNibName:@"CameraViewController" bundle:nil];
    [self.navigationController pushViewController:cameraVC animated:YES];
}

- (IBAction)mapButtonTouchUpInside:(id)sender
{
    MapViewController *mapVC = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
    [self.navigationController pushViewController:mapVC animated:YES];
}

- (IBAction)pedometrButtonTouchUpInside:(id)sender
{
    PedometrViewController *pedometrVC = [[PedometrViewController alloc] initWithNibName:@"PedometrViewController" bundle:nil];
    [self.navigationController pushViewController:pedometrVC animated:YES];
}

- (IBAction)browserButtonTouchUpInside:(id)sender
{
    BrowserViewController  *browserVC = [[BrowserViewController alloc] initWithNibName:@"BrowserViewController" bundle:nil];
    [self.navigationController pushViewController:browserVC animated:YES];
}

- (IBAction)audioPlayerButtonTouchUpInside:(id)sender
{
    AudioPlayerViewController *audioPlayerVC = [[AudioPlayerViewController alloc] initWithNibName:@"AudioPlayerViewController" bundle:nil];
    [self.navigationController pushViewController:audioPlayerVC animated:YES];
}

- (IBAction)myContactsButtonTouchUpInside:(id)sender
{
    MyContactsViewController *myContacts = [[MyContactsViewController alloc] initWithNibName:@"MyContactsViewController" bundle:nil];
    [self.navigationController pushViewController:myContacts animated:YES];
}


@end
