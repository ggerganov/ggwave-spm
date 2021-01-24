#import <Foundation/Foundation.h>

#import "ggwave/ggwave.h"

int main() {
    int result = 10;
    ggwave_Parameters parameters = ggwave_getDefaultParameters();

    printf("Hello from Objc %d %d", result, parameters.samplesPerFrame);
    return 0;
}
