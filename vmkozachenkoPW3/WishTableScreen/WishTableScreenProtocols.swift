import Foundation

// MARK: - Business logic

protocol WishTableScreenBusinessLogic {
    typealias Model = WishTableScreenModel
    
    func loadStart(_ request: Model.Start.Request)
}

// MARK: Presentation logic

protocol WishTableScreenPresentationLogic {
    typealias Model = WishTableScreenModel
    
    func presentStart(_ response: Model.Start.Response)
}
