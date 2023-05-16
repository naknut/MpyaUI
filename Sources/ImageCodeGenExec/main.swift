//
//  File.swift
//  
//
//  Created by Marcus Isaksson on 2023-05-15.
//

import Foundation

let arguments = ProcessInfo().arguments
if arguments.count < 3 {
    print("Missing arguments")
} else {
    let (input, output) = (arguments[1], arguments[2])
    
    var generatedCode = """
    import SwiftUI
    
    
    """
    
    try FileManager.default.contentsOfDirectory(atPath: input).forEach { content in
        guard content.hasSuffix(".imageset"),
              let imageName = content.split(separator: ".").first else { return }
        generatedCode += """
        public struct \(imageName): View {
            public var body: some View {
                Image("\(imageName)", bundle: .module)
            }
        }
        """
    }
    
    generatedCode.append("\n")
    try generatedCode.write(to: URL(fileURLWithPath: output), atomically: true, encoding: .utf8)
}
