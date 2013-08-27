//
//  SalesViewController.m
//  iNext
//
//  Created by mithun ravi on 13/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "SalesViewController.h"

@interface SalesViewController ()

@end

@implementation SalesViewController

@synthesize backButton;
@synthesize navImageview;
@synthesize inventoryTable,invoiceTable;
@synthesize mySegment;

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
    invoiceTable.backgroundColor=[UIColor clearColor];
    inventoryTable.backgroundColor=[UIColor clearColor];

    // Do any additional setup after loading the view from its nib.
    if(IS_IPHONE5)
    {
        navImageview.frame=CGRectMake(0,0,320,46);
    }
    else
    {
        navImageview.frame=CGRectMake(0,00,320,134);
    }
    mySegment.selectedSegmentIndex=0;
    inventoryTable.hidden=NO;
    invoiceTable.hidden=YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clickOnbackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];

}
-(IBAction)clickOninventoryButton:(id)sender
{
    InventoryViewController *inventory=[[InventoryViewController alloc]initWithNibName:@"InventoryViewController" bundle:nil];
    
    [self.navigationController pushViewController:inventory animated:YES];


}
-(IBAction)clickOninvoiceButton:(id)sender
{
    InvoiceViewController *invoice=[[InvoiceViewController alloc]initWithNibName:@"InvoiceViewController" bundle:nil];
    [self.navigationController pushViewController:invoice animated:YES];
}

#pragma mark - Segment controller method
-(IBAction)clickOnSegment
{
    
    switch (mySegment.selectedSegmentIndex)
    {
            
        case 0:
            
            inventoryTable.hidden=NO;
            invoiceTable.hidden=YES;
     
            break;
            
        case 1:
            
            
            inventoryTable.hidden=YES;
            invoiceTable.hidden=NO;

            
            break;
            
            
        default:
            
            break;
            
    }
    
    
}

#pragma mark - table view delegate and datasouce method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView== inventoryTable)
    {
        return 10;
    }
    else
    {
        return 65;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView== inventoryTable)
    {
        return 65;
    }
    else
    {
        return 65;
    }
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView1== inventoryTable)
    {
        static NSString *CellIdentifier=@"WishListCell2";
        WishlistCell *Cell =(WishlistCell *)[inventoryTable dequeueReusableCellWithIdentifier:CellIdentifier];
        if (Cell == nil)
        {
            NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"WishlistCell" owner:self options:nil];
            
            Cell = [cellArray objectAtIndex:0];
        }
        Cell.wishLabel.text=@"invetory list";
        
        return Cell;
    }
    else
    {
        static NSString *CellIdentifier=@"WishListCell2";
        WishlistCell *Cell =(WishlistCell *)[invoiceTable dequeueReusableCellWithIdentifier:CellIdentifier];
        if (Cell == nil)
        {
            NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"WishlistCell" owner:self options:nil];
            
            Cell = [cellArray objectAtIndex:0];
        }
        Cell.wishLabel.text=@"invoice list";
        return Cell;
    }
    
    
    
}


@end
