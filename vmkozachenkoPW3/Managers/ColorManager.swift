import Foundation

// MARK: - Color manager protocol

protocol ColorManagerProtocol {
    var color: ColorModel { get }
    
    func setColor(color: ColorModel)
}

// MARK: - Color manager

final class ColorManager: ColorManagerProtocol {
    
    // MARK: - Constants
    
    private enum Constants {
        static let startColor: String = "#082b11"
    }
    
    // MARK: - Fields
    
    static let shared: ColorManagerProtocol = ColorManager()
    
    var color: ColorModel = .init(hex: Constants.startColor)
    
    // MARK: - Inits
    
    private init() {}
    
    // MARK: - Set color
    
    func setColor(color: ColorModel) {
        self.color = color
    }
}
