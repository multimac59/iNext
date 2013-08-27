//
//  InventoryViewController.h
//  iNext
//
//  Created by mithun ravi on 12/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomeClass.h"
#import "InventoryCell.h"
#import "ZBarSDK.h"


@interface InventoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ZBarReaderDelegate>
{

}
@property(nonatomic,strong)IBOutlet UITableView *tableView;

@property(nonatomic,strong)IBOutlet UIButton *backButton;
@property(nonatomic,strong)IBOutlet UIImageView *navimageView;

-(IBAction)clickOnbackButton:(id)sender;

@end
