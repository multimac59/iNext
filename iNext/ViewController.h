//
//  ViewController.h
//  iNext
//
//  Created by mithun ravi on 06/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface ViewController : UIViewController
{

}
@property(nonatomic,strong)IBOutlet UIButton *adminButton;
@property(nonatomic,strong)IBOutlet UIButton *sales;
@property(nonatomic,strong)IBOutlet UIButton *client;
@property(nonatomic, strong)IBOutlet UIButton *supportman;



-(IBAction)clickOnadminButton:(id)sender;
-(IBAction)clickOnclientButton:(id)sender;
-(IBAction)clickOnsalesButton:(id)sender;
-(IBAction)clickOnsupportmanButton:(id)sender;




@end
