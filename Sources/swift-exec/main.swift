import ggwave

var parameters = ggwave_getDefaultParameters()

parameters.sampleFormatInp = GGWAVE_SAMPLE_FORMAT_I16
parameters.sampleFormatOut = GGWAVE_SAMPLE_FORMAT_I16

let instance = ggwave_init(parameters)

let payload = "test"
var decoded: Array<Character> = Array(repeating: "\0", count: 256)

let n = ggwave_encode(instance, payload, 4, GGWAVE_TX_PROTOCOL_AUDIBLE_FAST, 50, nil, 1)

var waveform: Array<Character> = Array(repeating: "\0", count: Int(n))
var ret: Int32 = 0

withUnsafeMutableBytes(of: &waveform) { (p) -> () in
    let pp = p.baseAddress?.assumingMemoryBound(to: UnsafeMutablePointer<Int8>?.self)
    ret = ggwave_encode(instance, payload, 4, GGWAVE_TX_PROTOCOL_AUDIBLE_FAST, 50, pp?.pointee, 0)
}

assert(ret > 0)

withUnsafeMutableBytes(of: &decoded) { (p) -> () in
    withUnsafeBytes(of: &waveform) { (w) -> () in
        let pp = p.baseAddress?.assumingMemoryBound(to: UnsafeMutablePointer<Int8>?.self)
        let wp = w.baseAddress?.assumingMemoryBound(to: UnsafePointer<Int8>?.self)
        ret = ggwave_decode(instance, wp?.pointee, Int32(2*ret), pp?.pointee)
    }
}

assert(ret == 4)

// todo : somehow compare that "decoded" is equal to "payload"

ggwave_free(instance)
