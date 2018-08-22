//
//  TBUserManager.swift
//  TaskBuddy2
//
//  Created by Jonathan Compton on 8/22/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import Foundation

class TBUserManager {
    
    private init() {}
    
    static let shared = TBUserManager()
    
    var currentTBUser: TBUser?
    
}
