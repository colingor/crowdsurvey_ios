//
//  TextField.h
//  FieldTripOpen
//
//  Created by Colin Gormley on 08/12/2015.
//  Copyright © 2015 Edina. All rights reserved.
//

#import "Field.h"

@interface TextField : Field
@property (nonatomic, copy) NSString * prefix;
@property (nonatomic, copy) NSString * placeHolder;
@property (nonatomic, copy) NSString * maxChars;
@end