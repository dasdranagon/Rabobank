//
//  DefaultBundleTextSource.swift
//  Rabobank
//
//  Created by Dennis Skokov on 24/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Foundation

class BundleTextSource {
    enum Constants {
        static let fileName = "issues"
    }
    
    let resource: String
    let type: String
    init(resource: String, ofType type: String) {
        self.resource = resource
        self.type = type
    }
}

extension BundleTextSource: TextSource {
    func fetch(handler:  @escaping (String?) -> ()) {
        guard let url = Bundle.main.url(forResource: Constants.fileName, withExtension: "csv") else {
            handler(nil)
            return
        }
        DispatchQueue.global(qos: .utility).async {
            let text = try? String(contentsOf: url)
            DispatchQueue.main.async {
                handler(text)
            }
        }
    }
}
