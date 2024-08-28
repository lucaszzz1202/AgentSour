import SwiftUI

struct RedHighlightText: View {
    let text: String
    let highlightText: String

    var body: some View {
        let range = text.range(of: highlightText)
        if let range = range {
            let lowerBound = text.distance(from: text.startIndex, to: range.lowerBound)
            let upperBound = text.distance(from: text.startIndex, to: range.upperBound)

            return Text(text[..<text.index(text.startIndex, offsetBy: lowerBound)]) +
                Text(highlightText)
                    .foregroundColor(.red) +
                Text(text[text.index(text.startIndex, offsetBy: upperBound)...])
        } else {
            return Text(text)
        }
    }
}

struct ontentView: View {
    var body: some View {
        RedHighlightText(text: "Hello, World!", highlightText: "World")
    }
}

#Preview {
    ontentView()
}
