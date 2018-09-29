//
//  XibScene.swift
//  natalie
//
//  Created by Alex Bofu on 29/09/2018.
//  Copyright © 2018 Marcin Krzyzanowski. All rights reserved.
//

class XibScene: XMLObject {
    
    lazy var viewController: ViewController? = {
        if let vcs = searchAll(root: self.xml, attributeKey: "customClass")?.first {
            return ViewController(xml: vc)
        }
        return nil
    }()
    
    lazy var sceneID: String? = self.xml.element?.attribute(by: "sceneID")?.text
    
    lazy var customModule: String? = self.viewController?.customModule
    lazy var customModuleProvider: String? = self.viewController?.customModuleProvider
    lazy var userLabel: String? = self.viewController?.userLabel
    
}
