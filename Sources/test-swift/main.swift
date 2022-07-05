import Foundation
import ggwave

var parameters = ggwave_getDefaultParameters()

parameters.sampleFormatInp = GGWAVE_SAMPLE_FORMAT_I16
parameters.sampleFormatOut = GGWAVE_SAMPLE_FORMAT_I16

let instance = ggwave_init(parameters)

let payload = "test"
let n = ggwave_encode(instance, payload, 4, GGWAVE_PROTOCOL_AUDIBLE_FAST, 50, nil, 1)

var ret: Int32 = 0

let payloadPointer = UnsafePointer<Int8>((payload as NSString).utf8String)

var decoded = Array<Int8>(repeating: 0, count: 256)
var waveform = Array<Int8>(repeating: 0, count: Int(n))

ret = ggwave_encode(instance, payloadPointer, 4, GGWAVE_PROTOCOL_AUDIBLE_FAST, 50, &waveform, 0)

assert(ret > 0)

ret = ggwave_decode(instance, &waveform, Int32(ret), &decoded)

assert(ret == 4)

let decodedValue : Array<String> = Array(decoded).map { String(UnicodeScalar(Int($0))!) }
assert(payload == decodedValue.joined(separator: "").prefix(4))

ggwave_free(instance)
