//
//  SeasonViewController.swift
//  Football
//
//  Created by Aleksandr Fetisov on 19.05.2022.
//

import UIKit

class SeasonViewController: UIViewController {
    
    var presenter: iSeasonPresenter?
    
    lazy var tableView: UITableView = {
        $0.allowsSelection = false
        $0.estimatedRowHeight = UITableView.automaticDimension
        $0.rowHeight = UITableView.automaticDimension
        $0.register(SeasonTableViewCell.self, forCellReuseIdentifier: SeasonTableViewCell.description())
        return $0
    }(UITableView())
    
    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        presenter?.fetchData()
    }

}

// MARK: TableView DataSource
extension SeasonViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.headerViewModels.count ?? .zero
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.viewModels[section].count ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SeasonTableViewCell.description(), for: indexPath)
        if let model = presenter?.viewModels[indexPath.section][indexPath.row] {
            (cell as? SeasonTableViewCell)?.configure(with: model)
        }
        return cell
    }
}

extension SeasonViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SeasonHeaderView()
        if let model = presenter?.headerViewModels[section] {
            view.configure(model: model)
        }
        return view
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let sectionHeaderHeight: CGFloat = 44
        if scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= .zero {
            scrollView.contentInset = UIEdgeInsets(top: -scrollView.contentOffset.y, left: .zero, bottom: .zero, right: .zero)
        } else if scrollView.contentOffset.y >= sectionHeaderHeight {
            scrollView.contentInset = UIEdgeInsets(top: -sectionHeaderHeight, left: .zero, bottom: .zero, right: .zero)
        }
    }
}
