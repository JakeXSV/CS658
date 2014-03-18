//
//  TodoListItemTableViewCell.m
//  TodoList
//
//  Created by Jake on 3/18/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "TodoListItemTableViewCell.h"
#import "TodoListItem.h"

@implementation TodoListItemTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self.item setTitle:([NSMutableString stringWithString:(textField.text)])];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}

@end
