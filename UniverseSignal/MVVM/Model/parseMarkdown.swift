//
//  parseMarkdown.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/9/25.
//

import Foundation
import SwiftUI

func parseMarkdown(_ markdown: String) -> Text {
    do {
        let processedMarkdown = markdown.replacingOccurrences(of: "\n\n", with: "  \n    ")
        let attributedString = try AttributedString(markdown: processedMarkdown)
        return Text(attributedString)
    } catch {
        return Text("Error parsing markdown")
    }
}
