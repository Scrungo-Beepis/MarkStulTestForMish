//
//  LogStore.swift
//  SimpleApp
//
//  Created by Mark Nazzaro on 10/29/18.
//  Copyright © 2018 King Ultimat0's Fabulous Creations. All rights reserved.
//

import UIKit

class LogStore {
    
    var logs = [Log]()
    
    @discardableResult func createLog() -> Log {
        let log = Log()
        
        logs.append(log)
        
        return log
    }
    
    func removeLog(_ log: Log) {
        if let index = logs.index(of: log) {
            logs.remove(at: index)
        }
    }
    
    func moveLog(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        let movedLog = logs[fromIndex]

        logs.remove(at: fromIndex)

        logs.insert(movedLog, at: toIndex)
    }
}
