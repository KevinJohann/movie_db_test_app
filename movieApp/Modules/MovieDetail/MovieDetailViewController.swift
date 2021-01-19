//
//  MovieDetailViewController.swift
//  movieApp
//
//  Created by Kevin Torres on 17-01-21.
//  
//

import UIKit

// MARK: - MediaItemDataSource
protocol MediaDetailDataSource {
    var title: String { get }
    var posterPath: URL? { get }
    var backdropPath: URL? { get }
    var overview: String { get }
    var voteAverage: String { get }
    var popularity: String { get }
    var voteCount: String { get }
    var homepage: String? { get }
}

// MARK: - MovieDetailViewController
final class MovieDetailViewController: UIViewController {
    @IBOutlet weak var blurredCloseButtonBackgroundView: UIVisualEffectView! { didSet { blurredCloseButtonBackgroundView.setAsRoundedView() } }

    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            closeButton.addTarget(self, action: #selector(onCloseButtonPressed(sender:)), for: .touchUpInside)
        }
    }
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var pageStackView: UIStackView! {
        didSet {
            pageStackView.isHidden = false
        }
    }

    @IBOutlet weak var backdropImageView: UIImageView! {
        didSet {
            backdropImageView.kf.indicatorType = .activity
        }
    }

    @IBOutlet weak var movieImageView: UIImageView! {
        didSet {
            movieImageView.kf.indicatorType = .activity
        }
    }

    var presenter: MovieDetailPresenterProtocol?

    var dataSource: MediaDetailDataSource? {
        didSet {
            guard let dataSource = dataSource else { return }
            backdropImageView.kf.setImage(
                with: dataSource.backdropPath,
                options: [
                    .keepCurrentImageWhileLoading,
                    .transition(.fade(0.3)),
                ]
            )
            movieImageView.kf.setImage(
                with: dataSource.posterPath,
                options: [
                    .keepCurrentImageWhileLoading,
                    .transition(.fade(0.3)),
                ]
            )
            titleLabel.text = dataSource.title
            voteAverageLabel.text = dataSource.voteAverage
            popularityLabel.text = dataSource.popularity
            voteCountLabel.text = dataSource.voteCount
            overviewLabel.text = dataSource.overview

            guard
                let webPage = dataSource.homepage,
                !webPage.isEmpty else {
                pageStackView.isHidden = true
                return
            }
            websiteLabel.text = dataSource.homepage
        }
    }
}

// MARK: - Life cycles
extension MovieDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

// MARK: - MovieDetailViewProtocol
extension MovieDetailViewController: MovieDetailViewProtocol {
    func set(dataSource: MediaDetailDataSource) {
        self.dataSource = dataSource
    }
}

// MARK: - Target
extension MovieDetailViewController {
    @objc func onCloseButtonPressed(sender: UIButton) {
        presenter?.onCloseButtonPressed()
    }
}
