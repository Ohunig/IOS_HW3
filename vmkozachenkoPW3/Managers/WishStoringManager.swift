import Foundation

// MARK: - Wish storing logic

protocol WishStoringLogic {
    var сount: Int { get }

    func getWishById(id: Int) -> String?

    func addWish(wish: String)
}

// MARK: - Wish Manager

final class WishStoringManager: WishStoringLogic {

    // MARK: Fields

    static let shared: WishStoringLogic = WishStoringManager()

    private var wishes: [String] = []

    var сount: Int { wishes.count }

    // MARK: Lifecycle

    private init() {}

    // MARK: Behaviour

    func getWishById(id: Int) -> String? {
        guard id >= 0 && id < wishes.count else { return nil }
        return wishes[id]
    }
    
    func addWish(wish: String) {
        wishes.append(wish)
    }
}
