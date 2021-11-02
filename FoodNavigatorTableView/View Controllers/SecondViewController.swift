//
//  SecondViewController.swift
//  FoodNavigatorTableView
//
//  Created by Mac on 01/09/21.
//

import UIKit

protocol SecondVCProtocol: class {
    
    func DataFromVC2(_ dataFromVC2:String)
}

class SecondViewController: UIViewController {
    //
    //  MARK: Outlets
    //
    @IBOutlet weak var secondView : UITableView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var HotelNameLabel: UILabel!
    
    weak var delegateProtocolVar : SecondVCProtocol?
    var food : String?
    var hotel : String?
    var type : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodNameLabel.text = food
        typeLabel.text = type
        if hotel == nil{
            HotelNameLabel.isHidden = true
        }else{
            HotelNameLabel.text = hotel
        }
    }
    
    @IBAction func selectBtnAction(){
        if let food = food {
            delegateProtocolVar?.DataFromVC2(food)
            navigationController?.popViewController(animated: true)
        } else {
            print("food name is nil!!!")
        }
       
    }
}
