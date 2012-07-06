//
//  hGridView.m
//  hGridViewController
//
//  Created by pongsil vachirajongkol on 6/22/55 BE.
//  Copyright (c) 2555 pongsil.v@gmail.com. All rights reserved.
//

#import "hGridView.h"

#define ITEM_IMAGE_WIDTH    70
#define ITEM_IMAGE_HEIGHT   70
#define COLUMN_NUM          5

@implementation hGridView
@synthesize items = _items;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)refreshLikeScrollView
{
    for (NSMutableDictionary *item in self.items) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:[item objectForKey:@"image"]];
        NSInteger i = [self.items indexOfObject:item];
        
        CGRect frame = CGRectMake((i%COLUMN_NUM * ITEM_IMAGE_WIDTH), (i/COLUMN_NUM * ITEM_IMAGE_HEIGHT), ITEM_IMAGE_WIDTH-20, ITEM_IMAGE_HEIGHT-20);

        imageView.frame = frame;
        
        [self addSubview:imageView];
        [self bringSubviewToFront:imageView];
        
        UILabel *itemName = [[UILabel alloc] initWithFrame:CGRectMake((i%COLUMN_NUM*ITEM_IMAGE_WIDTH), (ITEM_IMAGE_HEIGHT-12)+(i/COLUMN_NUM*ITEM_IMAGE_HEIGHT), ITEM_IMAGE_WIDTH, 12)];
        itemName.text = [item objectForKey:@"name"];
        itemName.font = [UIFont fontWithName:@"Helvetica" size:12];
        itemName.backgroundColor = [UIColor clearColor];
        [itemName setTextAlignment:UITextAlignmentCenter];
        
        [self addSubview:itemName];
        [self bringSubviewToFront:itemName];

    }
    [self setScrollEnabled:YES];
    self.contentSize = CGSizeMake(ITEM_IMAGE_WIDTH*COLUMN_NUM, ITEM_IMAGE_HEIGHT+(self.items.count/COLUMN_NUM * ITEM_IMAGE_HEIGHT));
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - Setter

- (void)setItems:(NSMutableArray *)items
{
    _items = [items mutableCopy];
    
}

@end
