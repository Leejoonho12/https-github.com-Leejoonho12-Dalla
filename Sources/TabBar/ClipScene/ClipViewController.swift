import Foundation
import UIKit

class ClipViewController: UIViewController {
    
    @IBOutlet weak var clipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clipLabel.text = "clipScene"
        barItemSet()
    }
    
    private func barItemSet() {
        if let tabBarItem = tabBarItem {
            tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        }
    }
}
