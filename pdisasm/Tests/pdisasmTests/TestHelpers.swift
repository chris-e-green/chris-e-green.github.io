import Foundation
@testable import pdisasm

/// Shared test helper for extracting 512-byte aligned code blocks.
/// Returns an empty `Data` if the requested block is out of range.
func codeBlock(for seg: Segment, from data: Data) -> Data {
    let start = seg.codeaddr * 512
    let end = start + seg.codeleng
    if start >= 0 && end <= data.count {
        return data.subdata(in: start..<end)
    }
    return Data()
}
