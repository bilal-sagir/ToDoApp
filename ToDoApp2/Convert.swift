import Foundation

extension String
{
    var bool: Bool
    {
        switch self.lowercased()
        {
        case "true", "yes":
            return true
        default:
            return false
        }
    }
}

extension Bool
{
    var string: String
    {
        if self == true
        {
            return "true"
        }
        else
        {
            return "false"
        }
    }
}
