//
//  ScienceModel.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/16.
//

import UIKit

struct ScienceStruct {
    let id :Int
    let image: UIImage?
    let upTitle: String
    let bottomTitle: String
}

class ScienceModel {
    let scienceModel = [
        ScienceStruct(id: 0, image: UIImage(named: "Science_1"), upTitle: "校长魏世忠教授团队在材料领域国际顶级期刊《Advanced Materials》上发表科研论文", bottomTitle: "近日，校长魏世忠教授团队联合内蒙古大学刘健教授在材料领域国际顶级学术期刊《Advanced Materials》（影响因子27.4）上发表题名为“Hollow Mo/MoSVn Nanoreactors with Tunable Built-in Electric Fields for Sustainable Hydrogen Production”（《具有可调内置电场的中空Mo/MoSVn纳米反应器用于可持续产氢》）的高水平研究论文。魏世忠教授和巩飞龙副教授为共同通讯作者，该工作主要由材料与化学工程学院硕士研究生陈志林、常超群等人共同完成，郑州轻工业大学为该论文第一署名单位。\n构建内置电场是优化反应中间体吸附、反应和脱附的有效策略，但其精确调控以实现高效双功能电催化反应仍极具挑战。基于此，团队通过精准调制钼基同源异质结材料的阴离子空位，构筑了具有可调内置电场的中空Mo/MoSVn纳米反应器，优化了析氢反应（HER）过程中氢解吸和尿素氧化反应（UOR）过程中N–H键能，提升了析氢反应和尿素氧化反应，实现了尿素耦合节能制氢。其中，具有适中内置电场强度的纳米反应器表现出最优的双功能催化活性和稳定性；同时，组装的HER||UOR耦合制氢系统比常规系统的电压低437 mV（100 mA cm-2），可在200 mA cm-2工作条件下稳定运行200小时以上。系统的生命周期评价证实了纳米反应器用于耦合制氢在降低碳足迹、保护生态环境、减少可再生/不可再生能源消耗方面的巨大优势。\n此项研究成果得到了国家自然科学基金联合基金重点项目等项目资助和支持。\n文章链接：https://doi.org/10.1002/adma.202415269"),
        ScienceStruct(id: 1, image: UIImage(named: "Science_2"), upTitle: "材料与化学工程学院张晓静教授团队在国际知名期刊《Chemical Engineering Journal》上发表研究论文", bottomTitle: "近日，我校材料与化学工程学院张晓静教授团队在国际知名学术期刊《Chemical Engineering Journal》（中科院一区TOP期刊，影响因子13.3）发表题名为“Eutectogel adhesives with underwater-enhanced adhesion to hydrophilic surfaces and strong adhesion in harsh environments” (《在水下对亲水性表面具有增强粘附力和在恶劣环境中具有强粘附力的共晶凝胶粘附剂》)的研究论文。材料与化学工程学院樊凯奇副教授为该论文第一作者，张晓静教授为通讯作者，郑州轻工业大学为该论文第一署名单位。\n如何使凝胶粘附剂在水中具有较强的粘接强度一直是一个挑战。针对此问题，该团队开发了一种基于N-乙烯基吡咯烷酮和低共熔溶剂的新型共晶凝胶粘附剂，其丰富的氢键相互作用和亲水性聚乙烯吡咯烷酮网络结构使共晶凝胶在空气和水下对亲水和疏水表面均具有出色的粘附性。此外，对于亲水性基材，共晶凝胶粘附剂的水下粘合强度是空气中的1.3倍，显示出水下增强粘合效果。该共晶凝胶粘附剂在沸水、强酸性介质、强碱性介质和有机溶剂中也能保持强粘合性能。\n此项研究成果得到了国家自然科学基金、河南省科技攻关等项目的资助和支持。\n论文链接：https://www.sciencedirect.com/science/article/pii/S1385894724077040"),
        ScienceStruct(id: 2, image: UIImage(named: "Science_3"), upTitle: "电子信息学院张园园博士在IEEE Internet of Things Journal上发表论文", bottomTitle: "近日，电子信息学院张园园博士联合伍伦贡大学Qinghua Guo 教授、郑州大学王忠勇教授在国际物联网领域顶级学术期刊“IEEE Internet of Things Journal”（中科院一区TOP期刊，IF=10.6）上发表题为“Grant Free MIMO-NOMA With Differential Modulation for Machine Type Communications ”的论文。\n作为物联网的基础，海量机器类通信受到学者们的广泛关注，它的特点是大量设备零星地进行短包数据传输。非正交多址接入能够实现过载以满足该通信场景下海量接入的需求，成为研究热点。现有非正交多址接入通信系统中的接收机大部分是基于导频信号设计相干检测算法，将信道估计、活跃用户和符号检测割裂开来研究，算法复杂度高且难以实现全局优化。此外，发送导频信号会产生额外的通信开销，当相干信道时间或数据包较短时，会降低终端设备的通信效率。本文研究非正交多址接入通信系统的接收机设计。首先，基于概率图模型理论和消息传递理论，挖掘系统模型的统计特征，对全局后验概率密度分布函数进行分解优化；然后，基于分区自由能理论和消息的理论化近似方法，构建统一的联合消息传递和近似消息传递框架；最后，据此设计低复杂度的非相干检测算法以实现联合活跃用户及其符号检测。本文所提出的接收机设计方案将为解决海量机器类通信中的信号检测问题提供新的技术和方法。\n此论文得到了国家自然科学基金等项目的支持。\n论文链接：https://ieeexplore.ieee.org/document/10556566"),
        ScienceStruct(id: 3, image: UIImage(named: "Science_4"), upTitle: "校长魏世忠教授团队在材料类国际知名期刊《Advanced Energy Materials》上发表科研论文", bottomTitle: "近日，校长魏世忠教授团队联合中国科学院大连化物所/内蒙古大学刘健研究员在材料领域国际知名学术期刊《Advanced Energy Materials》（中科院一区TOP期刊，影响因子24.4）上发表题名为“Cross-Scale Process Intensification of Spindle CuO Supported Tungsten Single-Atom Catalysts toward Enhanced Electrochemical Hydrogen Production”（《氧化铜支撑钨催化剂的跨尺度过程强化用于增强电化学析氢反应》）的高水平研究论文。材料与化学工程学院硕士研究生常超群为该论文第一作者，魏世忠教授和巩飞龙副教授为通讯作者，郑州轻工业大学为该论文第一署名单位。\n发展高效的非贵金属电解水催化剂对于实现绿色能源再生和社会可持续发展至关重要。单原子催化剂因其丰富的活性位点、超高的原子利用效率等优点有望替代传统的贵金属催化剂，然而目前仍然存在活性低和稳定性差的难题。过程强化工程涉及空间限域、流体传质、中间体富集等物理过程以及反应物吸附、反应、脱附等化学过程的协同优化，对提升多步催化反应的热/动力学至关重要。基于此，团队可控合成了具有曲率可调的纺锤形CuO载体，优化了纳米尖端的介尺度局域电场，调控了W单原子周围的局域原子结构，实现了催化剂的跨尺度过程强化，大幅提升了电解水制氢的催化活性和稳定性。高曲率载体赋予催化剂显著增强的局域电场和更高的局域配位数，合成的材料在阴离子交换膜电解槽中表现出可与商业催化剂相媲美的活性和更优的稳定性（衰减率仅为：0.085 mA cm−2 h−1）。\n此项研究成果得到了国家自然科学基金（52002359, 22279139和U2341258）、河南省青年骨干教师基金（2023GGJS091）等项目的资助和支持。\n文章链接：https://doi.org/10.1002/aenm.202402825")
    ]
}
