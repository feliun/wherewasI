//
//  DataStore.swift
//  Where Was I
//
//  Created by Gibbonsoft Limited on 16/08/2016.
//  Copyright © 2016 feliun. All rights reserved.
//

import Foundation

struct StorageKeys {
    static let storedLat = "storedLat"
    static let storedLong = "storedLong"
}

class DataStore {

    func getDefaults() -> UserDefaults {
        return UserDefaults.standard
    }
    
    func storeDataPoint(lat:String, long: String) {
        let def = getDefaults()
        
        def.setValue(lat, forKey: StorageKeys.storedLat)
        def.setValue(long, forKey: StorageKeys.storedLong)
        def.synchronize()
    }
}
