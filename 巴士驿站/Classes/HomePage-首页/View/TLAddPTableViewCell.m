//
//  TLAddPTableViewCell.m
//  巴士驿站
//
//  Created by Maominghui on 16/7/29.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLAddPTableViewCell.h"
#import "Masonry.h"


@interface TLAddPTableViewCell()



@end

@implementation TLAddPTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier selectOrNot:(BOOL)selectOrNot
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor =[UIColor colorWithRed:0.950 green:0.971 blue:0.980 alpha:1.000];
        
        _selectButton = [UICellButton buttonWithType:UIButtonTypeCustom];
        
        //按下时会发光代属性
        _selectButton.showsTouchWhenHighlighted = YES;
        
        //设置正常时图片为 check_n
        [_selectButton setImage:[UIImage imageNamed:@"check_n"] forState:UIControlStateNormal];
        
        ///设置点击选中状态图片为check_p
        [_selectButton setImage:[UIImage imageNamed:@"check_p"] forState:UIControlStateSelected];
        
        _pName = [[UILabel alloc]init];
        _pName.font = [UIFont systemFontOfSize:21];;
        _pName.numberOfLines = 2;
        _pName.textAlignment = NSTextAlignmentLeft;
        _pName.textColor = [UIColor blackColor];
        
        _pID = [[UILabel alloc]init];
        _pID.font =[UIFont systemFontOfSize:17];;
        _pID.textAlignment = NSTextAlignmentLeft;
        _pID.textColor = [UIColor lightGrayColor];
        
        [self.contentView addSubview:_selectButton];
        [self.contentView addSubview:_pID];
        [self.contentView addSubview:_pName];
        
        
        [_selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.height.mas_equalTo(22);
            make.width.mas_equalTo(22);
        }];
        
        [_pName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top);
            make.bottom.equalTo(self.contentView.mas_centerY).with.offset(8);
            make.left.equalTo(_selectButton.mas_right).with.offset(15);
        }];
        
        [_pID mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_pName.mas_bottom);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-8);
            make.left.equalTo(_selectButton.mas_right).with.offset(15);
        }];
        
        
        
        
        //按钮点击事件
        //   [_selectButton addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
        [_selectButton setSelected:selectOrNot];//设置按钮得状态是否为选中（可在此根据具体情况来设置按钮得初始状态）
        
    }
    return self;
}

/*
 //按钮点击事件
 -(void)checkboxClick:(UICellButton *)btn{
 btn.selected=!btn.selected;//每次点击都改变按钮的状态
 if(btn.selected){
 
 NSLog(@"在此实现打勾时的方法");
 
 }else{
 
 NSLog(@"在此实现不打勾时的方法");
 
 }
 
 }
 */


//- (void)awakeFromNib {
//    // Initialization code
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
