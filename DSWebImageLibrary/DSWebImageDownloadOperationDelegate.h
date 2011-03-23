//
//  DSWebImageDownloadOperationDelegate.h
//  DSWebImage
//
//  Created by Alexander Belyavskiy on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol DSWebImageDownloadOperationDelegate <NSObject>
- (void)dsDownloadOperationDidEndWithImage:(UIImage *)anImage
                                    forURL:(NSURL *)anURL
                                  uniqueID:(id)anUniqueID;
- (void)dsDownloadOperationDidEndWithError:(NSError *)anError
                                    forURL:(NSURL *)anURL
                                  uniqueID:(id)anUniqueID;
@end
