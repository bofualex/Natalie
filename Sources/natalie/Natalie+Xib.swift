//
//  Natalie+Xib.swift
//  natalie
//
//  Created by Alex Bofu on 29/09/2018.
//  Copyright © 2018 Marcin Krzyzanowski. All rights reserved.
//

import Foundation

extension Natalie {
    func processXib(os: OS) -> String {
        guard let xibs = xibs else { return "" }
        
        var output = ""
        
        output += header.description
        output += "import \(os.framework)\n"
        for module in storyboardCustomModules {
            output += "import \(module)\n"
        }
        output += "\n"
        output += "// MARK: - Xibs\n"
        

        return output
    }
}
