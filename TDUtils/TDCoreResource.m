//
//  TDCoreResource.m
//  Pods
//
//  Created by Dao Duy Thuy on 10/7/15.
//
//

#import "TDCoreResource.h"

@implementation TDCoreResource

+ (NSBundle *)td_getResourcesBundle
{
//    NSString *path = [NSString stringWithFormat:@"%@/Frameworks/TDCore.framework/TDCore.bundle", [NSBundle mainBundle].bundlePath];
//
//    NSBundle *bundle = [NSBundle bundleWithURL:[[NSURL alloc] initFileURLWithPath:path]];
    NSBundle *bundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"TDCore" withExtension:@"bundle"]];
    return bundle;
}


+ (UIStoryboard *)td_getStoryboard:(NSString *)name
{
    UIStoryboard *setupStoryboard = [UIStoryboard storyboardWithName:@"name" bundle:[TDCoreResource td_getResourcesBundle]];
    return setupStoryboard;
}

+ (UIImage *)td_imageNamed:(NSString *)name
{
    NSString *imgPath = [[TDCoreResource td_getResourcesBundle] pathForResource:name ofType:@"png"];
    return [[UIImage alloc] initWithContentsOfFile:imgPath];
}

+ (UIView *)td_getViewWithXibName:(NSString *)name
{
    return [[[TDCoreResource td_getResourcesBundle] loadNibNamed:name owner:self options:nil] firstObject];
}

+ (UIView *)td_getViewWithXibName:(NSString *)name index:(NSInteger)index
{
    return [[TDCoreResource td_getResourcesBundle] loadNibNamed:name owner:self options:nil][index];
}

@end
