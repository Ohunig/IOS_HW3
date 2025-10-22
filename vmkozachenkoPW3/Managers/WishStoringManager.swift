import Foundation

// MARK: - Wish storing logic

protocol WishStoringLogic {
    var count: Int { get }
    
    func start()

    func getWishById(id: Int) -> String?
    
    func setWishTo(id: Int, wish: String)

    func addWish(wish: String)
    
    func deleteWish(index: Int)
}

// MARK: - Wish Manager

final class WishStoringManager: WishStoringLogic {
    
    // MARK: - Constants
    
    private enum Constants {
        static let wishesKey: String = "wishes"
    }

    // MARK: Fields

    static let shared: WishStoringLogic = WishStoringManager()

    private var wishes: [String] = []

    private let defaults = UserDefaults.standard
    
    var count: Int { wishes.count }

    // MARK: Lifecycle

    private init() {}

    // MARK: Behaviour
    
    func start() {
        wishes = defaults.array(forKey: Constants.wishesKey) as? [String] ?? []
    }

    func getWishById(id: Int) -> String? {
        guard id >= 0 && id < wishes.count else { return nil }
        return wishes[id]
    }
    
    func setWishTo(id: Int, wish: String) {
        guard id >= 0 && id < wishes.count else { return }
        wishes[id] = wish
        defaults.set(wishes, forKey: Constants.wishesKey)
    }
    
    func addWish(wish: String) {
        wishes.append(wish)
        defaults.set(wishes, forKey: Constants.wishesKey)
    }
    
    func deleteWish(index: Int) {
        if (index >= 0 && index < count) {
            wishes.remove(at: index)
        }
        defaults.set(wishes, forKey: Constants.wishesKey)
    }
}
