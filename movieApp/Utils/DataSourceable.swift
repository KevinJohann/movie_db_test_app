//
//  DataSourceable.swift
//  movieApp
//
//  Created by Kevin Torres on 16-01-21.
//

// MARK: - DataSourceable
protocol DataSourceable: AnyObject {
    associatedtype DataSourceType

    var dataSource: DataSourceType? { get set }
    func set(dataSource: DataSourceType)
}

extension DataSourceable {
    func set(dataSource: DataSourceType) { self.dataSource = dataSource }
}

// MARK: - DataSource
protocol DataSource {}

protocol DataSourceableT: AnyObject {
    var dataSource: DataSource? { get set }
    func set(dataSource: DataSource)
}

extension DataSourceableT {
    func set(dataSource: DataSource) { self.dataSource = dataSource }
}
