//
//  HomeViewController.swift
//  MobileAppTask
//
//  Created by Omar Ahmed on 20/04/2022.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {

    @IBOutlet weak var subCategoriesCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrayOfMovies : [Movie] = []
    let homeViewModel = HomeViewModel()
    var myTitleArr = ["Action" , "Comedy" , "Romantic" ,  "Horror" , "Sadness"]
    var mySubCategoryArr = ["All" , "Happy" , "Famous" ,  "Sad" , "Crazy","Hacking"]
    var lastIndexActive:IndexPath = [1 ,0]
    var lastIndexActive2:IndexPath = [1,0]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionsViews()
       
        collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductInCell")
        
        homeViewModel.bindSuccessToView = {
            self.onSuccess()
        }
        homeViewModel.bindFailedToView = { [self] in
            showAlertError(title: "Error", message: homeViewModel.error)
        }
    }
    
    
    func setUpCollectionsViews(){
//        categoriesCollectionView.delegate = self
//        categoriesCollectionView.dataSource = self
//        subCategoriesCollectionView.delegate = self
//        subCategoriesCollectionView.dataSource = self
        
        [categoriesCollectionView,subCategoriesCollectionView].forEach {
            $0?.delegate=self
            $0?.dataSource=self
        }
    }
    
    func onSuccess(){
        self.arrayOfMovies = homeViewModel.movies
        self.collectionView.reloadData()
    }

}



extension HomeViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView{
            return CGSize(width: self.view.frame.width*0.43, height: self.view.frame.width*0.6)
        }else if collectionView == self.categoriesCollectionView{
            return CGSize(width: self.view.frame.width*0.29, height: self.view.frame.width*0.6)
        }else{
            return CGSize(width: self.view.frame.width*0.23, height: self.view.frame.width*0.6)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView{
            return arrayOfMovies.count
        }else if collectionView == self.categoriesCollectionView {
            return myTitleArr.count
        }else {
            return mySubCategoryArr.count
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductInCell", for: indexPath) as! ProductCollectionViewCell
            
            cell.movieImageView.kf.indicatorType = .activity
            if let movieImage = arrayOfMovies[indexPath.row].image {
                cell.movieImageView.kf.setImage(with: URL(string: movieImage))
            }
            cell.movieNameLabel.text = arrayOfMovies[indexPath.row].title
            cell.movieReleaseYearLabel.text = "\(arrayOfMovies[indexPath.row].releaseYear ?? 0)"
            return cell
        }else if collectionView == self.categoriesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath as IndexPath) as! CategoriesCollectionViewCell

            cell.nameLabel.text = self.myTitleArr[indexPath.row]
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubcategoriesCollectionViewCell", for: indexPath as IndexPath) as! SubcategoriesCollectionViewCell

            cell.subCategoryName.text = self.mySubCategoryArr[indexPath.row]
            
            return cell
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.categoriesCollectionView {
            if self.lastIndexActive != indexPath {

                // change here
            let cell = collectionView.cellForItem(at: indexPath) as! CategoriesCollectionViewCell
            cell.nameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.viewCell.backgroundColor = #colorLiteral(red: 0.9194818139, green: 0.316909492, blue: 0.2418158352, alpha: 0.8284669586)
            cell.viewCell.layer.masksToBounds = true

            let cell1 = collectionView.cellForItem(at: self.lastIndexActive) as? CategoriesCollectionViewCell
            cell1?.nameLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell1?.viewCell.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
            cell1?.viewCell.layer.masksToBounds = true
            self.lastIndexActive = indexPath
        }
        }else {
            if self.lastIndexActive2 != indexPath {
            let cell = collectionView.cellForItem(at: indexPath) as! SubcategoriesCollectionViewCell
            cell.subCategoryName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

            let cell1 = collectionView.cellForItem(at: self.lastIndexActive2) as? SubcategoriesCollectionViewCell
            cell1?.subCategoryName.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            self.lastIndexActive2 = indexPath
        }
    }
}
}
