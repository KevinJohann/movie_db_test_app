//
//  MovieFeedViewController.swift
//  movieApp
//
//  Created by Kevin Torres on 15-01-21.
//  
//

import UIKit
import SkeletonView

// MARK: - MovieFeedViewController
final class MovieFeedViewController: BaseViewController {
    @IBOutlet weak var feedCollectionView: UICollectionView!
    var presenter: MovieFeedPresenterProtocol?
}

// MARK: - Life cycles
extension MovieFeedViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.onViewWillAppear()
    }
}

// MARK: - MovieFeedViewProtocol
extension MovieFeedViewController: MovieFeedViewProtocol {
    func reloadData() { feedCollectionView.reloadData() }
    func setupNavigationBar() { title = .movieFeedTitle }
}

// MARK: - SkeletonCollectionViewDataSource
extension MovieFeedViewController: SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 5 }
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier { MediaItemCell.reuseIdentifier }
}

// MARK: - UICollectionViewDataSource
extension MovieFeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { presenter?.getNumberOfItems() ?? .zero }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaItemCell.reuseIdentifier, for: indexPath)

        guard let mediaItemCell = cell as? MediaItemCell else { return cell }

        mediaItemCell.dataSource = presenter?.onCellForItemAt(index: indexPath.item)
        mediaItemCell.delegate = self

        return mediaItemCell
    }
}

// MARK: - MediaItemCellDelegate
extension MovieFeedViewController: MediaItemCellDelegate {
    func onShowInfo(using id: String) {
        presenter?.onShowMovieDetail(using: id)
    }

    func startSkeleton() {
        let gradient = SkeletonGradient(baseColor: .lightGray)
        view.showAnimatedGradientSkeleton(usingGradient: gradient)
    }

    func stopSkeleton() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.view.hideSkeleton(reloadDataAfter: false, transition: .crossDissolve(0.3))
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MovieFeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ratio: CGFloat = (130/414)
        let width = collectionView.frame.width
        let height = width * ratio

        return CGSize(width: width, height: height)
    }
}
