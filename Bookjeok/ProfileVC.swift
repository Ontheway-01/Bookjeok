//
//  ProfileVC.swift
//  bookjuk
//
//  Created by 이은화 on 2022/05/25.
//

import Foundation
import UIKit

enum ProfileMenuType {
    case ProfileEdit
    case ExportData
    case SetColorFont
    case LogOut
    case SendFeedback
    case AppGradeReview
    case LookNotion
    case SeeInsta
    case DevIntro
    
    var iconImage: UIImage {
        switch self {
        case .ProfileEdit:
            return UIImage(systemName: "person.fill")!
        case .ExportData:
            return UIImage(systemName: "doc.text.fill")!
        case .SetColorFont:
            return UIImage(systemName: "paintpalette.fill")!
        case .LogOut:
            return UIImage(systemName: "rectangle.portrait.and.arrow.right.fill")!
        case .SendFeedback:
            return UIImage(systemName: "bubble.left.fill")!
        case .AppGradeReview:
            return UIImage(systemName: "hand.thumbsup.fill")!
        case .LookNotion:
            return UIImage(systemName: "cup.and.saucer.fill")!
        case .SeeInsta:
            return UIImage(systemName: "camera.metering.partial")!
        case .DevIntro:
            return UIImage(systemName: "smiley.fill")!
            
        }
    }
    
    var titleText: String {
        switch self {
        case .ProfileEdit:
            return "프로필 수정"
        case .ExportData:
            return "독서기록 내보내기"
        case .SetColorFont:
            return "컬러 폰트 설정"
        case .LogOut:
            return "로그아웃"
        case .SendFeedback:
            return "피드백 보내기"
        case .AppGradeReview:
            return "앱 평점주기 / 리뷰"
        case .LookNotion:
            return "노션 구경가기"
        case .SeeInsta:
            return "북적이 인스타그램"
        case .DevIntro:
            return "개발자 소개"
        }
    }
}

class ProfileVC: UIViewController{
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var lblNickname: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var colorTheme: UIColor = .systemPink
    var fontTheme: UIFont = .systemFont(ofSize: 17.0)
    let profileSectionHeader = ["쓰담쓰담 한마디", "북적이와 소통하기"]
    var profileMenuData = [[ProfileModel]]()
    
    @objc func onChangedColorFont(_ sender: Notification) {
        let userDefault = UserDefaults.standard
        let colorName = (userDefault.object(forKey: "AppColor") as? String) ?? "Coral"
        colorTheme = colorList[colorName] ?? .systemPink
        let fontName = (userDefault.object(forKey: "AppFont") as? String) ?? "Arial"
        fontTheme = UIFont(name: fontName, size: 17.0) ?? .systemFont(ofSize: 17.0)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onChangedColorFont(_:)), name: .ColorFontChanged, object: nil)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        profileMenuData.append([ProfileModel]())
        profileMenuData.append([ProfileModel]())
        profileMenuData.append([ProfileModel]())
        
        
        profileMenuData[0].append(ProfileModel.init(menuType: .ProfileEdit))
        profileMenuData[0].append(ProfileModel.init(menuType: .ExportData))
        profileMenuData[0].append(ProfileModel.init(menuType: .SetColorFont))
        profileMenuData[0].append(ProfileModel.init(menuType: .LogOut))
        profileMenuData[1].append(ProfileModel.init(menuType: .SendFeedback))
        profileMenuData[1].append(ProfileModel.init(menuType: .AppGradeReview))
        profileMenuData[2].append(ProfileModel.init(menuType: .LookNotion))
        profileMenuData[2].append(ProfileModel.init(menuType: .SeeInsta))
        profileMenuData[2].append(ProfileModel.init(menuType: .DevIntro))
        profileImgView.layer.cornerRadius = profileImgView.frame.height/2
        profileImgView.layer.borderWidth = 1.0
        profileImgView.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        profileImgView.clipsToBounds = true
        
//        tableView.reloadData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

//extension ProfileVC: ColorFontSetDelegate{
//    func onChangeFont(font: UIFont) {
//        let userDefault = UserDefaults.standard
//        userDefault.set(font.fontName, forKey: "AppFont")
//        userDefault.synchronize()
//
//        fontTheme = font
//        tableView.reloadData()
//    }
//
//    func onChangeColor(color: UIColor) {
//        var colorKey: String? = nil
//        for key in colorList.keys {
//            if colorList[key] == color {
//                colorKey = key
//            }
//        }
//
//        let userDefault = UserDefaults.standard
//        userDefault.set(colorKey!, forKey: "AppColor")
//        userDefault.synchronize()
//
//        colorTheme = color
//        tableView.reloadData()
//    }
//}
//
//extension ProfileVC: LogoutDelegate{
//    func color() -> UIColor?{
//        return colorTheme
//    }
//}

//extension ProfileVC: DevIntroDelegate{
//    func color() -> UIColor? {
//        return colorTheme
//    }
//    func font() -> UIFont? {
//        return fontTheme
//    }
//}


extension ProfileVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let data = profileMenuData[indexPath.section][indexPath.row]
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        switch data.type{
        case .ProfileEdit:
            let profileEditVC = storyboard.instantiateViewController(withIdentifier: "ProfileEditVC") as? ProfileEditVC
            present(profileEditVC!, animated: true, completion: nil)
            
        case .ExportData:
            let readingRecordPopUpVC = storyboard.instantiateViewController(withIdentifier: "ReadingRecordPopUpVC") as? ReadingRecordPopUpVC
            readingRecordPopUpVC?.modalPresentationStyle = .overCurrentContext
            present(readingRecordPopUpVC!, animated: false, completion: nil)
        
        case .SetColorFont:
            let colorFontSetVC = storyboard.instantiateViewController(withIdentifier: "ColorFontSetVC") as? ColorFontSetVC
//            colorFontSetVC?.colorFontSetDelegate = self
            present(colorFontSetVC!, animated: true, completion: nil)
        
        case .LogOut:
            let logoutPopUpVC = storyboard.instantiateViewController(withIdentifier: "LogoutPopUpVC") as? LogoutPopUpVC
//            logoutPopUpVC?.LogoutDelegate = self
            logoutPopUpVC?.modalPresentationStyle = .overCurrentContext
            present(logoutPopUpVC!, animated: false, completion: nil)
//        case .SendFeedback:
//
        case .AppGradeReview:
            let appstore = "itms-apps://itunes.apple.com/app/id1472538417"
            let appstoreURL = NSURL(string: appstore)
            if(UIApplication.shared.canOpenURL(appstoreURL! as URL)){
                UIApplication.shared.open(appstoreURL! as URL)
            }else{
                print("No app store installed")
            }
        
        case .LookNotion:
            let lookNotionVC = storyboard.instantiateViewController(withIdentifier: "LookNotionVC") as? LookNotionVC
            present(lookNotionVC!, animated: true, completion: nil)
        
        case .SeeInsta:
            let instagram = "https://www.instagram.com/eunhwa813"
            let instagramURL = NSURL(string: instagram)
            if(UIApplication.shared.canOpenURL(instagramURL! as URL)){
                UIApplication.shared.open(instagramURL! as URL)
            }else{
                print("No instagram installed")
            }
        
        case .DevIntro:
            let devIntroductionVC = storyboard.instantiateViewController(withIdentifier: "DevIntroductionVC") as? DevIntroductionVC
//            devIntroductionVC?.devIntroDelegate = self
            present(devIntroductionVC!, animated: true, completion: nil)
            
        default:
            return
        }
//        switch data.profileMenuTitle {
//        case "프로필 수정":
//            let profileEditVC = storyboard.instantiateViewController(withIdentifier: "ProfileEditVC") as? ProfileEditVC
//            present(profileEditVC!, animated: true, completion: nil)
//
//        case "컬러 폰트 설정":
//
//
//        case "독서기록 내보내기":
//
//
//        case "로그아웃":
////            let instagram =  "itms-apps://itunes.apple.com/app/apple-store/id1488570532?mt=8"
//////            let instagram = "mailto:?to=[recipient]&subject=[subject]&body=[message]"
////            let instagramURL = NSURL(string: instagram)
////            if(UIApplication.shared.canOpenURL(instagramURL! as URL)){
//                UIApplication.shared.open(instagramURL! as URL)
//            }else{
//                print("No instagram installed")
//            }
//            return
            
        
//        case "피드백 보내기":
//            let profileEditVC = storyboard.instantiateViewController(withIdentifier: "ProfileEditVC") as? ProfileEditVC
//            present(profileEditVC!, animated: true, completion: nil)
//
//        case "앱 평점주기 / 리뷰":
//            let profileEditVC = storyboard.instantiateViewController(withIdentifier: "ProfileEditVC") as? ProfileEditVC
//            present(profileEditVC!, animated: true, completion: nil)
         
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return profileMenuData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section != 0{
            return profileSectionHeader[section-1]
        }else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileMenuData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as? ProfileCell
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let profileData = profileMenuData[indexPath.section][indexPath.row]
        let cell = cell as? ProfileCell
        cell?.imgView.image = profileData.img
        cell?.imgView.tintColor = colorTheme
        cell?.lbltiltle.text = profileData.profileMenuTitle
        cell?.lbltiltle.font = fontTheme
    }
}


