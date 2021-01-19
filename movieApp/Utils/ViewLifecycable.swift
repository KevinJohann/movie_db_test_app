//
//  ViewLifecycable.swift
//  movieApp
//
//  Created by Kevin Torres on 15-01-21.
//

// MARK: - ViewLifecycable
protocol ViewLifecycable: AnyObject {
    func onViewDidLoad()
    func onViewWillAppear()
    func onViewWillLayoutSubviews()
    func onViewDidLayoutSubviews()
    func onViewDidAppear()
}

// MARK: - Default Impl
extension ViewLifecycable {
    func onViewDidLoad() {}
    func onViewWillAppear() {}
    func onViewWillLayoutSubviews() {}
    func onViewDidLayoutSubviews() {}
    func onViewDidAppear() {}
}
