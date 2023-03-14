//
//  ViewModel.swift
//  JZChildCare
//
//  Created by Jaafar Zubaidi  on 2/25/23.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataViewModel: ObservableObject {
    
    @Published var np = NavigationPath()
    
    var password: String = ""
    var email: String = ""
    var singTrue: Bool = false
    var pageOne: Bool = true
    @Published var child: [childModel] = []
    let container: NSPersistentContainer
    @Published var saveResults: [ResultEntity] = []
   
    
    init(){
        container = NSPersistentContainer(name: "ChildContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Data: \(error)")
            }else {
                print("Seccufully loading data")
            }
        }
        fetchResult()
    }
    
    func fetchResult(){
        let request = NSFetchRequest<ResultEntity>(entityName: "ResultEntity")
        do{
            saveResults = try container.viewContext.fetch(request)
            
        } catch let error {
            print("Fatch the Error .\(error)")
        }
    }
    func addChild(childFirstName: String, childLastName: String, password: String, email: String ) {
        let fetchRequest: NSFetchRequest<ResultEntity> = ResultEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", childFirstName)
        
        do {
            let results = try container.viewContext.fetch(fetchRequest)
            if results.first != nil {
                // An existing favorite was found, you could choose to update its values here if needed
                return
            }
        } catch {
            print("Error fetching favorites: \(error)")
            return
        }

        let newFavorite = ResultEntity(context: container.viewContext)
        newFavorite.childFirstName = childFirstName
        newFavorite.childLastName = childLastName
        newFavorite.password = password
        newFavorite.email = email
   
        saveChild()

    }
    func isChild(child: childModel) -> Bool {
        // Find out if the album is favorite
        let fetchRequest = NSFetchRequest<ResultEntity>(entityName: "ResultEntity")
        fetchRequest.predicate = NSPredicate(format: "id = %@", child.email , child.password )
        print(child.email)

        do {
            let result = try container.viewContext.fetch(fetchRequest)
           
            if result.first != nil {
                // Album is a favorite
              
                return true
            } else {
                // Album is not a favorite
               
                return false
            }
           
        } catch {
            print("Error fetching favorite album: \(error)")
            return false
        }
    }
    func deleteChild(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = saveResults[index]
        container.viewContext.delete(entity)
        saveChild()
    }
    func saveChild() {
        do {
            try container.viewContext.save()
            fetchResult()
        } catch let error {
            print("Error in Saving: \(error)")
        }
    }
    func isCorrect(email: String, password: String) -> Bool{
       
        let request = NSFetchRequest<ResultEntity>(entityName: "ResultEntity")
        request.predicate = NSPredicate(format: "email == %@ AND password == %@", email, password)
  
           do {
               
               let users = try container.viewContext.fetch(request)
               
               if let user = users.first {
                   print("Signed in as \(user.childFirstName ?? "")")
                   singTrue = true
               } else {
                   print("Invalid email or password.")
               }
              
           } catch let error as NSError {
               print("Error fetching users: \(error.localizedDescription)")
           }
        return singTrue
    }
    func signIn(entity: ResultEntity?) -> Bool {
        
        
       // return true
        
        guard let email = entity?.email, let password = entity?.password else { return false }
           let request = NSFetchRequest<ResultEntity>(entityName: "ResultEntity")
        request.predicate = NSPredicate(format: "email == %@ AND password == %@", email, password)
        print(password)
           
           do {
               
               let users = try container.viewContext.fetch(request)
               
               if let user = users.first {
                   print("Signed in as \(user.childFirstName ?? "")")
                   singTrue = true
               } else {
                   print("Invalid email or password.")
               }
              
           } catch let error as NSError {
               print("Error fetching users: \(error.localizedDescription)")
           }
        return singTrue
        
       }
    func clearAllData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ResultEntity")

        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            
            try container.viewContext.execute(batchDeleteRequest)
            saveResults = []
        } catch {
            
        }
        
    }
  
}



