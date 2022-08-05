//
//  ProfileVC.swift
//  bookjuk
//
//  Created by 이은화 on 2022/05/25.
//

import Foundation
import UIKit
class ProfileVC:UIViewController{
    
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var lblNickname: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let profileSectionHeader = ["쓰담쓰담 한마디", "북적이와 소통하기"]
    var profileMenuData = [[ProfileModel]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        profileMenuData.append([ProfileModel]())
        profileMenuData.append([ProfileModel]())
        profileMenuData.append([ProfileModel]())
        
        profileMenuData[0].append(ProfileModel.init(img: UIImage(systemName: "person.fill")!, profileMenuTitle: "프로필 수정"))
        profileMenuData[0].append(ProfileModel.init(img: UIImage(systemName: "doc.text.fill")!, profileMenuTitle: "독서기록 내보내기"))
        profileMenuData[0].append(ProfileModel.init(img: UIImage(systemName: "paintpalette.fill")!, profileMenuTitle: "컬러 폰트 설정"))
        profileMenuData[0].append(ProfileModel.init(img: UIImage(systemName: "rectangle.portrait.and.arrow.right.fill")!, profileMenuTitle: "로그아웃"))
        profileMenuData[1].append(ProfileModel.init(img: UIImage(systemName: "bubble.left.fill")!, profileMenuTitle: "피드백 보내기"))
        profileMenuData[1].append(ProfileModel.init(img: UIImage(systemName: "hand.thumbsup.fill")!, profileMenuTitle: "앱 평점주기 / 리뷰"))
        profileMenuData[2].append(ProfileModel.init(img: UIImage(systemName: "cup.and.saucer.fill")! , profileMenuTitle: "노션 구경가기"))
        profileMenuData[2].append(ProfileModel.init(img: UIImage(systemName: "camera.metering.partial")! , profileMenuTitle: "북적이 인스타그램"))
        profileMenuData[2].append(ProfileModel.init(img: UIImage(systemName: "smiley.fill")!, profileMenuTitle: "개발자 소개"))
        profileImgView.layer.cornerRadius = profileImgView.frame.height/2
        profileImgView.layer.borderWidth = 1.0
        profileImgView.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        profileImgView.clipsToBounds = true
        
        tableView.reloadData()
    }
    
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let data = profileMenuData[indexPath.section][indexPath.row]
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        switch data.profileMenuTitle {
        case "프로필 수정":
            let profileEditVC = storyboard.instantiateViewController(withIdentifier: "ProfileEditVC") as? ProfileEditVC
            present(profileEditVC!, animated: true, completion: nil)
        
        case "컬러 폰트 설정":
            let colorFontSetVC = storyboard.instantiateViewController(withIdentifier: "ColorFontSetVC") as? ColorFontSetVC
            present(colorFontSetVC!, animated: true, completion: nil)
        
        case "독서기록 내보내기":
            let readingRecordPopUpVC = storyboard.instantiateViewController(withIdentifier: "ReadingRecordPopUpVC") as? ReadingRecordPopUpVC
            present(readingRecordPopUpVC!, animated: true, completion: nil)
            
        case "로그아웃":
            let logoutPopUpVC = storyboard.instantiateViewController(withIdentifier: "LogoutPopUpVC") as? LogoutPopUpVC
            present(logoutPopUpVC!, animated: true, completion: nil)
        
        case "피드백 보내기":
            let profileEditVC = storyboard.instantiateViewController(withIdentifier: "ProfileEditVC") as? ProfileEditVC
            present(profileEditVC!, animated: true, completion: nil)
            
        case "앱 평점주기 / 리뷰":
            let profileEditVC = storyboard.instantiateViewController(withIdentifier: "ProfileEditVC") as? ProfileEditVC
            present(profileEditVC!, animated: true, completion: nil)
            
        case "노션 구경가기":
            let lookNotionVC = storyboard.instantiateViewController(withIdentifier: "LookNotionVC") as? LookNotionVC
            present(lookNotionVC!, animated: true, completion: nil)
            
        case "북적이 인스타그램":
            let profileEditVC = storyboard.instantiateViewController(withIdentifier: "ProfileEditVC") as? ProfileEditVC
            present(profileEditVC!, animated: true, completion: nil)
            
        case "개발자 소개":
            let devIntroductionVC = storyboard.instantiateViewController(withIdentifier: "DevIntroductionVC") as? DevIntroductionVC
            present(devIntroductionVC!, animated: true, completion: nil)
            
        default:
            return
        }
        
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
        cell?.lbltiltle.text = profileData.profileMenuTitle
    }
}
