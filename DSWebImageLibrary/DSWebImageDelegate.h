//
//  DSWebImageCancelDelegate.h
//  DSWebImage
//
//  Created by Alexander Belyavskiy on 3/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DSImageViewProtocol; 

@protocol DSWebImageDelegate <NSObject>
- (void)removeFromWaitersForImage:(id<DSImageViewProtocol>)anImage;
@end
