//
//  DSWebImageCache.m
//  DSWebImage
//
//  Created by Alexander Belyavskiy on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DSWebImageCache.h"
#pragma mark - include
#import "DSWebImageCache.h"

#pragma mark - props
@interface DSWebImageCache()
@end

#pragma mark - private
@interface DSWebImageCache(Private)
@end

@implementation DSWebImageCache
#pragma mark - synth

#pragma mark - memory
- (void)dealloc {
  [inMemoryCache_ release];
  [super dealloc];    
}

#pragma mark - init
- (id)init {
  self = [super init];
    
  if (self) {
    inMemoryCache_ = [[NSMutableDictionary alloc] init];
  }
    
  return self;
}

#pragma mark - access images in cache
- (UIImage *)imageForURL:(NSURL *)anURL {
  return [inMemoryCache_ objectForKey:[anURL absoluteString]];
}

- (void)saveImage:(UIImage *)anImage
           forURL:(NSURL *)anURL {
  return [inMemoryCache_ setObject:anImage
                            forKey:[anURL absoluteString]];
}


@end