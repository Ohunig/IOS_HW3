import UIKit

final class WrittenWishCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let fatalError = "init(coder:) has not been implemented"

        static let wrapColor: UIColor = UIColor(
            red: 1,
            green: 0.8,
            blue: 0.64,
            alpha: 1
        )
        static let wrapRadius: CGFloat = 12
        static let wrapOffsetV: CGFloat = 5
        static let wrapOffsetH: CGFloat = 8

        static let wishLabelOffset: CGFloat = 18
    }

    // MARK: - Fields

    static let reuseId: String = "WrittenWishCell"

    private let wishLabel: UILabel = UILabel()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }

    // MARK: - Configure label

    func configure(with wish: String) {
        wishLabel.text = wish
    }

    // MARK: - Configure UI

    private func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear

        // Wrap configuring
        let wrap: UIView = UIView()
        wrap.backgroundColor = Constants.wrapColor
        wrap.layer.cornerRadius = Constants.wrapRadius

        wrap.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrap)

        NSLayoutConstraint.activate([
            wrap.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            wrap.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: Constants.wrapOffsetH
            ),
            wrap.topAnchor.constraint(equalTo: self.topAnchor),
            wrap.bottomAnchor.constraint(
                equalTo: self.bottomAnchor,
                constant: -Constants.wrapOffsetV
            ),
        ])

        // Wish label configuring
        wishLabel.textColor = .black
        wishLabel.translatesAutoresizingMaskIntoConstraints = false
        wrap.addSubview(wishLabel)

        NSLayoutConstraint.activate([
            wishLabel.centerXAnchor.constraint(equalTo: wrap.centerXAnchor),
            wishLabel.centerYAnchor.constraint(equalTo: wrap.centerYAnchor),
            wishLabel.leadingAnchor.constraint(
                equalTo: wrap.leadingAnchor,
                constant: Constants.wishLabelOffset
            ),
            wishLabel.topAnchor.constraint(
                equalTo: wrap.topAnchor,
                constant: Constants.wishLabelOffset
            ),
        ])
    }
}
