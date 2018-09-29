//
//  XibFile.swift
//  natalie
//
//  Created by Alex Bofu on 29/09/2018.
//  Copyright © 2018 Marcin Krzyzanowski. All rights reserved.
//

import Foundation

class XibFile {
    
    let data: Data
    let xibName: String
    let xib: Xib
    
    init(filePath: String) throws {
        let url = URL(fileURLWithPath: filePath)
        self.data = try Data(contentsOf: url)
        self.xibName = ((filePath as NSString).lastPathComponent as NSString).deletingPathExtension
        self.xib = Xib(xml: SWXMLHash.parse(self.data))
    }
}
