//
//  ProfileEditVC.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/07/27.
//

import Foundation
import UIKit
class ProfileEditVC: UIViewController{
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let userInfoTitle = ["닉네임","이메일"]
    var userInfo = ["eunhwa","eunhwa6087@naver.com"]
    let editMenu = ["프로필 이미지 수정", "닉네임 수정", "북적북적 회원탈퇴"]
    var dataList = [[String]]()
    var getName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getName = userInfo[0]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dataList.append(userInfoTitle)
        dataList.append(editMenu)
    }
    
    @IBAction func clickBtnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension ProfileEditVC: NicknameDelegate{
    func changeName(name: String?) {
        getName = name
        userInfo[0] = getName!
        tableView.reloadData()
    }
    func getNickname() -> String? {
        return getName
    }
}

extension ProfileEditVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        if indexPath.section != 0{
            switch indexPath.row{
            case 0:
                let profileImgPopUpVC = storyboard.instantiateViewController(withIdentifier: "ProfileImgPopUpVC") as? ProfileImgPopUpVC
                profileImgPopUpVC?.modalPresentationStyle = .overCurrentContext
                present(profileImgPopUpVC!, animated: false, completion: nil)
            case 1:
                let nicknamePopUpVC = storyboard.instantiateViewController(withIdentifier: "NicknamePopUpVC") as? NicknamePopUpVC
                nicknamePopUpVC?.nicknameDelegate = self
                nicknamePopUpVC?.modalPresentationStyle = .overCurrentContext
                present(nicknamePopUpVC!, animated: false, completion: nil)
            case 2:
                let deleteAccountPopUpVC = storyboard.instantiateViewController(withIdentifier: "DeleteAccountPopUpVC") as? DeleteAccountPopUpVC
                deleteAccountPopUpVC?.modalPresentationStyle = .overCurrentContext
                present(deleteAccountPopUpVC!, animated: false, completion: nil)
            default:
                return
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "유저 정보"
        }else{
            return "     "
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileEditCell", for: indexPath) as? ProfileEditCell
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let data = dataList[indexPath.section][indexPath.row]
        let cell = cell as? ProfileEditCell
        cell?.lblTitle.text = data
        if indexPath.section != 0{
            cell?.lblDetail.text = ">"
        }else{
            if data == userInfoTitle[0]{
                cell?.lblDetail.text = getName
            }else if data == userInfoTitle[1]{
                cell?.lblDetail.text = userInfo[1]
            }
        }
    }
    
}
