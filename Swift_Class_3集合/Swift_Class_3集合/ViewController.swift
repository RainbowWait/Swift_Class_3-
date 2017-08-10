//
//  ViewController.swift
//  Swift_Class_3集合
//
//  Created by 郑小燕 on 17/3/29.
//  Copyright © 2017年 郑小燕. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        [Int]
//        [String]
//        [value1,value2,value3]
        var someInt = [Int]()
//        var threeDoubles = [Double]()
//        var teachers:[String] = ["Mr. Wang","Mr. Liu"]//teachers用两个元素完成初始化
        var teachers = ["Mr. Wang","Mr. Liu"]
        
        var arrayCount = teachers.count
        print("teachers数组一共\(teachers.count)位老师")
        /*
         输出：teachers数组一共2位老师
         */
        
        teachers.append("Mr Zheng")
        
        teachers += ["Mr Yang"]
        teachers  += ["Mr Yu","Baby"]
        print("teacher.count = \(teachers.count)")
        for item in teachers {
            print(item)
        }
        /*
         输出：teacher.count = 6
         Mr. Wang
         Mr. Liu
         Mr Zheng
         Mr Yang
         Mr Yu
         Baby
         */
        teachers.insert("Angle", at: 3)
        for item in teachers {
            
            print("nick = \(item)")
        }
        /*
         输出：nick = Mr. Wang
         nick = Mr. Liu
         nick = Mr Zheng
         nick = Angle
         nick = Mr Yang
         nick = Mr Yu
         nick = Baby
         */
       let oneTeacher = teachers.remove(at: 4)
        print("oneTeacher = \(oneTeacher)")
        for item in teachers {
            
            print("teacher = \(item)")
        }
        /*
         输出:oneTeacher = Mr Yang
         teacher = Mr. Wang
         teacher = Mr. Liu
         teacher = Mr Zheng
         teacher = Angle
         teacher = Mr Yu
         */
        
        
        let deleteLastTeacher = teachers.removeLast()
        let deleteFirstTeacher = teachers.removeFirst()
        print(deleteLastTeacher,deleteFirstTeacher)
        
        //获取数组的一个元素可以使用下标语法。在数组名后面紧跟着的一对方括号中，传进去要取得的元素的索引值，数组第一元素的索引值为0，而不是1.Swift的数组是从0开始索引的。
        var firstItem = teachers[0]
        print("firstItem = \(firstItem)")
        //可是使用下标语法来改变给定索引的已存在的值
        teachers[0] = "Mr Gao"
        for item in teachers {
            print(item)
        }
        
        /*
         打印结果：Mr Gao
         Mr Zheng
         Angle
         Mr Yu
         */
        
        //当然也可以使用下标语法一次性改变指定范围的值，这里允许将要被替换掉的元素的数量和将要替换成的元素的数量不一样。下面的例子将数组1、2、3三个元素换乘了
        teachers[0...2] = ["HuiTong","Gaven"]
        for item in teachers {
            print("teacher = \(item)")
        }
        /*
         打印结果：
         teacher = HuiTong
         teacher = Gaven
         teacher = Mr Yu
         
         */
        
        //使用for-in循环来遍历所有数组中的数据项
        for item in teachers {
            
            print(item)
        }
        /*
         打印结果：
         HuiTong
         Gaven
         Mr Yu
         */
        
        //如果同时需要每个元素的值和小标值，可以使用全局enumerate函数进行数组遍历。
        for (index,value) in teachers.enumerated() {
            
            print("index = \(index),value = \(value)")
        }
        /*
         打印结果：
         index = 0,value = HuiTong
         index = 1,value = Gaven
         index = 2,value = Mr Yu
         */
        
        //2.2.2字典
        
        //字典表示一种非常复杂的集合，允许按照某个键来访问元素。字典是由两部分集合构成的，一个是键（key）集合，一个是值(value)集合。键集合是不能有重复元素的，而值集合是可以重复的，键和值是成对出现的。字典中键和值的集合是无序的，即便在添加的时候是按照顺序添加的，当取出这些键或值的时候，也会变得无序。
        
        var ariports : Dictionary<String, String>//创建一个String,String类型的空字典，它的键是String行，值是String型。
        var dic : Dictionary = ["key1" : "value1","key2" : "value2","key3" : "value3"]
        
        var namesOfItegers : Dictionary<String,NSNumber>  = [:]
        var languageDic = ["French":"fr","English":"en"]
        //字典的常见操作
        //对字典的存取与修改可以通过字典的方法和属性来进行，或者使用字典的key来操作
        //获取字典中包含数据项个数，可以通过点语法count。
        var dicCount = languageDic.count
        
        //可以在字典中使用下标语法来添加新的数据项。可以使用一个合适类型的key作为下标索引，并且分配新的合适类型的值。
        languageDic["German"] = "ger"
        
        for item in languageDic.values {
            
            print("value = \(item)")
        }
        /*
         打印结果：
         value = ger
         value = en
         value = fr
         */
        
        //字典updateValue(forKey:)方法可以设置或更新特定键对应的值。该方法在这个键不存在对应值的时候设置值，或者在存在时更新已存在的值，返回更新值之前的原值。这样方便我们检查更新是否成功
        let oldValue  = languageDic.updateValue("Ge", forKey: "German")///打印结果：Optional("ger")
        print(oldValue)
        //通过检索特定的键，来获取对应的值。如果不存在则返回nil，存在的话返回该键对应的值。
        let englishShort = languageDic["English"]//打印结果:Optional("en")
        print(englishShort)
        //使用下标语法通过给某个键对应值赋值为nil而从字典移除一个键值对。
        languageDic["English"] = nil
        for item in languageDic.keys {
            
            print("item=========\(item)")
        }
        //也可使用removeValueForKey方法，来移除字典中的键值对。这个方法在键值对存在的情况会移除该键值对并返回被移除的value，键值对不存在的情况返回nil
        let removed = languageDic.removeValue(forKey: "English")
        print("removed = \(removed)")//打印结果：removed = nil
        let removedOther = languageDic.removeValue(forKey: "German")
        print("removedOther = \(removedOther) ")//打印结果：removedOther = Optional("Ge") 
        
        //字典遍历
        //使用for-in循环遍历某个字典中的键值对。每一个字典中的数据项都由（key,value）元组形式返回。
        for (language,shorthand) in languageDic {
            
            print("\(language) : \(shorthand)")
        }
        /*
         打印结果：French : fr
         */
        //如果需要使用某个字典的键集合或者集合来作为某个接受Array实例API的参数，可以使用keys或者values属性直接构造一个新数组。
        let languageArray = Array(languageDic.keys)
        let shorthandArray = Array(languageDic.values)
        
//2.3解包
        //可选类型在每次访问的时候都会检测它的值是否存在，但有时候根据程序结构可以推断可选量在首次赋值后必然存在值，这个时候，就不需要每次验证值是否存在。我们可以使用！进行解包来获取它的值，或者使用Optionarl Binding，结合if 和 let，即可进行隐士解包。
        //强制隐士解包
        //将!放在optional value后面，可以进行强制解包。
        let possibleString : String? = "An optional string"
        print(possibleString!)//打印结果：An optional string
        //隐士解包
        //通过结合if和let，即可进行隐士解包。
        //Optional Binding，等价于上面一行
        if let sValue = possibleString{
            
            let stringValue = sValue
            print(stringValue)//打印结果：An optional string
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

