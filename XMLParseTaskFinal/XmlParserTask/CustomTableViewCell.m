//
//  CustomTableViewCell.m
//  XmlParserTask
//
//  Created by Greens on 6/23/15.
//  Copyright (c) 2015 greens. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell
@synthesize text1,text2,text3;
//@synthesize leftLabel,rightLabel,centerLabel,descLabel;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
