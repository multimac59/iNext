//
//  ProfileViewController.h
//  iNext
//
//  Created by mithun ravi on 06/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
@interface ProfileViewController : UIViewController
{

}

@property(nonatomic, strong)IBOutlet UIButton *Edit;
@property(nonatomic, strong)IBOutlet UIButton *logout;

-(IBAction)ClickOnEditButton:(id)sender;

-(IBAction)ClickOnlogoutButton:(id)sender;



@end
