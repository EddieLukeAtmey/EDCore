//
//  EDMacro.h
//  Pods
//
//  Created by Eddie Luke Atmey on 09/25/17.
//

#pragma mark - Threads
#define TD_MAIN_THREAD(code)\
dispatch_async(dispatch_get_main_queue(), ^{\
code;\
});

#define TD_BACKGROUND_THREAD(code)\
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{\
code;\
});

#pragma mark - Colors
#define TD_COLOR_RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define TD_COLOR_RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define TD_COLOR_HEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define TD_COLOR_HEXA(rgbValue, alpha) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alpha]

#define TD_RADIANS(degrees) ((degrees * M_PI) / 180.0);

#pragma mark - APP INFO
#define TD_APP_VERSION [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
#define TD_APP_NAME [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];


#pragma mark - WeakSafe
#define TD_WEAK(var) __weak typeof(var) TD_WEAK_##var = var;
#define TD_STRONG(var) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
__strong typeof(var) var = TD_WEAK_##var; \
_Pragma("clang diagnostic pop")

#pragma mark - check device orientation
// check device orientation
#define dDeviceOrientation [[UIDevice currentDevice] orientation]
#define td_isPortrait  UIDeviceOrientationIsPortrait(dDeviceOrientation)
#define td_isLandscape UIDeviceOrientationIsLandscape(dDeviceOrientation)
#define td_isFaceUp    dDeviceOrientation == UIDeviceOrientationFaceUp   ? YES : NO
#define td_isFaceDown  dDeviceOrientation == UIDeviceOrientationFaceDown ? YES : NO

#define TD_STRING_FROM_FILE(filename, type) [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:filename ofType:type] encoding:NSUTF8StringEncoding error:nil]

//For Test
#define TD_TICK NSDate *td_startDate = [NSDate date]
#define TD_TOCK NSLog(@"Elapsed Time: %f",[td_startDate timeIntervalSinceNow])

