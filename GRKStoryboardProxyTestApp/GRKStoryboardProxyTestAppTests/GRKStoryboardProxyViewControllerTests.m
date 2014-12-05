//
//  GRKStoryboardProxyViewControllerTests.m
//
//  Created by Levi Brown on 11/24/14.
//  Copyright (c) 2014 Levi Brown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GRKStoryboardProxyViewController.h"

@interface GRKStoryboardProxyViewControllerTests : XCTestCase

@property (nonatomic,strong) GRKStoryboardProxyViewController *obj;

@end

@implementation GRKStoryboardProxyViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.obj = [[GRKStoryboardProxyViewController alloc] init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.obj = nil;
    [super tearDown];
}

- (void)testDefaultSceneIdentifierMetadataDelimiter
{
    NSString *expected = kGRKProxyDefaultSceneIdentifierMetadataDelimiter;
    NSString *received = self.obj.sceneIdentifierMetadataDelimiter;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@'.", expected, received);
}

- (void)testDefaultStoryboardBundleIdentifierMetadataDelimiter
{
    NSString *expected = kGRKProxyDefaultStoryboardBundleIdentifierMetadataDelimiter;
    NSString *received = self.obj.storyboardBundleIdentifierMetadataDelimiter;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@'.", expected, received);
}

//testParseMetadataSceneIdentifier

- (void)testParseMetadataSceneIdentifier100
{
    NSString *input = nil;
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier200
{
    NSString *input = @"";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier300
{
    NSString *input = @" ";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier400
{
    NSString *input = @"bar";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier500
{
    NSString *input = @"@bar";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier600
{
    NSString *input = @" @bar";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier700
{
    NSString *input = @"#";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier800
{
    NSString *input = @"@#";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier900
{
    NSString *input = @" @# ";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier1000
{
    NSString *input = @"@ # ";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier1100
{
    NSString *input = @" @ #";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier1200
{
    NSString *input = @" @ # ";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier1300
{
    NSString *input = @"foo@bar";
    NSString *expected = @"foo";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier1400
{
    NSString *input = @" foo@bar";
    NSString *expected = @"foo";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier1500
{
    NSString *input = @" foo @bar";
    NSString *expected = @"foo";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier1600
{
    NSString *input = @"foo @bar";
    NSString *expected = @"foo";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier1700
{
    NSString *input = @"foo@bar";
    NSString *expected = @"foo";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier1800
{
    NSString *input = @"foo@bar ";
    NSString *expected = @"foo";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier1900
{
    NSString *input = @"foo@ bar";
    NSString *expected = @"foo";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataSceneIdentifier2000
{
    NSString *input = @"foo@ bar ";
    NSString *expected = @"foo";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.sceneIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

//testParseMetadataStoryboardBundleIdentifier

- (void)testParseMetadataStoryboardBundleIdentifier100
{
    NSString *input = nil;
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier200
{
    NSString *input = @"";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier300
{
    NSString *input = @" ";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier400
{
    NSString *input = @"bar";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier500
{
    NSString *input = @"@bar";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier600
{
    NSString *input = @" @bar";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier700
{
    NSString *input = @"#";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier800
{
    NSString *input = @"@#";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier900
{
    NSString *input = @" @# ";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier1000
{
    NSString *input = @"@ # ";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier1100
{
    NSString *input = @" @ #";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier1200
{
    NSString *input = @" @ # ";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier1300
{
    NSString *input = @"foo@ #";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier1400
{
    NSString *input = @"@bar#";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier1500
{
    NSString *input = @"foo@bar#";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier1600
{
    NSString *input = @"foo@bar#wooga";
    NSString *expected = @"wooga";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier1700
{
    NSString *input = @"foo@bar# wooga";
    NSString *expected = @"wooga";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier1800
{
    NSString *input = @"foo@bar#wooga ";
    NSString *expected = @"wooga";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier1900
{
    NSString *input = @"foo@bar# wooga ";
    NSString *expected = @"wooga";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier2000
{
    NSString *input = @"foo@bar#woo ga";
    NSString *expected = @"woo ga";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier2100
{
    NSString *input = @"foo@bar# woo ga";
    NSString *expected = @"woo ga";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier2200
{
    NSString *input = @"foo@bar# woo ga ";
    NSString *expected = @"woo ga";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier2300
{
    NSString *input = @"#wooga";
    NSString *expected = @"wooga";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier2400
{
    NSString *input = @"# wooga";
    NSString *expected = @"wooga";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardBundleIdentifier2500
{
    NSString *input = @" @ # wooga";
    NSString *expected = @"wooga";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardBundleIdentifier;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

//testParseMetadataStoryboardName

- (void)testParseMetadataStoryboardName100
{
    NSString *input = nil;
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName200
{
    NSString *input = @"";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName300
{
    NSString *input = @" ";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName400
{
    NSString *input = @"bar";
    NSString *expected = @"bar";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName500
{
    NSString *input = @"@bar";
    NSString *expected = @"bar";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName600
{
    NSString *input = @" @bar";
    NSString *expected = @"bar";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName700
{
    NSString *input = @"#";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName800
{
    NSString *input = @"@#";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName900
{
    NSString *input = @" @# ";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName1000
{
    NSString *input = @"@ # ";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName1100
{
    NSString *input = @" @ #";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName1200
{
    NSString *input = @" @ # ";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName1300
{
    NSString *input = @"foo@ #";
    NSString *expected = nil;
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue(received == expected, @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName1400
{
    NSString *input = @"@bar#";
    NSString *expected = @"bar";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName1500
{
    NSString *input = @"foo@bar#";
    NSString *expected = @"bar";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName1600
{
    NSString *input = @"foo@bar#wooga";
    NSString *expected = @"bar";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName1700
{
    NSString *input = @"foo@bar# wooga";
    NSString *expected = @"bar";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName1800
{
    NSString *input = @"foo@bar#";
    NSString *expected = @"bar";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName1900
{
    NSString *input = @"foo@bar# ";
    NSString *expected = @"bar";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName2000
{
    NSString *input = @"@bar#";
    NSString *expected = @"bar";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName2100
{
    NSString *input = @" @bar# ";
    NSString *expected = @"bar";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName2200
{
    NSString *input = @" @bar#";
    NSString *expected = @"bar";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName2300
{
    NSString *input = @"@bar# ";
    NSString *expected = @"bar";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName2400
{
    NSString *input = @"foo@ bar#wooga";
    NSString *expected = @"bar";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName2500
{
    NSString *input = @"foo@bar #wooga";
    NSString *expected = @"bar";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName2600
{
    NSString *input = @"foo@ bar #wooga";
    NSString *expected = @"bar";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName2700
{
    NSString *input = @"foo@b a r#wooga";
    NSString *expected = @"b a r";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

- (void)testParseMetadataStoryboardName2800
{
    NSString *input = @"foo@ b a r #wooga";
    NSString *expected = @"b a r";
    [self.obj parseMetadata:input];
    NSString *received = self.obj.storyboardName;
    
    XCTAssertTrue([received isEqualToString:expected], @"Expected '%@' but received '%@' for input '%@'.", expected, received, input);
}

//testParseMetadata

- (void)testParseMetadata100
{
    NSString *input = nil;
    NSString *expectedStoryboardName = nil;
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = nil;
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue(receivedStoryboardName == expectedStoryboardName, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue(receivedSceneIdentifier == expectedSceneIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata200
{
    NSString *input = @"";
    NSString *expectedStoryboardName = nil;
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = nil;
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue(receivedStoryboardName == expectedStoryboardName, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue(receivedSceneIdentifier == expectedSceneIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata300
{
    NSString *input = @" ";
    NSString *expectedStoryboardName = nil;
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = nil;
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue(receivedStoryboardName == expectedStoryboardName, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue(receivedSceneIdentifier == expectedSceneIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata400
{
    NSString *input = @"bar";
    NSString *expectedStoryboardName = @"bar";
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = nil;
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue(receivedSceneIdentifier == expectedSceneIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata500
{
    NSString *input = @"@bar";
    NSString *expectedStoryboardName = @"bar";
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = nil;
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue(receivedSceneIdentifier == expectedSceneIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata600
{
    NSString *input = @" @bar";
    NSString *expectedStoryboardName = @"bar";
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = nil;
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue(receivedSceneIdentifier == expectedSceneIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata700
{
    NSString *input = @"#";
    NSString *expectedStoryboardName = nil;
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = nil;
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue(receivedStoryboardName == expectedStoryboardName, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue(receivedSceneIdentifier == expectedSceneIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata800
{
    NSString *input = @"@#";
    NSString *expectedStoryboardName = nil;
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = nil;
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue(receivedStoryboardName == expectedStoryboardName, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue(receivedSceneIdentifier == expectedSceneIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata900
{
    NSString *input = @" @# ";
    NSString *expectedStoryboardName = nil;
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = nil;
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue(receivedStoryboardName == expectedStoryboardName, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue(receivedSceneIdentifier == expectedSceneIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata1000
{
    NSString *input = @"@ # ";
    NSString *expectedStoryboardName = nil;
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = nil;
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue(receivedStoryboardName == expectedStoryboardName, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue(receivedSceneIdentifier == expectedSceneIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata1100
{
    NSString *input = @" @ #";
    NSString *expectedStoryboardName = nil;
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = nil;
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue(receivedStoryboardName == expectedStoryboardName, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue(receivedSceneIdentifier == expectedSceneIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata1200
{
    NSString *input = @" @ # ";
    NSString *expectedStoryboardName = nil;
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = nil;
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue(receivedStoryboardName == expectedStoryboardName, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue(receivedSceneIdentifier == expectedSceneIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata1300
{
    NSString *input = @"foo@ #";
    NSString *expectedStoryboardName = nil;
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = @"foo";
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue(receivedStoryboardName == expectedStoryboardName, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue([receivedSceneIdentifier isEqualToString:expectedSceneIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata1400
{
    NSString *input = @"@bar#";
    NSString *expectedStoryboardName = @"bar";
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = nil;
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue(receivedSceneIdentifier == expectedSceneIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata1500
{
    NSString *input = @"foo@bar#";
    NSString *expectedStoryboardName = @"bar";
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = @"foo";
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue([receivedSceneIdentifier isEqualToString:expectedSceneIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata1600
{
    NSString *input = @"foo@bar#wooga";
    NSString *expectedStoryboardName = @"bar";
    NSString *expectedStoryboardBundleIdentifier = @"wooga";
    NSString *expectedSceneIdentifier = @"foo";
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue([receivedStoryboardBundleIdentifier isEqualToString:expectedStoryboardBundleIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue([receivedSceneIdentifier isEqualToString:expectedSceneIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata1700
{
    NSString *input = @"foo@bar# wooga";
    NSString *expectedStoryboardName = @"bar";
    NSString *expectedStoryboardBundleIdentifier = @"wooga";
    NSString *expectedSceneIdentifier = @"foo";
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue([receivedStoryboardBundleIdentifier isEqualToString:expectedStoryboardBundleIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue([receivedSceneIdentifier isEqualToString:expectedSceneIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata1800
{
    NSString *input = @"foo@bar#";
    NSString *expectedStoryboardName = @"bar";
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = @"foo";
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue([receivedSceneIdentifier isEqualToString:expectedSceneIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata1900
{
    NSString *input = @"foo@bar# ";
    NSString *expectedStoryboardName = @"bar";
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = @"foo";
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue([receivedSceneIdentifier isEqualToString:expectedSceneIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata2000
{
    NSString *input = @"@bar#";
    NSString *expectedStoryboardName = @"bar";
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = nil;
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue(receivedSceneIdentifier == expectedSceneIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata2100
{
    NSString *input = @" @bar# ";
    NSString *expectedStoryboardName = @"bar";
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = nil;
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue(receivedSceneIdentifier == expectedSceneIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata2200
{
    NSString *input = @" @bar#";
    NSString *expectedStoryboardName = @"bar";
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = nil;
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue(receivedSceneIdentifier == expectedSceneIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata2300
{
    NSString *input = @"@bar# ";
    NSString *expectedStoryboardName = @"bar";
    NSString *expectedStoryboardBundleIdentifier = nil;
    NSString *expectedSceneIdentifier = nil;
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue(receivedStoryboardBundleIdentifier == expectedStoryboardBundleIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue(receivedSceneIdentifier == expectedSceneIdentifier, @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata2400
{
    NSString *input = @"foo@ bar#wooga";
    NSString *expectedStoryboardName = @"bar";
    NSString *expectedStoryboardBundleIdentifier = @"wooga";
    NSString *expectedSceneIdentifier = @"foo";
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue([receivedStoryboardBundleIdentifier isEqualToString:expectedStoryboardBundleIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue([receivedSceneIdentifier isEqualToString:expectedSceneIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata2500
{
    NSString *input = @"foo@bar #wooga";
    NSString *expectedStoryboardName = @"bar";
    NSString *expectedStoryboardBundleIdentifier = @"wooga";
    NSString *expectedSceneIdentifier = @"foo";
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue([receivedStoryboardBundleIdentifier isEqualToString:expectedStoryboardBundleIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue([receivedSceneIdentifier isEqualToString:expectedSceneIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata2600
{
    NSString *input = @"foo@ bar #wooga";
    NSString *expectedStoryboardName = @"bar";
    NSString *expectedStoryboardBundleIdentifier = @"wooga";
    NSString *expectedSceneIdentifier = @"foo";
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue([receivedStoryboardBundleIdentifier isEqualToString:expectedStoryboardBundleIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue([receivedSceneIdentifier isEqualToString:expectedSceneIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata2700
{
    NSString *input = @"foo@b a r#wooga";
    NSString *expectedStoryboardName = @"b a r";
    NSString *expectedStoryboardBundleIdentifier = @"wooga";
    NSString *expectedSceneIdentifier = @"foo";
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue([receivedStoryboardBundleIdentifier isEqualToString:expectedStoryboardBundleIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue([receivedSceneIdentifier isEqualToString:expectedSceneIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}

- (void)testParseMetadata2800
{
    NSString *input = @"foo@ b a r #wooga";
    NSString *expectedStoryboardName = @"b a r";
    NSString *expectedStoryboardBundleIdentifier = @"wooga";
    NSString *expectedSceneIdentifier = @"foo";
    [self.obj parseMetadata:input];
    NSString *receivedStoryboardName = self.obj.storyboardName;
    NSString *receivedStoryboardBundleIdentifier = self.obj.storyboardBundleIdentifier;
    NSString *receivedSceneIdentifier = self.obj.sceneIdentifier;
    
    
    XCTAssertTrue([receivedStoryboardName isEqualToString:expectedStoryboardName], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardName, receivedStoryboardName, input);
    XCTAssertTrue([receivedStoryboardBundleIdentifier isEqualToString:expectedStoryboardBundleIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedStoryboardBundleIdentifier, receivedStoryboardBundleIdentifier, input);
    XCTAssertTrue([receivedSceneIdentifier isEqualToString:expectedSceneIdentifier], @"Expected '%@' but received '%@' for input '%@'.", expectedSceneIdentifier, receivedSceneIdentifier, input);
}
@end
