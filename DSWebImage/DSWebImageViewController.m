//
//  DSWebImageViewController.m
//  DSWebImage
//
//  Created by Alexander Belyavskiy on 3/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#pragma mark - include
#import "DSWebImageViewController.h"
#warning TEST PURPOSE
#import "DSWebImageManager.h"
#import "DSWebImage.h"

#pragma mark - props
@interface DSWebImageViewController()
@end

#pragma mark - private
@interface DSWebImageViewController(Private)
@end

@implementation DSWebImageViewController
@synthesize img;
#pragma mark - synth

#pragma mark - memory
- (void)dealloc {
  [img release];
  [super dealloc];
}

- (void)didReceiveMemoryWarning {
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
  [self setImg:nil];
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

#pragma mark - init
- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (id)init {
  self = [super init];
  
  if (self) {
    
  }
  
  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  
  if (self) {
    
  }
  
  return self;
}

#pragma mark - view life
- (void)viewDidLoad {
  [super viewDidLoad];
  NSString *urlStr = @"http://www.google.com/images/logos/ps_logo2.png";
  NSURL *url = [NSURL URLWithString:urlStr];
  DSWebImageManager *m = [[DSWebImageManager alloc] init];
  DSWebImage *image = [[DSWebImage alloc] initWithURL:url];
  [image setFrame:[[self img] frame]];
  [[self view] addSubview:image];
  [m queueImage:image
      noConnectionImage:nil
      waitingForDownloadImage:[UIImage imageNamed:@"2.png"]];
}

#pragma mark - rotation support
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

@end
