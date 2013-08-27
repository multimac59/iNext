//
//  Profile1ViewController.m
//  iNext
//
//  Created by mithun ravi on 10/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "Profile1ViewController.h"

@interface Profile1ViewController ()

@end

@implementation Profile1ViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)clickOnCustomerButton:(id)sender;
{
    MyCustomerViewController *customer=[[MyCustomerViewController alloc]initWithNibName:@"MyCustomerViewController" bundle:nil];
    
    [self.navigationController pushViewController:customer animated:YES];

}

@end
