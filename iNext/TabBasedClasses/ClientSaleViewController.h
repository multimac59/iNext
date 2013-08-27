//
//  ClientSaleViewController.h
//  iNext
//
//  Created by Mithun on 11/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClientSaleCell.h"
#import "MyCustomeClass.h"
#import "RegisterViewController.h"
#import "RegistrationView.h"

@interface ClientSaleViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,WebServiceHelperDelegate>
{

    NSUserDefaults *clientDefault;


}
@property(nonatomic,strong)IBOutlet UIImageView *navImageView;
@property(nonatomic,strong)IBOutlet UITableView *tableView;

@property(nonatomic,strong)IBOutlet UIButton *backButton;
@property(nonatomic,strong)IBOutlet UIButton *addButton;
@property(nonatomic, strong) IBOutlet UILabel *titleLable;
@property (nonatomic, strong) NSString *titleString,*registerServicName,*serviceName;
@property (nonatomic, strong) NSMutableArray *AccountListArray;



-(IBAction)clickOnbackButton:(id)sender;
-(IBAction)clickOnaddButton:(id)sender;

@end
