//
//  hGridView.h
//  hGridViewController
//
//  Created by pongsil vachirajongkol on 6/22/55 BE.
//  Copyright (c) 2555 pongsil.v@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface hGridView : UIScrollView

@property (strong, nonatomic, setter = setItems:) NSMutableArray *items;

- (void)refreshLikeScrollView;

@end
