//
//  SeasonTableViewCell.swift
//  Football
//
//  Created by Aleksandr Fetisov on 19.05.2022.
//

import UIKit

class SeasonTableViewCell: UITableViewCell {
    
    private let inset: CGFloat = 10

    private lazy var nameLabel: UILabel = {
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .black
        $0.numberOfLines = .zero
        $0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    private lazy var abbrLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .systemGray
        $0.numberOfLines = .zero
        $0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    private lazy var startLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .systemGray
        return $0
    }(UILabel())
    
    private lazy var endLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .systemGray
        return $0
    }(UILabel())
    
    private lazy var standingsButton: UIButton = {
        $0.setTitle("Standings >", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        return $0
    }(UIButton())
    
    private lazy var contentStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .center
        $0.spacing = inset
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var infoStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.alignment = .leading
        $0.spacing = inset
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var dateStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
        $0.alignment = .leading
        $0.spacing = inset
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
    }

    private func addSubviews() {
        contentView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(infoStackView)
        contentStackView.addArrangedSubview(standingsButton)
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(abbrLabel)
        infoStackView.addArrangedSubview(dateStackView)
        dateStackView.addArrangedSubview(startLabel)
        dateStackView.addArrangedSubview(endLabel)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configure(with model: SeasonViewModel) {
        nameLabel.text = model.name
        abbrLabel.text = model.abbr
        startLabel.text = model.startDate
        endLabel.text = model.endDate
        if !model.hasStandings {
            standingsButton.isHidden = true
        }
    }

}
