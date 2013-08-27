//
//  ProductCell.m
//  iNext
//
//  Created by mithun ravi on 17/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "ProductCell.h"

@implementation ProductCell
@synthesize label1;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
