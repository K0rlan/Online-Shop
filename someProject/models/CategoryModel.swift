//
//  CategoryModel.swift
//  someProject
//
//  Created by Koko on 10/27/20.
//

import Foundation
import ObjectMapper

class CategoryResponse : NSObject, NSCoding, Mappable{

    var data : [DataCategory]?


    class func newInstance(map: Map) -> Mappable?{
        return CategoryResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        data <- map["data"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         data = aDecoder.decodeObject(forKey: "data") as? [DataCategory]

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if data != nil{
            aCoder.encode(data, forKey: "data")
        }

    }

}
class DataCategory : NSObject, NSCoding, Mappable{

    var alias : String?
    var categories : [Category]?
    var createdAt : AnyObject?
    var deletedAt : AnyObject?
    var descriptionField : AnyObject?
    var id : Int?
    var image : String?
    var keyword : AnyObject?
    var name : String?
    var parentId : AnyObject?
    var updatedAt : AnyObject?


    class func newInstance(map: Map) -> Mappable?{
        return DataCategory()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        alias <- map["alias"]
        categories <- map["categories"]
        createdAt <- map["created_at"]
        deletedAt <- map["deleted_at"]
        descriptionField <- map["description"]
        id <- map["id"]
        image <- map["image"]
        keyword <- map["keyword"]
        name <- map["name"]
        parentId <- map["parent_id"]
        updatedAt <- map["updated_at"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         alias = aDecoder.decodeObject(forKey: "alias") as? String
         categories = aDecoder.decodeObject(forKey: "categories") as? [Category]
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? AnyObject
         deletedAt = aDecoder.decodeObject(forKey: "deleted_at") as? AnyObject
         descriptionField = aDecoder.decodeObject(forKey: "description") as? AnyObject
         id = aDecoder.decodeObject(forKey: "id") as? Int
         image = aDecoder.decodeObject(forKey: "image") as? String
         keyword = aDecoder.decodeObject(forKey: "keyword") as? AnyObject
         name = aDecoder.decodeObject(forKey: "name") as? String
         parentId = aDecoder.decodeObject(forKey: "parent_id") as? AnyObject
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? AnyObject

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if alias != nil{
            aCoder.encode(alias, forKey: "alias")
        }
        if categories != nil{
            aCoder.encode(categories, forKey: "categories")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if deletedAt != nil{
            aCoder.encode(deletedAt, forKey: "deleted_at")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if keyword != nil{
            aCoder.encode(keyword, forKey: "keyword")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if parentId != nil{
            aCoder.encode(parentId, forKey: "parent_id")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }

    }

}
class Category : NSObject, NSCoding, Mappable{

    var alias : String?
//    var categories : [AnyObject]?
    var createdAt : AnyObject?
    var deletedAt : AnyObject?
    var descriptionField : AnyObject?
    var id : Int?
    var image : String?
    var keyword : AnyObject?
    var name : String?
    var parentId : Int?
    var updatedAt : AnyObject?
    var categories : [Category]?


    class func newInstance(map: Map) -> Mappable?{
        return Category()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        alias <- map["alias"]
        categories <- map["categories"]
        createdAt <- map["created_at"]
        deletedAt <- map["deleted_at"]
        descriptionField <- map["description"]
        id <- map["id"]
        image <- map["image"]
        keyword <- map["keyword"]
        name <- map["name"]
        parentId <- map["parent_id"]
        updatedAt <- map["updated_at"]
        categories <- map["categories"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         alias = aDecoder.decodeObject(forKey: "alias") as? String
//         categories = aDecoder.decodeObject(forKey: "categories") as? [AnyObject]
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? AnyObject
         deletedAt = aDecoder.decodeObject(forKey: "deleted_at") as? AnyObject
         descriptionField = aDecoder.decodeObject(forKey: "description") as? AnyObject
         id = aDecoder.decodeObject(forKey: "id") as? Int
         image = aDecoder.decodeObject(forKey: "image") as? String
         keyword = aDecoder.decodeObject(forKey: "keyword") as? AnyObject
         name = aDecoder.decodeObject(forKey: "name") as? String
         parentId = aDecoder.decodeObject(forKey: "parent_id") as? Int
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? AnyObject
         categories = aDecoder.decodeObject(forKey: "categories") as? [Category]

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if alias != nil{
            aCoder.encode(alias, forKey: "alias")
        }
        if categories != nil{
            aCoder.encode(categories, forKey: "categories")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if deletedAt != nil{
            aCoder.encode(deletedAt, forKey: "deleted_at")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if keyword != nil{
            aCoder.encode(keyword, forKey: "keyword")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if parentId != nil{
            aCoder.encode(parentId, forKey: "parent_id")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if categories != nil{
            aCoder.encode(categories, forKey: "categories")
        }

    }

}
