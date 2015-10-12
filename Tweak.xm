#include <Security/Security.h>
#include <Security/SecureTransport.h>
%config(generator=MobileSubstrate);

%hookf(void, SSLWrite, id context, const void *data, size_t dataLength, size_t *processed)
{
	HBLogDebug(@"SSLWrite( , %s, %zu, %zu)", (char*)data, dataLength, *processed);
	return %orig();
}

%ctor{
	%init();
}