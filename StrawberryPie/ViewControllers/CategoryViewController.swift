//
//  CategoryViewController.swift
//  StrawberryPie
//
//  Created by Arttu Jokinen on 23/11/2019.
//  Copyright © 2019 Team Työkkäri. All rights reserved.
//  This class handles the Category view. Uses Category+CoreDataClass as its model

import UIKit
import CoreData

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var category = Category()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        category.deleteAllData(entity: "Category")
        category.generateData()
        category.getCategoryData(name: "Social Sectors")
        let test = category.getEntity(name: "ICT")
        print(test[0].value(forKey: "categoryName") as! String)
        collectionView.dataSource = self
        collectionView.delegate = self
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 20)/2, height: self.collectionView.frame.size.height/6)
        self.view.backgroundColor = judasGrey()
        collectionView.backgroundColor = UIColor.clear
    }
    //The Amount of cells in the collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.getNames().count
    }
    //Sets up the collectionview
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryName = category.getNames()[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.categoryNameLabel.text = NSLocalizedString(categoryName, value: categoryName, comment: "Category name")
        cell.categoryImageView.image = category.getImages()[indexPath.item] //category.getImages()[indexPath.item]
        //Adding some styling here
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.25
        cell.layer.cornerRadius = 10
        cell.categoryNameLabel.layer.masksToBounds = true
        cell.categoryNameLabel.layer.cornerRadius = 10
        cell.categoryNameLabel.layer.backgroundColor = UIColor(red: 0.0/255.0, green: 176.0/255.0, blue: 255.0/255.0, alpha: 0.8).cgColor
        return cell
    }
    //Select item and increases the gray border size to indicate selection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 3
        let selectedCategory = category.getNames()[indexPath.item]
        print(selectedCategory)
    }
    //Sends data over to CategoryContent 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ToCategoryContent"){
            let vc = segue.destination as? CategoryContentController
            let cell = sender as! CollectionViewCell
            let indexPaths = self.collectionView.indexPath(for: cell)
            let selected = self.category.getNames()[indexPaths!.item] as String
            //print(thisThing)
            vc?.topText = selected
            vc?.categoryObject = category.getEntity(name: selected)
        }
    }
    //Deselects the old item and removes its larger border
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 0.25
    }
}
