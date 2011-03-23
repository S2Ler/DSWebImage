//
//  DSWebImageDonwloadOperation.m
//  DSWebImage
//
//  Created by Alexander Belyavskiy on 3/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#pragma mark - include
#import "DSWebImageDownloadOperation.h"

#pragma mark - props
@interface DSWebImageDownloadOperation()
@property (nonatomic, copy) NSURL *imageURL;
@property (nonatomic, retain) NSURLConnection *connection;
@property (nonatomic, retain) NSMutableData *imageData;
@end

#pragma mark - private
@interface DSWebImageDownloadOperation(Private)
@end

@implementation DSWebImageDownloadOperation
#pragma mark - synth
@synthesize imageData = imageData_;
@synthesize connection = connection_;
@synthesize imageURL = imageURL_;

#pragma mark - memory
- (void)dealloc {
  [connection_ cancel];
  [connection_ release];
  
  [imageURL_ release];
  [imageData_ release];
  
  [uniqueID_ release];
  
  [super dealloc];
}

#pragma mark - init
- (id)initWithURL:(NSURL *)anImageURL
         delegate:(id<DSWebImageDownloadOperationDelegate>)aDelegate
         uniqueID:(id)anUniqueID {
  self = [super init];
  
  if (self) {
    imageURL_ = [anImageURL copy];
    delegate_ = aDelegate;
    uniqueID_ = [anUniqueID retain];
  }
  
  return self;
}

- (void)main {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  NSLog(@"Start queue");
  if ([self isCancelled] == NO) {
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:imageURL_];    
        
    NSError *error = nil;
    NSData *imageData
    = [NSURLConnection sendSynchronousRequest:request
                            returningResponse:nil
                                        error:&error];
    [request release];        
    
    if ([self isCancelled] == NO) {
      if (imageData) {
        UIImage *image = [UIImage imageWithData:imageData];
        [delegate_ dsDownloadOperationDidEndWithImage:image
                                               forURL:imageURL_
                                             uniqueID:uniqueID_];
      } else {
        [delegate_ dsDownloadOperationDidEndWithError:error
                                               forURL:imageURL_
                                             uniqueID:uniqueID_];
      }
    } 
  }
  
  [pool drain];
}

//#pragma mark - NSURLConnectionDelegate
//- (void)connection:(NSURLConnection *)connection
//didReceiveResponse:(NSURLResponse *)response {
//  if ([self isCancelled] == YES) {
//    [connection cancel];
//  } else {
//    [self setImageData:[NSMutableData data]];
//  }
//}
//
//- (void)connection:(NSURLConnection *)connection 
//    didReceiveData:(NSData *)data {
//  if ([self isCancelled] == YES) {
//    [connection cancel];
//  } else {
//    [imageData_ appendData:data];
//  }
//}
//
//- (void)connection:(NSURLConnection *)connection
//  didFailWithError:(NSError *)error {
//  [delegate_ dsDownloadOperationDidEndWithError:error];
//}
//
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
//  UIImage *image = [UIImage imageWithData:imageData_];
//  [delegate_ dsDownloadOperationDidEndWithImage:image];
//}
@end