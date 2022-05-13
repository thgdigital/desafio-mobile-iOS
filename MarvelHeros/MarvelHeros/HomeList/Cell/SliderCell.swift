//
//  SliderCell.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 13/05/22.
//

import UIKit

class SliderCell: CollectionViewCell {
    
    var dataTask: URLSessionDataTask?
    let session = URLSession.shared
    
    override func setupView() {
        backgroundColor = .white
        addSubview(imagemView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    override func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imagemView.topAnchor.constraint(equalTo: topAnchor),
            imagemView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imagemView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imagemView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imagemView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    lazy var imagemView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .green
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkText
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        descriptionLabel.text = ""
        imagemView.image = nil
    }
    
    func configure(display: ComicCharacterEntenty) {
        titleLabel.text = display.name
        descriptionLabel.text = display.textDescription
        if let url = URL(string: display.image) {
            downloadImage(from: url)
        }
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.imagemView.image = UIImage(data: data)
                self.layoutIfNeeded()
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()){
        dataTask = session.dataTask(with: url, completionHandler: completion)
        dataTask?.resume()
    }
}
