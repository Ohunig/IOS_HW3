import Foundation

enum MainScreenAssembly {
    
    static func build() -> MainScreenViewController {
        let presenter: MainScreenPresenter = MainScreenPresenter()
        let colorService: ColorService = ColorService()
        let interactor: MainScreenBusinessLogic = MainScreenInteractor(presenter: presenter, colorService: colorService)
        let viewController: MainScreenViewController = MainScreenViewController(interactor: interactor)
        presenter.view = viewController
        
        return viewController
    }
}
