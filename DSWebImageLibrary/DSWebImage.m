//
//  DSWebImage.m
//  DSWebImage
//
//  Created by Alexander Belyavskiy on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#pragma mark - include
#import "DSWebImage.h"
#import "DSWebImageDelegate.h"

#pragma mark - props
@interface DSWebImage()
@end

#pragma mark - private
@interface DSWebImage(Private)
@end

@implementation DSWebImage
#pragma mark - synth

#pragma mark - memory
- (void)dealloc {
  [delegate_ removeFromWaitersForImage:self];
  [url_ release];
  
  [super dealloc];    
}

#pragma mark - init
- (id)initWithURL:(NSURL *)anURL {
  self = [super init];
    
  if (self) {
    url_ = [anURL retain];
  }
    
  return self;
}

#pragma mark - DSImageViewProtocol
- (void)setImage:(UIImage *)anImage {
  [super setImage:anImage];
  NSLog(@"Image setted");
}

- (NSURL *)url {
  return url_;
}

- (void)setDelegate:(id<DSWebImageDelegate>)aDelegate {
  delegate_ = aDelegate;
}

- (id)uniqueID {
  return [NSNumber numberWithInt:[self hash]];
}

#pragma mark - view managment

- (void)removeFromSuperview {
  [delegate_ removeFromWaitersForImage:self];
  [super removeFromSuperview];
}

@end