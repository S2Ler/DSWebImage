//
//  MyClass.h
//  DSWebImage
//
//  Created by Alexander Belyavskiy on 3/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSWebImageDelegate.h"
#import "DSWebImageDownloadOperationDelegate.h"

@protocol DSImageViewProtocol;
@class DSWebImageQueue;
@class DSWebImageCache;

//enum DSWebImageManagerPriority {
//  DSWebImageManagerPriorityLow = -4,
//  DSWebImageManagerPriorityMiddle = 0,
//  DSWebImageManagerPriorityHigh = 4
//};

typedef enum DSWebImageManagerPriority DSWebImageManagerPriority;

@interface DSWebImageManager : NSObject
<
DSWebImageDelegate,
DSWebImageDownloadOperationDelegate
> {
  DSWebImageQueue *queue_;
  DSWebImageCache *cache_;
  
  
  NSMutableDictionary *waitersImage_;
  NSMutableDictionary *noConnectionImages_;
}

- (void)queueImage:(id<DSImageViewProtocol>)anImage
    noConnectionImage:(UIImage *)aNoImagePlaceholder
    waitingForDownloadImage:(UIImage *)aPlaceholder;


//- (void)queueImage:(id<DSImageViewProtocol>)anImage
//          priority:(DSWebImageManagerPriority)aPriority;

@end
