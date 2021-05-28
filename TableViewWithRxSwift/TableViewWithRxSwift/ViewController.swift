//
//  ViewController.swift
//  TableViewWithRxSwift
//
//  Created by Akshay Nandane on 25/05/21.
//  Copyright © 2021 com.app.connectme. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    var personArray = [
        person(name: "Ram", age: 28),
        person(name: "Akshay", age: 28),
        person(name: "Ashwin", age: 27),
        person(name: "Sonu", age: 27),
    ]
    
    var arrayName = ["Ram","Akshay","Ashwin","Sonu"]
    var searchedName: [String] = []
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Observable for objectArray is created
        let objArray: Observable<[String]> = Observable.just(arrayName)
        
        searchBar.rx.text
        .orEmpty
        .distinctUntilChanged()
        .debug()
        .bind(onNext: {query in
            self.arrayName = self.arrayName.filter {query1 in
                query1.hasPrefix(query)
                
            }
            print("arrayName : \(self.arrayName)")
        })
        .disposed(by: disposeBag)
        
        
        
        objArray.bind(to: tableView.rx.items(cellIdentifier: "TableViewCell")) {_,person,cell in
            
            if let cellToUse = cell as? TableViewCell{
                cellToUse.label1.text = person
                //                cellToUse.label2.text = "\(person.age)"
            }
        }.disposed(by: disposeBag)
        
        
        //On Tap of table View cell handled
//        tableView.rx.modelSelected(person.self).subscribe(onNext: { person in
//            print("Person: \(person)")
//        })
        
        //On tap change the cell content
        tableView.rx.itemSelected.subscribe(onNext: { indexPath in
            if let cell = self.tableView.cellForRow(at: indexPath) as? TableViewCell{
                cell.label1.text = "New Value"
            }
        })
        
        
        
    }
    
    func searchText(){
        
    }
    


}

