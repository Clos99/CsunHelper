import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tblView: UITableView!
    
    let classData = ["0000", "0001", "0002", "0003", "0004", "1100", "1101", "1101A", "1101B", "1101C", "1101D", "1102", "1103", "1104", "1105", "1107", "1107A", "1108", "1109", "1109A", "1110", "1110A", "1101B", "1101C", "1111", "1112", "1113", "1115", "1116", "1116A", "1117", "1118", "1119", "1120", "1121", "1122", "1123", "1124", "1126", "1128", "1130", "1130A", "1132", "1134", "2210A", "2210B", "2210C", "3327", "3329", "3331", "3333", "3335", "4427", "4429", "4431"]
    
    var searchClass = [String]()
    
    var searching = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchClass.count
        }
        else {
            
        return classData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell")
        if searching {
            cell?.textLabel?.text = searchClass[indexPath.row]
        }
        else{
            cell?.textLabel?.text = classData[indexPath.row]
        }
        return cell!
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //Matches the ongoing search input with data
        searchClass = classData.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tblView.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tblView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
