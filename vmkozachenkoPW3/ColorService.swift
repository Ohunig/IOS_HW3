import Foundation

protocol ColorServiceProtocol {
    var color: ColorModel { get set }
}

final class ColorService: ColorServiceProtocol {
    private enum Constants {
        static let startColor: String = "#082b11"
    }
    
    var color: ColorModel = .init(hex: Constants.startColor)
}
