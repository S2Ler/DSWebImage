//
//  MyClass.m
//  DSWebImage
//
//  Created by Alexander Belyavskiy on 3/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#pragma mark - include
#import "DSWebImageManager.h"
#import "DSImageViewProtocol.h"
#import "DSWebImageQueue.h"
#import "DSWebImageCache.h"
#import "DSWebImageDownloadOperation.h"
#import <Foundation/NSThread.h>

#pragma mark - props
@interface DSWebImageManager()
@end

#pragma mark - private
@interface DSWebImageManager(Private)
@end

@implementation DSWebImageManager
#pragma mark - synth

#pragma mark - memory
- (void)dealloc {
  [queue_ release];
  [cache_ release];
  [waitersImage_ release];
  
  [super dealloc];    
}

#pragma mark - init
- (id)init {
  self = [super init];
    
  if (self) {
    queue_ = [[DSWebImageQueue alloc] init];
    cache_ = [[DSWebImageCache alloc] init];
    waitersImage_ = [[NSMutableDictionary alloc] init];
  }
    
  return self;
}

#pragma mark - managin queue
- (void)queueImage:(id<DSImageViewProtocol>)anImage
 noConnectionImage:(UIImage *)aNoImagePlaceholder
waitingForDownloadImage:(UIImage *)aPlaceholder {
//   1. Lookup for cached image.
  UIImage *cachedImage = [cache_ imageForURL:[anImage url]];
//   1.1 If there is cached image - set it to anImage and exit.
  if (cachedImage) {
    [anImage setImage:cachedImage];
  } else {
    //   1.2 If there is no cached image - set aPlaceholder image to anImage
    [anImage setImage:aPlaceholder];
    //   1.2.1 Make new download operation and begin download
    DSWebImageDownloadOperation *op 
    = [[DSWebImageDownloadOperation alloc] initWithURL:[anImage url]
                                              delegate:self
                                              uniqueID:[anImage uniqueID]];
    [waitersImage_ setObject:anImage
                      forKey:[anImage uniqueID]];
    [queue_ addOperation:op];
    [op release];
    //   1.2.1.1 If connection broken - set aNoImagePlaceHolder to anImage
    //   1.2.1.2 If donwload successed - set downloaded image to anImage    
  }   
}

- (void)removeFromWaitersForImage:(id<DSImageViewProtocol>)anImage {
  [waitersImage_ removeObjectForKey:[anImage uniqueID]];
}

#pragma mark - DSWebImageDownloadOperationDelegate
- (void)dsDownloadOperationDidEndWithImage:(UIImage *)anImage
                                    forURL:(NSURL *)anURL
                                  uniqueID:(id)anUniqueID {
  id<DSImageViewProtocol> dsImage 
  = [waitersImage_ objectForKey:anUniqueID];
  
  if (dsImage) {
    [dsImage performSelectorOnMainThread:@selector(setImage:)
                              withObject:anImage
                           waitUntilDone:NO];
  }
  
  [cache_ saveImage:anImage
             forURL:anURL];
}
                                                           
- (void)dsDownloadOperationDidEndWithError:(NSError *)anError
                                    forURL:(NSURL *)anURL
                                  uniqueID:(id)anUniqueID {
#warning NOT IMPLEMENTED
}

@end