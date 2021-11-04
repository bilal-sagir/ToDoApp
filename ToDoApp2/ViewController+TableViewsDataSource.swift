import UIKit

extension ViewController
{
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    
    }
    
    override func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String?
    {
        if section == 0
        {
            return "Yapılacak İşler"
            
        }
        else
        {
            return "Bitirilmiş işler"
        }
        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0
        {
            return ActiveItems.count
        }
        else
        {
            return DoneItems.count
            
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        
        
        //let thisItem = AppData.items[indexPath.row]
        
        var thisItem = Item ()
        if indexPath.section == 0
        {
            thisItem = ActiveItems[indexPath.row]
        }
        else
        {
            thisItem = DoneItems[indexPath.row]
        }
        
        
        
        
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: thisItem.name)
        
        if thisItem.status
        {
            cell.backgroundColor = .lightGray
            cell.accessoryType = .checkmark
            
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                         value: 2,
                                         range: NSRange(location: 0,
                                                        length: attributeString.length))
            
        }
        else
        {
            cell.backgroundColor = .white
            cell.accessoryType = .none
            
            attributeString.removeAttribute(NSAttributedString.Key.strikethroughStyle,
                                            range: NSRange(location: 0,
                                                           length: attributeString.length))
        
        }
        cell.textLabel?.attributedText = attributeString
        return cell
    }

}

