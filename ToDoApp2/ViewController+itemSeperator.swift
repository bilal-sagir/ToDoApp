import Foundation

extension ViewController
{
    func itemSeperator()
    {
        for item in AppData.items
        {
            if item.status
            {
                DoneItems.append(item)
            }
            else
            {
                ActiveItems.append(item)
            }
        }
    }
    
}

