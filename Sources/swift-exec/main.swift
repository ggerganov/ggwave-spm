import ggwave

var parameters = ggwave_getDefaultParameters()

parameters.sampleFormatInp = GGWAVE_SAMPLE_FORMAT_I16
parameters.sampleFormatOut = GGWAVE_SAMPLE_FORMAT_I16

let instance = ggwave_init(parameters)

let payload = "test"
let decoded: Array<Character> = Array(repeating: "\0", count: 256)

let n = ggwave_encode(instance, payload, 4, GGWAVE_TX_PROTOCOL_AUDIBLE_FAST, 50, nil, 1)
let waveform: Array<Character> = Array(repeating: "\0", count: Int(n))

let ret = ggwave_encode(instance, payload, 4, GGWAVE_TX_PROTOCOL_AUDIBLE_FAST, 50, waveform, 0);
