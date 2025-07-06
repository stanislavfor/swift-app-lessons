import Foundation
import CoreData

extension FriendEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendEntity> {
        return NSFetchRequest<FriendEntity>(entityName: "FriendEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var avatar: String?
    @NSManaged public var isFavorite: Bool
}

extension FriendEntity: Identifiable {}
