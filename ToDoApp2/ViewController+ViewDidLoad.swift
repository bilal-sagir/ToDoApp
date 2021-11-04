import UIKit

extension ViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        AppData.populate()
        itemSeperator()
        
        self.tableView.tableHeaderView = headerView
        self.TxtField.delegate = self
        self.TxtField.autocapitalizationType = .words
        
        
    }
}

