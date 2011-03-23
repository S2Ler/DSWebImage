//
//  DSWebImageDonwloadOperation.h
//  DSWebImage
//
//  Created by Alexander Belyavskiy on 3/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSWebImageDownloadOperationDelegate.h"

@interface DSWebImageDownloadOperation : NSOperation {
  NSURL *imageURL_;
  
  /** Connection which will donwload imageURL_ */
  NSURLConnection *connection_;  
  
  NSMutableData *imageData_;
  
  /** week reference */
  id<DSWebImageDownloadOperationDelegate> delegate_;
}

/** \param anImageURL is copied */
- (id)initWithURL:(NSURL *)anImageURL
         delegate:(id<DSWebImageDownloadOperationDelegate>)aDelegate;

@end
