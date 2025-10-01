import UIKit

final class MainScreenViewController: UIViewController {
    typealias Model = MainScreenModel
    
    // MARK: - Constants
    
    private enum Constants {
        static let fatalError: String = "init(coder:) has not been implemented"
        
        static let titleText = "Wish Maker"
        static let titleFontSize: CGFloat = 40
        static let titleLeading: CGFloat = 20
        static let titleTop: CGFloat = 20
        
        static let descriptionText = "This app will bring you joy and will fulfill three of your wishes!\n\t*The first wish is to change the background color."
        static let descriptionFontSize: CGFloat = 20
        static let descriptionLeading: CGFloat = 20
        static let descriptionTop: CGFloat = 50
        
        static let sliderLeading: CGFloat = 20
        static let sliderTop: CGFloat = 30
        
        static let maxColorVal: CGFloat = 255
        
        static let alphaValue: CGFloat = 1
    }
    
    // MARK: - Fields
    
    private let interactor: MainScreenBusinessLogic
    
    let mainTitle: UILabel = UILabel()
    let mainDescription: UILabel = UILabel()
    
    // Color controllers
    private let rgbSlider: CustomRGBSlider = CustomRGBSlider()
//    private let textField: CustomTextField = CustomTextField(placeholder: Constants.textFieldPlaceholder)
//    private let randomButton: UIButton = UIButton(type: .system)
    
    // MARK: - Initialisers
    
    init(interactor: MainScreenBusinessLogic) {
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
        configureUI()
    }
    
    // MARK: - Configure UI
    
    private func configureUI() {
        configureTitle()
        configureDescription()
        configureSliders()
    }
    
    // MARK: - Configure Title
    
    private func configureTitle() {
        // customise title
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        mainTitle.text = Constants.titleText
        mainTitle.font = UIFont.systemFont(ofSize: Constants.titleFontSize)
        mainTitle.textColor = .orange
        
        // place title on view
        view.addSubview(mainTitle)
        NSLayoutConstraint.activate([
            mainTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTitle.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: Constants.titleLeading),
            mainTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.titleTop),
        ])
    }
    
    // MARK: - Configure description
    
    private func configureDescription() {
        // customise description
        mainDescription.translatesAutoresizingMaskIntoConstraints = false
        mainDescription.text = Constants.descriptionText
        mainDescription.font = UIFont.systemFont(ofSize: Constants.descriptionFontSize)
        mainDescription.textColor = .orange
        mainDescription.numberOfLines = 0
        
        // place description on view
        view.addSubview(mainDescription)
        NSLayoutConstraint.activate([
            mainDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.descriptionLeading),
            mainDescription.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: Constants.descriptionTop)
        ])
    }
    
    // MARK: - Configure Sliders
    
    private func configureSliders() {
        
        // assign valueChanged
        rgbSlider.valueChanged = { [weak self] red, green, blue in
            guard let self = self else { return }
            self.interactor.loadChangeColor(.slider(red: red, green: green, blue: blue))
        }
        
        // add rgbSlider to view
        rgbSlider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rgbSlider)
        NSLayoutConstraint.activate([
            rgbSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rgbSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rgbSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.sliderLeading),
            rgbSlider.topAnchor.constraint(greaterThanOrEqualTo: mainDescription.bottomAnchor, constant: Constants.sliderTop)
        ])
    }
    
    // MARK: - Display changes
    
    func displayStart(_ viewModel: Model.Start.ViewModel) {
        rgbSlider.updateSliders(red: viewModel.red, green: viewModel.green, blue: viewModel.blue)
        view.backgroundColor = UIColor(red: viewModel.red, green: viewModel.green, blue: viewModel.blue, alpha: Constants.alphaValue)
    }
    
    func displayChangeColor(_ viewModel: Model.ChangeColor.ViewModel) {
        rgbSlider.updateSliders(red: viewModel.red, green: viewModel.green, blue: viewModel.blue)
        view.backgroundColor = UIColor(red: viewModel.red, green: viewModel.green, blue: viewModel.blue, alpha: Constants.alphaValue)
    }
}
