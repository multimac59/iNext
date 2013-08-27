//
//  WishlistViewController.m
//  iNext
//
//  Created by mithun ravi on 09/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "WishlistViewController.h"

@interface WishlistViewController ()

@end

@implementation WishlistViewController

@synthesize tableView;
@synthesize wishListArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Wishlist";

        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    passwordDefault=[NSUserDefaults standardUserDefaults];
    wishListArray=[[NSMutableArray alloc]init];
    tableView.backgroundColor=[UIColor clearColor];
    // Do any additional setup after loading the view from its nib.
    if(IS_IPHONE5)
    {
    
    
    }
    else
    {
    
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self getWishListRequest];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)clickOnaddButton:(id)sender
{
    CreateWishViewController *createwishview=[[CreateWishViewController alloc]initWithNibName:@"CreateWishViewController" bundle:nil];
    [createwishview setTitleString:@"Add WishList"];
    [self.navigationController presentViewController:createwishview animated:YES completion:nil];




}

#pragma mark - table view delegate and datasouce method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView1 numberOfRowsInSection:(NSInteger)section
{
    return wishListArray.count;
    
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView1 heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 51;
    
    
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"WishlistCell";
     WishlistCell *Cell =(WishlistCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (Cell == nil)
    {
        NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"WishlistCell" owner:self options:nil];
        
        Cell = [cellArray objectAtIndex:0];
    }
    
    Cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    if (wishListArray.count>indexPath.row)
    {
         Cell.wishLabel.text=[[wishListArray objectAtIndex:indexPath.row] objectForKey:@"wishlist"];
    }
   
    
    return Cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (wishListArray.count>indexPath.row)
    {
        CreateWishViewController *createWish=[[CreateWishViewController alloc] initWithNibName:@"CreateWishViewController" bundle:nil];
        [createWish setWishlistNameString:[[wishListArray objectAtIndex:indexPath.row] objectForKey:@"wishlist"]];
        [createWish setWishListIDSelected:[[wishListArray objectAtIndex:indexPath.row] objectForKey:@"id"]];;
        [createWish setTitleString:@"Detail Wishlist"];
        
        
        [self.navigationController pushViewController:createWish animated:true];
    }
    
}

-(void)getWishListRequest
{
    [MyCustomeClass SVProgressMessageShowOnWhenNeed:@"Loading..."];
    WebServiceHelper *helper=[[WebServiceHelper alloc]init];
    helper.delegate=self;
    NSString *post=[NSString stringWithFormat:@"User_Wish_list/%@",[passwordDefault objectForKey:@"username"]];
    [helper getWishList:post];

}
-(void)getWishList:(NSString *)response
{
    NSLog(@"%@",response);
    NSMutableDictionary *dicData=[MyCustomeClass jsonDictionary:response];
    if (dicData.count>0)
    {
        NSLog(@"%@",dicData);
        wishListArray=[dicData objectForKey:@"User_Wish_listResult"];
    }

    [tableView reloadData];
    [MyCustomeClass SVProgressMessageDismissWithSuccess:@"Successfully done." :2.0];
}

-(void)gettingFail:(NSString *)error
{
    NSLog(@"%@",error);
    [MyCustomeClass SVProgressMessageDismissWithError:@"Please try again" :2.0];
}



@end
