//
//  Singleton.h
//  AOC2-Wk3
//
//  Created by Brandon Mackey on 8/1/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject
{
    NSString *eventStr;
    NSString *saveStr;
    NSString *enterStr;
    
    NSUserDefaults *defaults;
}


@property(nonatomic, strong)NSString *eventStr;

+(Singleton*)GetInstance;

-(void)pageSavedStr:(NSString*)savedEvent date:(NSString*)date;
@end
