import Foundation


class Item: NSObject, NSCoding
{
    var name: String!
    var status: Bool!
    
    override init(){
    }
    
    init(name: String, status: Bool){
        self.name = name
        self.status = status
    }
    
    
    func encode(with coder: NSCoder) {
        coder.encode(self.name, forKey: "name")
        coder.encode(self.status.string, forKey: "status")
    }
    
    required convenience init?(coder: NSCoder)
    {
        let name = coder.decodeObject(forKey: "name") as! String
        let status = coder.decodeObject(forKey: "status") as! String
        
        self.init(name: name, status: status.bool)
    }
}
