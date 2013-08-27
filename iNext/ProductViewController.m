//
//  ProductViewController.m
//  iNext
//
//  Created by mithun ravi on 08/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "ProductViewController.h"

@interface ProductViewController ()

@end

@implementation ProductViewController

@synthesize tableView;
@synthesize addButton;
@synthesize titleLabel;
@synthesize titleString;
@synthesize webStoreArray;
@synthesize searchArray;

@synthesize actionSheet;
@synthesize dataPicker;
@synthesize webStoreTextfield;
@synthesize keywordTextfield;
@synthesize searchButton;

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
    
    webStoreArray=[[NSMutableArray alloc]init];
    searchArray=[[NSMutableArray alloc]init];
   [self getwebStoreRequest];
   // [self getProductListrequest];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)clickOnwebButton:(id)sender
{
    [self addDataPickerWithDoneAndCancelButton];
}
-(UIActionSheet *)addDataPickerWithDoneAndCancelButton
{
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"web store"
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
    //[datePicker setMinimumDate:minDate];falrea
    
    [actionSheet addSubview:dataPicker];
    
    
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
    webStoreTextfield.text=valueofDatapicker;
    
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
    
            return [NSString stringWithFormat:@"%@",[[webStoreArray objectAtIndex:row] objectForKey:@"webstorename"]];
    
    
}
- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
        
        webStoreID=[NSString stringWithFormat:@"%@",[[webStoreArray objectAtIndex:row] objectForKey:@"id"]];
        valueofDatapicker=[NSString stringWithFormat:@"%@",[[webStoreArray objectAtIndex:row] objectForKey:@"webstorename"]];
  
    
}



#pragma mark - table view delegate and datasouce method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
    
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
    
    
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"ProductCell";
    ProductCell *Cell =(ProductCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (Cell == nil)
    {
        NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"ProductCell" owner:self options:nil];
        
        Cell = [cellArray objectAtIndex:0];
    }
   // Cell.label1.text=[[IDarray objectAtIndex:0]objectForKey:@"id"];
    
    return Cell;
    
    
}

-(IBAction)ClickOnaddButton:(id)sender
{
    OffOdPViewController *offod=[[OffOdPViewController alloc]initWithNibName:@"OffOdPViewController" bundle:nil];
    [offod setTitleString:[NSString stringWithFormat:@"Add Product%@",titleString]];
    
    [self presentViewController:offod animated:YES completion:nil];
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
        //IDarray=[dicData objectForKey:@"id"];
        //NSLog(@"id value stored");
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


-(IBAction)ClickOnsearchButton:(id)sender
{
    WebServiceHelper *helper=[[WebServiceHelper alloc] init];
    helper.delegate=self;
    NSString *postString=[NSString stringWithFormat:@"Search_product/%@/%@",webStoreID,keywordTextfield.text];
    
    [helper getProductList:postString];


}
-(void)getProductList:(NSString *)response
{
     NSLog(@"%@",response);
    NSMutableDictionary *dicData=[MyCustomeClass jsonDictionary:response];
    if (dicData.count>0)
    {
        NSLog(@"%@",dicData);
        searchArray=[dicData objectForKey:@"Search_productResult"];
    }
    else
    {
        
    }


}



@end
