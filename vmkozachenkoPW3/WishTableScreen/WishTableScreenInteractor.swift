import Foundation

final class WishTableScreenInteractor: WishTableScreenBusinessLogic {

    // MARK: - Fields

    private let presenter: WishTableScreenPresentationLogic

    private let colorManager: ColorManagerProtocol

    private var wishManager: WishStoringLogic

    // MARK: - Inits

    init(
        presenter: WishTableScreenPresentationLogic,
        colorManager: ColorManagerProtocol,
        wishManager: WishStoringLogic
    ) {
        self.presenter = presenter
        self.colorManager = colorManager
        self.wishManager = wishManager
    }

    // MARK: - Load start

    func loadStart(_ request: Model.Start.Request) {
        wishManager.start()
        presenter.presentStart(Model.Start.Response(color: colorManager.color))
    }

    // MARK: - Load update wishes

    func loadUpdateWishes(_ request: Model.UpdateWishes.Request) {
        if case .add(let wish) = request {
            if !wish.isEmpty {
                wishManager.addWish(wish: wish)
            }
        } else if case .delete(let index) = request {
            wishManager.deleteWish(index: index)
        }
        var resp: [String?] = Array(repeating: "", count: wishManager.count)
        for i in 0..<wishManager.count {
            resp[i] = wishManager.getWishById(id: i)
        }
        presenter.presentUpdateWishes(Model.UpdateWishes.Response(wishes: resp))
    }
}
