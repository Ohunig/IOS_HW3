import UIKit

final class WishStoringViewController : UIViewController {
    typealias Model = WishTableScreenModel
    
    // MARK: - Constants
    
    private enum Constants {
        static let fatalError = "init(coder:) has not been implemented"
        
        static let alphaValue: CGFloat = 1
    }
    
    // MARK: - Fields
    
    private let interactor: WishTableScreenBusinessLogic
    
    // MARK: - Initialisers
    
    init(interactor: WishTableScreenBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }
    
    // MARK: - View did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.loadStart(Model.Start.Request())
    }
    
    // MARK: - Display changes
    
    func displayStart(_ viewModel: Model.Start.ViewModel) {
        view.backgroundColor = UIColor(red: viewModel.red, green: viewModel.green, blue: viewModel.blue, alpha: Constants.alphaValue)
    }
    
}
