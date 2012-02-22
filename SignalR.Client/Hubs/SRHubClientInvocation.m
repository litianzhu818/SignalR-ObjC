//
//  SRHubClientInvocation.m
//  SignalR
//
//  Created by Alex Billingsley on 11/7/11.
//  Copyright (c) 2011 DyKnow LLC. All rights reserved.
//

#import "SRHubClientInvocation.h"

@interface SRHubClientInvocation ()

#define kHub @"Hub"
#define kMethod @"Method"
#define kArgs @"Args"
#define kState @"State"

@end

@implementation SRHubClientInvocation

@synthesize hub = _hub;
@synthesize method = _method;
@synthesize args = _args;
@synthesize state = _state;

- (id) init
{
    if (self = [super init])
    {
        _hub = [NSString stringWithFormat:@""];
		_method = [NSString stringWithFormat:@""];
        _args = [NSMutableArray array];
        _state = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id)initWithDictionary:(NSDictionary*)dict
{
	if (self = [self init])
	{
        self.hub  = [NSString stringWithFormat:@"%@",[dict objectForKey:kHub]];
        self.method = [NSString stringWithFormat:@"%@",[dict objectForKey:kMethod]];
        self.args = [dict objectForKey:kArgs];
        self.state = [dict objectForKey:kState];
    }
    return self;
}

- (void)updateWithDictionary:(NSDictionary *)dict
{
    self.hub = ([dict objectForKey:kHub]) ? [NSString stringWithFormat:@"%@",[dict objectForKey:kHub]] : _hub;
    self.method = ([dict objectForKey:kMethod]) ? [NSString stringWithFormat:@"%@",[dict objectForKey:kMethod]] : _method;
    self.args = ([dict objectForKey:kArgs]) ? [dict objectForKey:kArgs] : _args;
    self.state = ([dict objectForKey:kState]) ? [dict objectForKey:kState] : _state;
}

- (id)proxyForJson
{
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    [dict setObject:[NSString stringWithFormat:@"%@",_hub] forKey:kHub];
    [dict setObject:[NSString stringWithFormat:@"%@",_method] forKey:kMethod];
    [dict setObject:_args forKey:kArgs];
    [dict setObject:_state forKey:kState];
    
    return dict;
}

- (id)JSON
{
    return [self proxyForJson];
}

- (NSString *)description 
{  
    return [NSString stringWithFormat:@"HubInvocation: Hub=%@ Method=%@",_hub,_method];
}

- (void)dealloc
{
    _hub = nil;
    _method = nil;
    _args = nil;
    _state = nil;
}

@end
