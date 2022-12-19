//
//  PreviewPage.swift
//  lesson 4
//
//  Created by Lashaun Corinna on 12/13/22.
//

import UIKit

private let reuseIdentifier = "ArtCover"

class PreviewPage: UICollectionViewController {

    
    let imageNameArray = ["Phao 2 Phut Hon - James Edhan",
                          "I Knew You Were Trouble - Taylor Swift",
                          "Summer Days - Calvin Sparks",
                          "In Da Club - 50 Cent",
                          "Anymore - Monista",
                          "Take My Love - Plazma",
                          "Maniac - Michael Sembello",
                          "Forgiven - Sylver",
                          "Hensonn — Sahara",
                          "Call Me - plenka"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNameArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCoverCell
        cell.coverImageView.image = UIImage(named: imageNameArray[indexPath.row])
        return cell
    }
}

extension PreviewPage: UICollectionViewDelegateFlowLayout
{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
       return CGSize(width: 100.0, height: 100.0)
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            vc.trackTitle = imageNameArray[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
