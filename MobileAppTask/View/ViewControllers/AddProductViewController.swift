//
//  AddProductViewController.swift
//  MobileAppTask
//
//  Created by Omar Ahmed on 21/04/2022.
//

import UIKit

class AddProductViewController: UIViewController {

    @IBOutlet weak var productNameTxtField: UITextField!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var myCollectionView: UICollectionView!
    var productsArray : [Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.register(UINib(nibName: "AddProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AddProductCollectionViewCell")
        self.hideKeyboardWhenTappedAround()
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }
    
    
    @IBAction func AddProductAction(_ sender: Any) {
        let newProduct = Product(name: productNameTxtField.text, image: "")
        productsArray.append(newProduct)
        self.myCollectionView.reloadData()
        productNameTxtField.text = ""
    }
    
    
    @IBAction func DoneAction(_ sender: Any) {
        
        let newProduct = Product(name: productNameTxtField.text, image: "")
        productsArray.append(newProduct)
        self.myCollectionView.reloadData()
        productNameTxtField.text = ""
        animateButton(button: doneBtn)
    }
}


extension AddProductViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
        
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productsArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddProductCollectionViewCell", for: indexPath) as! AddProductCollectionViewCell
        
        cell.removeProduct = {
            self.productsArray.remove(at: indexPath.row)
            collectionView.reloadData()
        }
        
        cell.prodName.text = productsArray[indexPath.row].name
        
        return cell
    }
    
    
    
}
