//
//  CustomChatTableViewCell.m
//  TreeTableStructure
//
//  Created by Vidya on 27/03/14.
//  Copyright (c) 2014 Vidya Murthy. All rights reserved.
//

#import "CustomChatTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation CustomChatTableViewCell

@synthesize m_cChatImageView, m_cUnreadImageView, m_cMatchedImageView, m_cChatTitle, m_cChatSubTitle, m_cTimeLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.frame = CGRectMake(0, 0, 320, 60);
        
        self.backgroundColor = [UIColor clearColor];
        
        self.m_cChatImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        self.m_cChatImageView.image = [self imageWithColor:[UIColor colorWithRed:0.48 green:0.68 blue:0.26 alpha:1]];
        [self.contentView addSubview:self.m_cChatImageView];
        
        self.m_cChatImageView.layer.cornerRadius = 20.0;
        self.m_cChatImageView.layer.masksToBounds = YES;
        
        self.m_cChatTitle = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, 200, 20)];
        self.m_cChatTitle.textColor = [UIColor colorWithRed:0.48 green:0.68 blue:0.26 alpha:1];
        self.m_cChatTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
//        self.m_cChatTitle.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.5];
        [self.contentView addSubview:self.m_cChatTitle];
        
        self.m_cChatSubTitle = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 20)];
//        m_cChatSubTitle.textColor = [UIColor colorWithRed:0.48 green:0.68 blue:0.26 alpha:1];
        self.m_cChatSubTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16];
//        self.m_cChatSubTitle.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.5];
        [self.contentView addSubview:self.m_cChatSubTitle];
        
        self.m_cTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(270, 10, 40, 20)];
        self.m_cTimeLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
//        self.m_cTimeLabel.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.5];
        [self.contentView addSubview:self.m_cTimeLabel];
        
//        self.m_cUnreadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 12, 10, 10)];
//        self.m_cUnreadImageView.image = [self imageWithColor:[UIColor redColor]];
//        [self.contentView addSubview:self.m_cUnreadImageView];
//        self.m_cUnreadImageView.layer.cornerRadius = 5;
//        self.m_cUnreadImageView.layer.masksToBounds = YES;
//        
//        self.m_cMatchedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 32, 16, 16)];
//        self.m_cMatchedImageView.image = [UIImage imageNamed:@"check_small"];
//        self.m_cMatchedImageView.clipsToBounds = YES;
//        self.m_cMatchedImageView.backgroundColor = [UIColor colorWithRed:0.48 green:0.68 blue:0.26 alpha:1];
//        self.m_cMatchedImageView.layer.cornerRadius = 8;
//        self.m_cMatchedImageView.layer.masksToBounds = YES;
//        [self.contentView addSubview:self.m_cMatchedImageView];

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

-(UIImage *)imageWithColor:(UIColor *)color{
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

-(void)setSublevel:(int)level{
    
    switch (level) {
        case 0:{
                CGRect frame;
            
                frame = self.m_cChatImageView.frame;
                frame.origin.x = 10;
                self.m_cChatImageView.frame = frame;
                
                frame = self.m_cChatTitle.frame;
                frame.origin.x = 60;
                self.m_cChatTitle.frame = frame;
                
                frame = self.m_cChatSubTitle.frame;
                frame.origin.x = 60;
                self.m_cChatSubTitle.frame = frame;
            
                frame = self.m_cUnreadImageView.frame;
                frame.origin.x = 40;
                self.m_cUnreadImageView.frame = frame;
            
                frame = self.m_cMatchedImageView.frame;
                frame.origin.x = 40;
                self.m_cMatchedImageView.frame = frame;
            
            }
            break;
        case 1:{
                CGRect frame;
            
                frame = self.m_cChatImageView.frame;
                frame.origin.x = 60;
                self.m_cChatImageView.frame = frame;
                
                frame = self.m_cChatTitle.frame;
                frame.origin.x = 110;
                self.m_cChatTitle.frame = frame;
                
                frame = self.m_cChatSubTitle.frame;
                frame.origin.x = 110;
                self.m_cChatSubTitle.frame = frame;
            
                frame = self.m_cUnreadImageView.frame;
                frame.origin.x = 90;
                self.m_cUnreadImageView.frame = frame;
                
                frame = self.m_cMatchedImageView.frame;
                frame.origin.x = 90;
                self.m_cMatchedImageView.frame = frame;
            }
            break;
            
        default:
            break;
    }

}

@end
