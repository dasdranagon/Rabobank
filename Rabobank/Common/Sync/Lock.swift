//
//  Lock.swift
//  Rabobank
//
//  Created by Dennis Skokov on 25/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

/**
    Executes code block only if it is free
 */

class Lock {
    typealias Block = ()->()
    private var locked = false
    
    func lock(block: Block) {
        guard !locked else { return }
        
        locked = true
        block()
    }
    
    func release() {
        locked = false
    }
}
