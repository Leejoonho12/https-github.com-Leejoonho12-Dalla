import Foundation
import UIKit

class PlusViewController: UIViewController {
    
    @IBOutlet weak var plusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plusLabel.text = "plusScene"
        barItemSet()
    }
    
    private func barItemSet() {
        if let tabBarItem = tabBarItem {
            tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
            tabBarItem.image = tabBarItem.image?.withRenderingMode(.alwaysOriginal)
        }
    }
}
