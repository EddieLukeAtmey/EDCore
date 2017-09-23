//
//  TDCoreResource.h
//  Pods
//
//  Created by Dao Duy Thuy on 10/7/15.
//
//

#import <Foundation/Foundation.h>

#define TD_CORE_VIEW_WITH_XIB_NAME(XibName) [TDCoreResource td_getViewWithXibName:XibName]
#define TD_CORE_VIEW_WITH_XIB_NAME_INDEX(XibName,index) [TDCoreResource td_getViewWithXibName:XibName index:index]
#define TD_CORE_IMAGE_WITH_NAME(name) [TDCoreResource td_imageNamed:name]
#define TD_CORE_STORYBOARD_WITH_NAME(name) [TDCoreResource td_getStoryboard:name]
#define TD_CORE_BUNDLE_WITH_NAME(name) [TDCoreResource td_getResourcesBundle]

@interface TDCoreResource : NSObject

+ (NSBundle *)td_getResourcesBundle;
+ (UIStoryboard *)td_getStoryboard:(NSString *)name;
+ (UIImage *)td_imageNamed:(NSString *)name;
+ (UIView *)td_getViewWithXibName:(NSString *)name;
+ (UIView *)td_getViewWithXibName:(NSString *)name index:(NSInteger)index;

@end
