//
//  InvoiceViewController.m
//  iNext
//
//  Created by mithun ravi on 13/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "InvoiceViewController.h"

@interface InvoiceViewController ()

@end

@implementation InvoiceViewController

@synthesize tableView;
@synthesize navImageview;
@synthesize backButton;

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
    // Do any additional setup after loading the view from its nib.
    if(IS_IPHONE5)
    {
    
    }
    else
    {
        navImageview.frame=CGRectMake(0,0,320,200);
    
    
    }
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
    return 65;
    
    
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"InventoryCell";
    InventoryCell *Cell =(InventoryCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (Cell == nil)
    {
        NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"InventoryCell" owner:self options:nil];
        
        Cell = [cellArray objectAtIndex:0];
    }
    
    return Cell;
    
    
}


@end
