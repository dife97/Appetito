//
//  CoreDataManager.swift
//  Appetito
//
//  Created by Diego Rodrigues on 28/09/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(modelName: "AppetitoCoreData")
    
    let persistencContainer: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        return persistencContainer.viewContext
    }
    
    init(modelName: String) {
        self.persistencContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (() -> Void)? = nil) {
        
        persistencContainer.loadPersistentStores { description, error in
                       
            guard error == nil else {
                fatalError("Unresolved error \(error!.localizedDescription)")
            }
            
            completion?()
        }
    }
    
    func save() {
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchUser() -> User? {
        
        let request = User.fetchRequest()
        
        do {
            let user = try CoreDataManager.shared.context.fetch(request)
            
            return user.first
        } catch {
            return nil
        }
    }
}
