//
//  RegisterViewController.m
//  iNext
//
//  Created by mithun ravi on 06/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize scrollView;
@synthesize submit;
@synthesize back;
@synthesize imageView;
@synthesize actionSheet;
@synthesize datePicker;
@synthesize dateAndTimeString;
@synthesize titleString;
@synthesize titleLabel;

@synthesize firstTextfield,lastTextField,userTextField,passTextField,emailTextField,mobileTextField,birthdayTextField;

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
    titleLabel.text=titleString;
    if (IS_IPHONE5)
    {
        scrollView.frame=CGRectMake(0, 47, 320, 500);
        scrollView.contentSize=CGSizeMake(320,600);
                                          
    }
    else
    {
        scrollView.frame=CGRectMake(0, 120, 320, 500);
        scrollView.contentSize=CGSizeMake(320,600);


    }
    // Do any additional setup after loading the view from its nib.
      
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)clickonbackbutton:(id)sender;
{
    
    
    [self.navigationController popViewControllerAnimated:true];
    [self dismissViewControllerAnimated:true completion:Nil];
}


-(IBAction)clickonsubmitbutton:(id)sender;
{
    
}

-(IBAction)keyBoardGone:(id)sender
{
    [firstTextfield resignFirstResponder];
    [lastTextField resignFirstResponder];
    [userTextField resignFirstResponder];
    [passTextField resignFirstResponder];
    [emailTextField resignFirstResponder];
    [mobileTextField resignFirstResponder];
    [birthdayTextField resignFirstResponder];
}
#pragma mark -
#pragma mark UITextFieldDelegate

#pragma mark -
#pragma mark UITextFieldDelegate
- (void) scrollViewAdaptToStartEditingTextField:(UITextField*)textField
{
    CGPoint point = CGPointMake(0, textField.frame.origin.y - 1.5 * textField.frame.size.height);
    [scrollView setContentOffset:point animated:YES];
}

- (void) scrollVievEditingFinished:(UITextField*)textField
{
    CGPoint point = CGPointMake(0, 0);
    [scrollView setContentOffset:point animated:YES];
}

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    [self scrollViewAdaptToStartEditingTextField:textField];
    return YES;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self scrollVievEditingFinished:textField];
    return YES;
}
-(IBAction)clickOnbirthdayButton:(id)sender
{
   


    [self addDatePickerWithDoneAndCancelButton];

}


-(UIActionSheet *)addDatePickerWithDoneAndCancelButton
{
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"Date Of birth"
                                              delegate:nil
                                     cancelButtonTitle:nil
                                destructiveButtonTitle:nil
                                     otherButtonTitles:nil];
    
    [actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
    CGRect pickerFrame = CGRectMake(0, 40, 0, 0);
    
    
    
    datePicker = [[UIDatePicker alloc] initWithFrame:pickerFrame];
    
        datePicker.datePickerMode = UIDatePickerModeDate;
    
    // dataPickerView.showsSelectionIndicator = YES;
    //dataPickerView.dataSource = self;
    //  dataPickerView.delegate = self;
  //  NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] ;
   // NSDate *currentDate = [NSDate date];
   // NSDateComponents *comps = [[NSDateComponents alloc] init] ;
    
  //  NSDate *minDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    //[datePicker setMinimumDate:minDate];
    
    [actionSheet addSubview:datePicker];
    
    
    UISegmentedControl *cancelButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Cancel"]];
    cancelButton.momentary = YES;
    cancelButton.frame = CGRectMake(10, 7.0f, 50.0f, 30.0f);
    cancelButton.segmentedControlStyle = UISegmentedControlStyleBar;
    cancelButton.tintColor = [UIColor grayColor];
    [cancelButton addTarget:self action:@selector(clickOnCancelButtonOnActionSheet:) forControlEvents:UIControlEventValueChanged];
    //////////////////////////////////////////////
   UISegmentedControl *doneButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Done"]];
    doneButton.momentary = YES;
    doneButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
    doneButton.segmentedControlStyle = UISegmentedControlStyleBar;
    doneButton.tintColor = [UIColor grayColor];
    [doneButton addTarget:self action:@selector(clickOnDoneButtonOnActionSheet:) forControlEvents:UIControlEventValueChanged];
    
    [actionSheet addSubview:cancelButton];
    [actionSheet addSubview:doneButton];
    
    
    [actionSheet showInView:[[UIApplication sharedApplication] keyWindow]];
    
    [actionSheet setBounds:CGRectMake(0, 0, 320, 485)];
    return actionSheet;
}


-(IBAction)clickOnCancelButtonOnActionSheet:(id)sender
{
    // actionSheet.hidden=YES;
    //dataPickerView.hidden=YES;
    [actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    
}
-(IBAction)clickOnDoneButtonOnActionSheet:(id)sender
{
    NSString *formattedDate;
    NSDate *date = datePicker.date;
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    formattedDate = [dateFormatter stringFromDate:date];
    birthdayTextField.text=formattedDate;
   [actionSheet dismissWithClickedButtonIndex:1 animated:YES];
    
    
}
-(IBAction)clickOnCameraButton:(id)sender
{
    
    [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.allowsEditing = YES;
        picker.showsCameraControls = YES;
        [self presentViewController:picker animated:true completion:nil];
    }






}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)myImage editingInfo:(NSDictionary *)editingInfo
{
    
    NSLog(@"value of my image is=========%@",myImage);
        [picker dismissModalViewControllerAnimated:YES];
    imageView.image=myImage;
    // NSLog(@"value of nsdata in picker=====%@",imgData);
    
    
  //[self uploadImage];
}


-(IBAction)clickOnPhotoLibryButton:(id)sender
{

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:picker animated:true completion:nil];
     
}




#pragma mark-
-(IBAction)clickOnSubmitButton:(id)sender
{
    [MyCustomeClass SVProgressMessageShowOnWhenNeed:@"Registration..."];
    if([firstTextfield.text length]<=0)
        
    {
        [firstTextfield becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter first name..." :1.0];
    }
    else if([lastTextField.text length]<=0)
    {
        [lastTextField becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter last name..." :1.0];
    }
    else if([userTextField.text length]<=0)
    {
        [userTextField becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter user name..." :1.0];
    }
    else if([emailTextField.text length]<=0)
    {
        [emailTextField becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter email..." :1.0];
    }
    else if([passTextField.text length]<=0)
    {
        [passTextField becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter password..." :1.0];
    }
    else if([mobileTextField.text length]<=0)
    {
        [mobileTextField becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter mobile no..." :1.0];
    }
    else if([birthdayTextField.text length]<=0)
    {
        [birthdayTextField becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter birthday..." :1.0];
    }
    
    else
    {
        if ([MyCustomeClass validateEmail:emailTextField.text]==true)
        {

            WebServiceHelper *web=[[WebServiceHelper alloc]init];
            web.delegate=self;
            NSString *postString=[NSString stringWithFormat:@"CreateUser/%@/%@/%@/%@/%@/%@/%@/?email=%@&date=%@ ",userTextField.text,passTextField.text,mobileTextField.text,mobileTextField.text,firstTextfield.text,lastTextField.text,/*[MyCustomeClass imageChangeIntoString:imageView.image]*/@"a",emailTextField.text,birthdayTextField.text];
        
            [web registration:postString];
        }
        else
        {
                [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter valid email id" :2.0];
        }
            

        
    }

   



}
#pragma mark - web service method list

-(void)getWebStore: (NSString *) response
{
    NSLog(@"%@",response);
}


-(void)registration:(NSString *)response
{
    NSLog(@"%@",response);
    NSMutableDictionary *dicData=[MyCustomeClass jsonDictionary:response];
    if ([[dicData objectForKey:@"Registration"] isEqualToString:@" bad URL."])
    {
        [MyCustomeClass SVProgressMessageDismissWithError:@" bad URL ." :2.0];
    }
    else
    {
        [MyCustomeClass SVProgressMessageDismissWithSuccess:@"Successfully Registration" :2.0];
        firstTextfield.text=nil;
        lastTextField.text=nil;
        userTextField.text=nil;
        passTextField.text=nil;
        emailTextField.text=nil;
        mobileTextField.text=nil;
        birthdayTextField.text=nil;
    }
}
-(void)gettingFail:(NSString *)error
{
    NSLog(@"%@",error);
}


@end
