import Foundation

enum WishTableScreenModel {
    
    // MARK: - Start
    
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
    
}
