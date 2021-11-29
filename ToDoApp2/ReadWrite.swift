import Foundation

class ReadWrite
{
    static let docsUrl = try! FileManager.default.url(for: .documentDirectory,
                                                  in: .userDomainMask,
                                                  appropriateFor: nil,
                                                  create: false)
    
    static let dataFile = docsUrl.appendingPathComponent("to_do.plist")
    
    
    class func write()
    {
        guard let items = AppData.items else {return}
        
        do
        {
            let archiver = try NSKeyedArchiver.archivedData(withRootObject: items,
                                                            requiringSecureCoding: false)
            try archiver.write(to: dataFile)
        }
        catch
        {
            print(error)
        }
    }
    
    
    
    
    class func read()
    {
        
    }
}
