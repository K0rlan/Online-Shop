//
//  ProductInCategoryModel.swift
//  someProject
//
//  Created by Koko on 10/27/20.
//

import Foundation
import ObjectMapper

class ProductInCategoryResponse : NSObject, NSCoding, Mappable{

    var data : DataProductInCategory?


    class func newInstance(map: Map) -> Mappable?{
        return ProductInCategoryResponse()
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
         data = aDecoder.decodeObject(forKey: "data") as? DataProductInCategory

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
class DataProductInCategory : NSObject, NSCoding, Mappable{

    var alias : String?
    var categories : [AnyObject]?
    var createdAt : AnyObject?
    var deletedAt : AnyObject?
    var descriptionField : AnyObject?
    var id : Int?
    var image : String?
    var keyword : AnyObject?
    var name : String?
    var parentId : Int?
    var products : [ProductInCategory]?
    var updatedAt : AnyObject?


    class func newInstance(map: Map) -> Mappable?{
        return DataProductInCategory()
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
        products <- map["products"]
        updatedAt <- map["updated_at"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         alias = aDecoder.decodeObject(forKey: "alias") as? String
         categories = aDecoder.decodeObject(forKey: "categories") as? [AnyObject]
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? AnyObject
         deletedAt = aDecoder.decodeObject(forKey: "deleted_at") as? AnyObject
         descriptionField = aDecoder.decodeObject(forKey: "description") as? AnyObject
         id = aDecoder.decodeObject(forKey: "id") as? Int
         image = aDecoder.decodeObject(forKey: "image") as? String
         keyword = aDecoder.decodeObject(forKey: "keyword") as? AnyObject
         name = aDecoder.decodeObject(forKey: "name") as? String
         parentId = aDecoder.decodeObject(forKey: "parent_id") as? Int
         products = aDecoder.decodeObject(forKey: "products") as? [ProductInCategory]
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
        if products != nil{
            aCoder.encode(products, forKey: "products")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }

    }

}
class ProductInCategory : NSObject, NSCoding, Mappable{

    var alias : String?
    var brandId : Int?
    var content : AnyObject?
    var createdAt : AnyObject?
    var deletedAt : AnyObject?
    var descriptionField : AnyObject?
    var id : Int?
    var image : String?
    var isHit : Bool?
    var keywords : AnyObject?
    var name : String?
    var piecesLeft : Int?
    var pivot : Pivot?
    var price : Int?
    var status : String?
    var updatedAt : AnyObject?
    var volume : Int?
    var weight : Int?


    class func newInstance(map: Map) -> Mappable?{
        return ProductInCategory()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        alias <- map["alias"]
        brandId <- map["brand_id"]
        content <- map["content"]
        createdAt <- map["created_at"]
        deletedAt <- map["deleted_at"]
        descriptionField <- map["description"]
        id <- map["id"]
        image <- map["image"]
        isHit <- map["is_hit"]
        keywords <- map["keywords"]
        name <- map["name"]
        piecesLeft <- map["pieces_left"]
        pivot <- map["pivot"]
        price <- map["price"]
        status <- map["status"]
        updatedAt <- map["updated_at"]
        volume <- map["volume"]
        weight <- map["weight"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         alias = aDecoder.decodeObject(forKey: "alias") as? String
         brandId = aDecoder.decodeObject(forKey: "brand_id") as? Int
         content = aDecoder.decodeObject(forKey: "content") as? AnyObject
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? AnyObject
         deletedAt = aDecoder.decodeObject(forKey: "deleted_at") as? AnyObject
         descriptionField = aDecoder.decodeObject(forKey: "description") as? AnyObject
         id = aDecoder.decodeObject(forKey: "id") as? Int
         image = aDecoder.decodeObject(forKey: "image") as? String
         isHit = aDecoder.decodeObject(forKey: "is_hit") as? Bool
         keywords = aDecoder.decodeObject(forKey: "keywords") as? AnyObject
         name = aDecoder.decodeObject(forKey: "name") as? String
         piecesLeft = aDecoder.decodeObject(forKey: "pieces_left") as? Int
         pivot = aDecoder.decodeObject(forKey: "pivot") as? Pivot
         price = aDecoder.decodeObject(forKey: "price") as? Int
         status = aDecoder.decodeObject(forKey: "status") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? AnyObject
         volume = aDecoder.decodeObject(forKey: "volume") as? Int
         weight = aDecoder.decodeObject(forKey: "weight") as? Int

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
        if brandId != nil{
            aCoder.encode(brandId, forKey: "brand_id")
        }
        if content != nil{
            aCoder.encode(content, forKey: "content")
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
        if isHit != nil{
            aCoder.encode(isHit, forKey: "is_hit")
        }
        if keywords != nil{
            aCoder.encode(keywords, forKey: "keywords")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if piecesLeft != nil{
            aCoder.encode(piecesLeft, forKey: "pieces_left")
        }
        if pivot != nil{
            aCoder.encode(pivot, forKey: "pivot")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if volume != nil{
            aCoder.encode(volume, forKey: "volume")
        }
        if weight != nil{
            aCoder.encode(weight, forKey: "weight")
        }

    }

}
class Pivot : NSObject, NSCoding, Mappable{

    var categoryId : Int?
    var id : Int?
    var productId : Int?


    class func newInstance(map: Map) -> Mappable?{
        return Pivot()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        categoryId <- map["category_id"]
        id <- map["id"]
        productId <- map["product_id"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         categoryId = aDecoder.decodeObject(forKey: "category_id") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         productId = aDecoder.decodeObject(forKey: "product_id") as? Int

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if categoryId != nil{
            aCoder.encode(categoryId, forKey: "category_id")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if productId != nil{
            aCoder.encode(productId, forKey: "product_id")
        }

    }

}
