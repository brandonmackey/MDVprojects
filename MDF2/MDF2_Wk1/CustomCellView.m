//
//  CustomCellView.m
//  MDF2_Wk1
//
//  Created by Brandon Mackey on 11/5/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "CustomCellView.h"

@implementation CustomCellView

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
