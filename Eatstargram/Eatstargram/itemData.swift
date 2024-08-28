//
//  itemData.swift
//  Eatstargram
//
//  Created by 박준영 on 8/27/24.
//

import Foundation

enum Categori: String, CaseIterable {
    case korean = "한식"
    case chinese = "중식"
    case japanese = "일식"
    case western = "양식"
    
    var displayName: String {
        return self.rawValue
    }
}

// Star enum 정의
enum Star: String, CaseIterable {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    
    var displayName: String {
        return self.rawValue
    }
}

enum Area: String, CaseIterable {
    // 광역시
    case seoul = "서울특별시"
    case busan = "부산광역시"
    case daegu = "대구광역시"
    case incheon = "인천광역시"
    case gwangju = "광주광역시"
    case daejeon = "대전광역시"
    case ulsan = "울산광역시"
    
    // 도
    case gyeonggi = "경기도"
    case gangwon = "강원도"
    case chungbuk = "충청북도"
    case chungnam = "충청남도"
    case jeonbuk = "전라북도"
    case jeonnam = "전라남도"
    case gyeongbuk = "경상북도"
    case gyeongnam = "경상남도"
    case jeju = "제주특별자치도"
    
    var displayName: String {
        return self.rawValue
    }
}

struct Food: Identifiable {
    var id = UUID()
    var star: String // 평점
    var location: Area // 지역
    var image: String // 이미지 URL
    var categori: Categori // 메뉴 카테고리
}



let foods: [Food] = [
    Food(star: "3", location: .seoul, image: "https://sitem.ssgcdn.com/64/98/58/item/1000524589864_i1_750.jpg", categori: .korean),
    Food(star: "5", location: .jeonnam, image: "https://previews.123rf.com/images/meykitchen/meykitchen2305/meykitchen230502570/205175374-%EB%B9%84%EB%B9%94%EB%B0%A5-%EB%8F%BC%EC%A7%80%EA%B3%A0%EA%B8%B0-%EB%B0%A5-%EB%8B%AC%EA%B1%80-%ED%94%84%EB%9D%BC%EC%9D%B4-%EC%95%BC%EC%B1%84.jpg", categori: .korean),
    Food(star: "4", location: .busan, image: "https://i.namu.wiki/i/1fMv9BlDolXCcO2TlBW0zuV14FbmYAQf71zBGjY8RvtoP3x-zDBo0jiQxy4gdQ8ipfOqa9NNgGc5AOPVfRHlzQ.webp", categori: .korean),
    Food(star: "2", location: .daegu, image: "https://mblogthumb-phinf.pstatic.net/MjAyMjA2MTJfMTY5/MDAxNjU1MDQzNTUxNzMy.5BYZF9-kftaq0d7ISLW02xsdptIObpIXbhJbRVDkaLQg.b4r6k9_CKWTSodj6V6-szOjMzNx_VMH-pklaVdbNGMEg.JPEG.dmsg55/20220612%EF%BC%BF183252.jpg?type=w800", categori: .korean),
    Food(star: "1", location: .incheon, image: "https://cdn.globale.co.kr/news/photo/202407/29746_42225_4115.jpg", categori: .korean),
    Food(star: "5", location: .jeju, image: "https://d12zq4w4guyljn.cloudfront.net/750_750_20190430115423_photo1_hUQeASJ3Bxnz.jpg", categori: .korean),
    Food(star: "5", location: .ulsan, image: "https://static.wtable.co.kr/image/production/service/recipe/1767/8a70db02-325f-4dd0-9780-625a2e7cfefe.jpg", categori: .western),
    Food(star: "5", location: .gyeonggi, image: "https://i.namu.wiki/i/aN7eMJzy4XAy1yqpL3kHb41MBsSdfPjt1ZqMfDXYk6J3-je6M8dNVOMldpbxhZ-IlO9IfHXMzpZc1tVvat5IjQ.webp", categori: .japanese),
    Food(star: "5", location: .gyeongnam, image: "https://gurunavi.com/ko/japanfoodie/article/sushi/img/sushi_01.jpg", categori: .japanese),
    Food(star: "3", location: .gwangju, image: "https://recipe1.ezmember.co.kr/cache/recipe/2015/06/08/0fd69039751d2e9d6649ae63bca07cd2.jpg", categori: .japanese),
    Food(star: "4", location: .gyeongbuk, image: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202204/11/36db54c6-4c62-40fe-89ae-7abc9bc45568.jpg", categori: .japanese),
    Food(star: "2", location: .jeonbuk, image: "https://roout.co.kr/m/p/u/gvGpTB9/c/oEonVdoJokx/i/Eqcg4Gbcv2A.jpg", categori: .korean),
    Food(star: "5", location: .seoul, image: "https://i.ytimg.com/vi/765FumdYgCU/maxresdefault.jpg", categori: .korean),
    Food(star: "1", location: .chungbuk, image: "https://mblogthumb-phinf.pstatic.net/MjAyMzA1MThfMTgz/MDAxNjg0NDE5ODUxMzU5.k06D1e-oKG2gYy8FRgKtO3ion0SgP9_xnyyNJQKzY_Eg.2400AaZiu5ykHYipFPUwceZFT0Ll9AGTjnX34f_50OEg.PNG.kizaki56/00.png?type=w800", categori: .korean),
    Food(star: "5", location: .chungnam, image: "https://img.khan.co.kr/news/2021/05/09/l_2021051001000864600073041.jpg", categori: .korean),
    Food(star: "3", location: .gyeonggi, image: "https://recipe1.ezmember.co.kr/cache/recipe/2015/07/16/e90d4aa496657c666f2821977e3c721e1.jpg", categori: .chinese),
    Food(star: "2", location: .gyeonggi, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg-mAUr19Fd4mLertjfDKVjV0J9BybFFuNdA&s", categori: .chinese),
    Food(star: "5", location: .gangwon, image: "https://cdn.imweb.me/thumbnail/20231018/3047515d4d8cd.png", categori: .chinese),
    Food(star: "4", location: .seoul, image: "https://www.sbfoods-worldwide.com/ko/recipes/deq4os00000008l9-img/10_Stake_A.jpg", categori: .western),
]
