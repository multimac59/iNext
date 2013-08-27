//
//  CreateWishViewController.m
//  iNext
//
//  Created by mithun ravi on 14/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "CreateWishViewController.h"

@interface CreateWishViewController ()

@end

@implementation CreateWishViewController

@synthesize userTextfield,wishTextfield,productTextfield;
@synthesize navImageview;
@synthesize actionSheet,datapicker;
@synthesize productString,productId;
@synthesize productArray;
@synthesize wishlistNameString;
@synthesize titleLable;
@synthesize titleString;
@synthesize viewProduce;
@synthesize keywordArray;
@synthesize keyWordTextField,keywordView;
@synthesize webStoreText;
@synthesize submitButton;
@synthesize productListView,productListArray,productListTableView;
@synthesize wishListIDSelected;
@synthesize backgroundImageView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    userDefault=[NSUserDefaults standardUserDefaults];
    productArray=[[NSMutableArray alloc] init];
    productListArray=[[NSMutableArray alloc] init];
    keywordArray=[[NSMutableArray alloc] initWithObjects:@"iPhone", nil];
    userTextfield.text=[userDefault  objectForKey:@"username"];
    viewProduce.backgroundColor=[UIColor clearColor];
    productListTableView.backgroundColor=[UIColor clearColor];
    keywordView.hidden=YES;
    keywordProducetString=@"WebStore";
    if ([titleString isEqualToString:@"Add WishList"])
    {
        titleLable.text=titleString;
        viewProduce.hidden=YES;
        [submitButton setTitle:@"Submit" forState:UIControlStateNormal];
        productListView.hidden=YES;
        if(IS_IPHONE5)
        {
            navImageview.frame=CGRectMake(0, 0,320, 46);
        }
        else
        {
            navImageview.frame=CGRectMake(0, 00,320, 88);
            
        }

    }
    else
    {
        titleLable.text=titleString;
        wishTextfield.text=wishlistNameString;
        viewProduce.hidden=NO;
        [submitButton setTitle:@"Add Product" forState:UIControlStateNormal];
        productListView.hidden=NO;
        [self getWebStore];
        [self getproductListAccordingtoWishListRequest];
        if(IS_IPHONE5)
        {
            navImageview.frame=CGRectMake(0, 0,320, 46);
            productListView.frame=CGRectMake(0, 197, 320, 302);
            backgroundImageView.frame=CGRectMake(2, 2, 318, 298);
            productListTableView.frame=CGRectMake(2, 30, 318, 298);

        }
        else
        {
            navImageview.frame=CGRectMake(0, 00,320, 134);
            productListView.frame=CGRectMake(0, 197, 320, 250);
            backgroundImageView.frame=CGRectMake(2, 2, 318, 246);
            productListTableView.frame=CGRectMake(2, 30, 318, 246);
        }
        

    }
    
    // Do any additional setup after loading the view from its nib.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)clickOnbackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];

}
-(IBAction)keyboardGone:(id)sender
{
    [userTextfield resignFirstResponder];
    [productTextfield resignFirstResponder];
    [wishTextfield resignFirstResponder];
    [keyWordTextField resignFirstResponder];

}



#pragma mark - Service Response and Request method list
#pragma mark - Request method list
-(IBAction)clickOnsubmitButton:(id)sender
{
    if ([titleString isEqualToString:@"Add WishList"])
    {
        [MyCustomeClass SVProgressMessageShowOnWhenNeed:@"creating wishlist..."];
        if(userTextfield.text==nil || [userTextfield.text length]<=0)
            
        {
            [userTextfield becomeFirstResponder];
            [MyCustomeClass SVProgressMessageDismissWithError:@"Please user name." :1.0];
        }
        else if(wishTextfield.text==nil || [wishTextfield.text length]<=0)
            
        {
            [wishTextfield becomeFirstResponder];
            [MyCustomeClass SVProgressMessageDismissWithError:@"Please wishlist name." :1.0];
        }
        else
        {
            
            WebServiceHelper *helper=[[WebServiceHelper alloc] init];
            helper.delegate=self;
            NSString *postString=[NSString stringWithFormat:@"Create_new_wishlist/%@/%@",[userDefault objectForKey:@"username"],[MyCustomeClass whiteSpaceReplaceFromString:wishTextfield.text]];
            
            [helper createWishlist:postString];
        }
    }
    else
    {
        [MyCustomeClass SVProgressMessageShowOnWhenNeed:@"Add Product with wishlist..."];
        if(userTextfield.text==nil || [userTextfield.text length]<=0)
            
        {
            [userTextfield becomeFirstResponder];
            [MyCustomeClass SVProgressMessageDismissWithError:@"Please user name." :1.0];
        }
        else if(wishTextfield.text==nil || [wishTextfield.text length]<=0)
            
        {
            [wishTextfield becomeFirstResponder];
            [MyCustomeClass SVProgressMessageDismissWithError:@"Please wishlist name." :1.0];
        }
        else if(productTextfield.text==nil || [productTextfield.text length]<=0)
            
        {
            [MyCustomeClass SVProgressMessageDismissWithError:@"Please select product." :1.0];
        }
        else
        {
            
            WebServiceHelper *helper=[[WebServiceHelper alloc] init];
            helper.delegate=self;
            NSString *postString=[NSString stringWithFormat:@"Add_product_in_wishlist/%@/%@",productId,webStoreId];
            
            [helper addProductList:postString];
        }
    }
    
    
    
}
-(void)getKeywordRequestMthod
{
    [MyCustomeClass SVProgressMessageShowOnWhenNeed:@"Keywoard finding..."];
    WebServiceHelper *helper=[[WebServiceHelper alloc] init];
    helper.delegate=self;
    NSString *postString=[NSString stringWithFormat:@""];
    [helper getKeywordForProduct:postString];
}

-(void)getProductlistRequest
{
    [MyCustomeClass SVProgressMessageShowOnWhenNeed:@"Product Search..."];
    WebServiceHelper *helper=[[WebServiceHelper alloc] init];
    helper.delegate=self;
    NSString *postString=[NSString stringWithFormat:@"Search_product/%@/%@",webStoreId,keyWordTextField.text];
    [helper getProductList:postString];
}
-(void)getWebStore
{
    WebServiceHelper *helper=[[WebServiceHelper alloc] init];
    helper.delegate=self;
    NSString *postString=[NSString stringWithFormat:@"/WebStoreList"];
    [helper getWebStore:postString];
}
-(void)getproductListAccordingtoWishListRequest
{
    [MyCustomeClass SVProgressMessageShowOnWhenNeed:@"Loading Data..."];
    WebServiceHelper *helper=[[WebServiceHelper alloc] init];
    helper.delegate=self;
    NSString *postString=[NSString stringWithFormat:@"/Product_list_from_wishlist/%@",wishListIDSelected];
    [helper getProductListAccordingtoWishlist:postString];

}

#pragma mark - Response method list
-(void)getProductListAccordingtoWishlist:(NSString *)response
{
    NSLog(@"%@",response);
    NSMutableDictionary *dicData=[MyCustomeClass jsonDictionary:response];
    if ([[dicData objectForKey:@"Product_list_from_wishlistResult"] count]>0)
    {
        productListArray=[dicData objectForKey:@"Product_list_from_wishlistResult"];
        [MyCustomeClass SVProgressMessageDismissWithSuccess:@"Successfully added." :2.0];
        [productListTableView reloadData];
    }
    else
    {
        [MyCustomeClass SVProgressMessageDismissWithError:@"No Product added with this wishlist." :2.0];
    }
}
-(void)addProductList:(NSString *)response
{
    NSLog(@"%@",response);
    NSMutableDictionary *dicData=[MyCustomeClass jsonDictionary:response];
    if ([[ NSString stringWithFormat:@"%@",[dicData objectForKey:@"Add_product_in_wishlistResult" ] ] isEqualToString:@"1"])
    {
        [MyCustomeClass SVProgressMessageDismissWithSuccess:@"Successfully added." :2.0];
    }
    else
    {
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please try again." :2.0];
    }
}
-(void)getProductList:(NSString *)response
{
    NSLog(@"%@",response);
    NSMutableDictionary *dicData=[MyCustomeClass jsonDictionary:response];
    if (dicData.count>0)
    {
        NSLog(@"%@",dicData);
        productArray=[dicData objectForKey:@"Search_productResult"];
        //IDarray=[dicData objectForKey:@"id"];
        //NSLog(@"id value stored");
        [keyWordTextField resignFirstResponder];
        [self addDataPickerWithDoneAndCancelButton];
        
        [MyCustomeClass SVProgressMessageDismissWithSuccess:@"Successfully Goted." :2.0];

    }
    else
    {
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please try again." :2.0];

    }

}
-(void)getWebStore:(NSString *)response
{
    NSLog(@"%@",response);
    NSMutableDictionary *dicData=[MyCustomeClass jsonDictionary:response];
    if (dicData.count>0)
    {
        NSLog(@"%@",dicData);
        keywordArray=[dicData objectForKey:@"WebStoreListResult"];
        //IDarray=[dicData objectForKey:@"id"];
        //NSLog(@"id value stored");
    }
    else
    {
        
    }

}
-(void)getKeywordForProduct:(NSString *)response
{
    NSLog(@"%@",response);
    [self addDataPickerWithDoneAndCancelButton];
}

-(void)createWishlist:(NSString *)response
{
    NSLog(@"%@",response);
    NSMutableDictionary *dicData=[MyCustomeClass jsonDictionary:response];
    NSLog(@"%@",[NSString stringWithFormat:@"%@",[dicData objectForKey:@"Create_new_wishlistResult"]]);
    if ([[NSString stringWithFormat:@"%@",[dicData objectForKey:@"Create_new_wishlistResult"]] isEqualToString:@"1"])
    {
        [MyCustomeClass SVProgressMessageDismissWithSuccess:@"Successfully changed" :2.0];
        userTextfield.text=nil;
        wishTextfield.text=nil;
        [self dismissViewControllerAnimated:true completion:nil];
        

    }
    else
    {
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please try again." :2.0];

        //changePassTextfield.text=nil;
    }
}
-(void)gettingFail:(NSString *)error
{
    NSLog(@"%@",error);
}



#pragma mark - data picker

-(IBAction)clickOnGetProductButton:(id)sender
{
    
        keywordView.hidden=NO;

    //[self addDataPickerWithDoneAndCancelButton];
}
-(IBAction)clickOnkeywordtextFieldButton:(id)sender
{
    //[self getKeywordRequestMthod];
    [self addDataPickerWithDoneAndCancelButton];

}
-(IBAction)selectKeywordButton:(id)sender
{
    if ([keyWordTextField.text length]<=0 || keyWordTextField.text==nil)
    {
        
    }
    else
    {
        keywordView.hidden=YES;
        keywordProducetString=@"Product List";
        [self getProductlistRequest];
        //[self addDataPickerWithDoneAndCancelButton];
    }
}

-(UIActionSheet *)addDataPickerWithDoneAndCancelButton
{
    actionSheet = [[UIActionSheet alloc] initWithTitle:keywordProducetString
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
    //[datePicker setMinimumDate:minDate];
    
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
    if ([keywordProducetString isEqualToString:@"WebStore"])
    {
        webStoreText.text=webStorString;

    }
    else
    {
        productTextfield.text=productString;

    }
    // birthdayTextfield.text=formattedDate;
    
               
    
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
    if ([keywordProducetString isEqualToString:@"WebStore"])
    {
        return keywordArray.count;
    }
    else
    {
        return productArray.count ;

    }
    
           
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if ([keywordProducetString isEqualToString:@"WebStore"])
    {
         return [NSString stringWithFormat:@"%@",[[keywordArray objectAtIndex:row] objectForKey:@"webstorename"]];
    }
    else
    {
         return [NSString stringWithFormat:@"%@",[[productArray objectAtIndex:row] objectForKey:@"productname"]];
    }
       
   
    
}
- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if ([keywordProducetString isEqualToString:@"WebStore"])
    {
        webStoreId=[NSString stringWithFormat:@"%@",[[keywordArray objectAtIndex:row] objectForKey:@"id"]];
        webStorString=[NSString stringWithFormat:@"%@",[[keywordArray objectAtIndex:row] objectForKey:@"webstorename"]];
    }
    else
    {
        productId=[NSString stringWithFormat:@"%@",[[productArray objectAtIndex:row] objectForKey:@"id"]];
        productString=[NSString stringWithFormat:@"%@",[[productArray objectAtIndex:row] objectForKey:@"productname"]];
    }
    
       
        
}

-(IBAction)clickOnnextBUTTON:(id)sender
{
    ProductViewController *PRODUCT=[[ProductViewController alloc]initWithNibName:@"ProductViewController" bundle:nil];
    
    [self.navigationController pushViewController:PRODUCT animated:YES];

}


#pragma mark - table view delegate and datasouce method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return productListArray.count;
    
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
    
    
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"WishListCell2";
    WishlistCell *Cell =(WishlistCell *)[productListTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (Cell == nil)
    {
        NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"WishlistCell" owner:self options:nil];
        
        Cell = [cellArray objectAtIndex:0];
    }
    Cell.wishLabel.text=@"Product list";
    
    return Cell;
    
    
}







@end
