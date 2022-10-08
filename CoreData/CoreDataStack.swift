//
//  CoreDataStack.swift
//  VK_app
//
//  Created by Ffhh Qerg on 16.08.2022.
//

import CoreData

class CoreDataStack {
    private(set) lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "VK_app")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func newBackgroundContext() -> NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }
    
    func fetchTasks() -> [PostEntity] {
        let request: NSFetchRequest<PostEntity> = PostEntity.fetchRequest()
        do {
            return try viewContext.fetch(request)
        } catch {
            fatalError("🤷‍♂️ Что-то пошло не так..")
        }
    }
    
    func remove(task: PostEntity) {
        viewContext.delete(task)
        
        save(context: viewContext)
    }
    
    func createNewTask(author: String, description: String, image: String, likes: Int, views: Int) {
        let newPost = PostEntity(context: viewContext)
         newPost.id = UUID()
         newPost.author = author
         newPost.descript = description
         newPost.image = image
         newPost.likes = Int64(likes)
         newPost.views = Int64(views)
        
        save(context: viewContext)
    }
    
    private func save(context: NSManagedObjectContext) {
        guard context.hasChanges else { return }
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}
