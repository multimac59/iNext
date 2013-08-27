//
//  CreateWishViewController.h
//  iNext
//
//  Created by mithun ravi on 14/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomeClass.h"
#import "WebServiceHelper.h"
#import "ProductViewController.h"
#import "WishlistCell.h"

@interface CreateWishViewController : UIViewController<WebServiceHelperDelegate,UIActionSheetDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSUserDefaults *userDefault;
    NSString *keywordProducetString,*webStoreId,*webStorString;

}
@property(nonatomic,strong)IBOutlet UITextField *userTextfield,*wishTextfield,*productTextfield;

@property(nonatomic,strong)IBOutlet UIButton *backButton;

@property(nonatomic,strong)IBOutlet UIImageView *navImageview;
@property (nonatomic, strong) UIActionSheet *actionSheet;
@property (nonatomic, strong) UIPickerView *datapicker;
@property (nonatomic,strong ) NSString *productString,*productId;
@property (nonatomic, strong) NSMutableArray *productArray;
@property (nonatomic, strong) IBOutlet UILabel *titleLable;
@property (nonatomic, strong) NSString *titleString,*wishlistNameString;
@property (nonatomic,strong) IBOutlet UIView *viewProduce;
@property (nonatomic, strong) IBOutlet UIButton *submitButton;

////////////  keyword view /////
@property (nonatomic, strong) IBOutlet UIView *keywordView;
@property (nonatomic, strong) IBOutlet UITextField *keyWordTextField,*webStoreText;

@property (nonatomic, strong) NSMutableArray *keywordArray;
/////////////// product list in table view//////
@property (nonatomic, strong) NSMutableArray *productListArray;
@property (nonatomic, strong) IBOutlet UITableView *productListTableView;
@property (nonatomic, strong) IBOutlet UIView *productListView;
@property (nonatomic, strong) NSString *wishListIDSelected;
@property (nonatomic, strong) IBOutlet UIImageView *backgroundImageView;



-(IBAction)clickOnbackButton:(id)sender;
-(IBAction)keyboardGone:(id)sender;

-(IBAction)clickOnnextBUTTON:(id)sender;

@end
