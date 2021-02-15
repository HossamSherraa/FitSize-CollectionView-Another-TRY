//
//  ViewController.swift
//  FitSize
//
//  Created by Hossam on 2/21/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit


class myCell : UICollectionViewCell{
    lazy var width: NSLayoutConstraint = {
          let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
          width.isActive = true
          return width
      }()
    
    
    let image = UIImageView(image: UIImage(named: "0"))
    
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.contentView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false

      
        NSLayoutConstraint.activate([self.image.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor) ,
                                     self.image.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor) ,
                                    self.image.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                    self.image.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
                                   ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        
        self.width.constant = self.bounds.width
        
        return self.contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
    }
    
    
    
}
class ViewController: UIViewController , UICollectionViewDataSource {
    
    var layout : UICollectionViewFlowLayout = {
        let lay = UICollectionViewFlowLayout()
        
     
      
        
        lay.scrollDirection = .vertical
        return lay
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        FakeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! myCell
        
        return cell
    }
    
    
    override func loadView() {
        super.loadView()
        self.view = {
            let v = UICollectionView(frame:UIScreen.main.bounds, collectionViewLayout: layout)
            v.dataSource = self
            v.backgroundColor = .green
            return v
        }()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let collection = self.view as? UICollectionView {
            collection.register(myCell.self, forCellWithReuseIdentifier: "MyCell")
        }
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        layout.estimatedItemSize = .init(width: self.view.bounds.width, height: 1)
        
    }

}

