//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
    
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    NSArray *holidays = [self.database[season] allKeys];
    // Very similar to the Apples & Holidays, now only adding self.database to the picture instead of having database in each method.
    
    return holidays;
    // This could be done in one line however I like the legibility of this way better.
    
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    NSMutableArray *supplies = [[self.database[season] valueForKey:holiday] mutableCopy];
    
    return supplies;
    
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    BOOL holidaysBOOL = 0;
    NSArray *seasons = [self.database[season] allKeys];
    
    if ([seasons containsObject:holiday]) {
        
        holidaysBOOL = 1;
        
    } else {
        
        holidaysBOOL = 0;
        
    }
    
    return holidaysBOOL;
    // Important to note the scope with the BOOL being defined outside the if / else statements.
    
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    BOOL supplies = [self.database[season][holiday] containsObject:supply];
    // I fumbled around with if / else statements eimilar to the previous method however found much simpler way to achieve the same.
    
    return supplies;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    NSMutableArray *emptyHoliday = [[NSMutableArray alloc] init];
    
    [self.database[season] setValue:emptyHoliday forKey:holiday];
    // Note the use of setValue: forKey: which combines setObject: forKey: & valueForKey: methods.
    
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    [self.database[season][holiday] addObject:supply];
    
}

@end
