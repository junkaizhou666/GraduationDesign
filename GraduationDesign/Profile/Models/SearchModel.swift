//
//  SearchModel.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/2/12.
//

import UIKit

struct ButtonItem {
    let image: UIImage?
    let title: String
}

class SearchModel {
    let allButtons: [ButtonItem] = [
        // MyCollection
        ButtonItem(image: UIImage(named: "icon"), title: "职业测评系统"),
        
        // LatestRelease
        ButtonItem(image: UIImage(named: "icon"), title: "学生缴费"),
        ButtonItem(image: UIImage(named: "icon"), title: "校园卡"),
        ButtonItem(image: UIImage(named: "icon"), title: "充电桩"),
        ButtonItem(image: UIImage(named: "icon"), title: "上网缴费"),
        ButtonItem(image: UIImage(named: "icon"), title: "体质健康"),
        ButtonItem(image: UIImage(named: "icon"), title: "意见反馈"),
        
        // StudentsWork
        ButtonItem(image: UIImage(named: "icon"), title: "注册报道"),
        ButtonItem(image: UIImage(named: "icon"), title: "职业测评系统"),
        ButtonItem(image: UIImage(named: "icon"), title: "第二课堂管理系统"),
        ButtonItem(image: UIImage(named: "icon"), title: "学生请假"),
        ButtonItem(image: UIImage(named: "icon"), title: "申请奖学金"),
        ButtonItem(image: UIImage(named: "icon"), title: "勤工助学"),
        ButtonItem(image: UIImage(named: "icon"), title: "申请临时困补"),
        ButtonItem(image: UIImage(named: "icon"), title: "国(境)外学生项目管"),
        ButtonItem(image: UIImage(named: "icon"), title: "综合素质测评"),
        ButtonItem(image: UIImage(named: "icon"), title: "微课堂报名"),
        ButtonItem(image: UIImage(named: "icon"), title: "毕业离校进度"),
        
        // OnlineLearning
        ButtonItem(image: UIImage(named: "icon"), title: "在线学习平台"),
        ButtonItem(image: UIImage(named: "icon"), title: "移动图书馆"),
        ButtonItem(image: UIImage(named: "icon"), title: "知识搜索"),
        
        // NetWorkInformation
        ButtonItem(image: UIImage(named: "icon"), title: "轻工学报"),
        ButtonItem(image: UIImage(named: "icon"), title: "学报社科版"),
        
        // CampusLife
        ButtonItem(image: UIImage(named: "icon"), title: "学生缴费"),
        ButtonItem(image: UIImage(named: "icon"), title: "校园卡"),
        ButtonItem(image: UIImage(named: "icon"), title: "充电桩"),
        ButtonItem(image: UIImage(named: "icon"), title: "体育场馆预约"),
        ButtonItem(image: UIImage(named: "icon"), title: "宿舍购电"),
        ButtonItem(image: UIImage(named: "icon"), title: "意见反馈"),
        ButtonItem(image: UIImage(named: "icon"), title: "校园地图"),
        ButtonItem(image: UIImage(named: "icon"), title: "活动签到"),
        ButtonItem(image: UIImage(named: "icon"), title: "上网帐号"),
        
        // MyInformation
        ButtonItem(image: UIImage(named: "icon"), title: "课程信息"),
        ButtonItem(image: UIImage(named: "icon"), title: "成绩查询"),
        ButtonItem(image: UIImage(named: "icon"), title: "图书借阅"),
        
        // NoLoginRequired
        ButtonItem(image: UIImage(named: "icon"), title: "领导信箱"),
        
        // VersionInformation
        ButtonItem(image: UIImage(named: "icon"), title: "隐私声明"),
        ButtonItem(image: UIImage(named: "icon"), title: "用户手册"),
        ButtonItem(image: UIImage(named: "icon"), title: "版本信息"),
        ButtonItem(image: UIImage(named: "icon"), title: "更新日志"),
        ButtonItem(image: UIImage(named: "icon"), title: "致谢")
    ]
}
