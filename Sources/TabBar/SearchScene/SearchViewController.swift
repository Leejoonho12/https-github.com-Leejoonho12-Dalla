import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchLabel.text = "searchScene"
        barItemSet()
    }
    
    private func barItemSet() {
        if let tabBarItem = tabBarItem {
            tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        }
    }
}
