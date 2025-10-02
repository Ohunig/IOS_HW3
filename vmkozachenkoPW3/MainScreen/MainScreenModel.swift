import Foundation

enum MainScreenModel {
    
    enum Start {
        struct Request { }
        struct Response {
            let color: ColorModel
        }
        struct ViewModel {
            let red: CGFloat
            let green: CGFloat
            let blue: CGFloat
        }
    }
    
    enum ChangeColor {
        enum Request {
            case slider(red: Double, green: Double, blue: Double)
            case randomButton
            case textField(hex: String)
        }
        struct Response {
            let color: ColorModel
        }
        struct ViewModel {
            let red: CGFloat
            let green: CGFloat
            let blue: CGFloat
        }
    }
    
    enum ChangeColorController {
        struct Request {
            let index: Int
        }
        enum Response {
            case slider
            case textField
            case randomButton
        }
        struct ViewModel {
            let showSlider: Bool
            let showTextField: Bool
            let showRandomButton: Bool
        }
    }
}
