//
//  AppDependencies.swift
//  Rabobank
//
//  Created by Dennis Skokov on 22/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import UIKit

struct AppDependencies {
    struct Assemblies {
        let list = ListAssembly()
    }
    private let assemblies = Assemblies()
    
    private let navigator = StandardNavigator()
   
    private var appInitialWireframe: Wireframe!
    
    init() {
        setup()
    }
    
    func apply(window: UIWindow) {
        navigator.configure(window: window)
        
        appInitialWireframe.activate()
    }
    
    mutating func setup() {
        assembleCommonDependencies()
        configure()
        setupDependencies()
        injectDependencies()
    }
}

extension AppDependencies {
    private func prepareCommonDependencies() {
        
    }
    
    private func assembleCommonDependencies() {
        prepareCommonDependencies()
        
        let dependencies = CommonDependencies(navigator: navigator)
        CommonDependencies.shared = dependencies
    }
}

extension AppDependencies {
    private mutating func setupDependencies() {
//        appInitialWireframe = assemblies.list.wireframe
    }
    
    private func injectDependencies() {
        let mirror = Mirror(reflecting: assemblies)
        for (_, value) in mirror.children {
            guard let assembly = value as? Assembly else { continue }
            assembly.injectDependencies()
        }
    }
    
    private func configure() {
        let mirror = Mirror(reflecting: assemblies)
        for (_, value) in mirror.children {
            guard let assembly = value as? Assembly else { continue }
            assembly.configure()
        }
    }
}
