//
//  ViewController.m
//  hGridViewController
//
//  Created by pongsil vachirajongkol on 6/22/55 BE.
//  Copyright (c) 2555 pongsil.v@gmail.com. All rights reserved.
//

#import "ViewController.h"
#import "hGridView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    hGridView *gridView = [[hGridView alloc] init];
    NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:@"hGridView"
                                                      owner:self
                                                    options:nil];
    for (id currentObject in nibViews) {
        if ([currentObject isMemberOfClass:[hGridView class]]) {
            gridView = (hGridView *)currentObject;
            gridView = [gridView initWithFrame:self.view.frame];
        }}
    
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    for (NSInteger i=1; i<20; i++) {
        NSString *name = [NSString stringWithFormat:@"name%d",i];
        NSString *image = [NSString stringWithFormat:@"%d.jpg",i];
        NSMutableDictionary *item = [[NSMutableDictionary alloc] initWithObjectsAndKeys: name ,@"name", image ,@"image" ,nil];
        [items addObject:item];
    }
    
    [gridView setItems:items];
    [gridView refreshLikeScrollView];
    [self.view addSubview:gridView];
    [self.view bringSubviewToFront:gridView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
