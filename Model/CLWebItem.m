//
//  CLWebItem.m
//  Cloud
//
//  Created by Nick Paulson on 7/20/10.
//  Copyright 2010 Linebreak. All rights reserved.
//

#import "CLWebItem.h"

static NSString * const CLWebItemNameKey = @"CLWebItemNameKey";
static NSString * const CLWebItemTypeKey = @"CLWebItemTypeKey";
static NSString * const CLWebItemContentURLKey = @"CLWebItemContentURLKey";
static NSString * const CLWebItemURLKey = @"CLWebItemURLKey";
static NSString * const CLWebItemMimeTypeKey = @"CLWebItemMimeTypeKey";
static NSString * const CLWebItemViewCountKey = @"CLWebItemViewCountKey";
static NSString * const CLWebItemRemoteURLKey = @"CLWebItemRemoteURLKey";
static NSString * const CLWebItemHrefKey = @"CLWebItemHrefKey";
static NSString * const CLWebItemIconURLKey = @"CLWebItemIconURLKey";
static NSString * const CLWebItemTrashedKey = @"CLWebItemTrashedKey";
static NSString * const CLWebItemPrivateKey = @"CLWebItemPrivateKey";

@implementation CLWebItem
@synthesize name = _name, type = _type, contentURL = _contentURL, mimeType = _mimeType, viewCount = _viewCount, remoteURL = _remoteURL, 
			href = _href, URL = _URL, iconURL = _iconURL, trashed = _trashed, private = _private;

- (id)init {
	return [self initWithName:nil];
}

- (id)initWithName:(NSString *)theName {
	return [self initWithName:theName type:CLWebItemTypeNone viewCount:0];
}

- (id)initWithName:(NSString *)theName type:(CLWebItemType)theType viewCount:(NSInteger)theCount {
	if (self = [super init]) {
		self.name = theName;
		self.type = theType;
		self.viewCount = theCount;
	}
	return self;
}

+ (CLWebItem *)webItem {
	return [[[[self class] alloc] init] autorelease];
}

+ (CLWebItem *)webItemWithName:(NSString *)theName {
	return [[[[self class] alloc] initWithName:theName] autorelease];
}

+ (CLWebItem *)webItemWithName:(NSString *)theName type:(CLWebItemType)theType viewCount:(NSInteger)theCount {
	return [[[[self class] alloc] initWithName:theName type:theType viewCount:theCount] autorelease];
}

- (NSString *)description {
	return [NSString stringWithFormat:@"<%@: %@ (%i) %@>", NSStringFromClass([self class]), self.name, self.viewCount, self.URL];
}

#pragma mark -
#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
	CLWebItem *retItem = [[[self class] alloc] initWithName:self.name type:self.type viewCount:self.viewCount];
	retItem.contentURL = self.contentURL;
	retItem.mimeType = self.mimeType;
	retItem.remoteURL = self.remoteURL;
	retItem.href = self.href;
	retItem.trashed = self.trashed;
	retItem.private = self.private;
	retItem.iconURL = self.iconURL;
	retItem.URL = self.URL;
	return retItem;
}

#pragma mark -
#pragma mark NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
	if (self = [super init]) {
		if ([decoder allowsKeyedCoding]) {
			_name = [decoder decodeObjectForKey:CLWebItemNameKey];
			_type = [decoder decodeIntegerForKey:CLWebItemTypeKey];
			_viewCount = [decoder decodeIntegerForKey:CLWebItemViewCountKey];
			_contentURL = [decoder decodeObjectForKey:CLWebItemContentURLKey];
			_URL = [decoder decodeObjectForKey:CLWebItemURLKey];
			_mimeType = [decoder decodeObjectForKey:CLWebItemMimeTypeKey];
			_remoteURL = [decoder decodeObjectForKey:CLWebItemRemoteURLKey];
			_href = [decoder decodeObjectForKey:CLWebItemHrefKey];
			_trashed = [decoder decodeBoolForKey:CLWebItemTrashedKey];
			_private = [decoder decodeBoolForKey:CLWebItemPrivateKey];
			_iconURL = [decoder decodeObjectForKey:CLWebItemIconURLKey];
		}
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	if ([encoder allowsKeyedCoding]) {
		[encoder encodeObject:self.name forKey:CLWebItemNameKey];
		[encoder encodeInteger:self.type forKey:CLWebItemTypeKey];
		[encoder encodeInteger:self.viewCount forKey:CLWebItemViewCountKey];
		[encoder encodeObject:self.contentURL forKey:CLWebItemContentURLKey];
		[encoder encodeObject:self.URL forKey:CLWebItemURLKey];
		[encoder encodeObject:self.mimeType forKey:CLWebItemMimeTypeKey];
		[encoder encodeObject:self.remoteURL forKey:CLWebItemRemoteURLKey];
		[encoder encodeObject:self.href forKey:CLWebItemHrefKey];
		[encoder encodeBool:self.trashed forKey:CLWebItemTrashedKey];
		[encoder encodeBool:self.private forKey:CLWebItemPrivateKey];
		[encoder encodeObject:self.iconURL forKey:CLWebItemIconURLKey];
	}
}

#pragma mark -
#pragma mark Cleanup

- (void)dealloc {
	self.name = nil;
	self.contentURL = nil;
	self.mimeType = nil;
	self.remoteURL = nil;
	self.href = nil;
	self.iconURL = nil;
	self.URL = nil;
	[super dealloc];
}


@end
