import UIKit

final class WishStoringViewController: UIViewController {
    typealias Model = WishTableScreenModel

    // MARK: - Constants

    private enum Constants {
        static let fatalInitError = "init(coder:) has not been implemented"
        static let fatalTableError = "Invalid section number"

        static let tableCornerRadius: CGFloat = 12
        static let tableTop: CGFloat = 40
        static let tableLeading: CGFloat = 20
        static let tableBottom: CGFloat = -50

        static let alphaValue: CGFloat = 1

        static let countOfSections = 2
    }

    // MARK: - Fields

    private let interactor: WishTableScreenBusinessLogic

    private let table: UITableView = UITableView(frame: .zero)

    // The source of truth is in interactor
    private var wishes: [String] = []

    // MARK: - Initialisers

    init(interactor: WishTableScreenBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalInitError)
    }

    // MARK: - View did load

    override func viewDidLoad() {
        super.viewDidLoad()

        interactor.loadStart(Model.Start.Request())
        interactor.loadUpdateWishes(.update)
        configureUI()
    }

    // MARK: - Configure UI

    private func configureUI() {
        configureTable()
    }

    // MARK: - Configure table

    private func configureTable() {
        table.register(
            WrittenWishCell.self,
            forCellReuseIdentifier: WrittenWishCell.reuseId
        )
        table.register(
            AddWishCell.self,
            forCellReuseIdentifier: AddWishCell.reuseId
        )
        table.dataSource = self
        table.reloadData()
        table.isUserInteractionEnabled = true
        table.delaysContentTouches = false
        table.showsVerticalScrollIndicator = false

        table.backgroundColor = .white
        table.separatorStyle = .none
        table.layer.cornerRadius = Constants.tableCornerRadius
        table.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(table)
        NSLayoutConstraint.activate([
            table.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            table.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.tableTop
            ),
            table.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.tableLeading
            ),
            table.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: Constants.tableBottom
            ),
        ])
    }

    // MARK: - Display changes

    func displayStart(_ viewModel: Model.Start.ViewModel) {
        view.backgroundColor = UIColor(
            red: viewModel.red,
            green: viewModel.green,
            blue: viewModel.blue,
            alpha: Constants.alphaValue
        )
    }

    func displayUpdateWishes(_ viewModel: Model.UpdateWishes.ViewModel) {
        wishes = viewModel.wishes
        table.reloadData()
    }
}

// MARK: - Extention to UITableViewDataSource

extension WishStoringViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        switch section {
        case 0:
            return 1
        case 1:
            return wishes.count
        default:
            fatalError(Constants.fatalTableError)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: AddWishCell.reuseId,
                for: indexPath
            )
            guard let addCell = cell as? AddWishCell else {
                return cell
            }

            addCell.buttonPressed = { [weak self] wish in
                self?.dismissKeyboard()
                self?.interactor.loadUpdateWishes(.add(wish))
            }
            return addCell
        case 1:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: WrittenWishCell.reuseId,
                for: indexPath
            )
            guard let wishCell = cell as? WrittenWishCell else {
                return cell
            }

            wishCell.configure(with: wishes[indexPath.row])

            return wishCell
        default:
            fatalError(Constants.fatalTableError)
        }
    }

    // MARK: Number of sections

    func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.countOfSections
    }

    // MARK: - Dismiss Keyboard

    @objc
    private func dismissKeyboard() {
        view.endEditing(true)
    }
}
