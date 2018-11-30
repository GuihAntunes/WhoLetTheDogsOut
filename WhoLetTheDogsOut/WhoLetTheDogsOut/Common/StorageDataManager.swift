//
//  StorageDataManager.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 30/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Disk

class StorageDataManager {
    
    func saveDog(_ dog: Dog) {
        do {
            try Disk.save(dog, to: .documents, as: dog.path)
        } catch {
            fatalError("impossible to save dog")
        }
    }
    
    func getStoredDog(_ breed: String) -> Dog? {
        do {
            if Disk.exists("storedDog\(breed).json", in: .documents) {
                return try Disk.retrieve("storedDog\(breed).json", from: .documents, as: Dog.self)
            } else {
                return nil
            }
        } catch {
            fatalError("impossible to check stored dog")
        }
    }
}
