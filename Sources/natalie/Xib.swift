//
//  Xib.swift
//  natalie
//
//  Created by Alex Bofu on 29/09/2018.
//  Copyright © 2018 Marcin Krzyzanowski. All rights reserved.
//

class Xib: XMLObject {
    
    let version: String
    lazy var os: OS = {
        guard let targetRuntime = self.xml["document"].element?.attribute(by: "targetRuntime")?.text else {
            return OS.iOS
        }
        
        return OS(targetRuntime: targetRuntime)
    }()

    lazy var scene: Scene? = {
        guard let scene = self.searchAll(root: self.xml, attributeKey: "customClass")?.first else {
            return nil
        }
        
        return Scene(xml: scene)
    }()
    
    lazy var colors: [Color] = {
        guard let colors = self.searchNamed(root: self.xml, name: "color") else {
            return []
        }
        
        return colors.map { Color(xml: $0) }
    }()
    
    lazy var customModules: Set<String> = {
        guard let scene = self.scene else { return Set([]) }
        
        return Set([scene].compactMap({ $0.customModule })) 
    }()
    
    override init(xml: XMLIndexer) {
        self.version = xml["document"].element!.attribute(by: "version")!.text
        super.init(xml: xml)
    }
    
}

