import UIKit

extension ViewController
{
    override func tableView(_ tableView: UITableView,
                            canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath)
    {
        if editingStyle != .delete{return}
        
        var item = Item ()
        if indexPath.section == 0
        {
            item = ActiveItems[indexPath.row]
            ActiveItems.remove(at: indexPath.row)
        }
        else
        {
            item = DoneItems[indexPath.row]
            DoneItems.remove(at: indexPath.row)
            
        }
        
        for i in 0..<AppData.items.count
        {
            let itemInAppdata = AppData.items[i]
            if (itemInAppdata.name == item.name )
            {
                AppData.items.remove(at: i)
                break
            }
        }
        
        
        
        //AppData.items.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        var item = Item()
        
        if indexPath.section == 0
        {
            item = ActiveItems[indexPath.row]
            item.status = !item.status
            ActiveItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
            DoneItems.append(item)
            let newIndexPath = IndexPath(row: DoneItems.count - 1 , section: 1)
            tableView.insertRows(at: [newIndexPath], with: UITableView.RowAnimation.right)
        }
        else
        {
            
            item = DoneItems[indexPath.row]
            item.status = !item.status
            DoneItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
            ActiveItems.append(item)
            let newIndexPath = IndexPath(row: ActiveItems.count - 1 , section: 0)
            tableView.insertRows(at: [newIndexPath], with: UITableView.RowAnimation.right)
        }
        
        for i in 0..<AppData.items.count
        {
            let itemInAppdata = AppData.items[i]
            if (itemInAppdata.name == item.name )
            {
                AppData.items[i] = item
            }
        }
        
        //AppData.items[indexPath.row].status = !AppData.items[indexPath.row].status
        //tableView.reloadData()
    }
    
}
