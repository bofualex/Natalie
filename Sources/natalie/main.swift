//
//  main.swift
//  Natalie
//
//  Created by Marcin Krzyzanowski on 07/08/16.
//  Copyright © 2016 Marcin Krzyzanowski. All rights reserved.
//

import Foundation

func printUsage() {
    print("Usage:")
    print("natalie <storyboard-path or directory>")
}

if CommandLine.arguments.count == 1 {
    printUsage()
    exit(1)
}

var storyboardPaths: [String] = []
let storyboardSuffix = ".storyboard"

var xibPaths: [String] = []
let xibSuffix = ".xib"

for arg in CommandLine.arguments.dropFirst() {
    if arg == "--help" {
        printUsage()
        exit(0)
    } else if arg.hasSuffix(storyboardSuffix) {
        storyboardPaths.append(arg)
    } else if let s = findStoryboards(rootPath: arg, suffix: storyboardSuffix) {
        storyboardPaths.append(contentsOf: s)
    } else if arg.hasSuffix(xibSuffix) {
        xibPaths.append(arg)
    } else if let x = findXibs(rootPath: arg, suffix: xibSuffix) {
        xibPaths.append(contentsOf: x)
    }
}

let storyboardFiles = storyboardPaths.compactMap { try? StoryboardFile(filePath: $0) }
let xibFiles = xibPaths.compactMap { try? XibFile(filePath: $0) }

let output = Natalie.process(storyboards: storyboardFiles, xibs: xibFiles)
print(output)

exit(0)
