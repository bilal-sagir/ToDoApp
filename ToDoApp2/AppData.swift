import Foundation

class AppData
{
    static var items: Array<Item>!
    
    class func populate()
    {
        
        let item1 = Item(name: "Yapıldı Olarak İşaretlemek İçin Üstüne Bas", status: false)
        let item2 = Item(name: "Silmek İçin Sola Çek", status: false)
        let item3 = Item(name: "Su Al", status: true)
        let item4 = Item(name: "Aliyi Ara", status: true)
        let item5 = Item(name: "Elektrik Öde", status: true)
        let item6 = Item(name: "Ödevleri Yap", status: true)
        
        items = [item1, item2, item3, item4, item5, item6]
    }

}
