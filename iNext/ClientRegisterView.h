//
//  ClientRegisterView.h
//  iNext
//
//  Created by mithun ravi on 08/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomeClass.h"

@interface ClientRegisterView : UIViewController

{

}

@property(nonatomic,strong)IBOutlet UITextField *name,*birthday,*email,*phoneno,*password ;
@property(nonatomic, strong)IBOutlet UIButton *submit,*Back;
@property(nonatomic, strong)IBOutlet UIScrollView *scrollview;


-(IBAction)ClickOnBackButton:(id)sender;

@end
