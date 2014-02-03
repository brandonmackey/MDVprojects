//
//  Singleton.h
//  MDF-Wk3
//
//  Created by Brandon Mackey on 8/22/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

+(Singleton*)GetInstance;

@property(nonatomic, strong)NSMutableArray *stringArray;

@end
