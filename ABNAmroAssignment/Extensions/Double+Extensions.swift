import Foundation
extension Double {
    func roundTwoDecimals() -> String {
        let rule: FloatingPointRoundingRule = self > 0 ? .down : .up
        return formatted(.number.rounded(rule: rule, increment: 0.01))
    }
}
