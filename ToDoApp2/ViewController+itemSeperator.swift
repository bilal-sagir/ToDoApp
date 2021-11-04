import UIKit

extension ViewController
{
    func itemSeperator()
    {
        for item in AppData.items
        {
            if item.status
            {
                ActiveItems.append(item)
            }
            else
            {
                DoneItems.append(item)
            }
        }
    }
    
}

