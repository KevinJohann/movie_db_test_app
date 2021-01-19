//
//  MediaItemCell.swift
//  movieApp
//
//  Created by Kevin Torres on 16-01-21.
//

import UIKit
import Kingfisher

// MARK: - MediaItemDataSource
protocol MediaItemCellDataSource {
    var id: String { get }
    var title: String { get }
    var posterPath: URL? { get }
    var overview: String { get }
    var voteAverage: Float { get }
}

// MARK: - MediaItemCellDelegate
protocol MediaItemCellDelegate: AnyObject {
    func onShowInfo(using id: String)
}

// MARK: - MediaItemCell
final class MediaItemCell: UICollectionViewCell, DataSourceable {
    @IBOutlet weak var infoButton: UIButton! {
        didSet {
            infoButton.addTarget(self, action: #selector(onInfoButtonPressed(sender:)), for: .touchUpInside)
        }
    }

    @IBOutlet weak var ratePointLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView! {
        didSet {
            coverImageView.layerCornerRadius = .defaultCellCornerRadius
            coverImageView.kf.indicatorType = .activity
            if let indicator = coverImageView.kf.indicator?.view as? UIActivityIndicatorView { indicator.color = .primary }
        }
    }

    weak var delegate: MediaItemCellDelegate?

    var dataSource: MediaItemCellDataSource? {
        didSet {
            guard let dataSource = dataSource else { return }

            titleLabel.text = dataSource.title
            overviewLabel.text = dataSource.overview
            ratePointLabel.text = String(dataSource.voteAverage)

            coverImageView.kf.setImage(
                with: dataSource.posterPath,
                options: [
                    .keepCurrentImageWhileLoading,
                    .transition(.fade(0.3)),
                ]
            )
        }
    }
}

// MARK: - Target
extension MediaItemCell {
    @objc func onInfoButtonPressed(sender: UIButton) {
        guard let id = dataSource?.id else { return }
        delegate?.onShowInfo(using: id)
    }
}

// MARK: - PrepareForReuse
extension MediaItemCell {
    override func prepareForReuse() {
        super.prepareForReuse()

        coverImageView.image = nil
    }
}
