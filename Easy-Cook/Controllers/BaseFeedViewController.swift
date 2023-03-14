//
//  BaseVC.swift
//  Easy-cook


import UIKit

struct Cells {
    static let recieptCell = "TableViewPrototypeCell"
}

class BaseFeedViewController: UIViewController{
   
    var tableView = UITableView()
    var reciepts: [ShowableInCustomCell] = []
    
    // Override 2 methods to dismiss empty space in a top of Table view (this space auto creates for navigationBar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // Change size of MainTableViewTitle View box.
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           if section == 0 {
               return CGFloat(45)
           }
           return tableView.sectionHeaderHeight
       }
    
    func configureTableView() {
        view.addSubview(tableView)
        //set delegates
        setTableViewDelegates()
        //set row heigt
        tableView.rowHeight = 240
        //register cells
        tableView.register(TableViewPrototypeCell.self, forCellReuseIdentifier: Cells.recieptCell)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
  
 
    
}

// MARK: - Extension (Delegate and DataSource)
extension BaseFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Here we setup how many rows do we wants to set up in table view ( Its should be equal to API Request of reciepts.count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return reciepts.count
    }
    
    // Shows which kind of default cell prototype do we set up
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.recieptCell) as! TableViewPrototypeCell
        let recieptsList = reciepts[indexPath.row]
        cell.set(recieptList: recieptsList)
        
        cell.recieptLikeButton.setItem(item: reciepts[indexPath.row])
        cell.recieptLikeButton.updateApperance()
        return cell
    }
    // this method will run when the user click at row (so we will open segue)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(reciepts[indexPath.row].id)
        present(RecipeViewController(reciepts[indexPath.row].id), animated: true, completion: nil)
    }

}
