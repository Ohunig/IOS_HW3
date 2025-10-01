import Foundation

final class MainScreenInteractor: MainScreenBusinessLogic {
    
    // MARK: - Constants
    
    private enum Constants {
        static let maxColorValue: CGFloat = 255
        
        static let alphaValue: CGFloat = 1
        static let minValue: CGFloat = 0
        static let maxValue: CGFloat = 1
    }
    
    // MARK: - Fields
    
    private let presenter: MainScreenPresentationLogic
    
    private var colorService: ColorServiceProtocol
    
    // MARK: - Initialisers
    
    init(presenter: MainScreenPresentationLogic, colorService: ColorServiceProtocol) {
        self.presenter = presenter
        self.colorService = colorService
    }
    
    // MARK: Business logic
    
    func loadStart(_ request: Model.Start.Request) {
        presenter.presentStart(Model.Start.Response(color: colorService.color))
    }
    
    func loadChangeColor(_ request: Model.ChangeColor.Request) {
        switch request {
            
        case let .slider(red, green, blue):
            // color processing
            let r = min(max(red / Constants.maxColorValue, Constants.minValue), Constants.maxValue)
            let g = min(max(green / Constants.maxColorValue, Constants.minValue), Constants.maxValue)
            let b = min(max(blue / Constants.maxColorValue, Constants.minValue), Constants.maxValue)
            // set color
            colorService.color = ColorModel(red: r, green: g, blue: b)
            
        case .randomButton:
            // set color
            colorService.color = ColorModel(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1))
            
        case let .textField(hex):
            // set color
            colorService.color = ColorModel(hex: hex)
        }
        
        presenter.presentChangeColor(Model.ChangeColor.Response(color: colorService.color))
    }
}
