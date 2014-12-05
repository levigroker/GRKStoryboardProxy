//
//  GRKStoryboardProxyViewController.h
//
//  Created by Levi Brown on November 13, 2014.
//  Copyright (c) 2013 Levi Brown <mailto:levigroker@gmail.com>
//  This work is licensed under the Creative Commons Attribution 3.0
//  Unported License. To view a copy of this license, visit
//  http://creativecommons.org/licenses/by/3.0/ or send a letter to Creative
//  Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041,
//  USA.
//
//  The above attribution and the included license must accompany any version
//  of the source code. Visible attribution in any binary distributable
//  including this work (or derivatives) is not required, but would be
//  appreciated.
//

#import <UIKit/UIKit.h>

extern NSString * const kGRKProxyDefaultSceneIdentifierMetadataDelimiter;
extern NSString * const kGRKProxyDefaultStoryboardBundleIdentifierMetadataDelimiter;

/**
 * A UIViewController proxy which will load a target UIViewController from an external storyboard.
 * The intention is to allow this view controller to be inserted into a storyboard in place of a
 * view controller which lives in a different storyboard file, and, at runtime, the target
 * view controller will be loaded from the external storyboard and substituted in to replace this proxy.
 * This allows for the separation of application storyboards into many logical groupings to facilitate
 * collaboration, quicker interaction with Interface Builder, and help avoid merge conflicts.
 * 
 * The default implementation expects "metadata" to be supplied in Interface Builder via the
 * Restoration Identifier for this proxy view controller. This metadata is the configuration which
 * ultimately will yeild information to instantiate a replacement UIViewController from a different
 * storyboard.
 *
 * This configuration metadata is expected to be located in the Restoration Identifier for this proxy
 * instance and in the following format:
 *
 *     [<sceneIdentifier>@]<storyboardName>[#<storyboardBundleIdentifier>]
 *
 * where:
 *
 * *`sceneIdentifier` is the optional identifier of the target scene in the storyboard represented by `storyboardName`.
     If not supplied we will use the initial view controller of the storyboard.
 * * `storyboardName` is the file name of the external storyboard (minus the `.storyboard` suffix).
 * * `storyboardBundleIdentifier` is the optional bundle identifier in which to locate the specified storyboard.
 *    If not supplied we will assume the storyboard is located in the main bundle.
 *
 * e.g.: You could specify "GRKMyFancyViewController" as the metadata in Interface Builder's Restoration Identifier
 * for this proxy instance, and we would attempt to load the initial view controller from a storyboard file named
 * "GRKMyFancyViewController.storyboard" in the main bundle.
 */
@interface GRKStoryboardProxyViewController : UIViewController {
    @protected
    NSString *_sceneIdentifier;
    NSString *_storyboardName;
    NSString *_storyboardBundleIdentifier;
}

/**
 * The identifier of the target scene view controller in the external storyboard.
 * If not supplied, we will attempt to use the inital view controller, specified by the storyboard.
 */
@property (nonatomic,strong,readonly) NSString *sceneIdentifier;
/**
 * The name of the external storyboard from which to load the target view controller.
 * This should be the filename of the storyboard minus the extension.
 * i.e. If the file is "MyStoryboard.storyboard" then this property value should be "MyStoryboard"
 */
@property (nonatomic,strong,readonly) NSString *storyboardName;
/**
 * The identifier of the bundle in which to locate the external storyboard.
 * If not supplied, we will attempt to located the storyboard in the Main bundle.
 */
@property (nonatomic,strong,readonly) NSString *storyboardBundleIdentifier;


//To Override (as desired):

/**
 * Responsible for providing the metadata string.
 * The default implementation retrieves this from UIViewcontroller's `restorationIdentifier` for
 * this proxy instance, which should be populated by the developer in Interface Builder as part of
 * using this proxy.
 *
 * @return The metadata to be passed to the `parseMetadata:` method.
 * @see parseMetadata:
 */
- (NSString *)retreiveMetadata;

/**
 * Parse the given metadata string and populate the `sceneIdentifier`, `storyboardName`, and
 * `storyboardBundleIdentifier` appropriately.
 * The default implementation expects the metadata to be of the form:
 *
 *     [<sceneIdentifier>@]<storyboardName>[#<storyboardBundleIdentifier>]
 *
 * Where the `sceneIdentifier` and `storyboardBundleIdentifier` are optional and the `storyboardName` is required.
 * By default, "@" is used as the delimeter between the `sceneIdentifier` and the `storyboardName`.
 * By default, "#" is used as the delimeter between the `storyboardName` and the `storyboardBundleIdentifier`.
 * All leading and trailing whitespace for all three fields will be trimmed.
 *
 * @param metadata The metadata to be parsed for values for the`sceneIdentifier`, `storyboardName`, and
 * `storyboardBundleIdentifier`.
 * @see GRKStoryboardProxyViewControllerTests
 * @see retreiveMetadata
 */
- (void)parseMetadata:(NSString *)metadata;

/**
 * The expected delimeter string separating the `sceneIdentifier` and the `storyboardName` in the metadata.
 * This defaults to `kGRKProxyDefaultSceneIdentifierMetadataDelimiter` whcih is "@".
 *
 * @return The expected delimeter string separating the `sceneIdentifier` and the `storyboardName` in the metadata.
 * @see kGRKProxyDefaultSceneIdentifierMetadataDelimiter
 */
- (NSString *)sceneIdentifierMetadataDelimiter;

/**
 * The expected delimeter string separating the `storyboardName` and the `storyboardBundleIdentifier` in the metadata.
 * This defaults to `kGRKProxyDefaultStoryboardBundleIdentifierMetadataDelimiter` whcih is "#".
 *
 * @return The expected delimeter string separating the `storyboardName` and the `storyboardBundleIdentifier` in the metadata.
 * @see kGRKProxyDefaultStoryboardBundleIdentifierMetadataDelimiter
 */
- (NSString *)storyboardBundleIdentifierMetadataDelimiter;

/**
 * Provides the `NSBundle` in which to look for the external storyboard.
 * The default implementation attempts to load the bundle with the `storyboardBundleIdentifier` which
 * was parsed from the metadata. Failing that, it will default to the main bundle.
 *
 * @return The `NSBundle` in which to look for the external storyboard. This may return `nil` if an error occurs.
 * @see parseMetadata:
 */
- (NSBundle *)derivedBundle;

/**
 * Provides the `UIStoryboard` in which to look for the target view controller scene.
 * The default implementation attempts to load the storyboard named `storyboardName` which was parsed
 * from the metadata, from the bundle returned by `derrivedBundle`.
 * @return The `UIStoryboard` in which to look for the target view controller scene. This may return `nil` if an error occurs.
 * @see parseMetadata:
 * @see derrivedBundle
 */
- (UIStoryboard *)derivedStoryboard;

/**
 * Provides the `UIViewController` instance to replace this proxy instance.
 * The default implementaion will attempt to load the view controller specified by `sceneIdentifier`
 * which was parsed from the metadata, from the storyboard returned by `derivedStoryboard`.
 * If no `sceneIdentifier` was specified, it will attempt to use `storyboardName` as the identifier,
 * and if that fails, it will use the initial view controller of the storyboard.
 * If all else fails, it will return self.
 *
 * @return The `UIViewController` instance to replace this proxy instance.
 * If no replacement is found, this returns `nil`.
 */
- (UIViewController *)derivedViewController;

@end
