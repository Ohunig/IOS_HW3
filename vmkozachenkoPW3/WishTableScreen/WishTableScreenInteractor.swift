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
        presenter.presentStart(Model.Start.Response(color: colorManager.color))
    }

    // MARK: - Load update wishes

    func loadUpdateWishes(_ request: Model.UpdateWishes.Request) {
        if case .add(let wish) = request {
            if !wish.isEmpty {
                wishManager.addWish(wish: wish)
            }
        }
        var resp: [String?] = Array(repeating: "", count: wishManager.сount)
        for i in 0..<wishManager.сount {
            resp[i] = wishManager.getWishById(id: i)
        }
        presenter.presentUpdateWishes(Model.UpdateWishes.Response(wishes: resp))
    }
}
