//
//  ViewController.swift
//  YouTubeScraping
//
//  Created by KB on 2021/08/11.
//

import UIKit
import WebKit
import SwiftSoup

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
//        let urlStr = "https://tv.naver.com/"
        let urlStr = "https://m.naver.com/"
        let targetUrl = URL(string: urlStr)
        let urlRequest = URLRequest(url: targetUrl!)
        
        webView.load(urlRequest)
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        crawl(urlStr)
    }
}

func crawl(_ urlStr: String) {
//    let url = URL(string: "https://www.aladin.co.kr/shop/common/wbest.aspx?BranchType=1&start=we")
//    let url = URL(string: "https://www.naver.com/")
//    let url = URL(string: "https://tv.naver.com/")
//    let url = URL(string: "https://finance.naver.com/")
//    let url = URL(string: "https://m.stock.naver.com")
//    let url = URL(string: "https://music.youtube.com")
//    let url = URL(string: "https://www.youtube.com/channel/UCVhUw50KohEPkjL3Ox2saag")
//    let url = URL(string: "https://m.youtube.com")
//    let url = URL(string: "https://raw.githubusercontent.com/goldman79/YouChube/master/youtubehtmlmaincode?token=ALPVR6H23S7PIXQHU23QOD3BKEPJK")
//    let url = URL(string: "https://tv.naver.com/")
    
    let url = URL(string: urlStr)
    
    guard let myURL = url else { return }

//    do {
//        let html = try String(contentsOf: myURL, encoding: .utf8)
//        print("GG : ", html)
//        let doc: Document = try SwiftSoup.parse(html)
//        let headTitle = try doc.select("title")
//        let titleStringArray: [String?] = headTitle.array().map { try? $0.attr("").description }
//        print("title : ", titleStringArray)

//        let firstLinkTitles:Elements = try doc.select(".recommend_list").select("h2") //.은 클래스
//        print("first link title : ", firstLinkTitles)
//        for i in firstLinkTitles {
//            print("title: ", try i.text())
//        }
        
//        guard let elements = try? doc.getAllElements() else { return }
//        for element in elements {
//            for textNode in element.textNodes() {
//                print("textNode: ", textNode)
//            }
//            for dataNode in element.dataNodes() {
//                print("dataNodes: ", dataNode)
//            }
//        }
        
//    } catch Exception.Error(let type, let message) {
//        print("Message: \(message)")
//    } catch {
//        print("error")
//    }

    do {
        let html = try String(contentsOf: myURL, encoding: .utf8)
        let doc: Document = try SwiftSoup.parse(html)
//        let srcs: Elements = try doc.select(".cnp_schedule").select("img[src]")
        let srcs: Elements = try doc.select(".cnp_m")
        let srcsStringArray: [String?] = srcs.array().map { try? $0.attr("src").description }
        for i in srcsStringArray {
            print("cnp_m src : ", i!)
        }
        let datasrcsStringArray: [String?] = srcs.array().map { try? $0.attr("data-src").description }
        for i in datasrcsStringArray {
            print("cnp_m data-src : ", i!)
        }
        
    } catch Exception.Error(_, let message) {
        print(message)
    } catch {
        print("error")
    }
}
