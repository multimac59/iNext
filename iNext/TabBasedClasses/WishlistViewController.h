//
//  WishlistViewController.h
//  iNext
//
//  Created by mithun ravi on 09/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomeClass.h"
#import "WishlistCell.h"
#import "CreateWishViewController.h"

@interface WishlistViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,WebServiceHelperDelegate>
{
    NSUserDefaults *passwordDefault;

}
@property(nonatomic,strong)IBOutlet UITableView *tableView;

@property(nonatomic,strong)IBOutlet UIButton *addButton;

@property(nonatomic,strong)NSMutableArray *wishListArray;

-(IBAction)clickOnaddButton:(id)sender;

@end
