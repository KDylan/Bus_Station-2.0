//
//  TLAddPTableViewCell.h
//  巴士驿站
//
//  Created by Maominghui on 16/7/29.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICellButton.h"


@interface TLAddPTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel     *pName;
@property (nonatomic,strong) UILabel     *pID;
@property (nonatomic,strong) UICellButton *selectButton;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier selectOrNot:(BOOL)selectOrNot;

@end
