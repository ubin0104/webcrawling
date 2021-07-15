//
//  ViewController.swift
//  webcrawling
//
//  Created by 김유빈 on 2021/07/15.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        crawl()
    }
}
func crawl(){
    let url = URL(string: "http://cu.bgfretail.com/product/product.do?category=product&depth2=4&sf=N")
    
    guard let myURL = url else { return }

    do {
        let html = try String(contentsOf: myURL, encoding: .utf8)
        let doc: Document = try SwiftSoup.parse(html)
        let headerTitle = try doc.title()
        print(headerTitle)
                
        let firstLinkTitles:Elements = try doc.select(".prodName").select("p") //.은 클래스
        for i in firstLinkTitles {
            print("title: ", try i.text())
            }
    }catch Exception.Error(let type, let message) {
        print("Message: \(message)")
        print(type)
        print(message)
    } catch{
        print("error")
    }
}
