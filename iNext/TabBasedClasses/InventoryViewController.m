//
//  InventoryViewController.m
//  iNext
//
//  Created by mithun ravi on 12/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "InventoryViewController.h"

@interface InventoryViewController ()

@end

@implementation InventoryViewController

@synthesize tableView;
@synthesize navimageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if(IS_IPHONE5)
    {
    
    }
    else
    {
        navimageView.frame=CGRectMake(0,0, 320, 133);
    
    
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clickOnbackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];

}

#pragma mark - table view delegate and datasouce method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
    
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
    
    
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"InventoryCell";
    InventoryCell *Cell =(InventoryCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (Cell == nil)
    {
        NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"InventoryCell" owner:self options:nil];
        
        Cell = [cellArray objectAtIndex:0];
    }
    
    return Cell;
    
    
}


#pragma mark - ZBarCode for QR scanning


-(IBAction)barCoderReader:(id)sender
{
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    
    ZBarImageScanner *scanner = reader.scanner;
    // TODO: (optional) additional reader configuration here
    
    // EXAMPLE: disable rarely used I2/5 to improve performance
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    // present and release the controller
    [self presentViewController:reader animated:true completion:nil];
}
- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    // ADD: get the decode results
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // EXAMPLE: just grab the first barcode
        break;
    
    // EXAMPLE: do something useful with the barcode data
    NSLog(@"%@",symbol.data);
    
    
    
    
    
    // EXAMPLE: do something useful with the barcode image
   // imageView.image =[info objectForKey: UIImagePickerControllerOriginalImage];
    
    // ADD: dismiss the controller (NB dismiss from the *reader*!)
    [reader dismissViewControllerAnimated:true completion:nil];
}




@end
