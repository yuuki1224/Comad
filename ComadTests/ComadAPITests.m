#import "Kiwi.h"
#import "CMDComadAPIClient.h"

SPEC_BEGIN(ComadAPIClient)

describe(@"ComadAPIClient", ^{
    __block CMDComadAPIClient *_sharedClient;
    beforeAll(^{
        _sharedClient = [CMDComadAPIClient sharedClient];
    });
    
    context(@"GET productions/list", ^{
        it(@"should valid value", ^{
            __block NSArray *responseResults;
            [_sharedClient getTimeLineProductionsWithUserId:@1 completion:^(NSArray *results, NSError *error) {
                responseResults = results;
            }];
            
            [[expectFutureValue(responseResults) shouldEventually] beNonNil];
            [[expectFutureValue(theValue(responseResults.count)) shouldEventually] equal:theValue(9)];
        });
    });
});

SPEC_END
