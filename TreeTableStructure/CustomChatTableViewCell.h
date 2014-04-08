//
//  CustomChatTableViewCell.h
//  TreeTableStructure
//
//  Created by Vidya on 27/03/14.
//  Copyright (c) 2014 Vidya Murthy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatItem.h"
#import "SWTableViewCell.h"

@interface CustomChatTableViewCell : SWTableViewCell {
    
    UIImageView *m_cChatImageView;
    UIImageView *m_cUnreadImageView;
    UIImageView *m_cMatchedImageView;
    
    UILabel *m_cChatTitle;
    UILabel *m_cChatSubTitle;
    UILabel *m_cTimeLabel;
}

@property UIImageView *m_cChatImageView;
@property UIImageView *m_cUnreadImageView;
@property UIImageView *m_cMatchedImageView;

@property UILabel *m_cChatTitle;
@property UILabel *m_cChatSubTitle;
@property UILabel *m_cTimeLabel;

@property (nonatomic, strong) ChatItem *treeItem;

-(void)setSublevel:(int)level;

@end
