//
//  OrderStatusViewController.h
//  iNext
//
//  Created by mithun ravi on 09/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OfferCell.h"
#import "MyCustomeClass.h"
#import "OffOdPViewController.h"

@interface OrderStatusViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,WebServiceHelperDelegate>
{
    NSUserDefaults *orderDefault;
}
@property(nonatomic,strong)IBOutlet UITableView *tableView;

@property(nonatomic,strong)IBOutlet UIButton *addButton;

@property(nonatomic,strong)IBOutlet UILabel *titleLabel;
@property(nonatomic,strong)NSString *titleString;


-(IBAction)clickOnaddButton:(id)sender;

@end
