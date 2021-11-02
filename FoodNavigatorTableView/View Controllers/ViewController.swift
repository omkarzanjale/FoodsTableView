//
//  ViewController.swift
//  FoodNavigatorTableView
//
//  Created by Mac on 01/09/21.
//
/*
 Program - display food with two types snacks and lunch on two different cells alternatively on cell action navigate to another page with data and also show recent selected food on home page.
 */

import UIKit

class ViewController: UIViewController {
    //
    //  MARK: Outlets
    //
    @IBOutlet weak var foodView : UITableView!
    @IBOutlet weak var passedDataLabel : UILabel!
    @IBOutlet weak var selectedOrderTextField: UITextField!
    
    var editOrderData : String?
    var foodNames = ["Poha","Dal-Tadka","Upma","Paneer-Tikka","Idli","Biryani"]
    var hotelNames = ["Gurukul","Lake-View","Vista","Pavalian-Hotel","Rajmudra","P.K","Swarg","Test"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.foodView.dataSource = self
        self.foodView.delegate = self
        selectedOrderTextField.delegate = self
        foodView.tableFooterView = UIView()
        let nibFile = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.foodView?.register(nibFile, forCellReuseIdentifier: "CustomTableViewCell")
    }
}
//
//  MARK: UITableViewDataSource
//
extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        foodNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.foodView.backgroundColor = .blue
        if indexPath.row % 2 == 0{
            if let cell = foodView?.dequeueReusableCell(withIdentifier: "cell", for: indexPath) {
                cell.textLabel?.text = foodNames[indexPath.row]
                return cell
            } else {
                return UITableViewCell()
            }
        }else{
            if let cell = foodView?.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)as? CustomTableViewCell {
                    let lunchFoodNames = foodNames[indexPath.row]
                    cell.foodNameLabel.text = lunchFoodNames
                    cell.HotelNameLabel.text = hotelNames[indexPath.row]
                    return cell
            } else {
                return UITableViewCell()
            }
        }
    }
}
//
//  MARK: UITableViewDelegate
//
extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row%2==0 {
            if let VC2 = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
                VC2.food = foodNames[indexPath.row]
                VC2.type = "Snacks"
                VC2.delegateProtocolVar = self
                self.navigationController?.pushViewController(VC2, animated:true)
            }
        }else{
            navigate(foodNames[indexPath.row],hotelNames[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
    
    private func navigate(_ foodName: String,_ hotelName: String) {
        if let VC2 = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            VC2.food = foodName
            VC2.hotel = hotelName
            VC2.type = "Lunch"
            VC2.delegateProtocolVar = self
            self.navigationController?.pushViewController(VC2, animated:true)
        }
    }
}
//
//  MARK: UITextFieldDelegate
//
extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        false
    }
}
//
//  MARK: SecondVCProtocol
//
extension ViewController:SecondVCProtocol {
    
    func DataFromVC2(_ dataFromVC2: String) {
        passedDataLabel.text = dataFromVC2
    }
}
