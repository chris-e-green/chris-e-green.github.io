import Foundation

// MARK: - Pseudo-code Generator

/// Generates high-level pseudo-code from decoded instructions and stack states
struct PseudoCodeGenerator {
    let procLookup: [String: ProcIdentifier]
    let labelLookup: [String: Location]

    // Helper to lookup label by Location
    func findLabel(_ loc: Location) -> (String?, String?) {
        let key = "\(loc.segment):\(loc.procedure ?? -1):\(loc.addr ?? -1)"
        if let ll = labelLookup[key] {
            return (ll.dispName, ll.dispType)
        } else {
            return (nil, nil)
        }
    }

    func generateForInstruction(
        _ inst: Instruction,
        stack: inout StackSimulator,
        loc: Location?
    ) -> String? {
        switch inst.opcode {
        case sto, sas:
            let (src, _) = stack.pop()
            let (dest, _) = stack.pop()
            return "\(dest) := \(src)"
        case mov:
            let (src, _) = stack.pop()
            let (dst, _) = stack.pop()
            return "\(dst) := \(src)"
        case stp:
            let (a, _) = stack.pop()
            let (bbit, _) = stack.pop()
            let (bwid, _) = stack.pop()
            let (b, _) = stack.pop()
            return "\(b):\(bwid):\(bbit) := \(a)"
        case stb:
            let (src, _) = stack.pop()
            let (dstoffs, _) = stack.pop()
            let (dstaddr, _) = stack.pop()
            return "\(dstaddr)[\(dstoffs)] := \(src)"
        case sro, str, stl, ste:
            let (src, srcType) = stack.pop()
            if srcType == "UNKNOWN" {
                _ = 0
            }
            if let destLoc = inst.memLocation {
                let (destName, destType) = findLabel(destLoc)
                if let destType = destType {
                    switch destType {
                    case "CHAR":
                        if let ch = Int(src), ch >= 0x20 && ch <= 0x7E {
                            return
                                "\(destName ?? destLoc.dispName) := '\(String(format: "%c", ch))'"
                        }
                    case "BOOLEAN":
                        if src == "0" {
                            return "\(destName ?? destLoc.dispName) := FALSE"
                        } else if src == "1" {
                            return "\(destName ?? destLoc.dispName) := TRUE"
                        }
                    default:
                        _ = 0
                        break
                    }
                } else {
                    // destType is unknown.
                    _ = 0
                }
                if destType != srcType {
                    _ = 0
                }
                return "\(destName ?? destLoc.dispName) := \(src)"
            }
            return "\(inst.memLocation?.dispName ?? "unknown") := \(src)"
        case cip, cbp, cxp, clp, cgp:
            if let dest = inst.destination {
                return handleCallProcedure(dest, stack: &stack)
            }
            return "missing destination!"
        default:
            return nil
        }
    }

    func handleCallProcedure(_ loc: Location, stack: inout StackSimulator) -> String? {
        let lookupKey = "\(loc.segment):\(loc.procedure ?? -1)"
        guard let called = procLookup[lookupKey] else {
            return nil
        }

        let parmCount = called.parameters.count
        var aParams: [String] = []
        if called.isFunction {
            _ = stack.pop()
            _ = stack.pop()
        }
        for i in 0..<parmCount {
            let (a, _) = stack.pop()
            switch called.parameters[i].type {
            case "CHAR":
                if let ch = Int(a), ch >= 0x20 && ch <= 0x7E {
                    aParams.append("'\(String(format: "%c", ch))'")
                } else {
                    aParams.append(a)
                }
            case "BOOLEAN":
                if a == "0" {
                    aParams.append("FALSE")
                } else if a == "1" {
                    aParams.append("TRUE")
                }
            default:
                aParams.append(a)
            }
        }

        let callSignature =
            "\(called.shortDescription)(\(aParams.reversed().joined(separator:", ")))"

        if called.isFunction {
            stack.push((callSignature, called.returnType))
            return nil
        } else {
            return callSignature
        }
    }
}
