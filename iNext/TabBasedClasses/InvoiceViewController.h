//
//  InvoiceViewController.h
//  iNext
//
//  Created by mithun ravi on 13/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomeClass.h"
#import "InventoryCell.h"

@interface InvoiceViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{

}
@property(nonatomic,strong)IBOutlet UITableView *tableView;

@property(nonatomic,strong)IBOutlet UIImageView *navImageview;
@property(nonatomic,strong)IBOutlet UIButton *backButton;

-(IBAction)clickOnbackButton:(id)sender;

@end
