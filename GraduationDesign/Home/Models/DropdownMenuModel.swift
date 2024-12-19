//
//  DropdownMenuModel.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/17.
//

struct DropdownMenuStruct {
    let id: Int
    let title: String
}

class NavDropdownMenuModel {
    let navModel = [DropdownMenuStruct(id: 0, title: "网站首页"),
                    DropdownMenuStruct(id: 1, title: "学校概况"),
                    DropdownMenuStruct(id: 2, title: "机构设置"),
                    DropdownMenuStruct(id: 3, title: "师资队伍"),
                    DropdownMenuStruct(id: 4, title: "人才培养"),
                    DropdownMenuStruct(id: 5, title: "科学研究"),
                    DropdownMenuStruct(id: 6, title: "招生与就业"),
                    DropdownMenuStruct(id: 7, title: "国际交流"),
                    DropdownMenuStruct(id: 8, title: "人才招聘"),
                    DropdownMenuStruct(id: 9, title: "校园文化")]
}

class SchoolDropdownMenuModel {
    let schoolModel = [DropdownMenuStruct(id: 0, title: "学校简介"),
                       DropdownMenuStruct(id: 1, title: "学校章程"),
                       DropdownMenuStruct(id: 2, title: "校徽校训"),
                       DropdownMenuStruct(id: 3, title: "校风教风学风"),
                       DropdownMenuStruct(id: 4, title: "校歌"),
                       DropdownMenuStruct(id: 5, title: "现任领导"),
                       DropdownMenuStruct(id: 6, title: "校园风光")]
}
