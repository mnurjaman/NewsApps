//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Muhammad Nurjaman on 06/11/24.
//

import UIKit

class NewsTableViewCellViewModel {
    let title: String
    let subtitle: String
    let imageURL: URL?
    var imageData: Data? = nil
    
    init(title: String, subtitle: String, imageURL: URL?) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
    }
}

class NewsTableViewCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"
    
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .darkGray
        return label
    }()
    
    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(newsTitleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(newsImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Define padding and image size
        let padding: CGFloat = 10
        let imageSize: CGFloat = contentView.frame.size.height - (2 * padding)
        
        // Image View Frame
        newsImageView.frame = CGRect(
            x: contentView.frame.size.width - imageSize - padding,
            y: padding,
            width: imageSize,
            height: imageSize
        )
        
        // Title Label Frame
        let titleWidth = contentView.frame.size.width - imageSize - 3 * padding
        let titleHeight = newsTitleLabel.sizeThatFits(CGSize(width: titleWidth, height: CGFloat.greatestFiniteMagnitude)).height
        newsTitleLabel.frame = CGRect(
            x: padding,
            y: padding,
            width: titleWidth,
            height: min(titleHeight, 44) // Limit to 2 lines
        )
        
        // Subtitle Label Frame
        let subtitleTop = newsTitleLabel.frame.maxY + 4
        let subtitleHeight = subtitleLabel.sizeThatFits(CGSize(width: titleWidth, height: CGFloat.greatestFiniteMagnitude)).height
        subtitleLabel.frame = CGRect(
            x: padding,
            y: subtitleTop,
            width: titleWidth,
            height: min(subtitleHeight, 60) // Limit to 3 lines
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsTitleLabel.text = nil
        subtitleLabel.text = nil
        newsImageView.image = nil
    }
    
    func configure(with viewModel: NewsTableViewCellViewModel) {
        newsTitleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        
        // Set image
        if let data = viewModel.imageData {
            newsImageView.image = UIImage(data: data)
        } else if let url = viewModel.imageURL {
            // Fetch image data asynchronously
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else { return }
                viewModel.imageData = data
                DispatchQueue.main.async {
                    self?.newsImageView.image = UIImage(data: data)
                }
            }.resume()
        }
    }
}
