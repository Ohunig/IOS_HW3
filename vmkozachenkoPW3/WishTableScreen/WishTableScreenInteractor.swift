import Foundation

final class WishTableScreenInteractor : WishTableScreenBusinessLogic {
    
    // MARK: - Fields
    
    private let presenter: WishTableScreenPresentationLogic
    
    private let colorService: ColorServiceProtocol
    
    // MARK: - Inits
    
    init(presenter: WishTableScreenPresentationLogic, params: WishTableScreenParamsModel) {
        self.presenter = presenter
        colorService = params.colorService
    }
    
    // MARK: - Load start
    
    func loadStart(_ request: Model.Start.Request) {
        presenter.presentStart(Model.Start.Response(color: colorService.color))
    }
}
