//1.4 心律失常
CREATE (:disease {name:"心律失常",definition:"心脏冲动的频率、节律、起源部位、传导速度或激动次序的异常。"});
//1.4.1 窦性心律失常
CREATE (:disease {name:"窦性心律失常",definition:"由于窦房结冲动发放频率的异常或窦性冲动向心房的传导受阻所导致的心律失常。"});
MATCH (dc:disease {name:"心律失常"}),(d:disease {name:"窦性心律失常"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.1.1 窦性心动过速
CREATE (:disease {name:"窦性心动过速",definition:"成人窦性心律的频率超过100次/分"});
MATCH (dc:disease {name:"窦性心律失常"}),(d:disease {name:"窦性心动过速"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.1.2 窦性心动过缓
CREATE (:disease {name:"窦性心动过缓",definition:"成人窦性心律的频率低于60次/分"});
MATCH (dc:disease {name:"窦性心律失常"}),(d:disease {name:"窦性心动过缓"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.1.3 窦性停搏
CREATE (:disease {name:"窦性停搏",synonym:"窦性静止",definition:"窦房结不能产生冲动"});
MATCH (dc:disease {name:"窦性心律失常"}),(d:disease {name:"窦性停搏"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.1.4 窦房传导阻滞
CREATE (:disease {name:"窦房传导阻滞",english_name:"SAB",definition:"窦房结冲动传导至心房时发生延缓或阻滞。"});
MATCH (dc:disease {name:"窦性心律失常"}),(d:disease {name:"窦房传导阻滞"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.1.5 病态窦房结综合征
CREATE (:disease {name:"病态窦房结综合征",english_name:"SSS",definition:"由窦房结病变导致功能减退，产生多种心律失常的综合表现。"});
MATCH (dc:disease {name:"窦性心律失常"}),(d:disease {name:"病态窦房结综合征"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.2 房性心律失常
CREATE (:disease {name:"房性心律失常",definition:"起源于窦房结以外心房任何部位的心房激动。"});
MATCH (dc:disease {name:"心律失常"}),(d:disease {name:"房性心律失常"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.2.1 房性期前收缩
CREATE (:disease {name:"房性期前收缩"});
MATCH (dc:disease {name:"房性心律失常"}),(d:disease {name:"房性期前收缩"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.2.2 房性心动过速
CREATE (:disease {name:"房性心动过速"});
MATCH (dc:disease {name:"房性心律失常"}),(d:disease {name:"房性心动过速"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.2.2.1 局灶性房性心动过速
CREATE (:disease {name:"局灶性房性心动过速"});
MATCH (dc:disease {name:"房性心动过速"}),(d:disease {name:"局灶性房性心动过速"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.2.2.2 多源性房性心动过速 
CREATE (:disease {name:"多源性房性心动过速"});
MATCH (dc:disease {name:"房性心动过速"}),(d:disease {name:"多源性房性心动过速"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.2.3 心房扑动
CREATE (:disease {name:"心房扑动",synonym:"房扑",definition:"介于房速和心房颤动之间的快速型心律失常。"});
MATCH (dc:disease {name:"房性心律失常"}),(d:disease {name:"心房扑动"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.2.4 心房颤动
CREATE (:disease {name:"心房颤动",english_name:"AF",definition:"规则有序的心房电活动丧失，代之以快速无序的颤动波，是严重的心房电活动紊乱。"});
MATCH (dc:disease {name:"房性心律失常"}),(d:disease {name:"心房颤动"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.3 房室交界区性心律失常
CREATE (:disease {name:"房室交界区性心律失常",abbreviation:"交界性期前收缩"});
MATCH (dc:disease {name:"心律失常"}),(d:disease {name:"房室交界区性心律失常"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.3.1 房室交界区性期前收缩
CREATE (:disease {name:"房室交界区性期前收缩"});
MATCH (dc:disease {name:"房室交界区性心律失常"}),(d:disease {name:"房室交界区性期前收缩"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.3.2 房室交界区性逸搏
CREATE (:disease {name:"房室交界区性逸搏"});
MATCH (dc:disease {name:"房室交界区性心律失常"}),(d:disease {name:"房室交界区性逸搏"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.3.3 房室交界区性心律
CREATE (:disease {name:"房室交界区性心律",definition:"房室交界区性逸搏连续发生形成的节律。"});
MATCH (dc:disease {name:"房室交界区性心律失常"}),(d:disease {name:"房室交界区性心律"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.3.4 非阵发性房室交界区性心动过速
CREATE (:disease {name:"非阵发性房室交界区性心动过速"});
MATCH (dc:disease {name:"房室交界区性心律失常"}),(d:disease {name:"非阵发性房室交界区性心动过速"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.3.5 房室交界区相关的折返性心动过速
CREATE (:disease {name:"非阵发性房室交界区性心动过速"});
MATCH (dc:disease {name:"房室交界区相关的折返性心动过速"}),(d:disease {name:"非阵发性房室交界区性心动过速"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.3.5.1 房室结折返性心动过速
CREATE (:disease {name:"房室结折返性心动过速",english_name:"AVNRT"});
MATCH (dc:disease {name:"房室交界区相关的折返性心动过速"}),(d:disease {name:"房室结折返性心动过速"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.3.5.2 房室折返性心动过速
CREATE (:disease {name:"房室折返性心动过速",english_name:"AVRT"});
MATCH (dc:disease {name:"房室交界区相关的折返性心动过速"}),(d:disease {name:"房室折返性心动过速"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.3.5.3 预激综合征
CREATE (:disease {name:"预激综合征",definition:"心房部分激动由正常房室传导系统以外的先天性附加通 道（旁道）下传，使心室某一部分心肌预先激动（预激），导致以异常心电生理和（或）伴发多种快速型心律失常为特征的一种综合征"});
MATCH (dc:disease {name:"房室交界区相关的折返性心动过速"}),(d:disease {name:"预激综合征"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.3.6 阵发性室上性心动过速
CREATE (:disease {name:"阵发性室上性心动过速",abbreviation:"室上速",english_name:"PSVT"});
MATCH (dc:disease {name:"心律失常"}),(d:disease {name:"阵发性室上性心动过速"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.4 室性心律失常
CREATE (:disease {name:"室性心律失常"});
MATCH (dc:disease {name:"心律失常"}),(d:disease {name:"室性心律失常"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.4.1 室性期前收缩
CREATE (:disease {name:"室性期前收缩",definition:"希氏束分叉以下部位过早发生，提前使心肌除极的心搏。"});
MATCH (dc:disease {name:"室性心律失常"}),(d:disease {name:"室性期前收缩"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.4.2 室性心动过速
CREATE (:disease {name:"室性心动过速",abbreviation:"室速",definition:"起源于希氏束分支以下的特殊传导系统或者心室肌的连续3个或3个以上的异位心搏。"});
MATCH (dc:disease {name:"室性心律失常"}),(d:disease {name:"室性心动过速"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.4.3 心室扑动
CREATE (:disease {name:"心室扑动",abbreviation:"室扑"});
MATCH (dc:disease {name:"室性心律失常"}),(d:disease {name:"心室扑动"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.4.4 心室颤动
CREATE (:disease {name:"心室颤动",abbreviation:"室颤"});
MATCH (dc:disease {name:"室性心律失常"}),(d:disease {name:"心室颤动"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.5 心脏传导阻滞
CREATE (:disease {name:"心脏传导阻滞",definition:"由解剖或机能失常造成的永久性或暂时性冲动传导障碍。"});
MATCH (dc:disease {name:"心律失常"}),(d:disease {name:"心脏传导阻滞"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.5.1 房室阻滞
CREATE (:disease {name:"房室阻滞",definition:"房室交界区脱离了生理不应期后，心房冲动传导延迟或不能传导至心室。"});
MATCH (dc:disease {name:"心脏传导阻滞"}),(d:disease {name:"房室阻滞"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.5.2 室内阻滞
CREATE (:disease {name:"室内阻滞",definition:"希氏束分叉以下部位的传导阻滞。"});
MATCH (dc:disease {name:"心脏传导阻滞"}),(d:disease {name:"室内阻滞"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);

//二、风险因子
//2.4.1.2 窦性心动过缓
CREATE (:risk_factor {name:"健康的青年人",disease:"窦性心动过缓"});
CREATE (:risk_factor {name:"运动员",disease:"窦性心动过缓"});
CREATE (:risk_factor {name:"睡眠状态",disease:"窦性心动过缓"});
CREATE (:risk_factor {name:"颅内疾病",disease:"窦性心动过缓"});
CREATE (:risk_factor {name:"严重缺氧",disease:"窦性心动过缓"});
CREATE (:risk_factor {name:"低温",disease:"窦性心动过缓"});
CREATE (:risk_factor {name:"甲状腺功能减退",disease:"窦性心动过缓"});
CREATE (:risk_factor {name:"阻塞性黄疸",disease:"窦性心动过缓"});
CREATE (:risk_factor {name:"血管迷走性晕厥",disease:"窦性心动过缓"});
MATCH (d:disease {name:"窦性心动过缓"}),(r:risk_factor {disease:"窦性心动过缓"}) CREATE (d)-[:disease_risk_factor {reference:"内科学第九版"}]->(r);

//2.4.2.2 房性心动过速
CREATE (:risk_factor {name:"心外科手术",disease:"窦性心动过缓"});
CREATE (:risk_factor {name:"导管消融术",disease:"窦性心动过缓"});
MATCH (d:disease {name:"房性心动过速"}),(r:risk_factor {disease:"房性心动过速"}) CREATE (d)-[:disease_risk_factor {reference:"内科学第九版"}]->(r);
//2.4.2.4 心房颤动
CREATE (:risk_factor {name:"≥80岁",disease:"心房颤动"});
MATCH (d:disease {name:"心房颤动"}),(r:risk_factor {disease:"心房颤动"}) CREATE (d)-[:disease_risk_factor {reference:"内科学第九版"}]->(r);

//2.4.4.1 室性期前收缩
CREATE (:risk_factor {name:"高血压",disease:"室性期前收缩"});
CREATE (:risk_factor {name:"冠心病",disease:"室性期前收缩"});
CREATE (:risk_factor {name:"心肌病",disease:"室性期前收缩"});
CREATE (:risk_factor {name:"风湿性心脏病",disease:"室性期前收缩"});
CREATE (:risk_factor {name:"二尖瓣脱垂",disease:"室性期前收缩"});
MATCH (d:disease {name:"室性期前收缩"}),(r:risk_factor {disease:"室性期前收缩"}) CREATE (d)-[:disease_risk_factor {reference:"内科学第九版"}]->(r);
//2.4.5.1 房室阻滞
CREATE (:risk_factor {name:"部分健康的成年人",disease:"房室阻滞"});
CREATE (:risk_factor {name:"儿童",disease:"房室阻滞"});
CREATE (:risk_factor {name:"运动员",disease:"房室阻滞"});
MATCH (d:disease {name:"房室阻滞"}),(r:risk_factor {disease:"房室阻滞"}) CREATE (d)-[:disease_risk_factor {reference:"内科学第九版"}]->(r);
//2.4.3.5.3 预激综合征
CREATE (:risk_factor {name:"男性",disease:"房室阻滞"});
MATCH (d:disease {name:"预激综合征"}),(r:risk_factor {disease:"预激综合征"}) CREATE (d)-[:disease_risk_factor {reference:"内科学第九版"}]->(r);


//三、病因
//3.4 心律失常
CREATE (:cause {name:"基因突变", disease:"心律失常"});
CREATE (:cause {name:"运动", disease:"心律失常"});
CREATE (:cause {name:"睡眠", disease:"心律失常"});
CREATE (:cause {name:"器质性心脏病", disease:"心律失常"});
CREATE (:cause {name:"冠心病", disease:"心律失常"});
CREATE (:cause {name:"高血压性心脏病", disease:"心律失常"});
CREATE (:cause {name:"风湿性心脏病", disease:"心律失常"});
CREATE (:cause {name:"瓣膜病", disease:"心律失常"});
CREATE (:cause {name:"心肌病", disease:"心律失常"});
CREATE (:cause {name:"心肌炎", disease:"心律失常"});
CREATE (:cause {name:"先天性心脏病", disease:"心律失常"});
CREATE (:cause {name:"药物毒性作用", disease:"心律失常"});
CREATE (:cause {name:"酸碱平衡", disease:"心律失常"});
CREATE (:cause {name:"电解质紊乱", disease:"心律失常"});
CREATE (:cause {name:"神经与体液调节功能失调", disease:"心律失常"});
CREATE (:cause {name:"甲状腺功能亢进", disease:"心律失常"});
CREATE (:cause {name:"贫血", disease:"心律失常"});
CREATE (:cause {name:"重度感染", disease:"心律失常"});
CREATE (:cause {name:"脑卒中", disease:"心律失常"});
CREATE (:cause {name:"胸部手术（尤其是心脏手术）", disease:"心律失常"});
CREATE (:cause {name:"麻醉过程", disease:"心律失常"});
CREATE (:cause {name:"心导管检查", disease:"心律失常"});
CREATE (:cause {name:"心脏介入性治疗", disease:"心律失常"});
CREATE (:cause {name:"毒素（如河豚素）", disease:"心律失常"});
MATCH (d:disease {name:"心律失常"}),(c:cause {disease:"心律失常"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//3.4.1.1 窦性心动过速
CREATE (:cause {name:"窦房结本身的自律性增强",disease:"窦性心动过速"});
CREATE (:cause {name:"自主神经对窦房结的调节异常",disease:"窦性心动过速"});
MATCH (d:disease {name:"窦性心动过速"}),(c:cause {disease:"窦性心动过速"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//3.4.1.2 窦性心动过缓
CREATE (:cause {name:"窦房结病变",disease:"窦性心动过缓"});
CREATE (:cause {name:"急性下壁心肌梗死",disease:"窦性心动过缓"});
MATCH (d:disease {name:"窦性心动过缓"}),(c:cause {disease:"窦性心动过缓"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//3.4.1.3 窦性停搏
CREATE (:cause {name:"窦房结变性与纤维化",disease:"窦性停搏"});
CREATE (:cause {name:"急性下壁心肌梗死",disease:"窦性停搏"});
CREATE (:cause {name:"脑血管意外",disease:"窦性停搏"});
CREATE (:cause {name:"迷走神经张力增高",disease:"窦性停搏"});
CREATE (:cause {name:"颈动脉窦过敏",disease:"窦性停搏"});
MATCH (d:disease {name:"窦性停搏"}),(c:cause {disease:"窦性停搏"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//3.4.1.4 窦房传导阻滞
CREATE (:cause {name:"纤维化与脂肪浸润", disease:"窦房传导阻滞"});
CREATE (:cause {name:"硬化与退行性变", disease:"窦房传导阻滞"});
CREATE (:cause {name:"淀粉样变性", disease:"窦房传导阻滞"});
CREATE (:cause {name:"甲状腺功能减退", disease:"窦房传导阻滞"});
CREATE (:cause {name:"窦房结周围神经的病变", disease:"窦房传导阻滞"});
CREATE (:cause {name:"心房肌的病变", disease:"窦房传导阻滞"});
CREATE (:cause {name:"窦房结动脉供血减少", disease:"窦房传导阻滞"});
CREATE (:cause {name:"颈动脉窦过敏", disease:"窦房传导阻滞"});
CREATE (:cause {name:"脑血管意外", disease:"窦房传导阻滞"});
CREATE (:cause {name:"高血钾", disease:"窦房传导阻滞"});
CREATE (:cause {name:"迷走神经张力增高", disease:"窦房传导阻滞"});
MATCH (d:disease {name:"窦房传导阻滞"}),(c:cause {disease:"窦房传导阻滞"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.4.1.5 病态窦房结综合征
CREATE (:cause {name:"纤维化与脂肪浸润", disease:"病态窦房结综合征"});
CREATE (:cause {name:"硬化与退行性变", disease:"病态窦房结综合征"});
CREATE (:cause {name:"淀粉样变性", disease:"病态窦房结综合征"});
CREATE (:cause {name:"甲状腺功能减退", disease:"病态窦房结综合征"});
CREATE (:cause {name:"窦房结周围神经的病变", disease:"病态窦房结综合征"});
CREATE (:cause {name:"心房肌的病变", disease:"病态窦房结综合征"});
CREATE (:cause {name:"窦房结动脉供血减少", disease:"病态窦房结综合征"});
CREATE (:cause {name:"颈动脉窦过敏", disease:"病态窦房结综合征"});
CREATE (:cause {name:"脑血管意外", disease:"病态窦房结综合征"});
CREATE (:cause {name:"高血钾", disease:"病态窦房结综合征"});
CREATE (:cause {name:"迷走神经张力增高", disease:"病态窦房结综合征"});
MATCH (d:disease {name:"病态窦房结综合征"}),(c:cause {disease:"病态窦房结综合征"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.4.2.2 房性心动过速
CREATE (:cause {name:"冠心病", disease:"房性心动过速"});
CREATE (:cause {name:"慢性肺部疾病", disease:"房性心动过速"});
CREATE (:cause {name:"洋地黄中毒", disease:"房性心动过速"});
CREATE (:cause {name:"代谢障碍", disease:"房性心动过速"});
MATCH (d:disease {name:"房性心动过速"}),(c:cause {disease:"房性心动过速"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.4.2.3 心房扑动
CREATE (:cause {name:"风湿性心脏病", disease:"心房扑动"});
CREATE (:cause {name:"冠心病", disease:"心房扑动"});
CREATE (:cause {name:"高血压性心脏病", disease:"心房扑动"});
CREATE (:cause {name:"心肌病", disease:"心房扑动"});
CREATE (:cause {name:"肺栓塞", disease:"心房扑动"});
CREATE (:cause {name:"慢性充血性心力衰竭", disease:"心房扑动"});
CREATE (:cause {name:"二、三尖瓣狭窄与反流导致心房扩大", disease:"心房扑动"});
CREATE (:cause {name:"甲状腺功能亢进", disease:"心房扑动"});
CREATE (:cause {name:"酒精中毒", disease:"心房扑动"});
CREATE (:cause {name:"心包炎", disease:"心房扑动"});
MATCH (d:disease {name:"心房扑动"}),(c:cause {disease:"心房扑动"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.4.2.4 心房颤动
CREATE (:cause {name:"器质性心脏病", disease:"心房颤动"});
CREATE (:cause {name:"高血压性心脏病", disease:"心房颤动"});
CREATE (:cause {name:"冠心病", disease:"心房颤动"});
CREATE (:cause {name:"风湿性心脏病二尖瓣狭窄", disease:"心房颤动"});
CREATE (:cause {name:"心肌病", disease:"心房颤动"});
CREATE (:cause {name:"甲状腺功能亢进", disease:"心房颤动"});
CREATE (:cause {name:"缩窄性心包炎", disease:"心房颤动"});
CREATE (:cause {name:"慢性肺源性心脏病", disease:"心房颤动"});
CREATE (:cause {name:"预激综合征", disease:"心房颤动"});
CREATE (:cause {name:"老龄", disease:"心房颤动"});
MATCH (d:disease {name:"心房颤动"}),(c:cause {disease:"心房颤动"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.4.3.4 非阵发性房室交界区性心动过速
CREATE (:cause {name:"洋地黄中毒", disease:"非阵发性房室交界区性心动过速"});
MATCH (d:disease {name:"非阵发性房室交界区性心动过速"}),(c:cause {disease:"非阵发性房室交界区性心动过速"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.4.4.1 室性期前收缩
CREATE (:cause {name:"心肌炎", disease:"室性期前收缩"});
CREATE (:cause {name:"缺血", disease:"室性期前收缩"});
CREATE (:cause {name:"缺氧", disease:"室性期前收缩"});
CREATE (:cause {name:"麻醉", disease:"室性期前收缩"});
CREATE (:cause {name:"手术", disease:"室性期前收缩"});
MATCH (d:disease {name:"室性期前收缩"}),(c:cause {disease:"室性期前收缩"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.4.4.2 室性心动过速
CREATE (:cause {name:"冠心病", disease:"室性心动过速"});
CREATE (:cause {name:"心肌病", disease:"室性心动过速"});
CREATE (:cause {name:"心力衰竭", disease:"室性心动过速"});
CREATE (:cause {name:"二尖瓣脱垂", disease:"室性心动过速"});
CREATE (:cause {name:"心瓣膜病", disease:"室性心动过速"});
CREATE (:cause {name:"代谢障碍", disease:"室性心动过速"});
CREATE (:cause {name:"电解质紊乱", disease:"室性心动过速"});
CREATE (:cause {name:"长QT间期综合征", disease:"室性心动过速"});
MATCH (d:disease {name:"室性心动过速"}),(c:cause {disease:"室性心动过速"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.4.4.3 心室扑动
CREATE (:cause {name:"缺血性心脏病", disease:"心室扑动"});
MATCH (d:disease {name:"心室扑动"}),(c:cause {disease:"心室扑动"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.4.4.4 心室颤动
CREATE (:cause {name:"缺血性心脏病", disease:"心室颤动"});
MATCH (d:disease {name:"心室颤动"}),(c:cause {disease:"心室颤动"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.4.5.1 房室阻滞
CREATE (:cause {name:"冠心病急性心肌梗死", disease:"心室颤动"});
CREATE (:cause {name:"冠状动脉痉挛", disease:"心室颤动"});
CREATE (:cause {name:"心肌炎", disease:"心室颤动"});
CREATE (:cause {name:"心内膜炎", disease:"心室颤动"});
CREATE (:cause {name:"多发性肌炎", disease:"心室颤动"});
CREATE (:cause {name:"心肌病", disease:"心室颤动"});
CREATE (:cause {name:"急性风湿热", disease:"心室颤动"});
CREATE (:cause {name:"主动脉瓣狭窄伴钙化", disease:"心室颤动"});
CREATE (:cause {name:"心脏肿瘤", disease:"心室颤动"});
CREATE (:cause {name:"先天性心血管病", disease:"心室颤动"});
CREATE (:cause {name:"原发性高血压", disease:"心室颤动"});
CREATE (:cause {name:"心脏手术损伤", disease:"心室颤动"});
CREATE (:cause {name:"系统退行性变", disease:"心室颤动"});
CREATE (:cause {name:"Lev病（心脏纤维支架的钙化与硬化）", disease:"心室颤动"});
CREATE (:cause {name:"药物中毒（如洋地黄）", disease:"心室颤动"});
CREATE (:cause {name:"电解质紊乱（如高钾血症）", disease:"心室颤动"});
CREATE (:cause {name:"黏液性水肿", disease:"心室颤动"});
CREATE (:cause {name:"心脏浸润性病变（如淀粉样变、结节病或硬皮病）", disease:"心室颤动"});
MATCH (d:disease {name:"心室颤动"}),(c:cause {disease:"心室颤动"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.4.5.2 室内阻滞
CREATE (:cause {name:"风湿性心脏病",comment:"右束支阻滞",disease:"室内阻滞"});
CREATE (:cause {name:"先天性心脏病房间隔缺损",comment:"右束支阻滞",disease:"室内阻滞"});
CREATE (:cause {name:"高血压",comment:"右束支阻滞",disease:"室内阻滞"});
CREATE (:cause {name:"冠心病",comment:"右束支阻滞",disease:"室内阻滞"});
CREATE (:cause {name:"肺源性心脏病",comment:"右束支阻滞",disease:"室内阻滞"});
CREATE (:cause {name:"充血性心力衰竭",comment:"左束支阻滞",disease:"室内阻滞"});
CREATE (:cause {name:"急性心肌梗死",comment:"左束支阻滞",disease:"室内阻滞"});
CREATE (:cause {name:"急性感染",comment:"左束支阻滞",disease:"室内阻滞"});
CREATE (:cause {name:"奎尼丁与普鲁卡因胺中毒",comment:"左束支阻滞",disease:"室内阻滞"});
CREATE (:cause {name:"高血压性心脏病",comment:"左束支阻滞",disease:"室内阻滞"});
CREATE (:cause {name:"风湿性心脏病",comment:"左束支阻滞",disease:"室内阻滞"});
CREATE (:cause {name:"冠心病",comment:"左束支阻滞",disease:"室内阻滞"});
CREATE (:cause {name:"梅毒性心脏病",comment:"左束支阻滞",disease:"室内阻滞"});
MATCH (d:disease {name:"室内阻滞"}),(c:cause {disease:"室内阻滞"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//3.4.3.5.2 房室折返性心动过速
CREATE (:cause {name:"预激综合征",disease:"房室折返性心动过速"});
MATCH (d:disease {name:"房室折返性心动过速"}),(c:cause {disease:"房室折返性心动过速"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//3.4.3.5.3 预激综合征
CREATE (:cause {name:"三尖瓣下移畸形（Ebstein畸形）",disease:"预激综合征"});
CREATE (:cause {name:"二尖瓣脱垂",disease:"预激综合征"});
CREATE (:cause {name:"各类心肌病",disease:"预激综合征"});
CREATE (:cause {name:"冠心病",disease:"预激综合征"});
MATCH (d:disease {name:"预激综合征"}),(c:cause {disease:"预激综合征"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);


//四、诱因

//4.4.1.1 窦性心动过速
CREATE (:inducement {name:"吸烟",disease:"窦性心动过速"});
CREATE (:inducement {name:"饮茶咖啡",disease:"窦性心动过速"});
CREATE (:inducement {name:"饮酒",disease:"窦性心动过速"});
CREATE (:inducement {name:"体力活动",disease:"窦性心动过速"});
CREATE (:inducement {name:"情绪激动",disease:"窦性心动过速"});
CREATE (:inducement {name:"发热",disease:"窦性心动过速"});
CREATE (:inducement {name:"甲亢",disease:"窦性心动过速"});
CREATE (:inducement {name:"贫血",disease:"窦性心动过速"});
CREATE (:inducement {name:"休克",disease:"窦性心动过速"});
CREATE (:inducement {name:"充血性心力衰竭",disease:"窦性心动过速"});
CREATE (:inducement {name:"应用肾上腺素、阿托品等药物",disease:"窦性心动过速"});
MATCH (d:disease {name:"窦性心动过速"}),(c:inducement {disease:"窦性心动过速"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
//4.4.1.2 窦性心动过缓
CREATE (:inducement {name:"拟胆碱药物",disease:"窦性心动过缓"});
CREATE (:inducement {name:"胺碘酮",disease:"窦性心动过缓"});
CREATE (:inducement {name:"β受体阻滞剂",disease:"窦性心动过缓"});
CREATE (:inducement {name:"非二氢吡啶类钙通道阻滞剂",disease:"窦性心动过缓"});
CREATE (:inducement {name:"洋地黄药物",disease:"窦性心动过缓"});
MATCH (d:disease {name:"窦性心动过缓"}),(c:inducement {disease:"窦性心动过缓"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
//4.4.1.3 窦性停搏
CREATE (:inducement {name:"应用洋地黄类药物",disease:"窦性停搏"});
CREATE (:inducement {name:"应用乙酰胆碱等药物",disease:"窦性停搏"});
MATCH (d:disease {name:"窦性停搏"}),(r:inducement {disease:"窦性停搏"}) CREATE (d)-[:disease_inducement {reference:"内科学第九版"}]->(r);
//4.4.1.4 窦房传导阻滞
CREATE (:inducement {name:"布鲁氏菌病", disease:"窦房传导阻滞"});
CREATE (:inducement {name:"伤寒", disease:"窦房传导阻滞"});
CREATE (:inducement {name:"洋地黄类药物", disease:"窦房传导阻滞"});
CREATE (:inducement {name:"乙酰胆碱等药物", disease:"窦房传导阻滞"});
MATCH (d:disease {name:"窦房传导阻滞"}),(r:inducement {disease:"窦房传导阻滞"}) CREATE (d)-[:disease_inducement {reference:"内科学第九版"}]->(r);
//4.4.1.5 病态窦房结综合征
CREATE (:inducement {name:"布鲁氏菌病", disease:"病态窦房结综合征"});
CREATE (:inducement {name:"伤寒", disease:"病态窦房结综合征"});
CREATE (:inducement {name:"洋地黄类药物", disease:"病态窦房结综合征"});
CREATE (:inducement {name:"乙酰胆碱等药物", disease:"病态窦房结综合征"});
MATCH (d:disease {name:"窦房传导阻滞"}),(r:inducement {disease:"窦房传导阻滞"}) CREATE (d)-[:disease_inducement {reference:"内科学第九版"}]->(r);
//4.4.2.1 房性期前收缩
CREATE (:inducement {name:"吸烟", disease:"房性期前收缩"});
CREATE (:inducement {name:"饮酒", disease:"房性期前收缩"});
CREATE (:inducement {name:"咖啡", disease:"房性期前收缩"});
MATCH (d:disease {name:"房性期前收缩"}),(r:inducement {disease:"房性期前收缩"}) CREATE (d)-[:disease_inducement {reference:"内科学第九版"}]->(r);
//4.4.2.2 房性心动过速
CREATE (:inducement {name:"大量饮酒",disease:"房性心动过速"});
MATCH (d:disease {name:"房性心动过速"}),(c:inducement {disease:"房性心动过速"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
//4.4.2.4 心房颤动
CREATE (:inducement {name:"情绪激动",disease:"心房颤动"});
CREATE (:inducement {name:"外科手术",disease:"心房颤动"});
CREATE (:inducement {name:"运动",disease:"心房颤动"});
CREATE (:inducement {name:"大量饮酒",disease:"心房颤动"});
MATCH (d:disease {name:"心房颤动"}),(c:inducement {disease:"心房颤动"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
//4.4.3.4 非阵发性房室交界区性心动过速
CREATE (:inducement {name:"下壁心肌梗死",disease:"非阵发性房室交界区性心动过速"});
CREATE (:inducement {name:"心肌炎",disease:"非阵发性房室交界区性心动过速"});
CREATE (:inducement {name:"急性风湿热",disease:"非阵发性房室交界区性心动过速"});
CREATE (:inducement {name:"心瓣膜手术",disease:"非阵发性房室交界区性心动过速"});
MATCH (d:disease {name:"非阵发性房室交界区性心动过速"}),(c:inducement {disease:"非阵发性房室交界区性心动过速"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
//4.4.4.1 室性期前收缩
CREATE (:inducement {name:"洋地黄",disease:"室性期前收缩"});
CREATE (:inducement {name:"奎尼丁",disease:"室性期前收缩"});
CREATE (:inducement {name:"三环类抗抑郁药",disease:"室性期前收缩"});
CREATE (:inducement {name:"电解质紊乱（低钾、低镁等）",disease:"室性期前收缩"});
CREATE (:inducement {name:"烟",disease:"室性期前收缩"});
CREATE (:inducement {name:"酒",disease:"室性期前收缩"});
CREATE (:inducement {name:"咖啡",disease:"室性期前收缩"});
MATCH (d:disease {name:"室性期前收缩"}),(c:inducement {disease:"室性期前收缩"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
//4.4.4.3 心室扑动
CREATE (:inducement {name:"抗心律失常药物",disease:"心室扑动"});
CREATE (:inducement {name:"严重缺氧",disease:"心室扑动"});
CREATE (:inducement {name:"缺血",disease:"心室扑动"});
CREATE (:inducement {name:"预激综合征合并房颤与极快的心室率",disease:"心室扑动"});
CREATE (:inducement {name:"电击伤",disease:"心室扑动"});
MATCH (d:disease {name:"心室扑动"}),(c:inducement {disease:"心室扑动"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
//4.4.4.4 心室颤动
CREATE (:inducement {name:"抗心律失常药物",disease:"心室颤动"});
CREATE (:inducement {name:"严重缺氧",disease:"心室颤动"});
CREATE (:inducement {name:"缺血",disease:"心室颤动"});
CREATE (:inducement {name:"预激综合征合并房颤与极快的心室率",disease:"心室颤动"});
CREATE (:inducement {name:"电击伤",disease:"心室颤动"});
MATCH (d:disease {name:"心室颤动"}),(c:inducement {disease:"心室颤动"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);

//五、临床症状
//5.4.1.1 窦性心动过速
CREATE (:symptom {characteristic:"通常逐渐开始和终止", disease:"窦性心动过速"});
CREATE (:symptom {characteristic:"频率大多在100~150次/分", disease:"窦性心动过速"});
CREATE (:symptom {characteristic:"刺激迷走神经可使其频率逐渐减慢，停止刺激后又加速至原先水平", disease:"窦性心动过速"});
MATCH (d:disease {name:"窦性心动过速"}),(s:symptom {disease:"窦性心动过速"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.1.2 窦性心动过缓
CREATE (:symptom {characteristic:"频率低于60次/分",disease:"窦性心动过缓"});
CREATE (:symptom {characteristic:"伴有窦性心律不齐（不同PP间期的差异>0.12秒）", disease:"窦性心动过缓"});
MATCH (d:disease {name:"窦性心动过缓"}),(s:symptom {disease:"窦性心动过缓"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.1.3 窦性停搏
CREATE (:symptom {characteristic:"在较正常PP间期显著长的间期内无P波发生",examination:"心电图",disease:"窦性停搏"});
CREATE (:symptom {characteristic:"P波与QRS波均不出现",examination:"心电图",disease:"窦性停搏"});
CREATE (:symptom {characteristic:"长的PP间期与基本的窦性PP间期无倍数关系",examination:"心电图",disease:"窦性停搏"});
CREATE (:symptom {characteristic:"黑矇",comment:"过长时间的窦性停搏（>3秒）且无逸搏发生",disease:"窦性停搏"});
CREATE (:symptom {characteristic:"短暂意识障碍",comment:"过长时间的窦性停搏（>3秒）且无逸搏发生",disease:"窦性停搏"});
CREATE (:symptom {characteristic:"晕厥",comment:"过长时间的窦性停搏（>3秒）且无逸搏发生",disease:"窦性停搏"});
CREATE (:symptom {characteristic:"Adams-Stokes综合征",comment:"严重者",disease:"窦性停搏"});
CREATE (:symptom {characteristic:"死亡",comment:"严重者",disease:"窦性停搏"});
MATCH (d:disease {name:"窦性停搏"}),(s:symptom {disease:"窦性停搏"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.1.4 窦房传导阻滞
CREATE (:symptom {characteristic:"PP间期进行性缩短，直至出现一次长PP间期，该长PP间期短于基本PP间期的两倍",examination:"心电图",comment:"莫氏I型阻滞",disease:"窦房传导阻滞"});
CREATE (:symptom {characteristic:"长PP间期为基本PP间期的整倍数",comment:"莫氏I型阻滞",examination:"心电图",disease:"窦房传导阻滞"});
CREATE (:symptom {characteristic:"窦房阻滞后可出现逸搏心律",disease:"窦房传导阻滞"});
MATCH (d:disease {name:"窦房传导阻滞"}),(s:symptom {disease:"窦房传导阻滞"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.1.5 病态窦房结综合征
CREATE (:symptom {characteristic:"头晕", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"黑矇", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"心悸", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"乏力", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"运动耐力下降", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"心绞痛", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"心力衰竭", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"短暂意识障碍", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"晕厥", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"猝死", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"心动过速", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"心绞痛", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"非药物引起的持续而显著的窦性心动过缓（50次/分以下）", examination:"心电图", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"窦性停搏或窦性静止与窦房阻滞", examination:"心电图", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"窦房阻滞与房室阻滞并存", examination:"心电图", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"心动过缓-心动过速综合征", examination:"心电图", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"心房颤动的心室率缓慢，并有窦性心动过缓和（或）一度房室阻滞", examination:"心电图", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"变时功能不全，表现为运动后心率提高不显著", examination:"心电图", disease:"病态窦房结综合征"});
CREATE (:symptom {characteristic:"房室交界区性逸搏心律", examination:"心电图", disease:"病态窦房结综合征"});
MATCH (d:disease {name:"病态窦房结综合征"}),(s:symptom {disease:"病态窦房结综合征"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.2.1 房性期前收缩
CREATE (:symptom {characteristic:"心悸",disease:"房性期前收缩"});
CREATE (:symptom {characteristic:"胸闷",disease:"房性期前收缩"});
CREATE (:symptom {characteristic:"乏力",disease:"房性期前收缩"});
CREATE (:symptom {characteristic:"停跳感",disease:"房性期前收缩"});
CREATE (:symptom {characteristic:"P波提前发生，与窦性P波形态不同",examination:"心电图",disease:"房性期前收缩"});
CREATE (:symptom {characteristic:"PR间期>120毫秒",examination:"心电图",disease:"房性期前收缩"});
CREATE (:symptom {characteristic:"QRS波群呈室上性，部分可有室内差异性传导",examination:"心电图",disease:"房性期前收缩"});
CREATE (:symptom {characteristic:"多为不完全代间歇",examination:"心电图",disease:"房性期前收缩"});
MATCH (d:disease {name:"房性期前收缩"}),(s:symptom {disease:"房性期前收缩"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.2.2 房性心动过速
CREATE (:symptom {characteristic:"心悸",disease:"房性心动过速"});
CREATE (:symptom {characteristic:"头晕",disease:"房性心动过速"});
CREATE (:symptom {characteristic:"胸痛",disease:"房性心动过速"});
CREATE (:symptom {characteristic:"憋气",disease:"房性心动过速"});
CREATE (:symptom {characteristic:"乏力",disease:"房性心动过速"});
CREATE (:symptom {characteristic:"晕厥",comment:"合并器质性心脏病",disease:"房性心动过速"});
CREATE (:symptom {characteristic:"心肌缺血",comment:"合并器质性心脏病",disease:"房性心动过速"});
CREATE (:symptom {characteristic:"肺水肿",comment:"合并器质性心脏病",disease:"房性心动过速"});
CREATE (:symptom {characteristic:"心律不恒定",comment:"房室传导比例发生变动",disease:"房性心动过速"});
CREATE (:symptom {characteristic:"第一心音强度变化",comment:"房室传导比例发生变动",disease:"房性心动过速"});
CREATE (:symptom {characteristic:"症状发作可呈短暂、间歇或持续发生",disease:"房性心动过速"});
MATCH (d:disease {name:"房性心动过速"}),(s:symptom {disease:"房性心动过速"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.2.2.1 局灶性房性心动过速
CREATE (:symptom {characteristic:"心悸",examination:"心电图",disease:"局灶性房性心动过速"});
CREATE (:symptom {characteristic:"P波形态与窦性P波不同",examination:"心电图",disease:"局灶性房性心动过速"});
CREATE (:symptom {characteristic:"当房率加快时可出现二度Ⅰ型或Ⅱ型房室阻滞，呈现2：1房室传导，但心动过速不受影响",examination:"心电图",disease:"局灶性房性心动过速"});
CREATE (:symptom {characteristic:"P波之间的等电线仍存在，与心房扑动时等电线消失不同",examination:"心电图",disease:"局灶性房性心动过速"});
CREATE (:symptom {characteristic:"刺激迷走神经不能终止心动过速，加重房室阻滞",examination:"心电图",disease:"局灶性房性心动过速"});
CREATE (:symptom {characteristic:"发作开始时心率逐渐加速",examination:"心电图",disease:"局灶性房性心动过速"});
MATCH (d:disease {name:"局灶性房性心动过速"}),(s:symptom {disease:"局灶性房性心动过速"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.2.2.1 多源性房性心动过速
CREATE (:symptom {characteristic:"P波通常有3种或以上形态各异，PR间期各不相同",examination:"心电图",disease:"多源性房性心动过速"});
CREATE (:symptom {characteristic:"心房率通常在100~130次/分之间",examination:"心电图",disease:"多源性房性心动过速"});
CREATE (:symptom {characteristic:"大多数P波能下传心室，但部分P波因过早发生而受阻，导致心室率不规则",examination:"心电图",disease:"多源性房性心动过速"});
MATCH (d:disease {name:"多源性房性心动过速"}),(s:symptom {disease:"多源性房性心动过速"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.2.3 心房扑动
CREATE (:symptom {characteristic:"无症状",comment:"心室率不快",disease:"心房扑动"});
CREATE (:symptom {characteristic:"心绞痛",comment:"房扑伴有极快的心室率",disease:"心房扑动"});
CREATE (:symptom {characteristic:"充血性心力衰竭",comment:"房扑伴有极快的心室率",disease:"心房扑动"});
CREATE (:symptom {characteristic:"恢复窦性心律",disease:"心房扑动"});
CREATE (:symptom {characteristic:"进展为心房颤动",disease:"心房扑动"});
CREATE (:symptom {characteristic:"心房血栓",disease:"心房扑动"});
CREATE (:symptom {characteristic:"体循环栓塞",disease:"心房扑动"});
CREATE (:symptom {characteristic:"快速的颈静脉扑动",disease:"心房扑动"});
CREATE (:symptom {characteristic:"第一心音强度变化",comment:"房室传导比例发生变化",disease:"心房扑动"});
CREATE (:symptom {characteristic:"心房音",disease:"心房扑动"});
CREATE (:symptom {characteristic:"窦性P波消失，代之以F波",examination:"心电图",disease:"心房扑动"});
CREATE (:symptom {characteristic:"扑动波之间的等电线消失，频率常为250~350次/分",examination:"心电图",disease:"心房扑动"});
CREATE (:symptom {characteristic:"心室率规则或不规则，取决于房室传导比例是否恒定",examination:"心电图",disease:"心房扑动"});
CREATE (:symptom {characteristic:"房扑波多以2：1及4：1交替下传",examination:"心电图",disease:"心房扑动"});
CREATE (:symptom {characteristic:"QRS波形态正常",examination:"心电图",disease:"心房扑动"});
CREATE (:symptom {characteristic:"QRS波增宽、形态异常",comment:"室内差异传导、原先有束支阻滞或经房室旁路下传",examination:"心电图",disease:"心房扑动"});
MATCH (d:disease {name:"心房扑动"}),(s:symptom {disease:"心房扑动"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//5.4.2.4 心房颤动
CREATE (:symptom {characteristic:"无症状",comment:"心室率不快",disease:"心房扑动"});
CREATE (:symptom {characteristic:"心绞痛",comment:"心室率超过150次/分",disease:"心房扑动"});
CREATE (:symptom {characteristic:"心绞痛",comment:"充血性心力衰竭",disease:"心房扑动"});
CREATE (:symptom {characteristic:"心排血量减少",disease:"心房扑动"});
CREATE (:symptom {characteristic:"血栓栓塞危险性大",disease:"心房扑动"});
CREATE (:symptom {characteristic:"第一心音强度变化不定",disease:"心房扑动"});
CREATE (:symptom {characteristic:"心律极不规则",disease:"心房扑动"});
CREATE (:symptom {characteristic:"脉搏短绌",disease:"心房扑动"});
CREATE (:symptom {characteristic:"P波消失",examination:"心电图",disease:"心房扑动"});
CREATE (:symptom {characteristic:"F波频率为350~600次/分",examination:"心电图",disease:"心房扑动"});
CREATE (:symptom {characteristic:"心室率极不规则",examination:"心电图",disease:"心房扑动"});
CREATE (:symptom {characteristic:"QRS波形态通常正常",examination:"心电图",disease:"心房扑动"});
CREATE (:symptom {characteristic:"QRS波增宽变形",comment:"心室率过快，发生室内差异性传导",examination:"心电图",disease:"心房扑动"});
MATCH (d:disease {name:"心房颤动"}),(s:symptom {disease:"心房颤动"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//5.4.3.2 房室交界区性逸搏
CREATE (:symptom {characteristic:"颈静脉搏动可出现大的α波",disease:"房室交界区性逸搏"});
CREATE (:symptom {characteristic:"第一心音强度变化不定",disease:"房室交界区性逸搏"});
CREATE (:symptom {characteristic:"在长于正常PP间期的间歇后出现一个正常的QRS波群",examination:"心电图",disease:"房室交界区性逸搏"});
CREATE (:symptom {characteristic:"P波缺失",examination:"心电图",disease:"房室交界区性逸搏"});
CREATE (:symptom {characteristic:"逆行P波位于QRS波群之前或之后",examination:"心电图",disease:"房室交界区性逸搏"});
CREATE (:symptom {characteristic:"可见到未下传至心室的窦性P波",examination:"心电图",disease:"房室交界区性逸搏"});
MATCH (d:disease {name:"房室交界区性逸搏"}),(s:symptom {disease:"房室交界区性逸搏"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.3.3 房室交界区性心律
CREATE (:symptom {characteristic:"颈静脉搏动可出现大的α波",disease:"房室交界区性心律"});
CREATE (:symptom {characteristic:"第一心音强度变化不定",disease:"房室交界区性心律"});
CREATE (:symptom {characteristic:"正常下传的QRS波群，频率为40~60次/分",examination:"心电图",disease:"房室交界区性心律"});
CREATE (:symptom {characteristic:"逆行P波",examination:"心电图",disease:"房室交界区性心律"});
CREATE (:symptom {characteristic:"房室分离，心室率超过心房率",examination:"心电图",disease:"房室交界区性心律"});
MATCH (d:disease {name:"房室交界区性心律"}),(s:symptom {disease:"房室交界区性心律"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.3.4 非阵发性房室交界区性心动过速
CREATE (:symptom {characteristic:"心率70~150次/分或更快",disease:"非阵发性房室交界区性心动过速"});
CREATE (:symptom {characteristic:"心律通常规则",disease:"非阵发性房室交界区性心动过速"});
CREATE (:symptom {characteristic:"QRS波正常",disease:"非阵发性房室交界区性心动过速"});
CREATE (:symptom {characteristic:"房室分离",comment:"心房活动由窦房结或异位心房起搏点控制",disease:"非阵发性房室交界区性心动过速"});
CREATE (:symptom {characteristic:"心室律变得不规则",comment:"洋地黄过量引起者,合并房室交界区文氏型传导阻滞",disease:"非阵发性房室交界区性心动过速"});
MATCH (d:disease {name:"非阵发性房室交界区性心动过速"}),(s:symptom {disease:"非阵发性房室交界区性心动过速"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.3.5.1 房室结折返性心动过速
CREATE (:symptom {characteristic:"心悸",disease:"房室结折返性心动过速"});
CREATE (:symptom {characteristic:"胸闷",disease:"房室结折返性心动过速"});
CREATE (:symptom {characteristic:"焦虑不安",disease:"房室结折返性心动过速"});
CREATE (:symptom {characteristic:"头晕",disease:"房室结折返性心动过速"});
CREATE (:symptom {characteristic:"晕厥",disease:"房室结折返性心动过速"});
CREATE (:symptom {characteristic:"心绞痛",disease:"房室结折返性心动过速"});
CREATE (:symptom {characteristic:"心力衰竭",disease:"房室结折返性心动过速"});
CREATE (:symptom {characteristic:"休克",disease:"房室结折返性心动过速"});
CREATE (:symptom {characteristic:"心尖区第一心音强度恒定",disease:"房室结折返性心动过速"});
CREATE (:symptom {characteristic:"心律绝对规则",disease:"房室结折返性心动过速"});
CREATE (:symptom {characteristic:"心率150~250次/分，节律规则",examination:"心电图",disease:"房室结折返性心动过速"});
CREATE (:symptom {characteristic:"QRS波形态与时限均正常",examination:"心电图",disease:"房室结折返性心动过速"});
CREATE (:symptom {characteristic:"QRS波形态异常",comment:"发生室内差异性传导或束支阻滞",examination:"心电图",disease:"房室结折返性心动过速"});
CREATE (:symptom {characteristic:"P波为逆行性，与QRS波保持固定关系",examination:"心电图",disease:"房室结折返性心动过速"});
CREATE (:symptom {characteristic:"起始突然",examination:"心电图",disease:"房室结折返性心动过速"});
MATCH (d:disease {name:"房室结折返性心动过速"}),(s:symptom {disease:"房室结折返性心动过速"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//5.4.3.5.2 房室折返性心动过速
CREATE (:symptom {characteristic:"阵发性心悸",disease:"房室折返性心动过速"});
CREATE (:symptom {characteristic:"QRS波群形态正常",comment:"顺向型房室折返性心动过速",examination:"心电图",disease:"预激综合征"});
CREATE (:symptom {characteristic:"心室率可达150~250次/分",comment:"顺向型房室折返性心动过速",examination:"心电图",disease:"预激综合征"});
CREATE (:symptom {characteristic:"QRS波群宽大畸形",comment:"逆向型房室折返性心动过速",examination:"心电图",disease:"预激综合征"});
MATCH (d:disease {name:"房室折返性心动过速"}),(s:symptom {disease:"房室折返性心动过速"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.3.5.3 预激综合征
CREATE (:symptom {characteristic:"窦性心搏的PR间期短于0.12秒",examination:"心电图",disease:"预激综合征"});
CREATE (:symptom {characteristic:"某些导联之QRS波群时限超过0.12秒",examination:"心电图",disease:"预激综合征"});
CREATE (:symptom {characteristic:"QRS波群起始部分粗钝（称σ波），终末部分正常",examination:"心电图",disease:"预激综合征"});
CREATE (:symptom {characteristic:"ST-T波呈继发性改变，与QRS波群主波方向相反",examination:"心电图",disease:"预激综合征"});
CREATE (:symptom {characteristic:"胸导联QRS波群主波均向上",comment:"预激发生在左室或右室后底部",examination:"心电图",disease:"预激综合征"});
CREATE (:symptom {characteristic:"QRS波群在V1导联主波向下，V5、V6导联主波向上",comment:"预激发生在右室前侧壁",examination:"心电图",disease:"预激综合征"});

//5.4.3.7 阵发性室上性心动过速
CREATE (:symptom {characteristic:"QRS波群形态正常、RR间期规则的快速心律",examination:"心电图",disease:"阵发性室上性心动过速"});
MATCH (d:disease {name:"阵发性室上性心动过速"}),(s:symptom {disease:"阵发性室上性心动过速"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.4.1 室性期前收缩
CREATE (:symptom {characteristic:"心悸",disease:"室性期前收缩"});
CREATE (:symptom {characteristic:"心跳",disease:"室性期前收缩"});
CREATE (:symptom {characteristic:"“停跳”感",disease:"室性期前收缩"});
CREATE (:symptom {characteristic:"头晕",disease:"室性期前收缩"});
CREATE (:symptom {characteristic:"乏力",disease:"室性期前收缩"});
CREATE (:symptom {characteristic:"胸闷",disease:"室性期前收缩"});
CREATE (:symptom {characteristic:"心绞痛",comment:"严重器质性心脏疾病者，长时间频发室性期前收缩",disease:"室性期前收缩"});
CREATE (:symptom {characteristic:"低血压",comment:"严重器质性心脏疾病者，长时间频发室性期前收缩",disease:"室性期前收缩"});
CREATE (:symptom {characteristic:"心衰",comment:"严重器质性心脏疾病者，长时间频发室性期前收缩",disease:"室性期前收缩"});
CREATE (:symptom {characteristic:"室性期前收缩后出现较长的停歇",disease:"室性期前收缩"});
CREATE (:symptom {characteristic:"室性期前收缩的第二心音强度减弱",disease:"室性期前收缩"});
CREATE (:symptom {characteristic:"仅能听到第一心音",disease:"室性期前收缩"});
CREATE (:symptom {characteristic:"桡动脉搏动减弱或消",disease:"室性期前收缩"});
CREATE (:symptom {characteristic:"室性期前收缩表现为提前发生的QRS波群，时限常超过0.12秒，宽大畸形",examination:"心电图",disease:"室性期前收缩"});
CREATE (:symptom {characteristic:"ST段与T波的方向与QRS主波方向相反",examination:"心电图",disease:"室性期前收缩"});
CREATE (:symptom {characteristic:"完全性代间歇",examination:"心电图",disease:"室性期前收缩"});
MATCH (d:disease {name:"室性期前收缩"}),(s:symptom {disease:"室性期前收缩"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//5.4.4.2 室性心动过速
CREATE (:symptom {characteristic:"无症状",comment:"非持续性室速（发作时间短于30秒，能自行终止）",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"低血压",comment:"持续性室速（发作时间超过30秒，需药物或电复律始能终止）",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"少尿",comment:"持续性室速（发作时间超过30秒，需药物或电复律始能终止）",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"气促",comment:"持续性室速（发作时间超过30秒，需药物或电复律始能终止）",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"心绞痛",comment:"持续性室速（发作时间超过30秒，需药物或电复律始能终止）",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"晕厥",comment:"持续性室速（发作时间超过30秒，需药物或电复律始能终止）",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"心源性晕厥",comment:"心室颤动",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"心脏骤停",comment:"心室颤动",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"心脏骤停",comment:"心室颤动",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"听诊心律可轻度不规则",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"第一、二心音分裂",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"收缩期血压随心搏变化",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"3个或以上的室性期前收缩连续出现",examination:"心电图",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"心室率常为100~250次/分",examination:"心电图",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"节律规则或略不规则",examination:"心电图",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"心房独立活动与QRS波无固定关系，形成室房分离",examination:"心电图",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"偶可见心室激动逆传夺获心房",examination:"心电图",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"心室夺获",examination:"心电图",disease:"室性心动过速"});
CREATE (:symptom {characteristic:"室性融合波",examination:"心电图",disease:"室性心动过速"});
MATCH (d:disease {name:"室性心动过速"}),(s:symptom {disease:"室性心动过速"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.4.3 心室扑动
CREATE (:symptom {characteristic:"意识丧失",disease:"心室扑动"});
CREATE (:symptom {characteristic:"抽搐",disease:"心室扑动"});
CREATE (:symptom {characteristic:"呼吸停顿",disease:"心室扑动"});
CREATE (:symptom {characteristic:"死亡",disease:"心室扑动"});
CREATE (:symptom {characteristic:"听诊心音消失",disease:"心室扑动"});
CREATE (:symptom {characteristic:"脉搏触不到",disease:"心室扑动"});
CREATE (:symptom {characteristic:"血压亦无法测到",disease:"心室扑动"});
CREATE (:symptom {characteristic:"波形呈正弦图形，波幅大而规则",examination:"心电图",disease:"心室扑动"});
CREATE (:symptom {characteristic:"QRS波呈单形性",examination:"心电图",disease:"心室扑动"});
CREATE (:symptom {characteristic:"频率150~300次/分（通常在200次/ 分以上)",examination:"心电图",disease:"心室扑动"});
MATCH (d:disease {name:"心室扑动"}),(s:symptom {disease:"心室扑动"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.4.4 心室颤动
CREATE (:symptom {characteristic:"意识丧失",disease:"心室颤动"});
CREATE (:symptom {characteristic:"抽搐",disease:"心室颤动"});
CREATE (:symptom {characteristic:"呼吸停顿",disease:"心室颤动"});
CREATE (:symptom {characteristic:"死亡",disease:"心室颤动"});
CREATE (:symptom {characteristic:"听诊心音消失",disease:"心室颤动"});
CREATE (:symptom {characteristic:"脉搏触不到",disease:"心室颤动"});
CREATE (:symptom {characteristic:"血压亦无法测到",disease:"心室颤动"});
CREATE (:symptom {characteristic:"波形、振幅与频率均极不规则",examination:"心电图",disease:"心室颤动"});
CREATE (:symptom {characteristic:"无法辨认QRS波群、ST段与T波",examination:"心电图",disease:"心室颤动"});
CREATE (:symptom {characteristic:"持续时间较短",examination:"心电图",disease:"心室颤动"});
MATCH (d:disease {name:"心室颤动"}),(s:symptom {disease:"心室颤动"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.5.1 房室阻滞
CREATE (:symptom {characteristic:"无症状",comment:"一度房室阻滞",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"第一心音强度减弱",comment:"一度房室阻滞",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"PR间期超过0.20秒",comment:"一度房室阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"QRS波群形态与时限多正常",comment:"一度房室阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"无症状",comment:"二度房室阻滞",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"心搏脱漏",comment:"二度房室阻滞",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"心悸",comment:"二度房室阻滞",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"第一心音强度逐渐减弱",comment:"二度I型房室阻滞",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"第一心音强度恒定",comment:"二度II型房室阻滞",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"P波规律出现",comment:"二度I型房室阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"PR间期逐延长，直到P波下传受阻脱漏一个QRS波群",comment:"二度I型房室阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"房室传导比例为3:2和5:4",comment:"二度I型房室阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"QRS波群正常",comment:"二度I型房室阻滞，阻滞位于房室结",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"PR间期恒定",comment:"二度II型房室阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"部分P波后无QRS波群",comment:"二度II型房室阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"QRS波群正常",comment:"二度II型房室阻滞，阻滞可能位于房室结内",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"QRS波群增宽，形态异常",comment:"二度II型房室阻滞，阻滞位于希氏束浦肯野系统",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"疲倦",comment:"三度房室阻滞",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"乏力",comment:"三度房室阻滞",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"头晕",comment:"三度房室阻滞",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"晕厥",comment:"三度房室阻滞",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"心绞痛",comment:"三度房室阻滞",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"心力衰竭",comment:"三度房室阻滞",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"暂时性意识丧失",comment:"三度房室阻滞",comment:"心室率过慢导致脑缺血",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"抽搐",comment:"三度房室阻滞",comment:"心室率过慢导致脑缺血",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"adams-Stokes 综合征",comment:"心室率过慢导致脑缺血",comment:"三度房室阻滞",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"猝死",comment:"三度房室阻滞",comment:"心室率过慢导致脑缺血",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"第一心音强度经常变化",comment:"三度房室阻滞",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"第二心音可呈正常或反常分裂",comment:"三度房室阻滞",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"间或听到响亮亢进的第一心音（大炮音）",comment:"三度房室阻滞",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"P波与QRS波群各自成节律、互不相关",comment:"三度房室阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"心房率快于心室率",comment:"三度房室阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"心室率为40~60次/分",comment:"三度房室阻滞，心室起搏点位于希氏束及其近邻",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"QRS波群正常",comment:"三度房室阻滞，心室起搏点位于希氏束及其近邻",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"心律较稳定",comment:"三度房室阻滞，心室起搏点位于希氏束及其近邻",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"心室率可低至40次/分以下",comment:"三度房室阻滞，心室起搏点位于室内传导系统的远端",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"QRS波群增宽",comment:"三度房室阻滞，心室起搏点位于室内传导系统的远端",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"心室律常不稳定",comment:"三度房室阻滞，心室起搏点位于室内传导系统的远端",examination:"心电图",disease:"房室阻滞"});
MATCH (d:disease {name:"房室阻滞"}),(s:symptom {disease:"房室阻滞"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.4.5.2 室内阻滞
CREATE (:symptom {characteristic:"无临床症状",comment:"单支、双支阻滞",disease:"室内阻滞"});
CREATE (:symptom {characteristic:"偶可听到第一、二心音分裂",comment:"单支、双支阻滞",disease:"室内阻滞"});
CREATE (:symptom {characteristic:"疲倦",comment:"完全性三分支阻滞",disease:"室内阻滞"});
CREATE (:symptom {characteristic:"乏力",comment:"完全性三分支阻滞",disease:"室内阻滞"});
CREATE (:symptom {characteristic:"头晕",comment:"完全性三分支阻滞",disease:"室内阻滞"});
CREATE (:symptom {characteristic:"晕厥",comment:"完全性三分支阻滞",disease:"室内阻滞"});
CREATE (:symptom {characteristic:"心绞痛",comment:"完全性三分支阻滞",disease:"室内阻滞"});
CREATE (:symptom {characteristic:"心力衰竭",comment:"完全性三分支阻滞",disease:"室内阻滞"});
CREATE (:symptom {characteristic:"暂时性意识丧失",comment:"完全性三分支阻滞，心室率过慢导致脑缺血",disease:"室内阻滞"});
CREATE (:symptom {characteristic:"抽搐",comment:"完全性三分支阻滞，心室率过慢导致脑缺血",disease:"室内阻滞"});
CREATE (:symptom {characteristic:"adams-Stokes综合征",comment:"完全性三分支阻滞，心室率过慢导致脑缺血",comment:"三度房室阻滞",disease:"室内阻滞"});
CREATE (:symptom {characteristic:"猝死",comment:"完全性三分支阻滞，心室率过慢导致脑缺血",disease:"室内阻滞"});
CREATE (:symptom {characteristic:"第一心音强度经常变化",comment:"完全性三分支阻滞",disease:"室内阻滞"});
CREATE (:symptom {characteristic:"第二心音可呈正常或反常分裂",comment:"完全性三分支阻滞",disease:"室内阻滞"});
CREATE (:symptom {characteristic:"间或听到响亮亢进的第一心音（大炮音）",comment:"完全性三分支阻滞",disease:"室内阻滞"});
CREATE (:symptom {characteristic:"QRS波群时限≥0.12秒",comment:"右束支阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"V1、V2导联呈rsR’，R’波粗钝",comment:"右束支阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"V5、V6导联呈qRS或RS，S波宽阔",comment:"右束支阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"T波与QRS波群主波方向相反",comment:"右束支阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"QRS波群时限<0.12秒",comment:"不完全性右束支阻滞/不完全性左束支阻滞/左前分支阻滞/左后分支阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"QRS波群时限≥0.12秒",comment:"左束支阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"V5、V6导联R波宽大，顶部有切迹或粗，前方无q波",comment:"左束支阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"V1、V2导联呈宽的QS波或rS波形，S波宽大",comment:"左束支阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"T波与QRS波群主波方向相反",comment:"左束支阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"额面平均QRS电轴左偏达-45~-90度",comment:"左前分支阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"I、aVL导联呈qR波",comment:"左前分支阻滞",examination:"心电图",disease:"房室阻滞"});
CREATE (:symptom {characteristic:"Ⅱ、Ⅲ、aVF导联呈rS图形",comment:"左前分支阻滞",examination:"心电图",disease:"房室阻滞"});
MATCH (d:disease {name:"室内阻滞"}),(s:symptom {disease:"室内阻滞"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//七、辅助检查
//7.4 心律失常
CREATE (:examination {name:"心电图",disease:"心律失常"});
CREATE (:examination {name:"长时间心电记录",disease:"心律失常"});
CREATE (:examination {name:"运动试验",disease:"心律失常"});
CREATE (:examination {name:"食管心电生理检查",disease:"心律失常"});
CREATE (:examination {name:"心腔内电生理检查",disease:"心律失常"});
CREATE (:examination {name:"三维心脏电生理及导航系统",disease:"心律失常"});
CREATE (:examination {name:"基因检测",disease:"心律失常"});
MATCH (d:disease {name:"心律失常"}),(rt:examination {disease:"心律失常"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

//十、药物治疗
//10.4.1.1 窦性心动过速
CREATE (:drug {name:"β受体阻滞剂",disease:"窦性心动过速"});
CREATE (:drug {name:"非二氢吡啶类钙通道阻滞剂（如地尔硫䓬）",disease:"窦性心动过速"});
CREATE (:drug {name:"伊伐布雷定",indication:"β受体阻滞剂和非二氢吡啶类钙通道阻滞剂不耐受",disease:"窦性心动过速"});
MATCH (ds:disease {name:"窦性心动过速"}),(dg:drug {disease:"窦性心动过速"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.4.1.2 窦性心动过缓
CREATE (:drug {name:"阿托品",indication:"心排血量不足",disease:"窦性心动过缓"});
CREATE (:drug {name:"异丙肾上腺素",indication:"心排血量不足",disease:"窦性心动过缓"});
MATCH (ds:disease {name:"窦性心动过缓"}),(dg:drug {disease:"窦性心动过缓"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.4.1.5 病态窦房结综合征
CREATE (:drug {name:"抗心律失常药物",indication:"慢快综合征病人应用起搏治疗后仍有心动过速发作",disease:"窦性心动过缓"});
CREATE (:drug {name:"单独应用抗心律失常药物",indication:"慢快综合征病人",side_effect:"加重心动过缓",prohibit_disease:"窦性心动过缓"});
MATCH (ds:disease {name:"病态窦房结综合征"}),(dg:drug {disease:"病态窦房结综合征"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
MATCH (ds:disease {name:"病态窦房结综合征"}),(dg:drug {prohibit_disease:"病态窦房结综合征"}) CREATE (ds)-[:disease_prohibit_drug {reference:"内科学第九版"}]->(dg);
//10.4.2.1 房性期前收缩
CREATE (:drug {name:"β受体阻滞剂",disease:"房性期前收缩"});
CREATE (:drug {name:"非二氢吡啶类钙通道阻滞剂",disease:"房性期前收缩"});
CREATE (:drug {name:"普罗帕酮",disease:"房性期前收缩"});
CREATE (:drug {name:"普罗帕酮",disease:"房性期前收缩"});
MATCH (ds:disease {name:"房性期前收缩"}),(dg:drug {disease:"房性期前收缩"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.4.2.2 房性心动过速
CREATE (:drug {name:"利多卡因",indication:"洋地黄引起的房性心动过速",disease:"房性心动过速"});
CREATE (:drug {name:"β受体阻滞剂",indication:"洋地黄引起的房性心动过速",disease:"房性心动过速"});
CREATE (:drug {name:"普罗帕酮",indication:"洋地黄引起的房性心动过速",disease:"房性心动过速"});
CREATE (:drug {name:"β受体阻滞剂",indication:"心室率达140次/分以上",aim:"控制心室率",disease:"房性心动过速"});
CREATE (:drug {name:"非二氢吡啶类钙通道阻滞剂",indication:"心室率达140次/分以上",aim:"控制心室率",disease:"房性心动过速"});
CREATE (:drug {name:"洋地黄",indication:"心室率达140次/分以上",aim:"控制心室率",disease:"房性心动过速"});
CREATE (:drug {name:"胺碘酮",indication:"转复窦性心律",disease:"房性心动过速"});
CREATE (:drug {name:"伊布利特",indication:"转复窦性心律",disease:"房性心动过速"});
MATCH (ds:disease {name:"房性心动过速"}),(dg:drug {disease:"房性心动过速"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.4.2.3 心房扑动
CREATE (:drug {name:"β受体阻滞剂",aim:"减慢心室率",disease:"心房扑动"});
CREATE (:drug {name:"钙通道阻滞剂",aim:"减慢心室率",disease:"心房扑动"});
CREATE (:drug {name:"洋地黄制剂",aim:"减慢心室率",disease:"心房扑动"});
CREATE (:drug {name:"伊布利特",indication;"转复房扑并预防复发",disease:"心房扑动"});
CREATE (:drug {name:"多非利特",indication;"转复房扑并预防复发",disease:"心房扑动"});
CREATE (:drug {name:"胺碘酮",indication;"转复房扑并预防复发，合并冠心病、充血性心力衰竭的房扑病人",disease:"心房扑动"});
CREATE (:drug {name:"伊布利特",indication;"新发房扑复律治疗",contraindication:"严重器质性心脏病、QT间期延长和窦房结功能障碍者",disease:"心房扑动"});
CREATE (:drug {name:"多非利特",indication;"新发房扑复律治疗",disease:"心房扑动"});
CREATE (:drug {name:"胺碘酮",indication;"长期维持窦性心律",disease:"心房扑动"});
CREATE (:drug {name:"多非利特",indication;"长期维持窦性心律",disease:"心房扑动"});
CREATE (:drug {name:"索他洛尔",indication;"长期维持窦性心律",disease:"心房扑动"});
MATCH (ds:disease {name:"心房扑动"}),(dg:drug {disease:"心房扑动"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);

//10.4.2.4 心房颤动
CREATE (:drug {name:"华法林",indication:"合并瓣膜病",aim:"抗凝治疗",disease:"心房颤动"});
CREATE (:drug {name:"肝素",usage:"静脉注射",indication:"紧急复律治疗",disease:"心房颤动"});
CREATE (:drug {name:"低分子量肝素",usage:"皮下注射",indication:"紧急复律治疗",disease:"心房颤动"});
CREATE (:drug {name:"达比加群酯",indication:"非瓣膜性房颤",aim:"抗凝治疗",disease:"心房颤动"});
CREATE (:drug {name:"利伐沙班",indication:"非瓣膜性房颤",aim:"抗凝治疗",disease:"心房颤动"});
CREATE (:drug {name:"阿哌沙班",indication:"非瓣膜性房颤",aim:"抗凝治疗",disease:"心房颤动"});
CREATE (:drug {name:"奎尼丁",side_effect:"可诱发致命性室性心动过速，增加死亡率",aim:"转复房颤",disease:"心房颤动"});
CREATE (:drug {name:"普鲁卡因胺",aim:"转复房颤",disease:"心房颤动"});
CREATE (:drug {name:"普罗帕酮",side_effect:"致室性心律失常",contraindication:"严重器质性心脏病病人",aim:"转复房颤",disease:"心房颤动"});
CREATE (:drug {name:"胺碘酮",indication:"合并器质性心脏病的病人",aim:"转复房颤",disease:"心房颤动"});
CREATE (:drug {name:"伊布利特",aim:"转复房颤",disease:"心房颤动"});
CREATE (:drug {name:"多非利特",aim:"转复房颤",disease:"心房颤动"});
CREATE (:drug {name:"索他洛尔",aim:"转复房颤",disease:"心房颤动"});
CREATE (:drug {name:"决奈达隆",aim:"转复房颤",disease:"心房颤动"});
CREATE (:drug {name:"稳心颗粒",aim:"转复房颤",disease:"心房颤动"});
CREATE (:drug {name:"参松养心胶囊",aim:"转复房颤",disease:"心房颤动"});
CREATE (:drug {name:"β受体阻滞剂",aim:"控制心室率",disease:"心房颤动"});
CREATE (:drug {name:"钙通道阻滞剂",aim:"控制心室率",disease:"心房颤动"});
CREATE (:drug {name:"洋地黄制剂",aim:"控制心室率",disease:"心房颤动"});
CREATE (:drug {name:"抗心律失常药物（如胺碘酮、决奈达隆）",aim:"控制心室率",disease:"心房颤动"});
MATCH (ds:disease {name:"心房颤动"}),(dg:drug {disease:"心房颤动"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.4.3.4 非阵发性房室交界区性心动过速
CREATE (:drug {name:"β受体阻滞剂",indication:"病因与洋地黄无关",disease:"非阵发性房室交界区性心动过速"});
CREATE (:drug {name:"钙通道阻滞剂",indication:"病因与洋地黄无关",disease:"非阵发性房室交界区性心动过速"});
CREATE (:drug {name:"洋地黄治疗",indication:"病因与洋地黄无关",disease:"非阵发性房室交界区性心动过速"});
CREATE (:drug {name:"IA药物",indication:"病因与洋地黄无关",disease:"非阵发性房室交界区性心动过速"});
CREATE (:drug {name:"IC药物",indication:"病因与洋地黄无关",disease:"非阵发性房室交界区性心动过速"});
CREATE (:drug {name:"Ⅲ类（胺碘酮）药物",indication:"病因与洋地黄无关",disease:"非阵发性房室交界区性心动过速"});
CREATE (:drug {name:"洋地黄抗体",indication:"洋地黄或疑洋地黄中毒者",disease:"非阵发性房室交界区性心动过速"});
CREATE (:drug {name:"钾盐",indication:"洋地黄或疑洋地黄中毒者",disease:"非阵发性房室交界区性心动过速"});
MATCH (ds:disease {name:"非阵发性房室交界区性心动过速"}),(dg:drug {disease:"非阵发性房室交界区性心动过速"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.4.4.1 室性期前收缩
CREATE (:drug {name:"β受体阻滞剂",indication:"无器质性心脏病/器质性心脏病合并心功能不全/二尖瓣脱垂病人发生室性期前收缩",aim:"消除症状",disease:"室性期前收缩"});
CREATE (:drug {name:"非二氢吡啶类钙通道阻滞剂",indication:"无器质性心脏病/器质性心脏病合并心功能不全",aim:"消除症状",disease:"室性期前收缩"});
CREATE (:drug {name:"普罗帕酮",indication:"无器质性心脏病",aim:"消除症状",disease:"室性期前收缩"});
CREATE (:drug {name:"参松养心胶囊",indication:"无器质性心脏病",aim:"消除症状",disease:"室性期前收缩"});
CREATE (:drug {name:"稳心颗粒",indication:"无器质性心脏病",aim:"消除症状",disease:"室性期前收缩"});
CREATE (:drug {name:"胺碘酮",indication:"器质性心脏病合并心功能不全",aim:"消除症状",disease:"室性期前收缩"});
CREATE (:drug {name:"IA类抗心律失常药物",indication:"器质性心脏病",prohibit_disease:"室性期前收缩"});
MATCH (ds:disease {name:"室性期前收缩"}),(dg:drug {prohibit_disease:"室性期前收缩"}) CREATE (ds)-[:disease_prohibit_drug {reference:"内科学第九版"}]->(dg);
MATCH (ds:disease {name:"室性期前收缩"}),(dg:drug {disease:"室性期前收缩"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.4.4.2 室性心动过速
CREATE (:drug {name:"利多卡因",usage:"静脉推注",indication:"无显著血流动力学障碍",aim:"终止室速发作",side_effect:"低血压",disease:"室性心动过速"});
CREATE (:drug {name:"β受体阻滞剂",usage:"静脉推注",indication:"无显著血流动力学障碍",aim:"终止室速发作",side_effect:"低血压",disease:"室性心动过速"});
CREATE (:drug {name:"胺碘酮",usage:"静脉推注",indication:"无显著血流动力学障碍",aim:"终止室速发作",side_effect:"低血压",disease:"室性心动过速"});
CREATE (:drug {name:"阿托品",indication:"窦性心动过缓或房室阻滞",prohibit_disease:"室性心动过速"});
MATCH (ds:disease {name:"室性心动过速"}),(dg:drug {disease:"室性心动过速"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.4.5.1 房室阻滞
CREATE (:drug {name:"阿托品",usage:"静脉注射",dosage:"0.5~2.0mg",indication:"阻滞位于房室结的病人",aim:"提高房室阻滞的心率",disease:"房室阻滞"});
CREATE (:drug {name:"异丙肾上腺素",usage:"静脉滴注",dosage:"1~4μg/min",contraindication:"急性心肌梗死",indication:"任何部位的房室阻滞",aim:"提高房室阻滞的心率",disease:"房室阻滞"});
MATCH (ds:disease {name:"房室阻滞"}),(dg:drug {disease:"房室阻滞"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.4.3.5.1 房室结折返性心动过速
CREATE (:drug {name:"腺苷",side_effect:"胸部压迫感、呼吸困难、面部潮红、窦性心动过缓、房室传导阻滞",aim:"终止心动过速",disease:"房室结折返性心动过速"});
CREATE (:drug {name:"维拉帕米",indication:"腺苷无效",aim:"终止心动过速",disease:"房室结折返性心动过速"});
CREATE (:drug {name:"短效β受体阻滞剂",aim:"终止心动过速",disease:"房室结折返性心动过速"});
CREATE (:drug {name:"洋地黄",aim:"终止心动过速",indication:"伴心功能不全",disease:"房室结折返性心动过速"});
CREATE (:drug {name:"普罗帕酮",aim:"终止心动过速",disease:"房室结折返性心动过速"});
CREATE (:drug {name:"去氧肾上腺素",indication:"合并低血压",contraindication:"老年人/高血压/急性心肌梗死病人",aim:"终止心动过速",disease:"房室结折返性心动过速"});
CREATE (:drug {name:"间羟胺",indication:"合并低血压",contraindication:"老年人/高血压/急性心肌梗死病人",aim:"终止心动过速",disease:"房室结折返性心动过速"});
CREATE (:drug {name:"甲氧明",indication:"合并低血压",contraindication:"老年人/高血压/急性心肌梗死病人",aim:"终止心动过速",disease:"房室结折返性心动过速"});
CREATE (:drug {name:"长效β受体阻滞剂",aim:"预防复发",indication:"暂时不能行导管消融术者且又发作频繁和症状显著者",disease:"房室结折返性心动过速"});
CREATE (:drug {name:"长效钙通道阻滞剂",aim:"预防复发",indication:"暂时不能行导管消融术者且又发作频繁和症状显著者",disease:"房室结折返性心动过速"});
CREATE (:drug {name:"洋地黄",aim:"预防复发",indication:"暂时不能行导管消融术者且又发作频繁和症状显著者",disease:"房室结折返性心动过速"});
MATCH (ds:disease {name:"房室结折返性心动过速"}),(dg:drug {disease:"房室结折返性心动过速"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//5.4.3.5.2 房室折返性心动过速
CREATE (:drug {name:"腺苷",usage:"静脉注射",aim:"终止心动过速",indication:"顺向型房室折返性心动过速",disease:"房室折返性心动过速"});
CREATE (:drug {name:"维拉帕米",usage:"静脉注射",aim:"终止心动过速",indication:"顺向型房室折返性心动过速",disease:"房室折返性心动过速"});
CREATE (:drug {name:"普罗帕酮",usage:"静脉注射",aim:"终止心动过速",indication:"顺向型房室折返性心动过速",disease:"房室折返性心动过速"});
//5.4.3.5.3 预激综合征
CREATE (:drug {name:"腺苷",indication:"顺向型房室折返性心动过速",disease:"预激综合征"});
CREATE (:drug {name:"维拉帕米",indication:"顺向型房室折返性心动过速",disease:"预激综合征"});
CREATE (:drug {name:"普罗帕酮",indication:"顺向型房室折返性心动过速/发作心房扑动与颤动时伴有晕厥或低血压",disease:"预激综合征"});
CREATE (:drug {name:"胺碘酮",indication:"发作心房扑动与颤动时伴有晕厥或低血压",disease:"预激综合征"});
CREATE (:drug {name:"洋地黄",indication:"预激综合征合并心房颤动",prohibit_disease:"预激综合征"});
CREATE (:drug {name:"利多卡因",indication:"预激综合征合并心房颤动",prohibit_disease:"预激综合征"});
CREATE (:drug {name:"维拉帕米",indication:"预激综合征合并心房颤动",prohibit_disease:"预激综合征"});
MATCH (ds:disease {name:"预激综合征"}),(dg:drug {disease:"预激综合征"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
MATCH (ds:disease {name:"预激综合征"}),(dg:drug {prohibit_disease:"预激综合征"}) CREATE (ds)-[:disease_prohibit_drug {reference:"内科学第九版"}]->(dg);

//十一、非药物治疗
//11.4.1.1 窦性心动过速
CREATE (:treatment {name:"病因和诱因治疗",disease:"窦性心动过速"});
CREATE (:treatment {name:"导管消融",indication:"药物无效而症状显著者",aim:"改良窦房结功能",disease:"窦性心动过速"});
MATCH (d:disease {name:"窦性心动过速"}),(t:treatment {disease:"窦性心动过速"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);

//11.4.1.2 窦性心动过缓
CREATE (:treatment {name:"无需治疗",indication:"无症状的窦性心动过缓",disease:"窦性心动过缓"});
CREATE (:treatment {name:"心脏起搏治疗",indication:"有症状的窦性心动过缓",disease:"窦性心动过缓"});
MATCH (d:disease {name:"窦性心动过缓"}),(t:treatment {disease:"窦性心动过缓"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.4.1.3 窦性停搏
CREATE (:treatment {name:"定期随诊观察",indication:"无心动过缓相关的症状",disease:"窦性停搏"});
CREATE (:treatment {name:"起搏器治疗",indication:"有症状的病态窦房结综合征病人",disease:"窦性停搏"});
MATCH (d:disease {name:"窦性停搏"}),(t:treatment {disease:"窦性停搏"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);

//11.4.1.4 窦房传导阻滞
CREATE (:treatment {name:"定期随诊观察",indication:"无心动过缓相关的症状",disease:"窦房传导阻滞"});
CREATE (:treatment {name:"起搏器治疗",indication:"有症状的病态窦房结综合征病人",disease:"窦房传导阻滞"});
MATCH (d:disease {name:"窦房传导阻滞"}),(t:treatment {disease:"窦房传导阻滞"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);

//11.4.1.5 病态窦房结综合征
CREATE (:treatment {name:"定期随诊观察",indication:"无心动过缓相关的症状",disease:"病态窦房结综合征"});
CREATE (:treatment {name:"起搏器治疗",indication:"有症状的病态窦房结综合征病人",disease:"病态窦房结综合征"});
CREATE (:treatment {name:"抗栓治疗",indication:"慢-快综合征病人合并心房扑动或心房颤动使血栓栓塞发生率增高",disease:"病态窦房结综合征"});
MATCH (d:disease {name:"病态窦房结综合征"}),(t:treatment {disease:"病态窦房结综合征"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.4.2.2 房性心动过速
CREATE (:treatment {name:"立即停用洋地黄",indication:"洋地黄引起的房性心动过速",disease:"房性心动过速"});
CREATE (:treatment {name:"纠正可能伴随的电解质紊乱",indication:"洋地黄引起的房性心动过速",disease:"房性心动过速"});
CREATE (:treatment {name:"警惕低钾血症",indication:"洋地黄引起的房性心动过速",disease:"房性心动过速"});
CREATE (:treatment {name:"直流电复律",indication:"血流动力学不稳定者",disease:"房性心动过速"});
CREATE (:treatment {name:"消融治疗",indication:"局灶性房性心动过速病人药物治疗效果不佳",disease:"房性心动过速"});
MATCH (d:disease {name:"房性心动过速"}),(t:treatment {disease:"房性心动过速"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.4.2.3 心房扑动
CREATE (:treatment {name:"直流电复律",disease:"心房扑动"});
CREATE (:treatment {name:"食管调搏",indication:"服用大量洋地黄制剂病人",disease:"心房扑动"});
CREATE (:treatment {name:"导管消融",indication:"症状明显或引起血流动力学不稳定的房扑",disease:"心房扑动"});
CREATE (:treatment {name:"抗凝治疗",indication:"持续性心房扑动的病人",disease:"心房扑动"});
MATCH (d:disease {name:"心房扑动"}),(t:treatment {disease:"心房扑动"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.4.2.4 心房颤动
CREATE (:treatment {name:"纠正可逆的出血因素",indication:"高出血风险的病人",disease:"心房颤动"});
CREATE (:treatment {name:"用As-BlED评分系统出血风险评估",indication:"高出血风险的病人",disease:"心房颤动"});
CREATE (:treatment {name:"使用CHA2DS2-VASc评分系统进行血栓栓塞的危险分层",indication:"非瓣膜病病人",disease:"心房颤动"});
CREATE (:treatment {name:"抗凝治疗",indication:"CHA2DS2-VASc评分≥2",disease:"心房颤动"});
CREATE (:treatment {name:"获益与风险权衡，优选抗凝治疗",indication:"CHA2DS2-VASc评分=1",disease:"心房颤动"});
CREATE (:treatment {name:"经皮左心耳封堵术",indication:"CHA2DS2-VASc评分≥2的非瓣膜性房颤，且不适合长期抗凝治疗或长期规范抗凝治疗基础上仍发生卒中或栓塞事件、HAS-BLED评分≥3分的病人",disease:"心房颤动"});
CREATE (:treatment {name:"电复律",aim:"转复并维持窦性心律",indication:"药物复律无效",disease:"心房颤动"});
CREATE (:treatment {name:"紧急电复律",aim:"转复并维持窦性心律",indication:"病人发作开始时已呈现急性心力衰竭或血压下降明显",disease:"心房颤动"});
CREATE (:treatment {name:"导管消融治疗",aim:"转复并维持窦性心律",indication:"症状明显、药物治疗无效的阵发性房颤/病史较短、药物治疗无效且无明显器质性心脏病的症状性持续性房颤以及存在心衰和（或）LVEF减少的症状性房颤病人",disease:"心房颤动"});
CREATE (:treatment {name:"外科迷宫手术",aim:"维持窦性心律",disease:"心房颤动"});
CREATE (:treatment {name:"房室结消融或改良术",indication:"房颤伴快速心室率、药物治疗无效者",aim:"控制心室率",disease:"心房颤动"});
CREATE (:treatment {name:"起搏器治疗",indication:"心室率较慢的房颤病人，最长RR间期>5秒或症状显著者",aim:"控制心室率",disease:"心房颤动"});
MATCH (d:disease {name:"心房颤动"}),(t:treatment {disease:"心房颤动"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.4.3.2 房室交界区性逸搏
CREATE (:treatment {name:"起搏治疗",disease:"房室交界区性逸搏"});
MATCH (d:disease {name:"房室交界区性逸搏"}),(t:treatment {disease:"房室交界区性逸搏"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.4.3.3 房室交界区性心律
CREATE (:treatment {name:"起搏治疗",disease:"房室交界区性心律"});
MATCH (d:disease {name:"房室交界区性心律"}),(t:treatment {disease:"房室交界区性心律"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.4.4.1 室性期前收缩
CREATE (:treatment {name:"诱因治疗",disease:"室性期前收缩"});
CREATE (:treatment {name:"再灌注治疗",indication:"急性心肌缺血或梗死合并室性期前收缩",disease:"室性期前收缩"});
CREATE (:treatment {name:"导管消融治疗",indication:"病人症状明显，抗心律失常药物疗效不佳，或不能耐受药物治疗，且无明显器质性心脏病",disease:"室性期前收缩"});
MATCH (d:disease {name:"室性期前收缩"}),(t:treatment {disease:"室性期前收缩"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.4.4.2 室性心动过速
CREATE (:treatment {name:"电复律",indication:"病人已发生低血压、休克、心绞痛、充血性心力衰竭或脑血流灌注不足等症状",contraindication:"洋地黄中毒",disease:"室性心动过速"});
CREATE (:treatment {name:"人工心脏起搏",indication:"窦性心动过缓或房室阻滞",disease:"室性心动过速"});
CREATE (:treatment {name:"治疗充血性心力衰竭",aim:"减少室速发生",disease:"室性心动过速"});
CREATE (:treatment {name:"诱因治疗",aim:"预防复发",disease:"室性心动过速"});
CREATE (:treatment {name:"冠脉血运重建",indication:"急性心肌缺血合并室速",disease:"室性心动过速"});
CREATE (:treatment {name:"心律转复除颤器",english_name:"ICD",indication:"经完全血运重建和最佳药物治疗后，仍反复发作室速或电风暴者/持续性多形性室速及遗传性心律失常综合征病人",disease:"室性心动过速"});
CREATE (:treatment {name:"导管消融治疗",indication:"药物治疗后仍反复发作单形性室速或ICD植入后反复电击的病人",disease:"室性心动过速"});
MATCH (d:disease {name:"室性心动过速"}),(t:treatment {disease:"室性心动过速"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.4.5.1 房室阻滞
CREATE (:treatment {name:"心脏起搏治疗",indication:"症状明显、心室率缓慢者",disease:"房室阻滞"});
MATCH (d:disease {name:"房室阻滞"}),(t:treatment {disease:"房室阻滞"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.4.5.2 室内阻滞
CREATE (:treatment {name:"心脏起搏治疗",indication:"急性前壁心肌梗死生双分支、三分支阻滞/慢性双分支、三分支阻滞/伴有晕厥或Adam -Stroke 综合征",disease:"室内阻滞"});
MATCH (d:disease {name:"室内阻滞"}),(t:treatment {disease:"室内阻滞"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.4.3.5.1 房室结折返性心动过速
CREATE (:treatment {name:"食管心房调搏术",aim:"中止心动过速发作",disease:"房室结折返性心动过速"});
CREATE (:treatment {name:"直流电复律",indication:"病人出现严重心绞痛、低血压、充血性心力衰竭表现或者急性发作应用药物无效",contraindication:"已应用洋地黄者",aim:"中止心动过速发作",disease:"房室结折返性心动过速"});
CREATE (:treatment {name:"导管消融术",aim:"预防复发",disease:"房室结折返性心动过速"});
MATCH (d:disease {name:"房室结折返性心动过速"}),(t:treatment {disease:"房室结折返性心动过速"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//5.4.3.5.3 预激综合征
CREATE (:treatment {name:"导管消融旁路",indication:"心动过速发作频繁或伴发心房颤动或扑动的预激综合征",aim:"根治预激综合征",disease:"预激综合征"});
CREATE (:treatment {name:"电复律",indication:"预激综合征病人发作心房扑动与颤动时伴有晕厥或低血压",aim:"根治预激综合征",disease:"预激综合征"});
MATCH (d:disease {name:"预激综合征"}),(t:treatment {disease:"预激综合征"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
