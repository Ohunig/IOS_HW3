import Foundation

final class MainScreenPresenter: MainScreenPresentationLogic {
    
    weak var view: MainScreenViewController?
    
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart(Model.Start.ViewModel(red: response.color.red, green: response.color.green, blue: response.color.blue))
    }
    
    func presentChangeColor(_ response: Model.ChangeColor.Response) {
        view?.displayChangeColor(Model.ChangeColor.ViewModel(red: response.color.red, green: response.color.green, blue: response.color.blue))
    }
}
