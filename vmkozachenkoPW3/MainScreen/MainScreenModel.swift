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
}
