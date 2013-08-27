//
//  SalesViewController.h
//  iNext
//
//  Created by mithun ravi on 13/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InventoryViewController.h"
#import "InvoiceViewController.h"
#import "MyCustomeClass.h"

@interface SalesViewController : UIViewController
{

}
@property(nonatomic,strong)IBOutlet UIImageView *navImageview;
@property(nonatomic,strong)IBOutlet UIButton *backButton;
@property (nonatomic,strong) IBOutlet UITableView *inventoryTable, *invoiceTable;
@property (nonatomic,strong) IBOutlet UISegmentedControl *mySegment;


-(IBAction)clickOnbackButton:(id)sender;
-(IBAction)clickOninventoryButton:(id)sender;
-(IBAction)clickOninvoiceButton:(id)sender;



@end
