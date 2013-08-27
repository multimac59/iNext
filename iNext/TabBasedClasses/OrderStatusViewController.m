//
//  OrderStatusViewController.m
//  iNext
//
//  Created by mithun ravi on 09/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "OrderStatusViewController.h"

@interface OrderStatusViewController ()

@end

@implementation OrderStatusViewController

@synthesize tableView;
@synthesize titleLabel;
@synthesize titleString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Order";

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    titleLabel.text=titleString;
    orderDefault=[NSUserDefaults standardUserDefaults];
    [self getOrderListRequest];
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
    return 20;
    
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
    
    
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"OfferCell";
    OfferCell *Cell =(OfferCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (Cell == nil)
    {
        NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"OfferCell" owner:self options:nil];
        
        Cell = [cellArray objectAtIndex:0];
    }
    
    return Cell;
    
    
}

-(IBAction)clickOnaddButton:(id)sender
{
    OffOdPViewController *off=[[OffOdPViewController alloc]initWithNibName:@"OffOdPViewController" bundle:nil];
    [off setTitleString:[NSString stringWithFormat:@"Add Order%@",titleString]];
    
    [self presentViewController:off animated:YES completion:nil];


}

#pragma mark - Request and Response method list
#pragma mark - Request method list
-(void)getOrderListRequest
{
    [MyCustomeClass SVProgressMessageShowOnWhenNeed:@"Loading Order..."];
    WebServiceHelper *helper=[[WebServiceHelper alloc] init];
    helper.delegate=self;
    NSString *postString=[NSString stringWithFormat:@"Order_detail/?email=%@",[orderDefault objectForKey:@"email"]];
    [helper getOrderList:postString];
}

#pragma mark - Response Method list
-(void)getOrderList:(NSString *)response
{
    NSLog(@"%@",response);
    NSMutableDictionary *dataDic=[MyCustomeClass jsonDictionary:response];
    if ([dataDic objectForKey:@"Order_detailResult"])
    {
        [MyCustomeClass SVProgressMessageDismissWithSuccess:@"Loaded." :2.0];
    }
    else
    {
        [MyCustomeClass SVProgressMessageDismissWithSuccess:@"No Order available." :2.0];

    }
}

-(void)gettingFail:(NSString *)error
{
    NSLog(@"%@",error);
}



@end
