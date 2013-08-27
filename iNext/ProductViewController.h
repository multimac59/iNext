//
//  ProductViewController.h
//  iNext
//
//  Created by mithun ravi on 08/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomeClass.h"
#import "OfferCell.h"
#import "ProductCell.h"



@interface ProductViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,WebServiceHelperDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSString *webStoreID,*valueofDatapicker;;
}
@property(nonatomic, strong)IBOutlet UIButton *addButton,*searchButton;
@property(nonatomic,strong)IBOutlet UITableView *tableView;

@property(nonatomic,strong)IBOutlet UILabel *titleLabel;
@property(nonatomic,strong)NSString *titleString;

@property(nonatomic,strong)NSMutableArray *webStoreArray,*searchArray;
@property(nonatomic,strong)UIPickerView *dataPicker;
@property(nonatomic,strong)UIActionSheet *actionSheet;

@property(nonatomic,strong)IBOutlet UITextField *webStoreTextfield,*keywordTextfield;;

-(IBAction)ClickOnaddButton:(id)sender;
-(IBAction)ClickOnsearchButton:(id)sender;

@end
