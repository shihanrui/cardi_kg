MATCH (n) detach delete n;

//一、疾病分类
//1.1 冠状动脉疾病
CREATE (:disease {name:"冠状动脉疾病"});
//1.1.1 冠状动脉粥样硬化性心脏病
CREATE (:disease {name:"冠状动脉粥样硬化性心脏病",abbreviation:"冠心病",synonym:"缺血性心脏病",english_name:"CHD",definition:"指冠状动脉（冠脉）发生粥样硬化引起管腔狭窄或闭塞，导致心肌缺血缺氧或坏死而引起的心脏病。"});
MATCH (dc1:disease {name:"冠状动脉疾病"}),(dc2:disease {name:"冠状动脉粥样硬化性心脏病"}) CREATE (dc1)-[:include_disease {reference:"内科学第九版"}]->(dc2);
//1.1.1.1 慢性心肌缺血综合征
CREATE (:disease {name:"慢性心肌缺血综合征",enlish_name:"CIS/CAD",synonym:"慢性冠脉疾病"});
MATCH (dc1:disease {name:"冠状动脉粥样硬化性心脏病"}),(dc2:disease {name:"慢性心肌缺血综合征"}) CREATE (dc1)-[:include_disease {reference:"内科学第九版"}]->(dc2);
//1.1.1.1.1 稳定型心绞痛
CREATE (:disease {name:"稳定型心绞痛",synonym:"劳力性心绞痛"});
MATCH (dc:disease {name:"慢性心肌缺血综合征"}),(d:disease {name:"稳定型心绞痛"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.1.1.1.2 隐匿型冠心病
CREATE (:disease {name:"隐匿型冠心病",synonym:"无症状冠心病",definition:"没有心绞痛的临床症状，但有心肌缺血的客观证据（心电活动、心肌血流灌注及心肌代谢等异常）的冠心病"});
MATCH (dc:disease {name:"慢性心肌缺血综合征"}),(d:disease {name:"隐匿型冠心病"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.1.1.1.3 缺血性心肌病
CREATE (:disease {name:"缺血性心肌病",english_name:"ICM",definition:"冠心病的一种特殊类型或晚期阶段。指由冠状动脉粥样硬化引起长期心肌缺血，导致心肌弥漫性纤维化，产生与原发性扩张型心肌病类似的临床表现。"});
MATCH (dc:disease {name:"慢性心肌缺血综合征"}),(d:disease {name:"缺血性心肌病"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.1.1.1.3.1 充血型缺血性心肌病
CREATE (:disease {name:"充血型缺血性心肌病"});
MATCH (d1:disease {name:"缺血性心肌病"}), (d2:disease {name:"充血型缺血性心肌病"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);
//1.1.1.1.3.2 限制型缺血性心肌病
CREATE (:disease {name:"限制型缺血性心肌病",synonym:"硬心综合征"});
MATCH (d1:disease {name:"缺血性心肌病"}), (d2:disease {name:"限制型缺血性心肌病"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);
//1.1.1.2 急性冠状动脉综合征
CREATE (:disease {name:"急性冠状动脉综合征",english_name:"ACS",abbreviation:"急性冠脉综合征",definition:"一组由急性心肌缺血引起的临床综合征"});
MATCH (dc1:disease {name:"冠状动脉粥样硬化性心脏病"}),(dc2:disease {name:"急性冠状动脉综合征"}) CREATE (dc1)-[:include_disease {reference:"内科学第九版"}]->(dc2);
//1.1.1.2.1  非ST段抬高型急性冠脉综合征
CREATE (:disease {name:"非ST段抬高型急性冠脉综合征",english_name:"NSTEACS",definition:"由于动脉粥样斑块破裂或糜烂，伴有不同程度的表面血栓形成、血管痉挛以及血管栓塞所导致的一组临床症状"});
MATCH (dc:disease {name:"急性冠状动脉综合征"}),(d:disease {name:"非ST段抬高型急性冠脉综合征"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.1.1.2.1.1 不稳定型心绞痛
CREATE (:disease {name:"不稳定型心绞痛",english_name:"UA"});
MATCH (d1:disease {name:"非ST段抬高型急性冠脉综合征"}), (d2:disease {name:"不稳定型心绞痛"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);
//1.1.1.2.1.2 非ST段抬高型心肌梗死
CREATE (:disease {name:"非ST段抬高型心肌梗死",english_name:"NSTEMI"});
MATCH (d1:disease {name:"非ST段抬高型急性冠脉综合征"}), (d2:disease {name:"非ST段抬高型心肌梗死"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);
//1.1.1.2.2 ST段抬高型心肌梗死
CREATE (:disease {name:"ST段抬高型心肌梗死",english_name:"STEMI"});
MATCH (dc:disease {name:"急性冠状动脉综合征"}),(d:disease {name:"ST段抬高型心肌梗死"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.1.1.2.2.1 ST段抬高型心肌梗死
CREATE (:disease {name:"冠状动脉非阻塞性心肌梗死",english_name:"MINOCA"});
MATCH (dc:disease {name:"ST段抬高型心肌梗死"}),(d:disease {name:"冠状动脉非阻塞性心肌梗死"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.1.1.2.3 猝死
CREATE (:disease {name:"猝死"});
MATCH (dc:disease {name:"急性冠状动脉综合征"}),(d:disease {name:"猝死"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.1.2 冠状动脉痉挛
CREATE (:disease {name:"冠状动脉痉挛"});
MATCH (dc1:disease {name:"冠状动脉疾病"}),(dc2:disease {name:"冠状动脉痉挛"}) CREATE (dc1)-[:include_disease {reference:"内科学第九版"}]->(dc2);
//1.1.3 心肌桥
CREATE (:disease {name:"心肌桥"});
MATCH (dc1:disease {name:"冠状动脉疾病"}),(dc2:disease {name:"心肌桥"}) CREATE (dc1)-[:include_disease {reference:"内科学第九版"}]->(dc2);
//1.1.4 X综合征
CREATE (:disease {name:"X综合征"});
MATCH (dc1:disease {name:"冠状动脉疾病"}),(dc2:disease {name:"X综合征"}) CREATE (dc1)-[:include_disease {reference:"内科学第九版"}]->(dc2);

//1.4 心律失常
CREATE (:disease {name:"心律失常"});
//1.4.1 窦性心律失常
CREATE (:disease {name:"窦性心律失常"});
MATCH (dc:disease {name:"心律失常"}),(d:disease {name:"窦性心律失常"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.1.1 窦性心动过速
CREATE (:disease {name:"窦性心动过速"});
MATCH (dc:disease {name:"窦性心律失常"}),(d:disease {name:"窦性心动过速"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.1.2 窦性停搏
CREATE (:disease {name:"窦性停搏"});
MATCH (dc:disease {name:"窦性心律失常"}),(d:disease {name:"窦性停搏"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.1.3 窦房传导阻滞
CREATE (:disease {name:"窦房传导阻滞"});
MATCH (dc:disease {name:"窦性心律失常"}),(d:disease {name:"窦房传导阻滞"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.1.5 病态窦房结综合征
CREATE (:disease {name:"病态窦房结综合征"});
MATCH (dc:disease {name:"窦性心律失常"}),(d:disease {name:"病态窦房结综合征"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.2 房性心律失常
CREATE (:disease {name:"房性心律失常"});
MATCH (dc:disease {name:"心律失常"}),(d:disease {name:"房性心律失常"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.2.1 房性期前收缩
CREATE (:disease {name:"房性期前收缩"});
MATCH (dc:disease {name:"房性心律失常"}),(d:disease {name:"房性期前收缩"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.2.2 房性心动过速
CREATE (:disease {name:"房性心动过速"});
MATCH (dc:disease {name:"房性心律失常"}),(d:disease {name:"房性心动过速"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.2.3 心房扑动
CREATE (:disease {name:"心房扑动"});
MATCH (dc:disease {name:"房性心律失常"}),(d:disease {name:"心房扑动"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.2.4 心房颤动
CREATE (:disease {name:"心房颤动"});
MATCH (dc:disease {name:"房性心律失常"}),(d:disease {name:"心房颤动"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.3 房室交界区性心律失常
CREATE (:disease {name:"房室交界区性心律失常"});
MATCH (dc:disease {name:"心律失常"}),(d:disease {name:"房室交界区性心律失常"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.3.1 房室交界区性期前收缩
CREATE (:disease {name:"房室交界区性期前收缩"});
MATCH (dc:disease {name:"房室交界区性心律失常"}),(d:disease {name:"房室交界区性期前收缩"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.3.2 房室交界区性逸搏与心律
CREATE (:disease {name:"房室交界区性逸搏与心律"});
MATCH (dc:disease {name:"房室交界区性心律失常"}),(d:disease {name:"房室交界区性逸搏与心律"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.3.3 非阵发性房室交界区性心动过速
CREATE (:disease {name:"非阵发性房室交界区性心动过速"});
MATCH (dc:disease {name:"房室交界区性心律失常"}),(d:disease {name:"非阵发性房室交界区性心动过速"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.3.4 房室交界区相关的折返性心动过速
CREATE (:disease {name:"房室交界区相关的折返性心动过速"});
MATCH (dc:disease {name:"房室交界区性心律失常"}),(d:disease {name:"房室交界区相关的折返性心动过速"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.4 室性心律失常
CREATE (:disease {name:"室性心律失常"});
MATCH (dc:disease {name:"心律失常"}),(d:disease {name:"室性心律失常"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.4.1 室性期前收缩
CREATE (:disease {name:"室性期前收缩"});
MATCH (dc:disease {name:"室性心律失常"}),(d:disease {name:"室性期前收缩"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.4.2 室性心动过速
CREATE (:disease {name:"室性心动过速"});
MATCH (dc:disease {name:"室性心律失常"}),(d:disease {name:"室性心动过速"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.4.3 心室扑动
CREATE (:disease {name:"心室扑动"});
MATCH (dc:disease {name:"室性心律失常"}),(d:disease {name:"心室扑动"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.4.4 心室颤动
CREATE (:disease {name:"心室颤动"});
MATCH (dc:disease {name:"室性心律失常"}),(d:disease {name:"心室颤动"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.5 心脏传导阻滞
CREATE (:disease {name:"心脏传导阻滞"});
MATCH (dc:disease {name:"心律失常"}),(d:disease {name:"心脏传导阻滞"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.5.1 房室阻滞
CREATE (:disease {name:"房室阻滞"});
MATCH (dc:disease {name:"心脏传导阻滞"}),(d:disease {name:"房室阻滞"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.4.5.2 室内阻滞
CREATE (:disease {name:"室内阻滞"});
MATCH (dc:disease {name:"心脏传导阻滞"}),(d:disease {name:"室内阻滞"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);

//1.7 感染性心内膜炎
CREATE (:disease {name:"感染性心内膜炎"});
MATCH (dc:disease {name:"感染性心内膜炎"}),(d:disease {name:"自体瓣膜心内膜炎"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.7.1 自体瓣膜心内膜炎
CREATE (:disease {name:"自体瓣膜心内膜炎"});
//1.7.2 人工瓣膜和静脉药瘾者心内膜炎
CREATE (:disease {name:"人工瓣膜和静脉药瘾者心内膜炎"});
MATCH (dc:disease {name:"感染性心内膜炎"}),(d:disease {name:"人工瓣膜和静脉药瘾者心内膜炎"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);


//1.9 周围血管病
CREATE (:disease {name:"周围血管病"});
CREATE (:disease {name:"静脉血栓症"});
CREATE (:disease {name:"闭塞性周围动脉粥样硬化"});
MATCH (dc:disease {name:"周围血管病"}),(d:disease {name:"静脉血栓症"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"周围血管病"}),(d:disease {name:"闭塞性周围动脉粥样硬化"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);

//1.10 主动脉疾病
CREATE (:disease {name:"主动脉疾病"});
CREATE (:disease {name:"主动脉弓中断"});
CREATE (:disease {name:"主动脉缩窄"});
CREATE (:disease {name:"先天性血管环"});
CREATE (:disease {name:"血管悬带"});
CREATE (:disease {name:"主动脉瓣狭窄"});
CREATE (:disease {name:"主动脉瘤"});
CREATE (:disease {name:"主动脉夹层"});
CREATE (:disease {name:"多发性大动脉炎"});
MATCH (dc:disease {name:"主动脉疾病"}),(d:disease {name:"主动脉弓中断"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"主动脉疾病"}),(d:disease {name:"主动脉缩窄"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"主动脉疾病"}),(d:disease {name:"先天性血管环"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"主动脉疾病"}),(d:disease {name:"血管悬带"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"主动脉疾病"}),(d:disease {name:"主动脉瓣狭窄"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"主动脉疾病"}),(d:disease {name:"主动脉瘤"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"主动脉疾病"}),(d:disease {name:"主动脉夹层"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"主动脉疾病"}),(d:disease {name:"多发性大动脉炎"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);


//二、风险因子
//2.1.1  冠状动脉粥样硬化性心脏病
CREATE (:risk_factor {name:"年齡>40",disease:"冠状动脉粥样硬化性心脏病"});
CREATE (:risk_factor {name:"男性",disease:"冠状动脉粥样硬化性心脏病"});
CREATE (:risk_factor {name:"血脂异常",disease:"冠状动脉粥样硬化性心脏病"});
CREATE (:risk_factor {name:"高血压",disease:"冠状动脉粥样硬化性心脏病"});
CREATE (:risk_factor {name:"吸烟",disease:"冠状动脉粥样硬化性心脏病"});
CREATE (:risk_factor {name:"糖耐量异常",disease:"冠状动脉粥样硬化性心脏病"});
CREATE (:risk_factor {name:"肥胖",disease:"冠状动脉粥样硬化性心脏病"});
CREATE (:risk_factor {name:"家族史",disease:"冠状动脉粥样硬化性心脏病"});
CREATE (:risk_factor {name:"A型性格",disease:"冠状动脉粥样硬化性心脏病"});
CREATE (:risk_factor {name:"口服避孕药",disease:"冠状动脉粥样硬化性心脏病"});
CREATE (:risk_factor {name:"高热量饮食",disease:"冠状动脉粥样硬化性心脏病"});
MATCH (d:disease {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {disease:"冠状动脉粥样硬化性心脏病"}) CREATE (d)-[:disease_risk_factor {reference:"内科学第九版"}]->(r);
//2.1.1.1.2 隐匿型冠心病
CREATE (:risk_factor {name:"高血压",disease:"隐匿型冠心病"});
CREATE (:risk_factor {name:"糖尿病",disease:"隐匿型冠心病"});
CREATE (:risk_factor {name:"ASCVD风险中危以上",disease:"隐匿型冠心病"});
CREATE (:risk_factor {name:"早发CAD家族史",disease:"隐匿型冠心病"});
MATCH (d:disease {name:"隐匿型冠心病"}),(r:risk_factor {disease:"隐匿型冠心病"}) CREATE (d)-[:disease_risk_factor {reference:"内科学第九版"}]->(r);

//2.1.2  冠状动脉痉挛
CREATE (:risk_factor {name:"吸烟",disease:"冠状动脉痉挛"});
MATCH (d:disease {name:"冠状动脉痉挛"}),(r:risk_factor {disease:"冠状动脉痉挛"}) CREATE (d)-[:disease_risk_factor {reference:"内科学第九版"}]->(r);
//2.1.4  X综合征
CREATE (:risk_factor {name:"绝经期前女性",disease:"X综合征"});
MATCH (d:disease {name:"X综合征"}),(r:risk_factor {disease:"X综合征"}) CREATE (d)-[:disease_risk_factor {reference:"内科学第九版"}]->(r);

//2.3  心脏瓣膜病
CREATE (:risk_factor {name:"年龄40~50岁",disease:"二尖瓣狭窄"});
CREATE (:risk_factor {name:"女性",disease:"二尖瓣狭窄"});
MATCH (d:disease {name:"二尖瓣狭窄"}),(r:risk_factor {disease:"二尖瓣狭窄"}) CREATE (d)-[:disease_risk_factor {reference:"内科学第九版"}]->(r);


//3.5.1 急性心包炎
CREATE (:cause {name:"病毒感染",disease:"急性心包炎"});
CREATE (:cause {name:"细菌感染",disease:"急性心包炎"});
CREATE (:cause {name:"自身免疫病",disease:"急性心包炎"});
CREATE (:cause {name:"肿瘤",disease:"急性心包炎"});
CREATE (:cause {name:"尿毒症",disease:"急性心包炎"});
CREATE (:cause {name:"急性心肌梗死后心包炎",disease:"急性心包炎"});
CREATE (:cause {name:"主动脉夹层",disease:"急性心包炎"});
CREATE (:cause {name:"胸壁外伤",disease:"急性心包炎"});
CREATE (:cause {name:"心脏手术",disease:"急性心包炎"});
MATCH (d:disease {name:"急性心包炎"}),(c:cause {disease:"急性心包炎"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//3.5.2 心包积液
CREATE (:cause {name:"肿瘤",disease:"心包积液"});
CREATE (:cause {name:"特发性心包炎",disease:"心包积液"});
CREATE (:cause {name:"感染性心包炎",disease:"心包积液"});
CREATE (:cause {name:"结核性心包炎",disease:"心包积液"});
CREATE (:cause {name:"严重体循环瘀血",disease:"心包积液"});
CREATE (:cause {name:"穿刺伤",disease:"心包积液"});
CREATE (:cause {name:"心室破裂",disease:"心包积液"});
CREATE (:cause {name:"心胸外科手术",disease:"心包积液"});
CREATE (:cause {name:"介入操作造成的冠状动脉穿孔",disease:"心包积液"});
MATCH (d:disease {name:"心包积液"}),(c:cause {disease:"心包积液"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//3.5.3 心脏压塞
CREATE (:cause {name:"肿瘤",disease:"心脏压塞"});
CREATE (:cause {name:"特发性心包炎",disease:"心脏压塞"});
CREATE (:cause {name:"感染性心包炎",disease:"心脏压塞"});
CREATE (:cause {name:"结核性心包炎",disease:"心脏压塞"});
CREATE (:cause {name:"严重体循环瘀血",disease:"心脏压塞"});
CREATE (:cause {name:"穿刺伤",disease:"心脏压塞"});
CREATE (:cause {name:"心室破裂",disease:"心脏压塞"});
CREATE (:cause {name:"心胸外科手术",disease:"心脏压塞"});
CREATE (:cause {name:"介入操作造成的冠状动脉穿孔",disease:"心脏压塞"});
MATCH (d:disease {name:"心脏压塞"}),(c:cause {disease:"心脏压塞"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//3.5.4 窄缩性心包炎
CREATE (:cause {name:"结核性心包炎",disease:"窄缩性心包炎"});
CREATE (:cause {name:"非特异性心包炎",disease:"窄缩性心包炎"});
CREATE (:cause {name:"化脓性心包炎",disease:"窄缩性心包炎"});
CREATE (:cause {name:"创伤性心包炎",disease:"窄缩性心包炎"});
CREATE (:cause {name:"放射性心包炎",disease:"窄缩性心包炎"});
CREATE (:cause {name:"心脏直视手术",disease:"窄缩性心包炎"});
CREATE (:cause {name:"自身免疫性疾病",disease:"窄缩性心包炎"});
CREATE (:cause {name:"恶性肿瘤",disease:"窄缩性心包炎"});
CREATE (:cause {name:"尿毒症",disease:"窄缩性心包炎"});
CREATE (:cause {name:"药物",disease:"窄缩性心包炎"});
MATCH (d:disease {name:"窄缩性心包炎"}),(c:cause {disease:"窄缩性心包炎"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);



//四、诱因

//4.1.1.1.1 稳定型心绞痛
CREATE (:inducement {name:"体力劳动",disease:"稳定型心绞痛"});
CREATE (:inducement {name:"情绪激动",disease:"稳定型心绞痛"});
CREATE (:inducement {name:"饱食",disease:"稳定型心绞痛"});
CREATE (:inducement {name:"寒冷",disease:"稳定型心绞痛"});
CREATE (:inducement {name:"吸烟",disease:"稳定型心绞痛"});
CREATE (:inducement {name:"心动过速",disease:"稳定型心绞痛"});
CREATE (:inducement {name:"休克",disease:"稳定型心绞痛"});
MATCH (d:disease {name:"稳定型心绞痛"}),(c:inducement {disease:"稳定型心绞痛"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
//4.1.1.2.1 非ST段抬高型急性冠脉综合征
CREATE (:inducement {name:"感染",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:inducement {name:"甲状腺功能亢进",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:inducement {name:"心律失常",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:inducement {name:"低血压",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:inducement {name:"贫血",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:inducement {name:"低血氧症",disease:"非ST段抬高型急性冠脉综合征"});
MATCH (d:disease {name:"非ST段抬高型急性冠脉综合征"}),(c:inducement {disease:"非ST段抬高型急性冠脉综合征"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
//4.1.1.2.2 ST段抬高型心肌梗死
CREATE (:inducement {name:"晨起",disease:"ST段抬高型心肌梗死"});
CREATE (:inducement {name:"饱餐",disease:"ST段抬高型心肌梗死"});
CREATE (:inducement {name:"重体力活动",disease:"ST段抬高型心肌梗死"});
CREATE (:inducement {name:"情绪过分激动",disease:"ST段抬高型心肌梗死"});
CREATE (:inducement {name:"血压剧升",disease:"ST段抬高型心肌梗死"});
CREATE (:inducement {name:"用力排便",disease:"ST段抬高型心肌梗死"});
CREATE (:inducement {name:"休克",disease:"ST段抬高型心肌梗死"});
CREATE (:inducement {name:"脱水",disease:"ST段抬高型心肌梗死"});
CREATE (:inducement {name:"出血",disease:"ST段抬高型心肌梗死"});
CREATE (:inducement {name:"外科手术",disease:"ST段抬高型心肌梗死"});
CREATE (:inducement {name:"严重心律失常",disease:"ST段抬高型心肌梗死"});
MATCH (d:disease {name:"ST段抬高型心肌梗死"}),(c:inducement {disease:"ST段抬高型心肌梗死"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
//4.1.2 冠状动脉痉挛
CREATE (:inducement {name:"吸烟",disease:"冠状动脉痉挛"});
CREATE (:inducement {name:"酒精",disease:"冠状动脉痉挛"});
CREATE (:inducement {name:"毒品",disease:"冠状动脉痉挛"});
MATCH (d:disease {name:"冠状动脉痉挛"}),(c:inducement {disease:"冠状动脉痉挛"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);


//五、临床表现
//5.1.1.1.1 稳定型心绞痛
CREATE (:symptom {characteristic:"发作性胸痛",inducement:"体力劳动/情绪激动/饱食/寒冷/吸烟/心动过速/休克",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"放射痛至左肩、左臂内侧达无名指和小指，或至颈、咽或下颌部",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"胸痛常为压迫、发闷或紧缩性，也可有烧灼感",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"续数分钟至十余分钟，多为3~5分钟",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"发作部位主要在胸骨体之后，可波及心前区，横贯前胸",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"心率增快",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"血压升高",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"表情焦虑",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"皮肤冷或出汗",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"第三心音奔马律",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"第四心音奔马律",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"暂时性心尖部收缩期杂音",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"超声心动图无异常",examination:"超声心动图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"坏死区或缺血心室壁运动异常",comment:"陈旧性心肌梗死者/严重心肌缺血",examination:"超声心动图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"心肌梗死后瘢痕部位灌注缺损",examination:"核素心肌显像",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"运动负荷可见灌注缺损心肌缺血区",examination:"核素心肌显像",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"冠脉管腔直径减少>70%",examination:"冠状动脉造影",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"冠状动脉狭窄病变",examination:"多层螺旋CT冠状动脉成像",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"冠状动脉管壁钙化",examination:"多层螺旋CT冠状动脉成像",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"心电图正常",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"陈旧性心肌梗死的改变",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"非特异性ST段",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"T波异常",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"房室传导阻滞",examination:"静息时心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"束支传导阻滞",examination:"静息时心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"室性期前收缩",examination:"静息时心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"房性期前收缩",examination:"静息时心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"心律失常",examination:"静息时心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"ST段移位",status:"心绞痛发作时",examination:"心绞痛发作时心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"T波倒置",status:"心绞痛发作时",examination:"心绞痛发作时心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"T波假性正常化",status:"心绞痛发作时",examination:"心绞痛发作时心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"运动试验阳性",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"ST-T改变",examination:"心电图连续动态监测",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"各种心律失常",examination:"心电图连续动态监测",disease:"稳定型心绞痛"});
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {disease:"稳定型心绞痛"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.1.1.1.2 隐匿型冠心病
CREATE (:symptom {characteristic:"有心肌缺血的客观证据，但无心绞痛症状",disease:"隐匿型冠心病"});
CREATE (:symptom {characteristic:"曾有过心肌梗死史，现有心肌缺血客观证据，但无症状",disease:"隐匿型冠心病"});
CREATE (:symptom {characteristic:"有心肌缺血发作，有时有症状，有时无症状",disease:"隐匿型冠心病"});
CREATE (:symptom {characteristic:"心肌缺血",examination:"静息/负荷心电图",disease:"隐匿型冠心病"});
CREATE (:symptom {characteristic:"心肌缺血",examination:"心电图连续动态监测",disease:"隐匿型冠心病"});
MATCH (d:disease {name:"隐匿型冠心病"}),(s:symptom {disease:"隐匿型冠心病"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.1.1.1.3.1 充血型缺血性心肌病
CREATE (:symptom {characteristic:"心绞痛",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"明确的冠心病史",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"1次以上心肌梗死病史",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"无症状性心肌缺血",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"胸闷",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"乏力",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"眩晕",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"呼吸困难",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"心力衰竭",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"劳力性呼吸困难",comment:"左心室功能不全",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"端坐呼吸",comment:"左心室功能不全",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"夜间阵发性呼吸困难",comment:"左心室功能不全",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"疲乏",comment:"左心室功能不全",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"虚弱",comment:"左心室功能不全",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"第一心音减弱",comment:"左心室功能不全",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"舒张中晚期奔马律",comment:"左心室功能不全",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"两肺底散在湿啰音",comment:"左心室功能不全",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"食欲缺乏",comment:"合并有右心室功能衰竭",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"周围性水肿",comment:"合并有右心室功能衰竭",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"右上腹闷胀感",comment:"合并有右心室功能衰竭",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"颈静脉充盈或怒张",comment:"合并有右心室功能衰竭",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"心界扩大",comment:"合并有右心室功能衰竭",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"肝大",comment:"合并有右心室功能衰竭",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"肝压痛",comment:"合并有右心室功能衰竭",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"肝颈静脉回流征阳性",comment:"合并有右心室功能衰竭",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"心律失常",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"室性期前收缩",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"心房颤动",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"束支传导阻滞",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"血栓和栓塞",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"冠脉显著狭窄",examination:"冠状动脉造影",disease:"充血型缺血性心肌病"});
CREATE (:symptom {characteristic:"冠脉显著狭窄",examination:"冠脉CTA",disease:"充血型缺血性心肌病"});
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {disease:"充血型缺血性心肌病"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.1.1.1.3.2 限制型缺血性心肌病
CREATE (:symptom {characteristic:"限制型心肌病体征",disease:"限制型缺血性心肌病"});
CREATE (:symptom {characteristic:"心绞痛",disease:"限制型缺血性心肌病"});
CREATE (:symptom {characteristic:"劳力性呼吸困难",disease:"限制型缺血性心肌病"});
CREATE (:symptom {characteristic:"活动受限",disease:"限制型缺血性心肌病"});
CREATE (:symptom {characteristic:"心脏明显过大",disease:"限制型缺血性心肌病"});
CREATE (:symptom {characteristic:"冠脉显著狭窄",examination:"冠状动脉造影",disease:"限制型缺血性心肌病"});
CREATE (:symptom {characteristic:"冠脉显著狭窄",examination:"冠脉CTA",disease:"限制型缺血性心肌病"});
CREATE (:symptom {characteristic:"心肌坏死",examination:"心电图",disease:"限制型缺血性心肌病"});
CREATE (:symptom {characteristic:"Q波形成",examination:"心电图",disease:"限制型缺血性心肌病"});
CREATE (:symptom {characteristic:"室壁运动减弱或消失征象",examination:"心脏超声",disease:"限制型缺血性心肌病"});
MATCH (d:disease {name:"限制型缺血性心肌病"}),(s:symptom {disease:"限制型缺血性心肌病"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.1.1.2.1.1 不稳定型心绞痛
CREATE (:symptom {characteristic:"一过性第三心音",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"一过性第四心音",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"诱发心绞痛的体力活动阈值突然或持久降低",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"心绞痛发生频率、严重程度和持续时间增加",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"出现静息或夜间心绞痛",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"胸痛放射至新的部位",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"心绞痛发作",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"出汗",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"恶心",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"呕吐",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"心悸",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"呼吸困难",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"常规休息或舌下含服硝酸甘油只能暂时甚至不能完全缓解症状",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"一过性第三心音",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"一过性第四心音",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"二尖瓣反流引起的一过性收缩性杂音",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"冠状动脉病变",examination:"单支或多支冠状动脉造影",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"一过性ST段抬高或压低",examination:"心绞痛发作时心电图",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"T波低平或倒置",examination:"心绞痛发作时心电图",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"ST段动态改变",examination:"心绞痛发作时心电图",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"U波倒置",examination:"心绞痛发作时心电图",disease:"不稳定型心绞痛"});
MATCH (d:disease {name:"不稳定型心绞痛"}),(s:symptom {disease:"不稳定型心绞痛"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.1.1.2.1.2 非ST段抬高型心肌梗死
CREATE (:symptom {characteristic:"一过性第三心音",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"一过性第四心音",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"诱发心绞痛的体力活动阈值突然或持久降低",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"心绞痛发生频率、严重程度和持续时间增加",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"出现静息或夜间心绞痛",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"胸痛放射至新的部位",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"心绞痛发作",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"出汗",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"恶心",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"呕吐",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"心悸",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"呼吸困难",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"常规休息或舌下含服硝酸甘油只能暂时甚至不能完全缓解症状",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"一过性第三心音",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"一过性第四心音",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"二尖瓣反流引起的一过性收缩性杂音",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"冠状动脉病变",examination:"单支或多支冠状动脉造影",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"一过性ST段抬高或压低",examination:"心绞痛发作时心电图",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"T波低平或倒置",examination:"心绞痛发作时心电图",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"ST段动态改变",examination:"心绞痛发作时心电图",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"U波倒置",examination:"心绞痛发作时心电图",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"持续改变12小时以上",examination:"心电图连续动态监测",disease:"非ST段抬高型心肌梗死"});
MATCH (d:disease {name:"非ST段抬高型心肌梗死"}),(s:symptom {disease:"非ST段抬高型心肌梗死"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//5.1.1.2.2 ST段抬高型心肌梗死
CREATE (:symptom {characteristic:"发病数日前乏力",comment:"先兆症状",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"发病数日前胸部不适",comment:"先兆症状",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"活动时心悸",comment:"先兆症状",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"活动时气急",comment:"先兆症状",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"活动时烦躁",comment:"先兆症状",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"活动时心绞痛",comment:"先兆症状",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"新发生心绞痛",comment:"先兆症状",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"原有心绞痛加重",comment:"先兆症状",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"心绞痛发作较以往频繁、程度较剧、持续较久、硝酸甘油疗效差、诱发因素不明显",comment:"先兆症状",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"ST段一过性明显抬高",examination:"心电图",comment:"先兆症状",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"T波倒置或增高（假性正常化）",examination:"心电图",comment:"先兆症状",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"疼痛",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"疼痛多发生于清晨",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"疼痛部位和性质与心绞痛相同",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"疼痛常发生于安静时",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"疼痛程度较重",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"疼痛持续时间较长，可达数小时或更长",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"休息和含用硝酸甘油片多不能缓解",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"烦躁不安",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"出汗",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"恐惧",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"胸闷",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"濒死感",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"休克",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"急性心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"发热",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"体温38℃",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"心动过速",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"白细胞计数增高",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"红细胞沉降率增快",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"恶心",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"呕吐",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"上腹胀痛",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"肠胀气",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"呃逆",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"乏力",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"头晕",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"晕厥",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"室性心律失常",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"房室传导阻滞",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"束支传导阻滞",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"低血压",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"心源性休克",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"心脏浊音界可正常也可轻度至中度增大",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"心律多增快，少数也可减慢",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"心尖区第一心音减弱",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"呼吸困难",comment:"心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"咳嗽",comment:"心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"发绀",comment:"心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"烦躁",comment:"心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"肺水肿",comment:"心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"颈静脉怒张",comment:"心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"肝大",comment:"心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"水肿",comment:"心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"血压下降",comment:"右心室心肌梗死",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"右心衰竭",comment:"右心室心肌梗死",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"第三心音奔马律",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"第四心音奔马律",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"心包摩擦音",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"心尖区收缩期杂音",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"心尖区收缩期喀喇音",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"胸骨左缘3~4肋间收缩期杂音伴震颤",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"ST段抬高呈弓背向上型",examination:"心电图",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"宽而深的Q波（病理性Q波）",examination:"心电图",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"无异常或异常高大两肢不对称的T波",examination:"心电图连续动态监测",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"ST-T单相曲线",examination:"心电图连续动态监测",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"病理性Q波",examination:"心电图连续动态监测",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"R波减低",examination:"心电图连续动态监测",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"ST段抬高持续数日",examination:"心电图连续动态监测",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"T波平坦或倒置",examination:"心电图连续动态监测",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"T波V形倒置",examination:"心电图连续动态监测",disease:"ST段抬高型心肌梗死"});
MATCH (d:disease {name:"ST段抬高型心肌梗死"}),(s:symptom {disease:"ST段抬高型心肌梗死"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.1.2 冠状动脉痉挛
CREATE (:symptom {characteristic:"静息性心绞痛",disease:"冠状动脉痉挛"});
CREATE (:symptom {characteristic:"发病时间集中在午夜至上午8点之间",disease:"冠状动脉痉挛"});
CREATE (:symptom {characteristic:"恶性心律失常",disease:"冠状动脉痉挛"});
CREATE (:symptom {characteristic:"急性心肌梗死",disease:"冠状动脉痉挛"});
CREATE (:symptom {characteristic:"猝死",disease:"冠状动脉痉挛"});
CREATE (:symptom {characteristic:"自行缓解",disease:"冠状动脉痉挛"});
CREATE (:symptom {characteristic:"正常或冠脉粥样硬化",examination:"冠状动脉造影",disease:"冠状动脉痉挛"});
CREATE (:symptom {characteristic:"一过性ST段抬高",examination:"心电图",comment:"冠状动脉痉挛导致血管闭塞",disease:"冠状动脉痉挛"});
CREATE (:symptom {characteristic:"ST段压低",comment:"非闭塞性痉挛",examination:"心电图",disease:"冠状动脉痉挛"});
CREATE (:symptom {characteristic:"T波改变",comment:"非闭塞性痉挛",examination:"心电图",disease:"冠状动脉痉挛"});
MATCH (d:disease {name:"冠状动脉痉挛"}),(s:symptom {disease:"冠状动脉痉挛"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.1.3 心肌桥
CREATE (:symptom {characteristic:"心绞痛",disease:"心肌桥"});
CREATE (:symptom {characteristic:"心律失常",disease:"心肌桥"});
CREATE (:symptom {characteristic:"猝死",disease:"心肌桥"});
CREATE (:symptom {characteristic:"心肌梗死",disease:"心肌桥"});
CREATE (:symptom {characteristic:"动脉粥样硬化斑块",examination:"冠状动脉造影",disease:"心肌桥"});
MATCH (d:disease {name:"心肌桥"}),(s:symptom {disease:"心肌桥"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.1.4 X综合征
CREATE (:symptom {characteristic:"心绞痛",disease:"X综合征"});
CREATE (:symptom {characteristic:"运动平板试验出现ST段下移",examination:"心电图",disease:"X综合征"});
CREATE (:symptom {characteristic:"正常或非特异性ST-T改变",examination:"心电图",disease:"X综合征"});
CREATE (:symptom {characteristic:"冠状静脉窦乳酸含量增加",examination:"运动负荷试验/心房调搏术",disease:"X综合征"});
CREATE (:symptom {characteristic:"冠状动脉内膜增厚",examination:"血管内超声",disease:"X综合征"});
CREATE (:symptom {characteristic:"早期动脉粥样硬化斑块",examination:"血管内超声",disease:"X综合征"});
CREATE (:symptom {characteristic:"冠状动脉血流储备降低",examination:"多普勒血流测定",disease:"X综合征"});
CREATE (:symptom {characteristic:"冠状动脉造影无异常",examination:"冠状动脉造影",disease:"X综合征"});
MATCH (d:disease {name:"X综合征"}),(s:symptom {disease:"X综合征"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//5.5.1 急性心包炎
CREATE (:symptom {characteristic:"胸痛",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"胸骨后、心前区疼痛",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"颈部、左肩、左臂、上腹部放射痛",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"疼痛性质尖锐",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"呼吸困难",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"水肿",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"发热",comment:"感染性心包炎",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"乏力",comment:"感染性心包炎",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"白细胞计数增加",examination:"血清学检查",comment:"感染性心包炎",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"中性粒细胞增加",examination:"血清学检查",comment:"感染性心包炎",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"C反应蛋白增高",examination:"血清学检查",comment:"感染性心包炎",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"红细胞沉降率增快",examination:"血清学检查",comment:"感染性心包炎",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"免疫指标阳性",examination:"血清学检查",comment:"自身免疫病引起心包炎",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"肌酐明显升高",examination:"血清学检查",comment:"尿毒症病人",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"心包摩擦音，呈抓刮样粗糙的高频音",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"三相摩擦音",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"心电图异常",examination:"心电图",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"除aVR及V1导联以外ST段呈弓背向下型抬高",examination:"心电图",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"心电图异常",examination:"心电图",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"aVR及V1导联ST段压低",examination:"心电图",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"窦性心动过速",examination:"心电图",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"QRS电交替",examination:"心电图",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"心影增大",examination:"胸部X线",comment:"心包积液较多",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"心包渗出后心包积液",examination:"胸部X线/超声心动图",disease:"急性心包炎"});
MATCH (d:disease {name:"急性心包炎"}),(s:symptom {disease:"急性心包炎"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//5.5.2 心包积液
CREATE (:symptom {characteristic:"呼吸困难",disease:"心包积液"});
CREATE (:symptom {characteristic:"端坐呼吸",disease:"心包积液"});
CREATE (:symptom {characteristic:"身体前倾",disease:"心包积液"});
CREATE (:symptom {characteristic:"面色苍白",disease:"心包积液"});
CREATE (:symptom {characteristic:"发绀",disease:"心包积液"});
CREATE (:symptom {characteristic:"干咳",disease:"心包积液"});
CREATE (:symptom {characteristic:"声音嘶哑",disease:"心包积液"});
CREATE (:symptom {characteristic:"吞咽困难",disease:"心包积液"});
CREATE (:symptom {characteristic:"上腹部疼痛",disease:"心包积液"});
CREATE (:symptom {characteristic:"肝大",disease:"心包积液"});
CREATE (:symptom {characteristic:"全身水肿",disease:"心包积液"});
CREATE (:symptom {characteristic:"胸腔积液",disease:"心包积液"});
CREATE (:symptom {characteristic:"腹腔积液",disease:"心包积液"});
CREATE (:symptom {characteristic:"休克",disease:"心包积液"});
CREATE (:symptom {characteristic:"心尖搏动减弱",disease:"心包积液"});
CREATE (:symptom {characteristic:"心脏浊音界向两侧增大",disease:"心包积液"});
CREATE (:symptom {characteristic:"心音低而遥远",disease:"心包积液"});
CREATE (:symptom {characteristic:"左肩胛骨下出现叩浊音",disease:"心包积液"});
CREATE (:symptom {characteristic:"支气管呼吸音",disease:"心包积液"});
CREATE (:symptom {characteristic:"心包积液征（Ewart征）",disease:"心包积液"});
CREATE (:symptom {characteristic:"胸骨左缘第3、4肋间闻及心包叩击音",disease:"心包积液"});
CREATE (:symptom {characteristic:"奇脉",disease:"心包积液"});
CREATE (:symptom {characteristic:"体循环瘀血",disease:"心包积液"});
CREATE (:symptom {characteristic:"颈静脉怒张",disease:"心包积液"});
CREATE (:symptom {characteristic:"肝颈静脉回流征",disease:"心包积液"});
CREATE (:symptom {characteristic:"下肢水肿",disease:"心包积液"});
CREATE (:symptom {characteristic:"肢体导联QRS低电压",examination:"心电图",disease:"心包积液"});
CREATE (:symptom {characteristic:"P波",examination:"心电图",disease:"心包积液"});
CREATE (:symptom {characteristic:"QRS波",examination:"心电图",disease:"心包积液"});
CREATE (:symptom {characteristic:"T波电交替",examination:"心电图",disease:"心包积液"});
CREATE (:symptom {characteristic:"窦性心动过速",examination:"心电图",disease:"心包积液"});
CREATE (:symptom {characteristic:"肺野清晰",examination:"X线检查",disease:"心包积液"});
CREATE (:symptom {characteristic:"心影显著增大",examination:"X线检查",disease:"心包积液"});
CREATE (:symptom {characteristic:"整个心动周期可见脏层心包与壁层心包之间存在积液",examination:"超声心动图",disease:"心包积液"});
CREATE (:symptom {characteristic:"游泳心",examination:"超声心动图",disease:"心包积液"});
CREATE (:symptom {characteristic:"舒张末期右心房塌陷",examination:"超声心动图",disease:"心包积液"});
CREATE (:symptom {characteristic:"舒张早期右心室游离壁塌陷",examination:"超声心动图",disease:"心包积液"});
CREATE (:symptom {characteristic:"吸气时右心室内径增大",examination:"超声心动图",disease:"心包积液"});
CREATE (:symptom {characteristic:"吸气时左心室内径减小",examination:"超声心动图",disease:"心包积液"});
CREATE (:symptom {characteristic:"吸气时室间隔左移",examination:"超声心动图",disease:"心包积液"});
MATCH (d:disease {name:"心包积液"}),(s:symptom {disease:"心包积液"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//5.5.3 心脏压塞
CREATE (:symptom {characteristic:"呼吸困难",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"端坐呼吸",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"身体前倾",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"面色苍白",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"发绀",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"干咳",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"声音嘶哑",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"吞咽困难",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"上腹部疼痛",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"肝大",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"全身水肿",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"胸腔积液",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"腹腔积液",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"休克",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"心尖搏动减弱",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"心脏浊音界向两侧增大",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"心音低而遥远",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"左肩胛骨下出现叩浊音",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"支气管呼吸音",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"心包积液征（Ewart征）",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"胸骨左缘第3、4肋间闻及心包叩击音",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"奇脉",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"体循环瘀血",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"颈静脉怒张",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"肝颈静脉回流征",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"下肢水肿",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"窦性心动过速",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"血压下降",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"脉压变小",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"静脉压明显升高",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"急性循环衰竭",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"休克",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"Kussmaul征",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"为挠动脉搏动呈吸气性显著减弱或消失",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"肢体导联QRS低电压",examination:"心电图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"P波",examination:"心电图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"QRS波",examination:"心电图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"T波电交替",examination:"心电图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"窦性心动过速",examination:"心电图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"肺野清晰",examination:"X线检查",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"心影显著增大",examination:"X线检查",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"整个心动周期可见脏层心包与壁层心包之间存在积液",examination:"超声心动图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"游泳心",examination:"超声心动图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"舒张末期右心房塌陷",examination:"超声心动图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"舒张早期右心室游离壁塌陷",examination:"超声心动图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"吸气时右心室内径增大",examination:"超声心动图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"吸气时左心室内径减小",examination:"超声心动图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"吸气时室间隔左移",examination:"超声心动图",disease:"心脏压塞"});
MATCH (d:disease {name:"心脏压塞"}),(s:symptom {disease:"心脏压塞"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//5.5.4 窄缩性心包炎
CREATE (:symptom {characteristic:"心包炎/心包积液/恶性肿瘤/胸部放射性治疗/胸心外科手术病史",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心悸",comment:"体循环瘀血",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"劳力性呼吸困难",comment:"体循环瘀血",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"活动耐量下降",comment:"体循环瘀血",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"疲乏",comment:"体循环瘀血",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"肝大",comment:"体循环瘀血",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"腹腔积液",comment:"体循环瘀血",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"胸腔积液",comment:"体循环瘀血",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"下肢水肿",comment:"体循环瘀血",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"颈静脉压升高",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"脉压变小",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心尖搏动减弱或消失",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"收缩期心尖呈负性搏动",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心浊音界正常或稍增大",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心音轻而远",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"无心脏杂音",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心浊音界正常或稍增大",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"胸骨左缘第3~4肋间可闻及心包叩击音",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心率较快",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"窦性/房性/室性心律",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"期前收缩",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"Kussmaul征",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"肌肉萎缩",comment:"晚期",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"恶病质",comment:"晚期",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"严重水肿",comment:"晚期",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心影轻度增大",examination:"X线检查",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心包钙化",examination:"X线检查",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心动过速",examination:"心电图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"QRS低电压",examination:"心电图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"T波低平或倒置",examination:"心电图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"P波增宽有切迹",examination:"心电图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心房颤动",comment:"病程长/高龄病人",examination:"心电图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"肺毛细血管压力/肺动脉舒张压力/右心室舒张末期压力/右心房压力/腔静脉压力均显著升高且趋于同一水平",comment:"病程长/高龄病人",examination:"右心导管检查",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"右心房压力曲线呈M或W波形",comment:"病程长/高龄病人",examination:"右心导管检查",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"右心室收缩压轻度升高，呈舒张早期下陷及高原形曲线",comment:"病程长/高龄病人",examination:"右心导管检查",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"呼吸时左、 压力曲线变化呈矛盾性",comment:"病程长/高龄病人",examination:"右心导管检查",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心包增厚、粘连",examination:"超声心动图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心脏变形",examination:"超声心动图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"室壁活动减弱",examination:"超声心动图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"室间隔舒张期矛盾运动（室间隔抖动症）",examination:"超声心动图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"下腔静脉增宽且不随呼吸变化",examination:"超声心动图",disease:"窄缩性心包炎"});
MATCH (d:disease {name:"窄缩性心包炎"}),(s:symptom {disease:"窄缩性心包炎"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//六、分期分级分类

//6.1.1.1 稳定型心绞痛分级
CREATE (:degree {name:"Ⅰ级", criterion:"一般体力活动（如步行和登楼）不受限，仅在强、快或持续用力时发生心绞痛",reference:"加拿大心血管病学会(CCS)",disease:"稳定型心绞痛"});
CREATE (:degree {name:"Ⅱ级", criterion:"一般体力活动轻度受限。快步、饭后、寒冷或刮风中、精神应激或醒后数小时内发作心绞痛。一般情况平地步行200m以上或登楼一层以上受限",reference:"加拿大心血管病学会(CCS)",disease:"稳定型心绞痛"});
CREATE (:degree {name:"Ⅲ级", criterion:"一般体力活动明显受限，一般情况下平地步行200m内或登楼一层引起心绞痛",reference:"加拿大心血管病学会(CCS)",disease:"稳定型心绞痛"});
CREATE (:degree {name:"Ⅳ级", criterion:"轻微活动或休息时即可发生心绞痛",reference:"加拿大心血管病学会(CCS)",disease:"稳定型心绞痛"});
MATCH (d:disease {name:"稳定型心绞痛"}),(g:degree {disease:"稳定型心绞痛"}) CREATE (d)-[:disease_degree {reference:"内科学第九版"}]->(g);

//6.1.1.2.1.1 不稳定型心绞痛分级
CREATE (:degree {name:"Ⅰ级", criterion:"严重的初发型心绞痛或恶化型心绞痛，无静息疼痛",reference:"Braunwald分级",disease:"不稳定型心绞痛"});
CREATE (:degree {name:"Ⅱ级", criterion:"亚急性静息型疼痛（一个月内发作过，但48小时内无发作）",reference:"Braunwald分级",disease:"不稳定型心绞痛"});
CREATE (:degree {name:"Ⅲ级", criterion:"急性静息型心绞痛（48小时内有发作）",reference:"Braunwald分级",disease:"不稳定型心绞痛"});
MATCH (d:disease {name:"不稳定型心绞痛"}),(g:degree {disease:"不稳定型心绞痛"}) CREATE (d)-[:disease_degree {reference:"内科学第九版"}]->(g);

//分型

// CREATE (:disease {name:"心肌梗死"});
// CREATE (:classification {name:"1型心肌梗死",definition:"由冠状动脉粥样硬化斑块急性破裂或侵蚀，血小板激活，继发冠状动脉血栓性阻塞，引起心肌缺血、损伤或坏死。须具备心肌损伤和至少一项心肌缺血的临床证据。"});
// CREATE (:classification {name:"2型心肌梗死",definition:"与冠状动脉粥样斑块急性破裂或侵蚀、血栓形成无关，为心肌供氧和需氧之间失平衡所致。"});
// CREATE (:classification {name:"3型心肌梗死",definition:"指心脏性死亡伴心肌缺血症状和新发生缺血性心电图改变或心室颤动,但死亡发生于获得生物标志物的血样本或在明确心脏生物标志物增高之前，尸检证实为心肌梗死。"});
// CREATE (:classification {name:"4a型心肌梗死",definition:"经皮冠状动脉介入治疗相关心肌梗死。"});
// CREATE (:classification {name:"4b型心肌梗死",definition:"冠状动脉内支架或支撑物血栓形成相关心肌梗死。"});
// CREATE (:classification {name:"4c型心肌梗死",definition:"再狭窄相关肌梗死。"});
// CREATE (:classification {name:"5型心肌梗死",definition:"为冠状动脉旁路移植术相关的心肌梗死。"});
// MATCH (d1:disease {english_name:"STEMI"}), (d2:classification {name:"1型心肌梗死"}) CREATE (d1)-[:disease_classification {reference:"急性ST段抬高型心肌梗死诊断和治疗指南(2019)"}]->(d2);
// MATCH (d1:disease {english_name:"STEMI"}), (d2:classification {name:"2型心肌梗死"}) CREATE (d1)-[:disease_classification {reference:"急性ST段抬高型心肌梗死诊断和治疗指南(2019)"}]->(d2);
// MATCH (d1:disease {english_name:"STEMI"}), (d2:classification {name:"3型心肌梗死"}) CREATE (d1)-[:disease_classification {reference:"急性ST段抬高型心肌梗死诊断和治疗指南(2019)"}]->(d2);
// MATCH (d1:disease {english_name:"STEMI"}), (d2:classification {name:"4a型心肌梗死"}) CREATE (d1)-[:disease_classification {reference:"急性ST段抬高型心肌梗死诊断和治疗指南(2019)"}]->(d2);
// MATCH (d1:disease {english_name:"STEMI"}), (d2:classification {name:"4b型心肌梗死"}) CREATE (d1)-[:disease_classification {reference:"急性ST段抬高型心肌梗死诊断和治疗指南(2019)"}]->(d2);
// MATCH (d1:disease {english_name:"STEMI"}), (d2:classification {name:"4c型心肌梗死"}) CREATE (d1)-[:disease_classification {reference:"急性ST段抬高型心肌梗死诊断和治疗指南(2019)"}]->(d2);
// MATCH (d1:disease {english_name:"STEMI"}), (d2:classification {name:"5型心肌梗死"}) CREATE (d1)-[:disease_classification {reference:"急性ST段抬高型心肌梗死诊断和治疗指南(2019)"}]->(d2);

//七、辅助检查

//7.1.1.1.1 稳定型心绞痛
CREATE (:laboratory_test {name:"血糖",information:"冠心病危险因素",disease:"稳定型心绞痛"});
CREATE (:laboratory_test {name:"血脂",information:"冠心病危险因素",disease:"稳定型心绞痛"});
CREATE (:laboratory_test {name:"心肌肌钙蛋白I或T",information:"血清心肌损伤标志物/ACS鉴别",disease:"稳定型心绞痛"});
CREATE (:laboratory_test {name:"肌酸激酶",english_name:"CK",information:"血清心肌损伤标志物/ACS鉴别",disease:"稳定型心绞痛"});
CREATE (:laboratory_test {name:"肌酸激酶同工酶",english_name:"CK-MB",information:"血清心肌损伤标志物/ACS鉴别",disease:"稳定型心绞痛"});
CREATE (:laboratory_test {name:"血常规",information:"贫血",disease:"稳定型心绞痛"});
CREATE (:laboratory_test {name:"甲状腺功能检查",information:"甲状腺功能",disease:"稳定型心绞痛"});
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:laboratory_test {disease:"稳定型心绞痛"}) CREATE (d)-[:disease_laboratory_test {reference:"内科学第九版"}]->(rt);
CREATE (:examination {name:"心电图",information:"静息时心电图/心绞痛发作时心电图",disease:"稳定型心绞痛"});
CREATE (:examination {name:"心电图负荷试验",information:"运动试验阳性",contraindication:"心肌梗死急性期/不稳定型心绞痛/明显心力衰竭/严重心律失常/急性疾病",disease:"稳定型心绞痛"});
CREATE (:examination {name:"心电图连续动态监测",information:"连续记录并自动分析24小时及以上心电图/检出无痛性心肌缺血",disease:"稳定型心绞痛"});
CREATE (:examination {name:"多层螺旋CT冠状动脉成像",english_name:"CTA",information:"判断冠脉官腔狭窄程度/管壁钙化情况/管壁内斑块分布范围和性质",disease:"稳定型心绞痛"});
CREATE (:examination {name:"超声心动图",information:"是否存在陈旧性心肌梗死/是否存在严重心肌缺血/鉴别诊断/负荷状态下心肌灌注情况",disease:"稳定型心绞痛"});
CREATE (:examination {name:"核素心肌显像及负荷试验",information:"灌注缺损区域",disease:"稳定型心绞痛"});
CREATE (:examination {name:"放射性核素心腔造影",information:"左心室射血分数/显示心肌缺血区室壁局部运动障碍",disease:"稳定型心绞痛"});
CREATE (:examination {name:"正电子发射断层心肌显像",english_name:"PET",information:"可判断心肌的血流灌注情况/心肌代谢情况/评估心肌活力",disease:"稳定型心绞痛"});
CREATE (:examination {name:"冠状动脉造影",english_name:"CAG",information:"诊断冠心病金标准",disease:"稳定型心绞痛"});
CREATE (:examination {name:"冠脉内超声显像",english_name:"IVUS",information:"诊断冠心病/指导介入治疗",disease:"稳定型心绞痛"});
CREATE (:examination {name:"冠脉内光学相干断层显像",english_name:"OCT",information:"诊断冠心病/指导介入治疗",disease:"稳定型心绞痛"});
CREATE (:examination {name:"冠脉血流储备分数测定",english_name:"FFR",information:"诊断冠心病/指导介入治疗",disease:"稳定型心绞痛"});
CREATE (:examination {name:"定量冠脉血流分数",english_name:"QFR",information:"诊断冠心病/指导介入治疗",disease:"稳定型心绞痛"});
CREATE (:examination {name:"胸部X线检查",information:"了解其他心肺疾病情况",disease:"稳定型心绞痛"});
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {disease:"稳定型心绞痛"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//7.1.1.1.2 隐匿型冠心病
CREATE (:examination {name:"心电图",information:"静息时心电图/动态心电图/负荷试验",disease:"隐匿型冠心病"});
CREATE (:examination {name:"颈动脉内-中膜厚度测量",information:"评估冠脉钙化分数",disease:"隐匿型冠心病"});
CREATE (:examination {name:"踝肱比",information:"评估冠脉钙化分数",disease:"隐匿型冠心病"});
CREATE (:examination {name:"多层螺旋CT冠状动脉成像",english_name:"CTA",information:"评估冠脉钙化分数",disease:"隐匿型冠心病"});
CREATE (:examination {name:"核素心肌显像",information:"心肌血流灌注情况",disease:"隐匿型冠心病"});
CREATE (:examination {name:"冠状动脉造影",english_name:"CAG",information:"心肌血流灌注情况",disease:"隐匿型冠心病"});
MATCH (d:disease {name:"隐匿型冠心病"}),(rt:examination {disease:"隐匿型冠心病"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//7.1.1.2.1.1 不稳定型心绞痛
CREATE (:laboratory_test {name:"心肌肌钙蛋白I或T",information:"血清心肌坏死标志物",disease:"不稳定型心绞痛"});
MATCH (d:disease {name:"不稳定型心绞痛"}),(rt:laboratory_test {disease:"不稳定型心绞痛"}) CREATE (d)-[:disease_laboratory_test {reference:"内科学第九版"}]->(rt);
CREATE (:examination {name:"心电图",information:"诊断/根据异常范围和严重程度提示预后",disease:"不稳定型心绞痛"});
CREATE (:examination {name:"连续心电监护",information:"发现无症状或心绞痛发作时的ST段改变",disease:"不稳定型心绞痛"});
CREATE (:examination {name:"冠状动脉造影",english_name:"CAG",information:"提供详细的血管相关信息",disease:"不稳定型心绞痛"});
CREATE (:examination {name:"冠脉超声成像",information:"提供斑块分布、性质、大小和有否斑块破溃及血栓",disease:"不稳定型心绞痛"});
CREATE (:examination {name:"冠脉内光学相干断层显像",information:"提供斑块分布、性质、大小和有否斑块破溃及血栓",disease:"不稳定型心绞痛"});
CREATE (:examination {name:"胸部X线",information:"增加阳性发现率",disease:"不稳定型心绞痛"});
CREATE (:examination {name:"心脏超声",information:"增加阳性发现率",disease:"不稳定型心绞痛"});
CREATE (:examination {name:"放射性核素检查",information:"增加阳性发现率",disease:"不稳定型心绞痛"});
MATCH (d:disease {name:"不稳定型心绞痛"}),(rt:examination {disease:"不稳定型心绞痛"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//7.1.1.2.1.1 非ST段抬高型心肌梗死
CREATE (:laboratory_test {name:"心肌肌钙蛋白I或T",information:"血清心肌坏死标志物",disease:"非ST段抬高型心肌梗死"});
MATCH (d:disease {name:"非ST段抬高型心肌梗死"}),(rt:laboratory_test {disease:"非ST段抬高型心肌梗死"}) CREATE (d)-[:disease_laboratory_test {reference:"内科学第九版"}]->(rt);
CREATE (:examination {name:"心电图",information:"诊断/根据异常范围和严重程度提示预后",disease:"非ST段抬高型心肌梗死"});
CREATE (:examination {name:"连续心电监护",information:"发现无症状或心绞痛发作时的ST段改变",disease:"非ST段抬高型心肌梗死"});
CREATE (:examination {name:"冠状动脉造影",english_name:"CAG",information:"提供详细的血管相关信息",disease:"非ST段抬高型心肌梗死"});
CREATE (:examination {name:"冠脉超声成像",information:"提供斑块分布、性质、大小和有否斑块破溃及血栓",disease:"非ST段抬高型心肌梗死"});
CREATE (:examination {name:"冠脉内光学相干断层显像",information:"提供斑块分布、性质、大小和有否斑块破溃及血栓",disease:"非ST段抬高型心肌梗死"});
CREATE (:examination {name:"胸部X线",information:"增加阳性发现率",disease:"非ST段抬高型心肌梗死"});
CREATE (:examination {name:"心脏超声",information:"增加阳性发现率",disease:"非ST段抬高型心肌梗死"});
CREATE (:examination {name:"放射性核素检查",information:"增加阳性发现率",disease:"非ST段抬高型心肌梗死"});
MATCH (d:disease {name:"非ST段抬高型心肌梗死"}),(rt:examination {disease:"非ST段抬高型心肌梗死"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//7.1.1.2.2 ST段抬高型心肌梗死
CREATE (:laboratory_test {name:"血常规",disease:"ST段抬高型心肌梗死"});
CREATE (:laboratory_test {name:"肌红蛋白",information:"血清心肌坏死标志物",disease:"ST段抬高型心肌梗死"});
CREATE (:laboratory_test {name:"心肌肌钙蛋白I或T",information:"血清心肌坏死标志物",disease:"ST段抬高型心肌梗死"});
CREATE (:laboratory_test {name:"肌酸激酶同工酶",information:"血清心肌坏死标志物",disease:"ST段抬高型心肌梗死"});
MATCH (d:disease {name:"ST段抬高型心肌梗死"}),(rt:laboratory_test {disease:"ST段抬高型心肌梗死"}) CREATE (d)-[:disease_laboratory_test {reference:"内科学第九版"}]->(rt);
CREATE (:examination {name:"心电图",information:"MI的诊断、定位、定范围、估计病情演变和预后",disease:"ST段抬高型心肌梗死"});
CREATE (:examination {name:"超声心动图",information:"了解心室壁的运动和左心室功能/诊断室壁瘤和乳头肌功能失调/检测心包积液及室间隔穿孔等并发症",disease:"ST段抬高型心肌梗死"});
CREATE (:examination {name:"放射性核素检查",english_name:"PET",information:"心肌的代谢变化",disease:"ST段抬高型心肌梗死"});
CREATE (:examination {name:"单光子发射计算机断层显像",english_name:"SPECT",information:"评估室壁运动/室壁厚度/整体功能",disease:"ST段抬高型心肌梗死"});
MATCH (d:disease {name:"ST段抬高型心肌梗死"}),(rt:examination {disease:"ST段抬高型心肌梗死"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//7.1.2 冠状动脉痉挛
CREATE (:examination {name:"心电图",information:"ST段抬高情况",disease:"冠状动脉痉挛"});
CREATE (:examination {name:"冠状动脉造影",english_name:"CTA",information:"血管粥样硬化情况",disease:"冠状动脉痉挛"});
CREATE (:examination {name:"乙酰胆碱或麦角新碱激发试验",information:"捕捉冠状动脉痉挛",disease:"冠状动脉痉挛"});
MATCH (d:disease {name:"冠状动脉痉挛"}),(rt:examination {disease:"冠状动脉痉挛"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//7.1.3 心肌桥
CREATE (:examination {name:"冠状动脉造影",english_name:"CTA",information:"挤奶现象",disease:"心肌桥"});
MATCH (d:disease {name:"心肌桥"}),(rt:examination {disease:"心肌桥"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//7.1.4 X综合征
CREATE (:examination {name:"心电图",information:"静息时心电图/负荷试验",disease:"X综合征"});
CREATE (:examination {name:"心房调搏术",information:"冠状静脉窦乳酸含量增加",disease:"X综合征"});
CREATE (:examination {name:"血管内超声",information:"冠状动脉内膜增厚/早期动脉粥样斑块形成",disease:"X综合征"});
CREATE (:examination {name:"多普勒血流测定",information:"冠状动脉血流储备降低",disease:"X综合征"});
MATCH (d:disease {name:"X综合征"}),(rt:examination {disease:"X综合征"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

//7.5.1 急性心包炎
CREATE (:examination {name:"血清学检查",information:"白细胞计数/中性粒细胞/C反应蛋白/红细胞/免疫指标/肌酐",disease:"急性心包炎"});
CREATE (:examination {name:"心电图",information:"心电图改变",disease:"急性心包炎"});
CREATE (:examination {name:"胸部X线",information:"心包积液情况",disease:"急性心包炎"});
CREATE (:examination {name:"超声心动图",information:"靴型心/肺淤血/肺水肿",disease:"急性心包炎"});
CREATE (:examination {name:"心脏磁共振成像",english_name:"MRI",information:"心包积液的容量和分布情况/心包厚度",disease:"急性心包炎"});
CREATE (:examination {name:"心包穿刺",information:"心脏压塞",disease:"急性心包炎"});
MATCH (d:disease {name:"急性心包炎"}),(rt:examination {disease:"急性心包炎"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

//7.5.2 心包积液
CREATE (:examination {name:"X线检查",information:"心影增大",disease:"心包积液"});
CREATE (:examination {name:"心电图",information:"QRS波/P波/T波/窦性心动过速",disease:"心包积液"});
CREATE (:examination {name:"超声心电图",information:"心包积液定量、定位",disease:"心包积液"});
CREATE (:examination {name:"心脏磁共振成像",information:"心包积液的位置、范围和容量/心包积液的性质/心包膜的增厚/心包腔内肿瘤",disease:"心包积液"});
CREATE (:examination {name:"心包穿刺",information:"心包积液的性质",disease:"心包积液"});
MATCH (d:disease {name:"心包积液"}),(rt:examination {disease:"心包积液"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

//7.5.3 心脏压塞
CREATE (:examination {name:"X线检查",information:"心影增大",disease:"心脏压塞"});
CREATE (:examination {name:"心电图",information:"QRS波/P波/T波/窦性心动过速",disease:"心脏压塞"});
CREATE (:examination {name:"超声心电图",information:"心包积液定量、定位",disease:"心脏压塞"});
CREATE (:examination {name:"心脏磁共振成像",information:"心包积液的位置、范围和容量/心包积液的性质/心包膜的增厚/心包腔内肿瘤",disease:"心脏压塞"});
CREATE (:examination {name:"心包穿刺",information:"心包积液的性质",disease:"心脏压塞"});
MATCH (d:disease {name:"心脏压塞"}),(rt:examination {disease:"心脏压塞"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

//7.5.4 窄缩性心包炎
CREATE (:examination {name:"X线检查",information:"心影增大/心包钙化",disease:"窄缩性心包炎"});
CREATE (:examination {name:"心电图",information:"心动过速/QRS低电压/T波低平或倒置/P波增宽有切迹/心房颤动",disease:"窄缩性心包炎"});
CREATE (:examination {name:"超声心电图",information:"心包增厚粘连/心脏变形/室壁活动减弱减弱/室间隔抖动症/下腔静脉增宽",disease:"窄缩性心包炎"});
CREATE (:examination {name:"心脏CT",information:"心包的受累范围和程度/心包钙化/心包厚度",disease:"窄缩性心包炎"});
CREATE (:examination {name:"心脏MRI",information:"心包的受累范围和程度/心包钙化/心包厚度/心包渗出/心包粘连/心包炎症",disease:"窄缩性心包炎"});
CREATE (:examination {name:"右心导管检查",information:"肺毛细血管压力、肺动脉舒张压力、右心室舒张末期压力、右心房压力和腔静脉压均显著升高且趋于同一水平/右心房压力曲线呈M或W波形/右心室收缩压轻度升高，呈舒张早期下陷及高原形曲线/呼吸时左、右压力曲线变化呈矛盾性//",disease:"窄缩性心包炎"});
CREATE (:examination {name:"心包腔纤维内镜",information:"病因",disease:"窄缩性心包炎"});
MATCH (d:disease {name:"窄缩性心包炎"}),(rt:examination {disease:"窄缩性心包炎"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);


//八、并发症
//8.1.1.2.2 ST段抬高型心肌梗死
CREATE (d:complication {name:"乳头肌功能失调或断裂",disease:"ST段抬高型心肌梗死"});
CREATE (d:complication {name:"心脏破裂",disease:"ST段抬高型心肌梗死"});
CREATE (d:complication {name:"栓塞",disease:"ST段抬高型心肌梗死"});
CREATE (d:complication {name:"心室壁瘤",disease:"ST段抬高型心肌梗死"});
CREATE (d:complication {name:"心肌梗死后综合征",disease:"ST段抬高型心肌梗死"});
MATCH (d1:disease {name:"ST段抬高型心肌梗死"}),(d2:complication {disease:"ST段抬高型心肌梗死"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);

//九、鉴别诊断
//9.1.1.1.1 稳定型心绞痛
CREATE (:differential_diagnosis {name:"急性冠状动脉综合征",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"反流性食管炎",symptom:"疼痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"膈疝",symptom:"疼痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"心脏神经症",symptom:"胸痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"消化性溃疡",symptom:"疼痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"肠道疾病",symptom:"疼痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"颈椎病",symptom:"疼痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"肋间神经痛",symptom:"疼痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"肋软骨炎",symptom:"疼痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"主动脉瓣狭窄",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"主动脉瓣关闭不全",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"风湿性冠脉炎",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"梅毒主动性脉炎引起的冠脉口狭窄或闭塞",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"肥厚型心肌病",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"X综合征",symptom:"心绞痛",disease:"稳定型心绞痛"});
MATCH (d:disease {name:"稳定型心绞痛"}),(dd:differential_diagnosis {disease:"稳定型心绞痛"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.1.1.1.2 隐匿型冠心病
CREATE (:differential_diagnosis {name:"心肌炎",symptom:"缺血性ST-T改变",disease:"隐匿型冠心病"});
CREATE (:differential_diagnosis {name:"心肌病",symptom:"缺血性ST-T改变",disease:"隐匿型冠心病"});
CREATE (:differential_diagnosis {name:"心包疾病",symptom:"缺血性ST-T改变",disease:"隐匿型冠心病"});
CREATE (:differential_diagnosis {name:"电解质失调",symptom:"缺血性ST-T改变",disease:"隐匿型冠心病"});
CREATE (:differential_diagnosis {name:"内分泌疾病",symptom:"缺血性ST-T改变",disease:"隐匿型冠心病"});
CREATE (:differential_diagnosis {name:"药物作用",symptom:"缺血性ST-T改变",disease:"隐匿型冠心病"});
MATCH (d:disease {name:"隐匿型冠心病"}),(dd:differential_diagnosis {disease:"隐匿型冠心病"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.1.1.1.3.1 充血型缺血性心肌病
CREATE (:differential_diagnosis {name:"心肌病",symptom:"心脏增大/心力衰竭",disease:"充血型缺血性心肌病"});
CREATE (:differential_diagnosis {name:"心肌炎",symptom:"心脏增大/心力衰竭",disease:"充血型缺血性心肌病"});
CREATE (:differential_diagnosis {name:"内分泌病性心脏病",symptom:"心脏增大/心力衰竭",disease:"充血型缺血性心肌病"});
MATCH (d:disease {name:"充血型缺血性心肌病"}),(dd:differential_diagnosis {disease:"充血型缺血性心肌病"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.1.1.1.3.1 限制型缺血性心肌病
CREATE (:differential_diagnosis {name:"心肌病",symptom:"心脏增大/心力衰竭",disease:"限制型缺血性心肌病"});
CREATE (:differential_diagnosis {name:"心肌炎",symptom:"心脏增大/心力衰竭",disease:"限制型缺血性心肌病"});
CREATE (:differential_diagnosis {name:"高血压性心脏病",symptom:"心脏增大/心力衰竭",disease:"限制型缺血性心肌病"});
CREATE (:differential_diagnosis {name:"内分泌病性心脏病",symptom:"心脏增大/心力衰竭",disease:"限制型缺血性心肌病"});
MATCH (d:disease {name:"限制型缺血性心肌病"}),(dd:differential_diagnosis {disease:"限制型缺血性心肌病"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.1.1.2.1.1 不稳定型心绞痛
CREATE (:differential_diagnosis {name:"ST段抬高型心肌梗死",symptom:"心绞痛",disease:"不稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"稳定型心绞痛",symptom:"心绞痛",disease:"不稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"反流性食管炎",symptom:"疼痛",disease:"不稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"膈疝",symptom:"疼痛",disease:"不稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"心脏神经症",symptom:"胸痛",disease:"不稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"消化性溃疡",symptom:"疼痛",disease:"不稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"肠道疾病",symptom:"疼痛",disease:"不稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"颈椎病",symptom:"疼痛",disease:"不稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"肋间神经痛",symptom:"疼痛",disease:"不稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"肋软骨炎",symptom:"疼痛",disease:"不稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"主动脉瓣狭窄",symptom:"心绞痛",disease:"不稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"主动脉瓣关闭不全",symptom:"心绞痛",disease:"不稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"风湿性冠脉炎",symptom:"心绞痛",disease:"不稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"梅毒主动性脉炎引起的冠脉口狭窄或闭塞",symptom:"心绞痛",disease:"不稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"肥厚型心肌病",symptom:"心绞痛",disease:"不稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"X综合征",symptom:"心绞痛",disease:"不稳定型心绞痛"});
MATCH (d:disease {name:"不稳定型心绞痛"}),(dd:differential_diagnosis {disease:"不稳定型心绞痛"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.1.1.2.1.2 非ST段抬高型心肌梗死
CREATE (:differential_diagnosis {name:"反流性食管炎",symptom:"疼痛",disease:"非ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"膈疝",symptom:"疼痛",disease:"非ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"心脏神经症",symptom:"胸痛",disease:"非ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"消化性溃疡",symptom:"疼痛",disease:"非ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"肠道疾病",symptom:"疼痛",disease:"非ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"颈椎病",symptom:"疼痛",disease:"非ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"肋间神经痛",symptom:"疼痛",disease:"非ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"肋软骨炎",symptom:"疼痛",disease:"非ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"主动脉瓣狭窄",symptom:"心绞痛",disease:"非ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"主动脉瓣关闭不全",symptom:"心绞痛",disease:"非ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"风湿性冠脉炎",symptom:"心绞痛",disease:"非ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"梅毒主动性脉炎引起的冠脉口狭窄或闭塞",symptom:"心绞痛",disease:"非ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"肥厚型心肌病",symptom:"心绞痛",disease:"非ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"X综合征",symptom:"心绞痛",disease:"非ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"ST段抬高型心肌梗死",symptom:"心绞痛",disease:"非ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"稳定型心绞痛",symptom:"心绞痛",disease:"非ST段抬高型心肌梗死"});
MATCH (d:disease {name:"非ST段抬高型心肌梗死"}),(dd:differential_diagnosis {disease:"非ST段抬高型心肌梗死"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.1.1.2.2 ST段抬高型心肌梗死
CREATE (:differential_diagnosis {name:"心绞痛",symptom:"心绞痛",disease:"ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"主动脉夹层",symptom:"胸痛",disease:"ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"急性肺动脉栓塞",symptom:"胸痛/咯血/呼吸困难/休克",disease:"ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"急性胰腺炎",symptom:"上腹部疼痛",disease:"ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"消化性溃疡穿孔",symptom:"上腹部疼痛",disease:"ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"急性胆囊炎",symptom:"上腹部疼痛",disease:"ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"胆石症",symptom:"上腹部疼痛",disease:"ST段抬高型心肌梗死"});
CREATE (:differential_diagnosis {name:"急性心包炎",symptom:"心前区疼痛",disease:"ST段抬高型心肌梗死"});
MATCH (d:disease {name:"ST段抬高型心肌梗死"}),(dd:differential_diagnosis {disease:"ST段抬高型心肌梗死"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);

//9.5.1 急性心包炎
CREATE (:differential_diagnosis {name:"急性心肌梗死",symptom:"胸痛伴心电图ST段抬高",disease:"急性心包炎"});
CREATE (:differential_diagnosis {name:"主动脉夹层动脉瘤破裂",symptom:"高血压史、胸痛",disease:"急性心包炎"});
CREATE (:differential_diagnosis {name:"肺栓塞",symptom:"胸痛/胸闷/晕厥",disease:"急性心包炎"});
MATCH (d:disease {name:"急性心包炎"}),(dd:differential_diagnosis {disease:"急性心包炎"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.5.2 心包积液
CREATE (:differential_diagnosis {name:"心力衰竭",symptom:"呼吸困难",disease:"心包积液"});
CREATE (:differential_diagnosis {name:"冠心病",symptom:"呼吸困难",disease:"心包积液"});
CREATE (:differential_diagnosis {name:"高血压",symptom:"呼吸困难",disease:"心包积液"});
CREATE (:differential_diagnosis {name:"瓣膜病",symptom:"呼吸困难",disease:"心包积液"});
CREATE (:differential_diagnosis {name:"先天性心脏病",symptom:"呼吸困难",disease:"心包积液"});
CREATE (:differential_diagnosis {name:"心肌病",symptom:"呼吸困难",disease:"心包积液"});
MATCH (d:disease {name:"心包积液"}),(dd:differential_diagnosis {disease:"心包积液"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.5.3 心脏压塞
CREATE (:differential_diagnosis {name:"心力衰竭",symptom:"呼吸困难",disease:"心脏压塞"});
CREATE (:differential_diagnosis {name:"冠心病",symptom:"呼吸困难",disease:"心脏压塞"});
CREATE (:differential_diagnosis {name:"高血压",symptom:"呼吸困难",disease:"心脏压塞"});
CREATE (:differential_diagnosis {name:"瓣膜病",symptom:"呼吸困难",disease:"心脏压塞"});
CREATE (:differential_diagnosis {name:"先天性心脏病",symptom:"呼吸困难",disease:"心脏压塞"});
CREATE (:differential_diagnosis {name:"心肌病",symptom:"呼吸困难",disease:"心脏压塞"});
MATCH (d:disease {name:"心脏压塞"}),(dd:differential_diagnosis {disease:"心脏压塞"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);

//9.5.4 窄缩性心包炎
CREATE (:differential_diagnosis {name:"限制型心肌病",symptom:"心脏增大/心力衰竭",disease:"窄缩性心包炎"});
CREATE (:differential_diagnosis {name:"心肌炎",symptom:"心脏增大/心力衰竭",disease:"窄缩性心包炎"});
CREATE (:differential_diagnosis {name:"高血压性心脏病",symptom:"心脏增大/心力衰竭",disease:"窄缩性心包炎"});
CREATE (:differential_diagnosis {name:"内分泌病性心脏病",symptom:"心脏增大/心力衰竭",disease:"窄缩性心包炎"});
CREATE (:differential_diagnosis {name:"肝硬化",symptom:"腹腔积液",disease:"窄缩性心包炎"});
CREATE (:differential_diagnosis {name:"结核性腹膜炎",symptom:"腹腔积液",disease:"窄缩性心包炎"});
MATCH (d:disease {name:"窄缩性心包炎"}),(dd:differential_diagnosis {disease:"窄缩性心包炎"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);

//十、药物治疗及禁用药物
//10.1.1.1.1 稳定型心绞痛
CREATE (:drug {name:"硝酸甘油",dosage:"0.5mg",usage:"舌下含化",disease:"稳定型心绞痛",aim:"缓解心绞痛",indication:"心绞痛发作时",side_effect:"头痛/面色潮红/心律反射性加快/低血压/直立性低血压"});
CREATE (:drug {name:"硝酸异山梨酯",dosage:"5~10mg",usage:"舌下含化/喷雾吸入",disease:"稳定型心绞痛",indication:"心绞痛发作时",aim:"缓解心绞痛",side_effect:"头痛/面色潮红/心律反射性加快/低血压/直立性低血压"});
CREATE (:drug {name:"美托洛尔普通片",dosage:"25~100mg",usage:"口服",frequency:"每日2次",disease:"稳定型心绞痛",aim:"改善缺血，缓解症状",contraindication:"严重心动过缓/高度房室传导阻滞/窦房结功能紊乱/明显的支气管痉挛/明显的支气管哮喘病人/外周血管疾病/严重抑郁",use_with_caution:"慢性肺心病"});
CREATE (:drug {name:"美托洛尔缓释片",dosage:"47.5~190mg",usage:"口服",frequency:"每日1次",disease:"稳定型心绞痛",aim:"改善缺血，缓解症状",contraindication:"严重心动过缓/高度房室传导阻滞/窦房结功能紊乱/明显的支气管痉挛/明显的支气管哮喘病人/外周血管疾病/严重抑郁",use_with_caution:"慢性肺心病"});
CREATE (:drug {name:"比索洛尔",dosage:"5~10mg",usage:"口服",frequency:"每日1次",disease:"稳定型心绞痛",aim:"改善缺血，缓解症状",contraindication:"严重心动过缓/高度房室传导阻滞/窦房结功能紊乱/明显的支气管痉挛/明显的支气管哮喘病人/外周血管疾病/严重抑郁",use_with_caution:"慢性肺心病"});
CREATE (:drug {name:"二硝酸异山梨酯普通片",dosage:"5~20mg",usage:"口服",frequency:"每日3~4次",disease:"稳定型心绞痛",aim:"改善缺血，缓解症状",side_effect:"头痛/面色潮红/心率反射性加快/低血压"});
CREATE (:drug {name:"二硝酸异山梨酯缓释片",dosage:"20~40mg",usage:"口服",frequency:"每日1次",disease:"稳定型心绞痛",aim:"改善缺血，缓解症状",side_effect:"头痛/面色潮红/心率反射性加快/低血压"});
CREATE (:drug {name:"单硝酸异山梨酯缓释片",dosage:"40~60mg",usage:"口服",frequency:"每日1次",disease:"稳定型心绞痛",aim:"改善缺血，缓解症状",side_effect:"头痛/面色潮红/心率反射性加快/低血压"});
CREATE (:drug {name:"单硝酸异山梨酯普通片",dosage:"20mg",usage:"口服",frequency:"每日2次",disease:"稳定型心绞痛",aim:"改善缺血，缓解症状",side_effect:"头痛/面色潮红/心率反射性加快/低血压"});
CREATE (:drug {name:"维拉帕米普通片",dosage:"40~80mg",usage:"口服",frequency:"每日3次",disease:"稳定型心绞痛",aim:"改善缺血，缓解症状",side_effect:"外周水肿/便秘/心悸/面部潮红/头痛/头晕/虚弱无力",contraindication:"左室功能不全/严重心动过缓/高度房室传导阻滞/病态窦房结综合征病人",prohibit_drug:"β受体阻滞剂"});
CREATE (:drug {name:"维拉帕米缓释片",dosage:"240mg",usage:"口服",frequency:"每日1次",disease:"稳定型心绞痛",aim:"改善缺血，缓解症状",side_effect:"外周水肿/便秘/心悸/面部潮红/头痛/头晕/虚弱无力",contraindication:"左室功能不全/严重心动过缓/高度房室传导阻滞/病态窦房结综合征病人",prohibit_drug:"β受体阻滞剂"});
CREATE (:drug {name:"地尔硫䓬普通片",dosage:"30~60mg",usage:"口服",frequency:"每日3次",disease:"稳定型心绞痛",aim:"改善缺血，缓解症状",side_effect:"外周水肿/便秘/心悸/面部潮红/头痛/头晕/虚弱无力",contraindication:"左室功能不全/严重心动过缓/高度房室传导阻滞/病态窦房结综合征病人",prohibit_drug:"β受体阻滞剂"});
CREATE (:drug {name:"地尔硫䓬缓释片",dosage:"90mg",usage:"口服",frequency:"每日1次",disease:"稳定型心绞痛",aim:"改善缺血，缓解症状",side_effect:"外周水肿/便秘/心悸/面部潮红/头痛/头晕/虚弱无力",contraindication:"左室功能不全/严重心动过缓/高度房室传导阻滞/病态窦房结综合征病人",prohibit_drug:"β受体阻滞剂"});
CREATE (:drug {name:"氨氯地平",dosage:"5~10mg",frequency:"每日1次",disease:"稳定型心绞痛",indication:"同时有高血压病人",aim:"改善缺血，缓解症状",side_effect:"外周水肿/便秘/心悸/面部潮红/头痛/头晕/虚弱无力"});
CREATE (:drug {name:"硝苯地平控释片",dosage:"30mg",frequency:"每日1次",disease:"稳定型心绞痛",indication:"同时有高血压病人",aim:"改善缺血，缓解症状",side_effect:"外周水肿/便秘/心悸/面部潮红/头痛/头晕/虚弱无力"});
CREATE (:drug {name:"曲美他嗪",dosage:"20~60mg",frequency:"每日3次",disease:"稳定型心绞痛",indication:"β受体阻滞剂不耐受/钙离子拮抗剂不耐受/钙离子拈抗剂有禁忌/不能控制症状",aim:"改善缺血，缓解症状"});
CREATE (:drug {name:"尼可地尔",dosage:"2mg",frequency:"每日3次",disease:"稳定型心绞痛",indication:"β受体阻滞剂不耐受/钙离子拮抗剂不耐受/钙离子拈抗剂有禁忌/不能控制症状",aim:"改善缺血，缓解症状"});
CREATE (:drug {name:"盐酸伊伐布雷定",disease:"稳定型心绞痛",indication:"β受体阻滞剂不耐受/钙离子拮抗剂不耐受/钙离子拈抗剂有禁忌/不能控制症状",aim:"改善缺血，缓解症状"});
CREATE (:drug {name:"雷诺嗪",disease:"稳定型心绞痛",indication:"β受体阻滞剂不耐受/钙离子拮抗剂不耐受/钙离子拈抗剂有禁忌/不能控制症状",aim:"改善缺血，缓解症状"});
CREATE (:drug {name:"阿司匹林",dosage:"75~150mg/d",disease:"稳定型心绞痛",aim:"预防心肌梗死，改善预后",side_effect:"胃肠道出血/阿司匹林过敏"});
CREATE (:drug {name:"吲哚布芬",dosage:"100mg",frequency:"每日2次",disease:"稳定型心绞痛",indication:"有胃肠道出血或消化道溃疡病史等阿司匹林不耐受病人",aim:"预防心肌梗死，改善预后"});
CREATE (:drug {name:"氯吡格雷",dosage:"75mg",frequency:"每日",disease:"稳定型心绞痛",indication:"支架植入以后/阿司匹林有禁忌症病人",aim:"预防心肌梗死，改善预后"});
CREATE (:drug {name:"替格瑞洛",disease:"稳定型心绞痛",aim:"预防心肌梗死，改善预后"});
CREATE (:drug {name:"辛伐他汀",dosage:"20~40mg",frequency:"每晚1次",disease:"稳定型心绞痛",aim:"降低LDL-C",side_effect:"肝脏损害/肌病"});
CREATE (:drug {name:"阿托伐他汀",dosage:"10~80mg",frequency:"每日1次",disease:"稳定型心绞痛",aim:"降低LDL-C",side_effect:"肝脏损害/肌病"});
CREATE (:drug {name:"普伐他汀",dosage:"20~40mg",frequency:"每晚1次",disease:"稳定型心绞痛",aim:"降低LDL-C",side_effect:"肝脏损害/肌病"});
CREATE (:drug {name:"氟伐他汀",dosage:"40~80mg",frequency:"每晚1次",disease:"稳定型心绞痛",aim:"降低LDL-C",side_effect:"肝脏损害/肌病"});
CREATE (:drug {name:"瑞舒伐他汀",dosage:"40~80mg",frequency:"每晚1次",disease:"稳定型心绞痛",aim:"降低LDL-C",side_effect:"肝脏损害/肌病"});
CREATE (:drug {name:"依折麦布",disease:"稳定型心绞痛",indication:"单独应用他汀类药物胆固醇水平不能达标/不能耐受较大剂量他汀治疗的病人",aim:"降低LDL-C",side_effect:"肝脏损害/肌病"});
CREATE (:drug {name:"PCSK9抑制剂",disease:"稳定型心绞痛",indication:"杂合子家族性高胆固醇血症/临床动脉粥样硬化性心血管疾病病人，在控制饮食和最大耐受剂量他汀治疗下仍需进一步降低LDL-C的病人",aim:"降低LDL-C",side_effect:"肝脏损害/肌病"});
CREATE (:drug {name:"卡托普利",dosage:"12.5~50mg",frequency:"每日3次",disease:"稳定型心绞痛",aim:"降低LDL-C"});
CREATE (:drug {name:"依那普利",dosage:"5~10mg",frequency:"每日2次",disease:"稳定型心绞痛",aim:"降低LDL-C"});
CREATE (:drug {name:"培哚普利",dosage:"4~8mg",frequency:"每日1次",disease:"稳定型心绞痛",aim:"降低LDL-C"});
CREATE (:drug {name:"雷米普利",dosage:"5~10mg",frequency:"每日1次",disease:"稳定型心绞痛",aim:"降低LDL-C"});
CREATE (:drug {name:"贝那普利",dosage:"10~20mg",frequency:"每日1次",disease:"稳定型心绞痛",aim:"降低LDL-C"});
CREATE (:drug {name:"赖诺普利",dosage:"10~20mg",frequency:"每日1次",disease:"稳定型心绞痛",aim:"降低LDL-C"});
CREATE (:drug {name:"ARB类药物",disease:"稳定型心绞痛",indication:"不能耐受ACEI类药物者",aim:"降低LDL-C"});
CREATE (:drug {name:"β受体拮抗剂",disease:"稳定型心绞痛",indication:"心肌梗死后的稳定型心绞痛病人",aim:"降低LDL-C"});
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {disease:"稳定型心绞痛"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.1.1.1.2 隐匿型冠心病
CREATE (:drug {name:"阿司匹林",disease:"隐匿型冠心病",indication:"有MI既往史"});
CREATE (:drug {name:"β受体阻滞剂",disease:"隐匿型冠心病",indication:"有MI既往史"});
CREATE (:drug {name:"他汀类药物",disease:"隐匿型冠心病",indication:"确诊CAD/2型糖尿病者",aim:"降脂治疗"});
CREATE (:drug {name:"ACEI",disease:"隐匿型冠心病",indication:"伴糖尿病和（或）心脏收缩功能障碍的CAD病人"});
MATCH (ds:disease {name:"隐匿型冠心病"}),(dg:drug {disease:"隐匿型冠心病"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.1.1.2.1.1 不稳定型心绞痛
CREATE (:drug {name:"硝酸甘油",usage:"舌下含服",dosage:"0.5mg",frequency:"连用3次",indication:"心绞痛发作",side_effect:"头痛/低血压",aim:"抗心肌缺血",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"硝酸甘油",usage:"静脉应用",dosage:"5~10µg/min",indication:"心绞痛发作",aim:"抗心肌缺血",side_effect:"头痛/低血压",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"硝酸异山梨酯",usage:"口服",side_effect:"头痛/低血压",aim:"抗心肌缺血",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"5-单硝酸异山梨酯",usage:"口服",aim:"抗心肌缺血",side_effect:"头痛/低血压",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"美托洛尔",aim:"抗心肌缺血",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"比索洛尔",aim:"抗心肌缺血",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"钙通道阻滞剂",aim:"抗心肌缺血",indication:"血管痉挛性心绞痛病人/β受体拈抗剂与硝酸酕类药物治疗后仍不能控制缺血症状的病人",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"阿司匹林",dosage:"150~300mg",aim:"抗血小板治疗",frequency:"首次应用",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"吲哚布芬",indication:"阿司匹林不耐受",aim:"抗血小板治疗",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"氯吡格雷",dosage:"300~600mg",aim:"抗血小板治疗",frequency:"首次应用",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"替格瑞洛",dosage:"180mg",aim:"抗血小板治疗",frequency:"首次应用",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"阿昔单抗",aim:"抗血小板治疗",indication:"接受PCI的UA/NSTEMI病人/和选用保守治疗策略的中高危UA/NSTEMI病人",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"替罗非班",aim:"抗血小板治疗",indication:"接受PCI的UA/NSTEMI病人/和选用保守治疗策略的中高危UA/NSTEMI病人",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"依替非巴肽",aim:"抗血小板治疗",indication:"接受PCI的UA/NSTEMI病人/和选用保守治疗策略的中高危UA/NSTEMI病人",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"西洛他唑",aim:"抗血小板治疗",indication:"阿司匹林不耐受病人的替代治疗",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"双嘧达莫",aim:"抗血小板治疗",side_effect:"冠状动脉窃血，加重心肌缺血",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"普通肝素",aim:"抗凝治疗",usage:"静脉注射",dosage:"80~85U/kg",side_effect:"血小板减少症",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"依诺肝素",aim:"抗凝治疗",side_effect:"血小板减少症",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"达肝素",aim:"抗凝治疗",side_effect:"血小板减少症",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"那曲肝素",aim:"抗凝治疗",side_effect:"血小板减少症",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"磺达肝葵钠",usage:"皮下注射",dosage:"2.5mg",frequency:"每日一次",aim:"抗凝治疗",indication:"采用保守策略的病人出血风险增加",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"比伐卢定",usage:"静脉滴注",dosage:"0.75mg/kg",aim:"抗凝治疗",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"他汀类药物",aim:"调脂治疗",side_effect:"肝酶升高/肌酶升高",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"ACEI",aim:"降低心血管事件发生率",indication:"不存在低血压压（收缩压<100mmHg或较基线下降30mmHg以上）/其他已知的禁忌证（如肾衰竭、双侧肾动脉狭窄和已知的过敏）",disease:"不稳定型心绞痛"});
CREATE (:drug {name:"ARB",aim:"降低心血管事件发生率",indication:"ACEI不耐受",disease:"不稳定型心绞痛"});
MATCH (ds:disease {name:"不稳定型心绞痛"}),(dg:drug {disease:"不稳定型心绞痛"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.1.1.2.1 非ST段抬高型心肌梗死
CREATE (:drug {name:"硝酸甘油",usage:"舌下含服",dosage:"0.5mg",frequency:"连用3次",indication:"心绞痛发作",side_effect:"头痛/低血压",aim:"抗心肌缺血",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"硝酸甘油",usage:"静脉应用",dosage:"5~10µg/min",indication:"心绞痛发作",aim:"抗心肌缺血",side_effect:"头痛/低血压",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"硝酸异山梨酯",usage:"口服",side_effect:"头痛/低血压",aim:"抗心肌缺血",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"5-单硝酸异山梨酯",usage:"口服",aim:"抗心肌缺血",side_effect:"头痛/低血压",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"美托洛尔",aim:"抗心肌缺血",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"比索洛尔",aim:"抗心肌缺血",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"钙通道阻滞剂",aim:"抗心肌缺血",indication:"血管痉挛性心绞痛病人/β受体拈抗剂与硝酸酕类药物治疗后仍不能控制缺血症状的病人",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"阿司匹林",dosage:"150~300mg",aim:"抗血小板治疗",frequency:"首次应用",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"吲哚布芬",indication:"阿司匹林不耐受",aim:"抗血小板治疗",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"氯吡格雷",dosage:"300~600mg",aim:"抗血小板治疗",frequency:"首次应用",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"替格瑞洛",dosage:"180mg",aim:"抗血小板治疗",frequency:"首次应用",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"阿昔单抗",aim:"抗血小板治疗",indication:"接受PCI的UA/NSTEMI病人/和选用保守治疗策略的中高危UA/NSTEMI病人",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"替罗非班",aim:"抗血小板治疗",indication:"接受PCI的UA/NSTEMI病人/和选用保守治疗策略的中高危UA/NSTEMI病人",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"依替非巴肽",aim:"抗血小板治疗",indication:"接受PCI的UA/NSTEMI病人/和选用保守治疗策略的中高危UA/NSTEMI病人",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"西洛他唑",aim:"抗血小板治疗",indication:"阿司匹林不耐受病人的替代治疗",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"双嘧达莫",aim:"抗血小板治疗",side_effect:"冠状动脉窃血，加重心肌缺血",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"普通肝素",aim:"抗凝治疗",usage:"静脉注射",dosage:"80~85U/kg",side_effect:"血小板减少症",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"依诺肝素",aim:"抗凝治疗",side_effect:"血小板减少症",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"达肝素",aim:"抗凝治疗",side_effect:"血小板减少症",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"那曲肝素",aim:"抗凝治疗",side_effect:"血小板减少症",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"磺达肝葵钠",usage:"皮下注射",dosage:"2.5mg",frequency:"每日一次",aim:"抗凝治疗",indication:"采用保守策略的病人出血风险增加",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"比伐卢定",usage:"静脉滴注",dosage:"0.75mg/kg",aim:"抗凝治疗",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"他汀类药物",aim:"调脂治疗",side_effect:"肝酶升高/肌酶升高",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"ACEI",aim:"降低心血管事件发生率",indication:"不存在低血压压（收缩压<100mmHg或较基线下降30mmHg以上）/其他已知的禁忌证（如肾衰竭、双侧肾动脉狭窄和已知的过敏）",disease:"非ST段抬高型心肌梗死"});
CREATE (:drug {name:"ARB",aim:"降低心血管事件发生率",indication:"ACEI不耐受",disease:"非ST段抬高型心肌梗死"});
MATCH (ds:disease {name:"非ST段抬高型心肌梗死"}),(dg:drug {disease:"非ST段抬高型心肌梗死"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.1.1.2.2 ST段抬高型心肌梗死
CREATE (:drug {name:"吗啡",dosage:"2~4mg",usage:"肌内注射",aim:"解除疼痛",side_effect:"低血压/呼吸功能抑制",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"哌替啶",dosage:"50~100mg",usage:"肌内注射",aim:"解除疼痛",side_effect:"低血压/呼吸功能抑制",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"硝酸酯类药物",aim:"解除疼痛",contraindication:"下壁MI/可疑右壁MI/明显低血压（收缩压低于90mmHg）",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"阿替洛尔",usage:"口服",aim:"解除疼痛",contraindication:"心力衰竭/低心输出量状态/心源性休克危险性增高/PR间期>0.24秒/二度房室传导阻滞/三度房室传导阻滞/哮喘发作期/反应性气道疾病",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"美托洛尔",usage:"口服",aim:"解除疼痛",contraindication:"心力衰竭/低心输出量状态/心源性休克危险性增高/PR间期>0.24秒/二度房室传导阻滞/三度房室传导阻滞/哮喘发作期/反应性气道疾病",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"比索洛尔",usage:"口服",aim:"解除疼痛",contraindication:"心力衰竭/低心输出量状态/心源性休克危险性增高/PR间期>0.24秒/二度房室传导阻滞/三度房室传导阻滞/哮喘发作期/反应性气道疾病",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"美托洛尔",usage:"静脉推注",dosage:"5mg",aim:"解除疼痛",indication:"病人有剧烈的缺血性胸痛或伴血压显著升高窃其他处理未能缓解",contraindication:"心力衰竭/低心输出量状态/心源性休克危险性增高/PR间期>0.24秒/二度房室传导阻滞/三度房室传导阻滞/哮喘发作期/反应性气道疾病",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"艾司洛尔",usage:"静脉注射",dosage:"250µg/（kg·min）",indication:"有β体桔抗剂相对禁忌证而又希望减慢心率的病人",aim:"解除疼痛",indication:"病人有剧烈的缺血性胸痛或伴血压显著升高窃其他处理未能缓解",contraindication:"心力衰竭/低心输出量状态/心源性休克危险性增高/PR间期>0.24秒/二度房室传导阻滞/三度房室传导阻滞/哮喘发作期/反应性气道疾病",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"阿司匹林",aim:"抗血小板治疗",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"P2Y12受体桔抗剂",aim:"抗血小板治疗",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"GPⅡb/Ⅲa受体拈抗剂",indication:"接受直接PCI的病人，术中使用",aim:"抗血小板治疗",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"阿昔单抗",aim:"抗血小板治疗",indication:"接受PCI的UA/NSTEMI病人/和选用保守治疗策略的中高危UA/NSTEMI病人",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"替罗非班",aim:"抗血小板治疗",indication:"接受PCI的UA/NSTEMI病人/和选用保守治疗策略的中高危UA/NSTEMI病人",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"依替非巴肽",aim:"抗血小板治疗",indication:"接受PCI的UA/NSTEMI病人/和选用保守治疗策略的中高危UA/NSTEMI病人",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"西洛他唑",aim:"抗血小板治疗",indication:"阿司匹林不耐受病人的替代治疗",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"双嘧达莫",aim:"抗血小板治疗",side_effect:"冠状动脉窃血，加重心肌缺血",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"磺达肝葵钠",aim:"抗凝治疗",usage:"静脉注射",dosage:"2.5mg",indication:"接受溶栓或不计划行再灌注治疗的病人",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"普通肝素",aim:"抗凝治疗",indication:"STEMI直接PCI",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"比伐卢定",aim:"抗凝治疗",usage:"静脉推注",dosage:"0.75mg/kg",indication:"直接PCI尤其出血风险高病人",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"华法林",aim:"抗凝治疗",indication:"STEMI合并心室内血栓/STMEI合并心房颤动",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"ACEI",aim:"改善恢复期心肌的重构，减少AMI的病死率和充血性心力衰竭的发生",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"ARB",aim:"改善恢复期心肌的重构，减少AMI的病死率和充血性心力衰竭的发生",indication:"ACEI不耐受",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"他汀类药物",aim:"调脂治疗",side_effect:"肝酶升高/肌酶升高",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"利多卡因",dosage:"50~100mg",usage:"静脉注射",aim:"抗心律失常和传导障碍治疗",indication:"室性期前收缩/室速",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"胺碘酮",aim:"抗心律失常和传导障碍治疗",indication:"室性心律失常反复",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"阿托品",dosage:"0.5~1mg",usage:"肌内或静脉注射",aim:"抗心律失常和传导障碍治疗",indication:"缓慢型心律失常",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"维拉帕米",aim:"抗心律失常和传导障碍治疗",indication:"室上性快速心律失常",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"地尔硫䓬",aim:"抗心律失常和传导障碍治疗",indication:"室上性快速心律失常",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"美托洛尔",aim:"抗心律失常和传导障碍治疗",indication:"室上性快速心律失常",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"洋地黄制剂",aim:"抗心律失常和传导障碍治疗",indication:"室上性快速心律失常",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"胺碘酮",aim:"抗心律失常和传导障碍治疗",indication:"室上性快速心律失常",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"右旋糖酐40",usage:"静脉滴注",aim:"抗休克治疗",indication:"血容量不足/中心静脉压低/肺动脉楔压低",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"5%~10%葡萄糖液",usage:"静脉滴注",aim:"抗休克治疗",indication:"血容量不足/中心静脉压低/肺动脉楔压低",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"多巴胺",usage:"静脉滴注",dosage:"3~5µg/（kg·min）",aim:"抗休克治疗",indication:"补充血容量后血压仍不升，而PCWP和CI正常",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"去甲肾上腺素",usage:"静脉滴注",dosage:"2~8µg/（kg·min）",aim:"抗休克治疗",indication:"补充血容量后血压仍不升，而PCWP和CI正常",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"多巴酚丁胺",usage:"静脉滴注",dosage:"3~10µg/（kg·min）",aim:"抗休克治疗",indication:"补充血容量后血压仍不升，而PCWP和CI正常",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"硝普钠",usage:"静脉滴注",dosage:"15µg/（kg·min）",aim:"抗休克治疗",indication:"补充血容量后血压仍不升，而PCWP增高和CI低/周围血管显著收缩以致四肢厥冷并有发绀",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"硝酸甘油",usage:"静脉滴注",dosage:"10~20µg/（kg·min）",aim:"抗休克治疗",indication:"补充血容量后血压仍不升，而PCWP增高和CI低/周围血管显著收缩以致四肢厥冷并有发绀",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"洋地黄制剂",aim:"抗休克治疗",disease:"ST段抬高型心肌梗死"});
MATCH (ds:disease {name:"ST段抬高型心肌梗死"}),(dg:drug {disease:"ST段抬高型心肌梗死"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.1.2 冠状动脉痉挛
CREATE (:drug {name:"钙通道阻滞剂",disease:"冠状动脉痉挛"});
CREATE (:drug {name:"硝酸酯类药物",disease:"冠状动脉痉挛"});
CREATE (:drug {name:"β受体拮抗剂",disease:"冠状动脉痉挛",indication:"伴有固定狭窄的病人",side_effect:"加重或诱发痉挛"});
MATCH (ds:disease {name:"冠状动脉痉挛"}),(dg:drug {disease:"冠状动脉痉挛"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.1.3 心肌桥
CREATE (:drug {name:"β受体拮抗剂",disease:"心肌桥",aim:"降低心肌收缩力"});
CREATE (:drug {name:"钙通道阻滞剂",disease:"心肌桥",aim:"降低心肌收缩力"});
MATCH (ds:disease {name:"心肌桥"}),(dg:drug {disease:"心肌桥"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
CREATE (:drug {name:"硝酸酯类药物",prohibit_disease:"心肌桥"});
CREATE (:drug {name:"正性肌力药物",prohibit_disease:"心肌桥"});
MATCH (ds:disease {name:"心肌桥"}),(dg:drug {prohib_disease:"心肌桥"}) CREATE (ds)-[:disease_prohibit_drug {reference:"内科学第九版"}]->(dg);

//10.1.4 X综合征
CREATE (:drug {name:"β受体拮抗剂",disease:"X综合征"});
CREATE (:drug {name:"硝酸酣类药物",disease:"X综合征"});
CREATE (:drug {name:"钙通道阻滞剂",disease:"X综合征"});
CREATE (:drug {name:"曲美他嗪",disease:"X综合征"});
CREATE (:drug {name:"ACEI类药物",disease:"X综合征",aim:"改善内皮功能"});
CREATE (:drug {name:"他汀类药物",disease:"X综合征",aim:"改善内皮功能"});
MATCH (ds:disease {name:"X综合征"}),(dg:drug {disease:"X综合征"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);

//11.5.1 急性心包炎
CREATE (:drug {name:"阿司匹林",dosage:"2~4g/d",indication:"疼痛",aim:"缓解疼痛",disease:"急性心包炎"});
CREATE (:drug {name:"布洛芬",dosage:"400~600mg",frequency:"一日3次",indication:"疼痛、阿司匹林效果不佳",aim:"缓解疼痛",disease:"急性心包炎"});
CREATE (:drug {name:"吲哚美辛",dosage:"20~50mg",frequency:"一日3次",indication:"疼痛、阿司匹林效果不佳",aim:"缓解疼痛",disease:"急性心包炎"});
CREATE (:drug {name:"秋水仙",dosage:"0.6mg",frequency:"一日2次",indication:"疼痛、阿司匹林效果不佳",aim:"缓解疼痛",disease:"急性心包炎"});
CREATE (:drug {name:"吗啡",disease:"急性心包炎"});
CREATE (:drug {name:"泼尼松",dosage:"40~80mg/d",disease:"急性心包炎"});
MATCH (ds:disease {name:"急性心包炎"}),(dg:drug {disease:"急性心包炎"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);



//十一、非药物治疗
//11.1.1.1.1 稳定型心绞痛
CREATE (:treatment {name:"立刻休息",indication:"心绞痛发作时",disease:"稳定型心绞痛"});
CREATE (:treatment {name:"一次进食不应过饱",disease:"稳定型心绞痛"});
CREATE (:treatment {name:"清淡饮食",disease:"稳定型心绞痛"});
CREATE (:treatment {name:"戒烟",disease:"稳定型心绞痛"});
CREATE (:treatment {name:"戒酒",disease:"稳定型心绞痛"});
CREATE (:treatment {name:"调整日常生活与工作量",disease:"稳定型心绞痛"});
CREATE (:treatment {name:"保持适当体力劳动",disease:"稳定型心绞痛"});
CREATE (:treatment {name:"经皮冠状动脉介入治疗",english_name:"PCI",disease:"稳定型心绞痛"});
CREATE (:treatment {name:"冠状动脉旁路移植术",english_name:"CABG",disease:"稳定型心绞痛"});
MATCH (d:disease {name:"稳定型心绞痛"}),(t:treatment {disease:"稳定型心绞痛"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.1.1.1.3 缺血性心肌病
CREATE (:treatment {name:"控制冠心病危险因素",disease:"缺血性心肌病"});
CREATE (:treatment {name:"改善心肌缺血",disease:"缺血性心肌病"});
CREATE (:treatment {name:"纠正心律失常",disease:"缺血性心肌病"});
CREATE (:treatment {name:"积极治疗心功能不全",disease:"缺血性心肌病"});
CREATE (:treatment {name:"经皮冠状动脉介入治疗",english_name:"PCI",disease:"缺血性心肌病",aim:"改善心肌功能"});
CREATE (:treatment {name:"冠状动脉旁路移植术",english_name:"CABG",disease:"缺血性心肌病",aim:"改善心肌功能"});
CREATE (:treatment {name:"自体骨髓干细胞移植",disease:"缺血性心肌病"});
CREATE (:treatment {name:"血管内皮生长因子基因治疗",disease:"缺血性心肌病"});
MATCH (d:disease {name:"缺血性心肌病"}),(t:treatment {disease:"缺血性心肌病"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.1.1.2.1 非ST段抬高型急性冠脉综合征
CREATE (:treatment {name:"卧床休息",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:treatment {name:"吸氧",indication:"有发组、呼吸困难或其他高危表现病人",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:treatment {name:"监测血氧饱和度（Sa02）",indication:"有发组、呼吸困难或其他高危表现病人",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:treatment {name:"积极处理可能引起心肌耗氧量增加的疾病",indication:"有发组、呼吸困难或其他高危表现病人",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:treatment {name:"经皮冠状动脉介入治疗",english_name:"PCI",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:treatment {name:"冠状动脉旁路移植术",english_name:"CABG",indication:"病变严重/有多支血管病变的症状严重/左心室功弄不全者",disease:"非ST段抬高型急性冠脉综合征"});
MATCH (d:disease {name:"非ST段抬高型急性冠脉综合征"}),(t:treatment {disease:"非ST段抬高型急性冠脉综合征"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.1.1.2.2 ST段抬高型心肌梗死
CREATE (:treatment {name:"卧床休息",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"监测",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"吸氧",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"护理",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"建立静脉通道",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"直接PCI",indication:"症状发作12小时以内并且有持续新发的ST段抬高或新发左束支传导阻滞病人/12小时内病人仍有心肌缺血证据（仍然有胸痛和ECG变化）",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"补救性PCI",indication:"溶栓治疗后仍有明显胸痛，抬高ST段无明显降低者",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"溶栓治疗再通者PCI",disease:"ST段抬高型心肌梗死",indication:"溶栓成功后有指征实施急诊血管造影"});
CREATE (:treatment {name:"溶栓疗法",indication:"预计直接PCI时间大于120分钟",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"紧急冠状动脉旁路移植术",indication:"介入治疗失败或溶栓治疗无效有手术指征者",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"非同步直流电除颤",indication:"室颤/持续多形性室速",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"同步直流电除颤",indication:"单形室速药物疗效不满意/室颤/持续多形性室速",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"临时经静脉心内膜右心室起搏治疗",indication:"房室传导阻滞发展到二度或三度，伴有血流动力学障碍者",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"同步步直流电复律治疗",indication:"室上性快速心律失常药物不能控制",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"纠正酸中毒",indication:"心源性休克",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"避免脑缺血",indication:"心源性休克",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"保护肾功能",indication:"心源性休克",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"主动脉内球囊反搏术",indication:"心源性休克",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"左心室辅助装置辅助循环",indication:"心源性休克",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"选择性冠状动脉造影",indication:"心源性休克",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"介入治疗",indication:"心源性休克",disease:"ST段抬高型心肌梗死"});
CREATE (:treatment {name:"主动脉-冠状动脉旁路移植手术",indication:"心源性休克",disease:"ST段抬高型心肌梗死"});
MATCH (d:disease {name:"ST段抬高型心肌梗死"}),(t:treatment {disease:"ST段抬高型心肌梗死"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.1.2 冠状动脉痉挛
CREATE (:treatment {name:"戒烟",disease:"冠状动脉痉挛"});
CREATE (:treatment {name:"戒酒",disease:"冠状动脉痉挛"});
MATCH (d:disease {name:"冠状动脉痉挛"}),(t:treatment {disease:"冠状动脉痉挛"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.1.3 心肌桥
CREATE (:treatment {name:"手术分离壁冠状动脉",disease:"心肌桥"});
MATCH (d:disease {name:"心肌桥"}),(t:treatment {disease:"心肌桥"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);

//11.5.1 急性心包炎
CREATE (:treatment {name:"卧床休息",disease:"急性心包炎"});
CREATE (:treatment {name:"心包穿刺引流",indication:"心包积液多引起急性心脏压塞",disease:"急性心包炎"});
CREATE (:treatment {name:"外科心包切除术",indication:"顽固性复发性心包炎病程超过2年/心包积液反复穿刺引流无法缓解/激素无法控制/伴严重胸痛",disease:"急性心包炎"});
MATCH (d:disease {name:"急性心包炎"}),(t:treatment {disease:"急性心包炎"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);

//11.5.2 心包积液
CREATE (:treatment {name:"心包穿刺引流",disease:"心包积液"});
CREATE (:treatment {name:"扩容、升压治疗",indication:"伴休克",disease:"心包积液"});
MATCH (d:disease {name:"心包积液"}),(t:treatment {disease:"心包积液"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);

//11.5.2 心脏压塞
CREATE (:treatment {name:"心包穿刺引流",disease:"心脏压塞"});
CREATE (:treatment {name:"扩容、升压治疗",indication:"伴休克",disease:"心脏压塞"});
MATCH (d:disease {name:"心脏压塞"}),(t:treatment {disease:"心脏压塞"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);

//11.5.3 窄缩性心包炎
CREATE (:treatment {name:"心包切除术",indication:"发展为慢性窄缩性心包炎",disease:"窄缩性心包炎"});
CREATE (:treatment {name:"抗炎治疗",indication:"近期诊断且病情稳定的病人，无心源性恶病质、心源性肝硬化、心肌萎缩等并发症",disease:"窄缩性心包炎"});
CREATE (:treatment {name:"抗结核治疗",indication:"结核性心包炎",disease:"窄缩性心包炎"});
MATCH (d:disease {name:"窄缩性心包炎"}),(t:treatment {disease:"窄缩性心包炎"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);

