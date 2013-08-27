//
//  ClientSaleCell.m
//  iNext
//
//  Created by Mithun on 11/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "ClientSaleCell.h"

@implementation ClientSaleCell

@synthesize nameLabel,emailLabel,mobilenoLabel,mypointsLabel;
@synthesize imageView;

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
