//
//  Copyright (C) DB Systel GmbH.
//
//  Permission is hereby granted, free of charge, to any person obtaining a 
//  copy of this software and associated documentation files (the "Software"), 
//  to deal in the Software without restriction, including without limitation 
//  the rights to use, copy, modify, merge, publish, distribute, sublicense, 
//  and/or sell copies of the Software, and to permit persons to whom the 
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in 
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
//  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
//  DEALINGS IN THE SOFTWARE.
//

import Foundation

public struct Location {
    public let latitude: Double
    public let longitude: Double
}

public struct Train {
    public let id: String
    public let name: String
    public let location: Location
    
}

public func parse(data: Data) -> [Train] {
    let array = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [Any]
    
    let values = array[1] as! [[String: Any]]
    
    return values.map { value in
        
        let m = value["m"] as! [[String: Any]]
        let first = m[0]
        let trains = first["trains"] as! [[String: String]]
        let name = trains[0]["n"]!
        let id = trains[0]["id"]!
        
        
        let longitude = Double(value["x"] as! String)! / 1000000
        let latitude = Double(value["y"] as! String)! / 1000000
        
        
        let location = Location(latitude: latitude, longitude: longitude)
        return Train(id: id, name: name, location: location)
    }
    
    
}

