//
//  OffOdPViewController.h
//  iNext
//
//  Created by mithun ravi on 12/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomeClass.h"
#import "WebServiceHelper.h"


@interface OffOdPViewController : UIViewController<UIScrollViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UIActionSheetDelegate,WebServiceHelperDelegate>
{
    NSString *satrtenddateString,*valueOfDataPicker,*webStoreId;;
}
@property(nonatomic,strong)IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong)IBOutlet UIImageView *navImageview;

@property(nonatomic,strong)IBOutlet UITextField *nameTextfield,*startdateTextfield,*enddateTextfield,*quantityTextfield,*amountTextfield,*storeTextfield;

@property(nonatomic,strong)IBOutlet UIButton *cancelButton,*submitButton;

@property(nonatomic,strong)IBOutlet UILabel *titleLabel;
@property(nonatomic,strong)NSString *titleString;

@property (nonatomic, strong) UIActionSheet *actionSheet;
@property (nonatomic, strong) UIDatePicker *datePicker;
@property(nonatomic,strong)UIPickerView *dataPicker;


@property(nonatomic,strong)IBOutlet UIButton *startButton;
@property(nonatomic,strong)IBOutlet UIButton *endButton;
@property(nonatomic,strong)NSMutableArray *webStoreArray;


-(IBAction)keyboardGone:(id)sender;
-(IBAction)clickOncancelButton:(id)sender;
-(IBAction)clickOnsubmitButton:(id)sender;
-(IBAction)clickOnstartButton:(id)sender;
-(IBAction)clickOnendButton:(id)sender;

@end
