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

enum FoodCategory: String, CaseIterable {
    case bibimbap = "비빔밥"  // 한국
    case kimchi = "김치"      // 한국
    case bulgogi = "불고기"  // 한국
    case tteokbokki = "떡볶이"// 한국
    case samgyeopsal = "삼겹살"// 한국
    case jjajangmyeon = "짜장면" // 한국
    case japchae = "잡채"    // 한국
    case bibimnaengmyeon = "비빔냉면" // 한국
    case galbitang = "갈비탕" // 한국
    case doenjangjjigae = "된장찌개" // 한국
    case kimchiJjigae = "김치찌개" // 한국
    case sundubuJjigae = "순두부찌개" // 한국
    case naengmyeon = "냉면" // 한국
    case kimbap = "김밥"    // 한국
    case dakgalbi = "닭갈비" // 한국
    case hotteok = "호떡"   // 한국
    case soondae = "순대"   // 한국
    case mandu = "만두"     // 한국
    case gochujang = "고추장" // 한국
    case jjambbong = "짬뽕" // 한국
    case banchan = "반찬"   // 한국
    case kongguksu = "콩국수" // 한국
    case kkanpunggi = "깐풍기" // 한국
    case jeon = "전"       // 한국
    case chadolbaegi = "차돌박이" // 한국
    case seolleongtang = "설렁탕" // 한국
    case chae = "채"       // 한국
    case pajeon = "파전"   // 한국
    case oden = "오뎅"     // 한국
    case hwe = "회"       // 한국
    case tonkotsuRamen = "돈코츠라멘" // 일본
    case shoyuRamen = "쇼유라멘" // 일본
    case misoRamen = "미소라멘" // 일본
    case tempura = "텐푸라" // 일본
    case sushi = "스시"     // 일본
    case sashimi = "사시미" // 일본
    case takoyaki = "타코야키" // 일본
    case okonomiyaki = "오코노미야키" // 일본
    case udon = "우동"     // 일본
    case soba = "소바"     // 일본
    case yakitori = "야키토리" // 일본
    case gyoza = "교자"    // 일본
    case tonkotsu = "돈코츠" // 일본
    case katsudon = "가츠동" // 일본
    case ramen = "라멘"    // 일본
    case curry = "카레"    // 일본
    case chawanmushi = "차완무시" // 일본
    case teriyaki = "테리야키" // 일본
    case misoyaki = "미소야키" // 일본
    case tempuraDonburi = "덴푸라돈부리" // 일본
    case oyakodon = "오야코돈" // 일본
    case yakisoba = "야끼소바" // 일본
    case sukiyaki = "스키야키" // 일본
    case kareRice = "카레라이스" // 일본
    case katsu = "가츠"    // 일본
    case mentaiko = "멘타이코" // 일본
    case saba = "사바"     // 일본
    case eel = "장어"      // 일본
    case sweetAndSourPork = "탕수육" // 중국
    case kungPaoChicken = "궁보계정" // 중국
    case springRolls = "춘권" // 중국
    case mapoTofu = "마파두부" // 중국
    case hotAndSourSoup = "쯔란탕" // 중국
    case friedRice = "볶음밥" // 중국
    case wontonSoup = "완탕" // 중국
    case chowMein = "차오면" // 중국
    case beefWithBroccoli = "브로콜리 소고기" // 중국
    case chickenAndCashew = "치킨과 캐슈넛" // 중국
    case lemonChicken = "레몬치킨" // 중국
    case hoisinPork = "호이신포크" // 중국
    case sichuanNoodles = "사천면" // 중국
    case blackPepperBeef = "블랙페퍼비프" // 중국
    case eggDropSoup = "계란국" // 중국
    case mooShuPork = "무슈포크" // 중국
    case chickenSatay = "치킨사테이" // 중국
    case crispyDuck = "크리스피덕" // 중국
    case charSiu = "차슈" // 중국
    case dryFriedGreenBeans = "마른볶음 녹두" // 중국
    case chickenAndCornSoup = "치킨콘수프" // 중국
    case mongolianBeef = "몽골비프" // 중국
    case braisedPork = "돼지갈비" // 중국
    case barbecuePork = "바베큐포크" // 중국
    case spicyEggplant = "매운가지" // 중국
    case lemonBeef = "레몬비프" // 중국
    case shrimpFriedRice = "새우볶음밥" // 중국
    case porkWonton = "돼지완탕" // 중국
    case pepperSteak = "페퍼스테이크" // 중국
    case kungPaoShrimp = "궁보새우" // 중국
    
    var displayName: String {
        return self.rawValue
    }
}

struct Food: Identifiable {
    var id = UUID()
    var star: String // 평점
    var location: Area // 지역
    var foodname: FoodCategory // 음식 이름
    var image: String // 이미지 URL
    var categori: Categori // 메뉴 카테고리
}



let foods: [Food] = [
    Food(star: "3", location: .seoul, foodname: .jjajangmyeon, image: "https://sitem.ssgcdn.com/64/98/58/item/1000524589864_i1_750.jpg", categori: .korean),
    Food(star: "3", location: .seoul, foodname: .jjajangmyeon, image: "https://sitem.ssgcdn.com/64/98/58/item/1000524589864_i1_750.jpg", categori: .korean),
    Food(star: "3", location: .seoul, foodname: .jjajangmyeon, image: "https://sitem.ssgcdn.com/64/98/58/item/1000524589864_i1_750.jpg", categori: .korean),
    Food(star: "3", location: .seoul, foodname: .jjajangmyeon, image: "https://sitem.ssgcdn.com/64/98/58/item/1000524589864_i1_750.jpg", categori: .korean),
]
