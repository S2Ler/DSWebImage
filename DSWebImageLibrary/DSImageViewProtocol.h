//
//  DSImageViewProtocol.h
//  DSWebImage
//
//  Created by Alexander Belyavskiy on 3/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DSImageViewDelegate;

@protocol DSImageViewProtocol <NSObject>
/** Once DSWebImageManager downloaded UIImage it will set image through
 this method, if it wasn't canceled */
- (void)setImage:(UIImage *)anImage;

/** url of the image to download */
- (NSURL *)url;

- (void)setDelegate:(id<DSImageViewDelegate>)aDelegate;

@end
