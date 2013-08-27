//
//  ClientSaleViewController.m
//  iNext
//
//  Created by Mithun on 11/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "ClientSaleViewController.h"

@interface ClientSaleViewController ()

@end

@implementation ClientSaleViewController
@synthesize tableView;
@synthesize navImageView;
@synthesize titleString,titleLable,registerServicName;
@synthesize AccountListArray,serviceName;

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
    titleLable.text=titleString;
    tableView.backgroundColor=[UIColor clearColor];
    clientDefault=[NSUserDefaults standardUserDefaults];
       
    // Do any additional setup after loading the view from its nib.
    if(IS_IPHONE5)
    {
    
    }
    else
    {
        tableView.frame=CGRectMake(0,44,320, 500);
        navImageView.frame=CGRectMake(0,0,320,132);
    
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self AccountListRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view delegate and datasouce method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return AccountListArray.count;
    
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
    
    
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *CellIdentifier=@"ClientSaleCell";
       ClientSaleCell *Cell =(ClientSaleCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (Cell == nil)
        {
            NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"ClientSaleCell" owner:self options:nil];
            
            Cell = [cellArray objectAtIndex:0];
        }
        if (AccountListArray.count>indexPath.row)
        {
            Cell.emailLabel.text=[[AccountListArray objectAtIndex:indexPath.row] objectForKey:@"email"];
            Cell.nameLabel.text=[NSString stringWithFormat:@"%@ %@", [[AccountListArray objectAtIndex:indexPath.row] objectForKey:@"F_name"],[[AccountListArray objectAtIndex:indexPath.row] objectForKey:@"L_name"]];
            Cell.mobilenoLabel.text=[NSString stringWithFormat:@"%@",[[AccountListArray objectAtIndex:indexPath.row] objectForKey:@"mobile_number"] ];
            Cell.mypointsLabel.text=[NSString stringWithFormat:@"%@",[[AccountListArray objectAtIndex:indexPath.row] objectForKey:@"workinhrOrpoint"] ];
           // Cell.imageView.image=[UIImage imageNamed:@""];
        }
    
    return Cell;
        
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(IBAction)clickOnbackButton:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(IBAction)clickOnaddButton:(id)sender
{
    RegistrationView *view=[[RegistrationView alloc]initWithNibName:@"RegistrationView" bundle:nil];
    [view setTitleString:[NSString stringWithFormat:@"Add %@",titleString]];
    [view setRegisterServiceName:registerServicName];
    [self presentViewController:view animated:true completion:nil];
}

#pragma mark - web service method list
-(void)AccountListRequest
{
    [MyCustomeClass SVProgressMessageShowOnWhenNeed:@"Loading..."];
    WebServiceHelper *helper=[[WebServiceHelper alloc] init];
    helper.delegate=self;
    NSString *postString=[NSString stringWithFormat:@"Account_list/?email=%@&list=%@",[clientDefault  objectForKey:@"email"],serviceName];
    [helper accountList:postString];
}
-(void)accountList:(NSString *)response
{
    NSLog(@"%@",response);
    NSMutableDictionary *dataDic=[MyCustomeClass jsonDictionary:response];
    NSLog(@"%@",dataDic);
    if ([[dataDic objectForKey:@"Account_listResult"] count]>0)
    {
        AccountListArray=[dataDic objectForKey:@"Account_listResult"];
        [MyCustomeClass SVProgressMessageDismissWithSuccess:@"Successfully loaded" :2.0];
    }
    else
    {
        [MyCustomeClass SVProgressMessageDismissWithError:@"You have no account" :2.0];
    }
    [tableView reloadData];
}





@end
