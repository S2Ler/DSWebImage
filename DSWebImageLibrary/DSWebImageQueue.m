//
//  DSWebImageQueue.m
//  DSWebImage
//
//  Created by Alexander Belyavskiy on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DSWebImageQueue.h"


@implementation DSWebImageQueue
- (id)init {
  self = [super init];
  if (self) {
    [self setMaxConcurrentOperationCount:1];
  }
  return self;
}

- (void)rePrioritizeOperations {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  [super setSuspended:YES];
  
  NSArray *operations = [super operations];
  
  NSInteger isReadyOpCount = [operations count];
  
  for (NSOperation *op in operations) {
    if ([op isReady] == NO) {
      isReadyOpCount--;
    }
  }
  
  NSInteger opNum = -1;
  NSInteger priorityIncreaseStep = isReadyOpCount / 3.0; //Only 3 priorities
  
  for (NSOperation *op in operations) {
    if ([op isReady] == YES) {
      opNum++;      
      
      NSInteger priority = 0;
      if (priorityIncreaseStep) {
        priority = opNum / priorityIncreaseStep;
      }
      
      switch (priority) {
        case 0:
          [op setQueuePriority:NSOperationQueuePriorityLow];
          break;
        case 1:
          [op setQueuePriority:NSOperationQueuePriorityNormal];
          break;
        case 2:
          [op setQueuePriority:NSOperationQueuePriorityHigh];
          break;          
        default:
          break;
      }
    }
  }
  
  [super setSuspended:NO];
  [pool drain];
}

- (void)addOperation:(NSOperation *)op {
  [op setQueuePriority:NSOperationQueuePriorityHigh];
  [super addOperation:op];
  
  dispatch_queue_t dispatchQueue 
  = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
  
  dispatch_async(dispatchQueue, ^(void) {
    [self rePrioritizeOperations];
  });
}
@end
