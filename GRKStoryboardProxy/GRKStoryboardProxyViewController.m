//
//  GRKStoryboardProxyViewController.m
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

#import "GRKStoryboardProxyViewController.h"

NSString * const kGRKProxyDefaultSceneIdentifierMetadataDelimiter = @"@";
NSString * const kGRKProxyDefaultStoryboardBundleIdentifierMetadataDelimiter = @"#";

static void * kStoryboardObservationContext = &kStoryboardObservationContext;

@interface GRKStoryboardProxyViewController ()

@property (nonatomic,strong,readwrite) NSString *sceneIdentifier;
@property (nonatomic,strong,readwrite) NSString *storyboardName;
@property (nonatomic,strong,readwrite) NSString *storyboardBundleIdentifier;

@end

@implementation GRKStoryboardProxyViewController

- (NSString *)sceneIdentifierMetadataDelimiter
{
    return kGRKProxyDefaultSceneIdentifierMetadataDelimiter;
}

- (NSString *)storyboardBundleIdentifierMetadataDelimiter
{
    return kGRKProxyDefaultStoryboardBundleIdentifierMetadataDelimiter;
}

- (NSString *)retreiveMetadata
{
    //We use the `restorationIdentifier` from Interface Builder as our placeholder for metadata.
    //It is loaded and available to us at the time `awakeAfterUsingCoder:` gets called (unlike custom IB properties),
    //and seems like overloading its usage in this way is not problematic.
    //NOTE: We could also use `title` which may have less consequence (?).
    //I chose `restorationIdentifier` because of its placement in the IB interface.
    NSString *retVal = self.restorationIdentifier;
    return retVal;
}

//Expecting "[<sceneIdentifier>@]<storyboardName>[#<storyboardBundleIdentifier>]"
- (void)parseMetadata:(NSString *)metadata
{
    //Look at the metadata, from index 0, for the `self.sceneIdentifierMetadataDelimiter` (default is "@")
    NSRange sceneIdentifierDelimiterRange = [metadata rangeOfString:self.sceneIdentifierMetadataDelimiter];
    if (sceneIdentifierDelimiterRange.location == NSNotFound)
    {
        self.sceneIdentifier = nil;
    }
    else
    {
        //If we found the `self.sceneIdentifierDelimiter`, take the substring from 0 to the location of the delimter to be our `self.sceneIdentifier`
        NSRange sceneIdentifierRange = NSMakeRange(0, sceneIdentifierDelimiterRange.location);
        NSString *substring = [metadata substringWithRange:sceneIdentifierRange];
        substring = [substring stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        self.sceneIdentifier = substring.length > 0 ? substring : nil;
        //Strip the scene identifier (and delimiter) from our metadata
        metadata = metadata.length > sceneIdentifierDelimiterRange.location ? [metadata substringFromIndex:sceneIdentifierDelimiterRange.location + 1] : @"";
    }
    
    //Now look from the back of the metadata for the `self.storyboardBundleIdentifierMetadataDelimiter` (default is "#")
    NSRange storyboardBundleIdentifierDelimiterRange = [metadata rangeOfString:self.storyboardBundleIdentifierMetadataDelimiter options:NSBackwardsSearch];
    if (storyboardBundleIdentifierDelimiterRange.location == NSNotFound)
    {
        self.storyboardBundleIdentifier = nil;
    }
    else
    {
        NSInteger location = storyboardBundleIdentifierDelimiterRange.location + 1;
        NSInteger length = metadata.length - location;
        if (location < metadata.length && length > 0)
        {
            NSRange bundleIdentifierRange = NSMakeRange(location, length);
            NSString *substring = [metadata substringWithRange:bundleIdentifierRange];
            substring = [substring stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            self.storyboardBundleIdentifier = substring.length > 0 ? substring : nil;
        }
        else
        {
            self.storyboardBundleIdentifier = nil;
        }

        //Strip the bundle identifier (and delimiter) from the metadata
        metadata = [metadata substringToIndex:storyboardBundleIdentifierDelimiterRange.location];
    }
    
    //Whatever is left in `metadata` (minus leading and trailing whitespace) we consider to be the `storyboardName`
    metadata = [metadata stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    self.storyboardName = metadata.length > 0 ? metadata : nil;
}

- (NSBundle *)derivedBundle
{
    NSBundle *retVal = nil;
    
    if (self.storyboardBundleIdentifier.length > 0)
    {
        retVal = [NSBundle bundleWithIdentifier:self.storyboardBundleIdentifier];
        if (!retVal)
        {
            NSLog(@"<%@> [WARN]: Unable to locate bundle named '%@'; defaulting to main bundle.", NSStringFromClass([self class]), self.storyboardBundleIdentifier);
        }
    }
    
    if (!retVal)
    {
        //Default to the main bundle
        retVal = [NSBundle mainBundle];
    }

    return retVal;
}

- (UIStoryboard *)derivedStoryboard
{
    UIStoryboard *retVal = nil;

    if (self.storyboardName.length > 0)
    {
        NSBundle *bundle = [self derivedBundle];
        retVal = [UIStoryboard storyboardWithName:self.storyboardName bundle:bundle];
    }
    
    if (!retVal)
    {
        NSLog(@"<%@>[ERROR]: Unable to locate storyboard named '%@' in bundle '%@'.\n\tBe sure `restorationIdentifier` is set appropriately in Interface Builder for this proxy view controller.", NSStringFromClass([self class]), self.storyboardName, [self derivedBundle]);
    }
    
    return retVal;
}

- (UIViewController *)derivedViewController
{
    UIViewController *retVal = nil;

    UIStoryboard *storyboard = [self derivedStoryboard];

    if (self.sceneIdentifier.length > 0)
    {
        @try
        {
            retVal = [storyboard instantiateViewControllerWithIdentifier:self.sceneIdentifier];
        }
        @catch (NSException *exception)
        {
            NSLog(@"<%@>[ERROR]: %@", NSStringFromClass([self class]), exception);
        }
    }
    
    if (!retVal)
    {
        //Default to the initial view controller
        retVal = [storyboard instantiateInitialViewController];
        if (!retVal)
        {
            NSLog(@"<%@>[ERROR]: Storyboard '%@' does not specify an initial view controller.", NSStringFromClass([self class]), self.storyboardName);
        }
    }
    
    return retVal;
}

#pragma mark - Overrides

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
    NSString *metadata = [self retreiveMetadata];
    [self parseMetadata:metadata];

    UIViewController *viewController = [self derivedViewController];
    if (viewController)
    {
        //Here we add a observer for the `storyboard` property of the view controller, because as it gets returned from this method the property value gets set to the current storyboard.
        //This causes an internal consistency exception from the storyboard. So, we observe the change and ensure it is set properly.
        NSString *keyPath = NSStringFromSelector(@selector(storyboard));
        [viewController addObserver:(id)self.class forKeyPath:keyPath options:NSKeyValueObservingOptionOld context:kStoryboardObservationContext];
    }
    else
    {
        //Default to this proxy view controller
        viewController = self;
    }

    return viewController;
}

#pragma mark - NSKeyValueObserving

+ (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (kStoryboardObservationContext == context)
    {
        //Get the old value
        UIStoryboard *storyboard = change[NSKeyValueChangeOldKey];
        //Remove ourselcves as the observer (not needed any longer, and would cause a circular call since we are about to change it again)
        [object removeObserver:(id)self forKeyPath:keyPath];
        //Set the value back to what it was (the storyboard of origin)
        [object setValue:storyboard forKey:keyPath];
    }
}

@end
