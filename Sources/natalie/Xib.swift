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

    lazy var scenes: [XibScene] =  = Set(self.scenes.filter { $0.customModule != nil && $0.customModuleProvider == nil }.map { $0.customModule! })
    
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

