//
//  ViewController.swift
//  YouTubeScraping
//
//  Created by KB on 2021/08/11.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        crawl()
    }
}

func crawl(){
//    let url = URL(string: "https://www.aladin.co.kr/shop/common/wbest.aspx?BranchType=1&start=we")
//    let url = URL(string: "https://www.naver.com/")
//    let url = URL(string: "https://finance.naver.com/")
    let url = URL(string: "https://m.stock.naver.com")
//    let url = URL(string: "https://music.youtube.com")

    guard let myURL = url else {   return    }

    do {
        let html = try String(contentsOf: myURL, encoding: .utf8)
        let doc: Document = try SwiftSoup.parse(html)
        let headerTitle = try doc.title()
        print(headerTitle)

        let firstLinkTitles:Elements = try doc.select(".bo3").select("b") //.은 클래스
        for i in firstLinkTitles {
            print("title: ", try i.text())
        }
        
        guard let elements = try? doc.getAllElements() else { return }
        for element in elements {
            for textNode in element.textNodes() {
                print("textNode: ", textNode)
            }
            for dataNode in element.dataNodes() {
                print("dataNodes: ", dataNode)
            }
        }
        
    } catch Exception.Error(let type, let message) {
        print("Message: \(message)")
    } catch {
        print("error")
    }

    do {
        let html = try String(contentsOf: myURL, encoding: .utf8)
        let doc: Document = try SwiftSoup.parse(html)
        let srcs: Elements = try doc.select("img[src]")
        let srcsStringArray: [String?] = srcs.array().map { try? $0.attr("src").description }
        for i in srcsStringArray {
            print("img[src]: ", i!)
        }
    } catch Exception.Error(_, let message) {
        print(message)
    } catch {
        print("error")
    }
}
