//
//  RegisterViewController.h
//  iNext
//
//  Created by mithun ravi on 06/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomeClass.h"
#import "WebServiceHelper.h"



@interface RegisterViewController : UIViewController<WebServiceHelperDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{

}
@property(nonatomic,strong)IBOutlet UIScrollView *scrollView;
@property(nonatomic, strong)IBOutlet UIButton *submit,*back;

@property(nonatomic,strong)IBOutlet UITextField *firstTextfield,*lastTextField,*userTextField,*passTextField,*emailTextField,*mobileTextField,*birthdayTextField;

@property(nonatomic,strong)IBOutlet UIImageView *imageView;

@property(nonatomic,strong)IBOutlet UIButton *birthdayButton;
@property (nonatomic, strong) UIActionSheet *actionSheet;
@property(nonatomic,strong)IBOutlet UIDatePicker *datePicker;
@property(nonatomic,strong)NSMutableString *dateAndTimeString;
@property (nonatomic, strong)IBOutlet UILabel *titleLabel;
@property (nonatomic, strong ) NSString *titleString;










@end
