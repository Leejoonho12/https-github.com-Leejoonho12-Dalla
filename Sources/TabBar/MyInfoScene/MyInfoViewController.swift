import Foundation
import UIKit

class MyInfoViewController: UIViewController {
    
    @IBOutlet weak var myInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myInfoLabel.text = "myInfoScene"
        barItemSet()
    }
    
    private func barItemSet() {
        if let tabBarItem = tabBarItem {
            tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        }
    }
}
