//
//  SeasonHeaderView.swift
//  Football
//
//  Created by Aleksandr Fetisov on 19.05.2022.
//

import UIKit

class SeasonHeaderView: UIView {
    
    private let inset: CGFloat = 10

    private lazy var yearLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .systemGray
        
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
    
    private lazy var nameLabel: UILabel = {
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .black
        $0.numberOfLines = .zero
        $0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    private lazy var contentStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.alignment = .top
        $0.spacing = inset
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var infoStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
        $0.alignment = .leading
        $0.spacing = inset
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame = self.frame.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
    }
    
    private func addSubviews() {
        self.addSubview(contentStackView)
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(infoStackView)
        infoStackView.addArrangedSubview(yearLabel)
        infoStackView.addArrangedSubview(startLabel)
        infoStackView.addArrangedSubview(endLabel)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: self.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func configure(model: SeasonHeaderViewModel) {
        nameLabel.text = model.name
        yearLabel.text = String(model.year)
        startLabel.text = model.startDate
        endLabel.text = model.endDate
    }

}
