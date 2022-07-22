//
//  CategoryCell.swift
//  DeliveryApp
//
//  Created by Luciano Berchon on 22/07/22.
//

import Foundation
import UIKit

class CategoryCell: UITableViewCell {
    
    private lazy var stackViewCell: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Configurations.stackViewSpacing
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(label)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        let a = image.layer.cornerRadius
        image.layer.cornerRadius = Configurations.cornerRadius
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private  lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateCell(imageName: String, category: String) {
        label.text = category
        image.image = UIImage(named: imageName)
    }
}

extension CategoryCell: ViewCode {
    private struct Configurations {
        static let imageSize: CGSize = .init(width: 56, height: 56)
        static let stackViewSpacing: CGFloat = 8
        static let cornerRadius: CGFloat = 16
    }
    
    func setupSubviews() {
        stackViewCell.addArrangedSubview(image)
        stackViewCell.addArrangedSubview(label)

        contentView.addSubview(stackViewCell)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackViewCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Configurations.stackViewSpacing),
            stackViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Configurations.stackViewSpacing),
            stackViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Configurations.stackViewSpacing),
            stackViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Configurations.stackViewSpacing),
            
            image.heightAnchor.constraint(equalToConstant: Configurations.imageSize.height),
            image.widthAnchor.constraint(equalToConstant: Configurations.imageSize.width),
        ])
    }
}
