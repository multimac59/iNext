//
//  OffersViewController.m
//  iNext
//
//  Created by mithun ravi on 09/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "OffersViewController.h"

@interface OffersViewController ()

@end

@implementation OffersViewController

@synthesize tableView;
@synthesize titleLabel;
@synthesize titleString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Offer";

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    titleLabel.text=titleString;
    // Do any additional setup after loading the view from its nib.
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
    OffOdPViewController *offod=[[OffOdPViewController alloc]initWithNibName:@"OffOdPViewController" bundle:nil];
    [offod setTitleString:[NSString stringWithFormat:@"Add Offer%@",titleString]];

    [self presentViewController:offod animated:YES completion:nil];


}




@end
