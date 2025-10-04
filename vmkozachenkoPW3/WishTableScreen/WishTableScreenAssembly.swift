import Foundation

enum WishTableScreenAssembly {
    
    static func build(params: WishTableScreenParamsModel) -> WishStoringViewController {
        let presenter: WishTableScreenPresenter = WishTableScreenPresenter()
        let interactor: WishTableScreenInteractor = WishTableScreenInteractor(presenter: presenter, params: params)
        let viewController: WishStoringViewController = WishStoringViewController(interactor: interactor)
        
        presenter.view = viewController
        
        return viewController
    }
}
