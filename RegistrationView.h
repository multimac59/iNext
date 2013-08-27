//
//  RegistrationView.h
//  iNext
//
//  Created by mithun ravi on 08/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomeClass.h"

@interface RegistrationView : UIViewController<UITextFieldDelegate,UIScrollViewDelegate,WebServiceHelperDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSString *hourandWebStore,*velueOfDataPicker,*webStoreId;
    NSUserDefaults *registerDefault;
}
@property(nonatomic,strong)IBOutlet UITextField *firstTextfield,*lastTextfield,*userTextfield,*emailTextfield,*passTextfield,*mobileTextfield,*storeTextfield,*workTextfield,*birthdayTextfield;


@property(nonatomic, strong)IBOutlet UIButton *submit,*back;
@property(nonatomic, strong)IBOutlet UIScrollView *scrollView;

@property(nonatomic,strong)IBOutlet UIImageView *imageView;
@property (nonatomic, strong) NSString *registerServiceName;
@property (nonatomic, strong)IBOutlet UILabel *titleLabel;
@property (nonatomic, strong ) NSString *titleString;
@property (nonatomic, strong) UIActionSheet *actionSheet;
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIPickerView *datapicker;
@property (nonatomic, strong) NSMutableArray *hourArray,*webStoreArray;


-(IBAction)clickOnCameraButton:(id)sender;
-(IBAction)clickOnPhotButton:(id)sender;

-(IBAction)ClickOnBackButton:(id)sender;
-(IBAction)clickOnbirthdayButton:(id)sender;



@end
