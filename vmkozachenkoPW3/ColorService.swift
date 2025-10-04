import Foundation

// MARK: - Color service protocol

protocol ColorServiceProtocol {
    var color: ColorModel { get }
    
    func setColor(color: ColorModel)
}

// MARK: - Color service

final class ColorService: ColorServiceProtocol {
    
    // MARK: - Constants
    
    private enum Constants {
        static let startColor: String = "#082b11"
    }
    
    // MARK: - Fields
    
    var color: ColorModel = .init(hex: Constants.startColor)
    
    // MARK: - Set color
    
    func setColor(color: ColorModel) {
        self.color = color
    }
}
