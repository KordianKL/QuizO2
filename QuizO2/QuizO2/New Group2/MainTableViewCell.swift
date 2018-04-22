//
//  MainTableViewCell.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 21/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import Foundation
import UIKit

class MainTableViewCell: UITableViewCell {
    
    private lazy var cellInsetRect: CGRect = {
        return UIEdgeInsetsInsetRect(contentView.frame, UIEdgeInsetsMake(10, 10, 10, 10))
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.numberOfLines = 2
        label.layer.cornerRadius = 15.0
        label.backgroundColor = UIColor(white: 1.0, alpha: 0.65)
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.textColor = UIColor.red
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.numberOfLines = 9
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textColor = UIColor.red
        return label
    }()
    
    private lazy var summaryLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.red
        return label
    }()
    
    private lazy var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 50.0
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 50.0
        contentView.frame = cellInsetRect
        titleLabel.backgroundColor = UIColor(white: 1.0, alpha: 0.65)
        bgImage.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        if subtitleLabel.text!.isEmpty {
            subtitleLabel.backgroundColor = UIColor(white: 1.0, alpha: 0.0)
        } else {
            subtitleLabel.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
    }
    
    func setUpWith(_ item: Quiz) {
        titleLabel.text = item.title
        subtitleLabel.text = item.content
        if item.result > 0.0 {
            summaryLabel.text = "Twój ostatni wynik to \(Int(item.result))%"
        } else if item.progress > 0 {
            summaryLabel.text = "Odpowiedziałeś na \(item.progress) z \(item.questionsCount) pytań!"
        } else {
            summaryLabel.text = "Dołącz do \(item.resultCount) osób które rozwiązały Quiz!"
        }
        bgImage.setUpImage(with: item.imageUrl)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bgImage)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(subtitleLabel)
        
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(summaryLabel)
        
        NSLayoutConstraint.activate([
            bgImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bgImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bgImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            bgImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15.0),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15.0),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15.0),
            titleLabel.heightAnchor.constraint(equalToConstant: 52.0),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.0),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -(contentView.frame.width / 1.5)),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 144.0),
            
            summaryLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 15.0),
            summaryLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.85),
            summaryLabel.heightAnchor.constraint(equalToConstant: 24.0),
            summaryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
