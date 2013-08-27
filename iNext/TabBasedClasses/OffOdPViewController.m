//
//  OffOdPViewController.m
//  iNext
//
//  Created by mithun ravi on 12/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "OffOdPViewController.h"

@interface OffOdPViewController ()

@end

@implementation OffOdPViewController

@synthesize scrollView;
@synthesize navImageview;
@synthesize cancelButton,submitButton;
@synthesize nameTextfield,startdateTextfield,enddateTextfield,quantityTextfield,amountTextfield,storeTextfield;
@synthesize titleLabel;
@synthesize titleString;
@synthesize actionSheet;
@synthesize datePicker;
@synthesize startButton,endButton;
@synthesize webStoreArray;

@synthesize dataPicker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Offer";

        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     webStoreArray=[[NSMutableArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    // Do any additional setup after loading the view from its nib.
     titleLabel.text=titleString;
    [self getwebStoreRequest];

    if(IS_IPHONE5)
    {
        scrollView.frame=CGRectMake(0,45,320,400);
    }
    else
    {
        navImageview.frame=CGRectMake(0,0 , 320,133);
        scrollView.frame=CGRectMake(0,133,320, 400);
        scrollView.contentSize=CGSizeMake(320, 400);
    
    
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

-(IBAction)keyboardGone:(id)sender
{
    [nameTextfield resignFirstResponder];
    [startdateTextfield resignFirstResponder];
    [enddateTextfield resignFirstResponder];
    [quantityTextfield resignFirstResponder];
    [amountTextfield resignFirstResponder];
    [storeTextfield resignFirstResponder];


}
-(IBAction)clickOncancelButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
    [self dismissViewControllerAnimated:true completion:Nil];

}
-(IBAction)clickOnstartButton:(id)sender
{
    satrtenddateString=@"Start Date";
    [self addDatePickerWithDoneAndCancelButton];
    
}
-(IBAction)clickOnendButton:(id)sender
{
    satrtenddateString=@"End Date";
    [self addDatePickerWithDoneAndCancelButton];

}

-(UIActionSheet *)addDatePickerWithDoneAndCancelButton
{
    actionSheet = [[UIActionSheet alloc] initWithTitle:satrtenddateString
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
    
    
    UISegmentedControl *cancelButton1 = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Cancel"]];
    cancelButton1.momentary = YES;
    cancelButton1.frame = CGRectMake(10, 7.0f, 50.0f, 30.0f);
    cancelButton1.segmentedControlStyle = UISegmentedControlStyleBar;
    cancelButton1.tintColor = [UIColor grayColor];
    [cancelButton1 addTarget:self action:@selector(clickOnCancelButtonOnActionSheet:) forControlEvents:UIControlEventValueChanged];
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
   
    if([satrtenddateString isEqualToString:@"Start Date"])
    {
        startdateTextfield.text=formattedDate;
    }
    else if ([satrtenddateString isEqualToString:@"End Date"])
    {
        enddateTextfield.text=formattedDate;
    
    }
       
    [actionSheet dismissWithClickedButtonIndex:1 animated:YES];
    
    
}

-(IBAction)clickOnWebStoreButton:(id)sender
{

    
    
    [self addDataPickerWithDoneAndCancelButton];
}

-(UIActionSheet *)addDataPickerWithDoneAndCancelButton
{
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"Web Store"
                                              delegate:nil
                                     cancelButtonTitle:nil
                                destructiveButtonTitle:nil
                                     otherButtonTitles:nil];
    
    [actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
    CGRect pickerFrame = CGRectMake(0, 40, 0, 0);
    
    
    
    dataPicker = [[UIPickerView alloc] initWithFrame:pickerFrame];
    
    // datePicker.datePickerMode = UIDatePickerModeDate;
    
    dataPicker.showsSelectionIndicator = YES;
    dataPicker.dataSource = self;
    dataPicker.delegate = self;
    //  NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] ;
    // NSDate *currentDate = [NSDate date];
    // NSDateComponents *comps = [[NSDateComponents alloc] init] ;
    
    //  NSDate *minDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    //[datePicker setMinimumDate:minDate];
    
    [actionSheet addSubview:dataPicker];
    
    
    UISegmentedControl *cancelButton2 = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Cancel"]];
    cancelButton2.momentary = YES;
    cancelButton2.frame = CGRectMake(10, 7.0f, 50.0f, 30.0f);
    cancelButton2.segmentedControlStyle = UISegmentedControlStyleBar;
    cancelButton2.tintColor = [UIColor grayColor];
    [cancelButton2 addTarget:self action:@selector(clickOnCancelButtonOnActionSheetData:) forControlEvents:UIControlEventValueChanged];
    //////////////////////////////////////////////
    UISegmentedControl *doneButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Done"]];
    doneButton.momentary = YES;
    doneButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
    doneButton.segmentedControlStyle = UISegmentedControlStyleBar;
    doneButton.tintColor = [UIColor grayColor];
    [doneButton addTarget:self action:@selector(clickOnDoneButtonOnActionSheetData:) forControlEvents:UIControlEventValueChanged];
    
    [actionSheet addSubview:cancelButton2];
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
    
    
    
        storeTextfield.text=valueOfDataPicker;
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
    
    return webStoreArray.count;
    
    
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    
            return [NSString stringWithFormat:@"%@",[webStoreArray objectAtIndex:row]];
    
    
}
- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
           webStoreId=[NSString stringWithFormat:@"%@",[[webStoreArray objectAtIndex:row] objectForKey:@"id"]];
    valueOfDataPicker=[NSString stringWithFormat:@"%@",[[webStoreArray objectAtIndex:row]objectForKey:@"webstorename"]];
    
}


-(IBAction)clickOnsubmitButton:(id)sender
{


}
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




@end
