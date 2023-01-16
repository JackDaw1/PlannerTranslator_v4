import Foundation
import CoreData

final class PTDataBaseService {
    static let shared = PTDataBaseService()
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "PlannerTranslator_v4")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func reloadOrders(by orderList: [OrderItem]) {
        let context = PTDataBaseService.shared.persistentContainer.viewContext
        for item in orderList {
            let newOrder = Order(context: context)
            newOrder.name = item.name
            newOrder.link = item.link
            newOrder.deadline = item.deadline?.toDate()
            newOrder.made = item.made
            newOrder.price = item.price ?? 0.0
            newOrder.customer = nil
            newOrder.paid = item.paid ?? false
            newOrder.numberOfSigns = item.numberOfSigns ?? 0
            newOrder.time = item.time ?? 0
            
            do {
                try context.save()
            } catch {
                context.rollback()
            }
        }
    }
}
