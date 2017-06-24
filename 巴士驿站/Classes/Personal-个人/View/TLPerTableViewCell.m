//
//  TLPerTableViewCell.m
//  巴士驿站
//
//  Created by Edge on 16/7/12.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLPerTableViewCell.h"

@implementation TLPerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setFrame:(CGRect)frame {
    frame.origin.y += 25;
    frame.size.height -= 5;
    [super setFrame:frame];
}
@end
