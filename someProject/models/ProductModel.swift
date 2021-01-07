//
//  ProductModel.swift
//  someProject
//
//  Created by Koko on 10/27/20.
//

import Foundation
import ObjectMapper

class ProductClass : NSObject, NSCoding, Mappable{

    var products : [Data]?
    var links : Link?
    var meta : Meta?


    class func newInstance(map: Map) -> Mappable?{
        return ProductClass()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        products <- map["data"]
        links <- map["links"]
        meta <- map["meta"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
        products = aDecoder.decodeObject(forKey: "products") as? [Data]
         links = aDecoder.decodeObject(forKey: "links") as? Link
         meta = aDecoder.decodeObject(forKey: "meta") as? Meta

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if products != nil{
            aCoder.encode(products, forKey: "data")
        }
        if links != nil{
            aCoder.encode(links, forKey: "links")
        }
        if meta != nil{
            aCoder.encode(meta, forKey: "meta")
        }

    }

}
class Data : NSObject, NSCoding, Mappable{

    var alias : String?
    var brandId : AnyObject?
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
    var price : Int?
    var status : String?
    var updatedAt : AnyObject?


    class func newInstance(map: Map) -> Mappable?{
        return Data()
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
        price <- map["price"]
        status <- map["status"]
        updatedAt <- map["updated_at"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         alias = aDecoder.decodeObject(forKey: "alias") as? String
         brandId = aDecoder.decodeObject(forKey: "brand_id") as? AnyObject
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
         price = aDecoder.decodeObject(forKey: "price") as? Int
         status = aDecoder.decodeObject(forKey: "status") as? String
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
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }

    }

}
class Link : NSObject, NSCoding, Mappable{

    var first : String?
    var last : String?
    var next : String?
    var prev : AnyObject?


    class func newInstance(map: Map) -> Mappable?{
        return Link()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        first <- map["first"]
        last <- map["last"]
        next <- map["next"]
        prev <- map["prev"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         first = aDecoder.decodeObject(forKey: "first") as? String
         last = aDecoder.decodeObject(forKey: "last") as? String
         next = aDecoder.decodeObject(forKey: "next") as? String
         prev = aDecoder.decodeObject(forKey: "prev") as? AnyObject

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if first != nil{
            aCoder.encode(first, forKey: "first")
        }
        if last != nil{
            aCoder.encode(last, forKey: "last")
        }
        if next != nil{
            aCoder.encode(next, forKey: "next")
        }
        if prev != nil{
            aCoder.encode(prev, forKey: "prev")
        }

    }

}
class Meta : NSObject, NSCoding, Mappable{

    var currentPage : Int?
    var from : Int?
    var lastPage : Int?
    var path : String?
    var perPage : Int?
    var to : Int?
    var total : Int?


    class func newInstance(map: Map) -> Mappable?{
        return Meta()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        currentPage <- map["current_page"]
        from <- map["from"]
        lastPage <- map["last_page"]
        path <- map["path"]
        perPage <- map["per_page"]
        to <- map["to"]
        total <- map["total"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         currentPage = aDecoder.decodeObject(forKey: "current_page") as? Int
         from = aDecoder.decodeObject(forKey: "from") as? Int
         lastPage = aDecoder.decodeObject(forKey: "last_page") as? Int
         path = aDecoder.decodeObject(forKey: "path") as? String
         perPage = aDecoder.decodeObject(forKey: "per_page") as? Int
         to = aDecoder.decodeObject(forKey: "to") as? Int
         total = aDecoder.decodeObject(forKey: "total") as? Int

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if currentPage != nil{
            aCoder.encode(currentPage, forKey: "current_page")
        }
        if from != nil{
            aCoder.encode(from, forKey: "from")
        }
        if lastPage != nil{
            aCoder.encode(lastPage, forKey: "last_page")
        }
        if path != nil{
            aCoder.encode(path, forKey: "path")
        }
        if perPage != nil{
            aCoder.encode(perPage, forKey: "per_page")
        }
        if to != nil{
            aCoder.encode(to, forKey: "to")
        }
        if total != nil{
            aCoder.encode(total, forKey: "total")
        }

    }

}
