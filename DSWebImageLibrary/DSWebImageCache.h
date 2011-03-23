//
//  DSWebImageCache.h
//  DSWebImage
//
//  Created by Alexander Belyavskiy on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DSWebImageCache : NSObject {
  NSMutableDictionary *inMemoryCache_;
}

- (UIImage *)imageForURL:(NSURL *)anURL;

- (void)saveImage:(UIImage *)anImage
           forURL:(NSURL *)anURL;

@end
