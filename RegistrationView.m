//
//  RegistrationView.m
//  iNext
//
//  Created by mithun ravi on 08/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "RegistrationView.h"

@interface RegistrationView ()

@end

@implementation RegistrationView

@synthesize submit;
@synthesize back;

@synthesize scrollView;

@synthesize firstTextfield,lastTextfield,userTextfield,emailTextfield,mobileTextfield,passTextfield,birthdayTextfield,workTextfield,storeTextfield;
@synthesize registerServiceName;

@synthesize imageView;
@synthesize titleString;
@synthesize titleLabel;
@synthesize datePicker,actionSheet;
@synthesize datapicker;
@synthesize webStoreArray,hourArray;


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
    registerDefault=[NSUserDefaults standardUserDefaults];
    webStoreArray=[[NSMutableArray alloc] initWithObjects:@"0",@"11",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    hourArray =[[NSMutableArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    if (IS_IPHONE5)
    {
        scrollView.frame=CGRectMake(0, 50, 320, 500);
        scrollView.contentSize=CGSizeMake(320,600);
        
    }
    else
    {
        scrollView.frame=CGRectMake(0, 132, 320, 500);
        scrollView.contentSize=CGSizeMake(320,650);
        
        
    }
    [self getwebStoreRequest];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)keyboardGone:(id)sender
{
    [firstTextfield resignFirstResponder];
    [lastTextfield resignFirstResponder];
    [userTextfield resignFirstResponder];
    [emailTextfield resignFirstResponder];
    [passTextfield resignFirstResponder];
    [mobileTextfield resignFirstResponder];
    [workTextfield resignFirstResponder];
    [birthdayTextfield resignFirstResponder];
    [storeTextfield resignFirstResponder];

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

-(IBAction)clickOnPhotButton:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:picker animated:true completion:nil];



}


-(IBAction)clickonsubmitbutton:(id)sender;
{
    
    [MyCustomeClass SVProgressMessageShowOnWhenNeed:@"Registration......"];
    if([firstTextfield.text length]<=0)
        
    {
        [firstTextfield becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter first Name..." :1.0];
    }
    
    else if([lastTextfield.text length]<=0)
    {
        [lastTextfield becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter Last Name..." :1.0];
    }
    
    else if([userTextfield.text length]<=0)
    {
        [userTextfield becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter user name..." :1.0];
    }
    
    else if([emailTextfield.text length]<=0)
    {
        [emailTextfield becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter email..." :1.0];
    }

    else if([passTextfield.text length]<=0)
    {
        [passTextfield becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter password..." :1.0];
    }
    else if([mobileTextfield.text length]<=0)
    {
        [mobileTextfield becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter mobile no...." :1.0];
    }
    else if([workTextfield.text length]<=0)
    {
        [workTextfield becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter Work Hour..." :1.0];
    }
    else if([storeTextfield.text length]<=0)
    {
        [storeTextfield becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter store" :1.0];
    
    }
    else
    {
        if ([MyCustomeClass validateEmail:emailTextfield.text]==true)
        {
            if ([titleLabel.text isEqualToString:@"Add Client"])
            {
               // NSArray *houArray=[MyCustomeClass seprateStringFromStringUsingArrray:workTextfield.text :@" "];
                WebServiceHelper *web=[[WebServiceHelper alloc]init];
                web.delegate=self;
                NSString *postString=[NSString stringWithFormat:@"%@/%@/%@/%@/%@/%@/%@/?email=%@&date=%@&adminemail=%@",registerServiceName,[MyCustomeClass whiteSpaceReplaceFromString:userTextfield.text],passTextfield.text,mobileTextfield.text,mobileTextfield.text,[MyCustomeClass whiteSpaceReplaceFromString:firstTextfield.text],[MyCustomeClass whiteSpaceReplaceFromString:lastTextfield.text], emailTextfield.text,birthdayTextfield.text, [[[registerDefault objectForKey:@"UserInfo"] objectAtIndex:0] objectForKey:@"email"]];
                
                [web creatRegistrtionFromAdin:postString];
            }
            else
            {
                NSArray *houArray=[MyCustomeClass seprateStringFromStringUsingArrray:workTextfield.text :@" "];
                WebServiceHelper *web=[[WebServiceHelper alloc]init];
                web.delegate=self;
                NSString *postString=[NSString stringWithFormat:@"%@/%@/%@/%@/%@/%@/%@/%@/%@/?email=%@&date=%@&adminemail=%@",registerServiceName,[MyCustomeClass whiteSpaceReplaceFromString:userTextfield.text],passTextfield.text,mobileTextfield.text,[MyCustomeClass whiteSpaceReplaceFromString:firstTextfield.text],[MyCustomeClass whiteSpaceReplaceFromString:lastTextfield.text],/*[MyCustomeClass imageChangeIntoString:imageView.image]*/@"a",[houArray objectAtIndex:0], webStoreId, emailTextfield.text,birthdayTextfield.text, [[[registerDefault objectForKey:@"UserInfo"] objectAtIndex:0] objectForKey:@"email"]];
                
                [web creatRegistrtionFromAdin:postString];
            }
           
        }
        else
        {
            [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter valid email id" :2.0];
        }

    }
}
-(IBAction)ClickOnBackButton:(id)sender;
{
    [self.navigationController popViewControllerAnimated:true];
    [self dismissViewControllerAnimated:true completion:nil];
}

#pragma mark - web service response method list
#pragma mark - web service method list
-(void)getwebStoreRequest
{
    WebServiceHelper *web=[[WebServiceHelper alloc]init];
    web.delegate=self;
    NSString *postString=@"WebStoreList";
    [web getWebStore:postString];
    
}
-(void)getWebStore: (NSString *) response
{
    NSLog(@"%@",response);
    NSMutableDictionary *dicData=[MyCustomeClass jsonDictionary:response];
    if (dicData.count>0)
    {
        NSLog(@"%@",dicData);
        webStoreArray=[dicData objectForKey:@"WebStoreListResult"];
    }
    else
    {
        
    }
}

-(void)gettingFail:(NSString *)error
{
    NSLog(@"%@",error);
    [MyCustomeClass SVProgressMessageDismissWithError:@"Please try again" :2.0];
}
-(void)creatRegistrtionFromAdin:(NSString *)response
{
    NSLog(@"%@",response);
    NSMutableDictionary *dataDic=[MyCustomeClass jsonDictionary:response];
    if ([[dataDic objectForKey:@"CreatesalesmanResult"] isEqualToString:@"There already exists a user with this email address."])
    {
        [MyCustomeClass SVProgressMessageDismissWithError:@"Already exists a user with this email address." :2.0];
    }
    else if ([[dataDic objectForKey:@"CreatesalesmanResult"] isEqualToString:@"The user account was successfully created!"] || [[dataDic objectForKey:@"CreatesalesmanResult"] isEqualToString:@"The user account was successfully created!"] )
    {
        [MyCustomeClass SVProgressMessageDismissWithError:@"Successfully Created." :2.0];
        [self dismissViewControllerAnimated:true completion:nil];
    }
    else
    {
        [MyCustomeClass SVProgressMessageDismissWithError:@"Successfully Created." :2.0];
    }
}
#pragma mark - data picker
-(IBAction)clickOnhourButton:(id)sender
{
    [mobileTextfield resignFirstResponder];
    hourandWebStore=@"Wroking Hour";

    [self addDataPickerWithDoneAndCancelButton];
}

-(IBAction)clickOnWebStoreButton:(id)sender
{
    [mobileTextfield resignFirstResponder];

    hourandWebStore=@"Web Store";
    [self addDataPickerWithDoneAndCancelButton];
}

-(UIActionSheet *)addDataPickerWithDoneAndCancelButton
{
    actionSheet = [[UIActionSheet alloc] initWithTitle:hourandWebStore
                                              delegate:nil
                                     cancelButtonTitle:nil
                                destructiveButtonTitle:nil
                                     otherButtonTitles:nil];
    
    [actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
    CGRect pickerFrame = CGRectMake(0, 40, 0, 0);
    
    
    
    datapicker = [[UIPickerView alloc] initWithFrame:pickerFrame];
    
   // datePicker.datePickerMode = UIDatePickerModeDate;
    
     datapicker.showsSelectionIndicator = YES;
    datapicker.dataSource = self;
      datapicker.delegate = self;
    //  NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] ;
    // NSDate *currentDate = [NSDate date];
    // NSDateComponents *comps = [[NSDateComponents alloc] init] ;
    
    //  NSDate *minDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    //[datePicker setMinimumDate:minDate];falrea
    
    [actionSheet addSubview:datapicker];
    
    
    UISegmentedControl *cancelButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Cancel"]];
    cancelButton.momentary = YES;
    cancelButton.frame = CGRectMake(10, 7.0f, 50.0f, 30.0f);
    cancelButton.segmentedControlStyle = UISegmentedControlStyleBar;
    cancelButton.tintColor = [UIColor grayColor];
    [cancelButton addTarget:self action:@selector(clickOnCancelButtonOnActionSheetData:) forControlEvents:UIControlEventValueChanged];
    //////////////////////////////////////////////
    UISegmentedControl *doneButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Done"]];
    doneButton.momentary = YES;
    doneButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
    doneButton.segmentedControlStyle = UISegmentedControlStyleBar;
    doneButton.tintColor = [UIColor grayColor];
    [doneButton addTarget:self action:@selector(clickOnDoneButtonOnActionSheetData:) forControlEvents:UIControlEventValueChanged];
    
    [actionSheet addSubview:cancelButton];
    [actionSheet addSubview:doneButton];
    
    
    [actionSheet showInView:[[UIApplication sharedApplication] keyWindow]];
    
    [actionSheet setBounds:CGRectMake(0, 0, 320, 485)];
    return actionSheet;
}
-(IBAction)clickOnCancelButtonOnActionSheetData:(id)sender
{
    // actionSheet.hidden=YES;
    //dataPickerView.hidden=YES;
    [actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    
}
-(IBAction)clickOnDoneButtonOnActionSheetData:(id)sender
{
    
   // birthdayTextfield.text=formattedDate;
    if ([hourandWebStore isEqualToString:@"Wroking Hour"])
    {
        workTextfield.text=[NSString stringWithFormat:@"%@ Hour",velueOfDataPicker];
        
    }
    else
    {
        storeTextfield.text=velueOfDataPicker;
    }
    [actionSheet dismissWithClickedButtonIndex:1 animated:YES];
    
    
}

#pragma mark
#pragma mark PickrView datasource methods


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{
    if ([hourandWebStore isEqualToString:@"Wroking Hour"])
    {
        return hourArray.count ;
    }
    else
    {
        return webStoreArray.count;
    }
    
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([hourandWebStore isEqualToString:@"Wroking Hour"])
    {
        
        return [NSString stringWithFormat:@"%@",[hourArray objectAtIndex:row]];
    }
    else
    {
        return [NSString stringWithFormat:@"%@",[[webStoreArray objectAtIndex:row] objectForKey:@"webstorename"]];
    }
    
}
- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if ([hourandWebStore isEqualToString:@"Wroking Hour"])
    {
        velueOfDataPicker=[NSString stringWithFormat:@"%@",[hourArray objectAtIndex:row]];;
       
    }
    else
    {
        webStoreId=[NSString stringWithFormat:@"%@",[[webStoreArray objectAtIndex:row] objectForKey:@"id"]];
        velueOfDataPicker=[NSString stringWithFormat:@"%@",[[webStoreArray objectAtIndex:row] objectForKey:@"webstorename"]];
    }
    
    
}

#pragma mark - date picker

-(IBAction)clickOnbirthdayButton:(id)sender
{
    [mobileTextfield resignFirstResponder];

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
    birthdayTextfield.text=formattedDate;
    [actionSheet dismissWithClickedButtonIndex:1 animated:YES];
    
    
}





@end
