//
//  AppDependencies.swift
//  Rabobank
//
//  Created by Dennis Skokov on 22/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import UIKit

struct AppDependencies {
    let listAssembly = ListAssembly()
    private let navigator = StandardNavigator()
    
    init() {
        setup()
    }
    
    func apply(window: UIWindow) {
        navigator.configure(window: window)
        
        listAssembly.wireframe.activate()
    }
    
    mutating func setup() {
        listAssembly.configure()
        listAssembly.setupDependencies()
        listAssembly.injectDependencies()
    }
}

// MARK: Common dependencies
// prepareCommonDependencies - here could be for instance data storage initialization
// assembleCommonDependencies - add you dependency to the common dependency object
extension AppDependencies {
    
    private func assembleCommonDependencies() {
        prepareCommonDependencies()
        
        let dependencies = CommonDependencies(navigator: navigator)
        CommonDependencies.shared = dependencies
    }
}

// MARK: Concrete dependencies
extension AppDependencies {
    
    // Setup dependencies between assemblies
    private mutating func setupDependencies() {
        
    }
    
    // In configure method of concrete assembly all internal dependencies should be set up.
    // For instance dependence between presenter and wireframe.
    private func configure() {
        let mirror = Mirror(reflecting: assemblies)
        for (_, value) in mirror.children {
            guard let assembly = value as? Assembly else { continue }
            
        }
    }
    
    // In injectDependencies method of concrete assembly all external dependencies should be set up.
    // For instance dependence between wireframes of different assemblies
    private func injectDependencies() {
        let mirror = Mirror(reflecting: assemblies)
        for (_, value) in mirror.children {
            guard let assembly = value as? Assembly else { continue }
            assembly.injectDependencies()
        }
    }
}
