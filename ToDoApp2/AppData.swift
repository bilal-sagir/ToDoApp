import Foundation

class AppData
{
    static var items: Array<Item>!
    
    class func populate()
    {
        
        let item1 = Item(name: "arabayı yıka", status: true)
        let item2 = Item(name: "ekmek al", status: false)
        let item3 = Item(name: "su al", status: true)
        let item4 = Item(name: "aliyi ara", status: false)
        let item5 = Item(name: "elektrik öde", status: false)
        let item6 = Item(name: "ödevleri yap", status: true)
        
        items = [item1, item2, item3, item4, item5, item6]
    }

}
