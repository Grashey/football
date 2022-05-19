//
//  LeagueViewController.swift
//  Football
//
//  Created by Aleksandr Fetisov on 18.05.2022.
//

import UIKit

class LeagueViewController: UIViewController {
    
    var presenter: iLeaguePresenter?
    
    private let cellHeight: CGFloat = 100
    
    var onDetail: ((String, String) -> Void)?
    
    lazy var tableView: UITableView = {
        $0.separatorStyle = .singleLine
        $0.rowHeight = cellHeight
        $0.register(LeagueTableViewCell.self, forCellReuseIdentifier: LeagueTableViewCell.description())
        return $0
    }(UITableView())

    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Leagues"
        tableView.delegate = self
        tableView.dataSource = self
        presenter?.fetchData()
    }

}

// MARK: TableView DataSource
extension LeagueViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.viewModels.count ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeagueTableViewCell.description(), for: indexPath)
        if let model = presenter?.viewModels[indexPath.row] {
            let size = CGSize(width: cellHeight, height: cellHeight)
            (cell as? LeagueTableViewCell)?.configure(with: model, logoSize: size)
        }
        return cell
    }
}

extension LeagueViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let identifier = presenter?.viewModels[indexPath.row].identifier,
              let title = presenter?.viewModels[indexPath.row].name
        else { return }
        onDetail?(title, identifier)
    }
}
