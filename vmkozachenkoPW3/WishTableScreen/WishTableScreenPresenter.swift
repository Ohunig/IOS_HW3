import Foundation

final class WishTableScreenPresenter: WishTableScreenPresentationLogic {
    
    // MARK: - Fields
    
    weak var view: WishStoringViewController?
    
    // MARK: - Present start
    
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart(Model.Start.ViewModel(red: response.color.red, green: response.color.green, blue: response.color.blue))
    }
}
