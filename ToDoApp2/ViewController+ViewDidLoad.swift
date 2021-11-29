import UIKit

extension ViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        let defaults = UserDefaults.standard
        
        if defaults.object(forKey: "firstUse") == nil
        {
            defaults.set(true, forKey: "firstUse")
            defaults.synchronize()
            AppData.populate()
            
            ReadWrite.write()
        }
        else
        {
            ReadWrite.read()
        }
        
        
        itemSeperator()
        
        self.tableView.tableHeaderView = headerView
        self.TxtField.delegate = self
        self.TxtField.autocapitalizationType = .words
        
        
    }
}

