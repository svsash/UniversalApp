//
//  MenuViewController.h
//  UniversalApp
//
//  Created by Machine Test on 05.09.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface MenuViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate>

- (IBAction)cameraButtonTouchUpInside:(id)sender;
- (IBAction)mapButtonTouchUpInside:(id)sender;
- (IBAction)pedometrButtonTouchUpInside:(id)sender;
- (IBAction)browserButtonTouchUpInside:(id)sender;
- (IBAction)audioPlayerButtonTouchUpInside:(id)sender;
- (IBAction)myContactsButtonTouchUpInside:(id)sender;


@end
