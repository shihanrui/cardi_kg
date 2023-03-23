MATCH (n) detach delete n;

//一、疾病分类
//1.1 冠状动脉疾病
CREATE (:disease {name:"冠状动脉疾病"});
//1.1.1 冠状动脉粥样硬化性心脏病
CREATE (:disease {name:"冠状动脉粥样硬化性心脏病",abbreviation:"冠心病",synonym:"缺血性心脏病",english_name:"CHD",definition:"指冠状动脉（冠脉）发生粥样硬化引起管腔狭窄或闭，导致心肌缺血缺氧或坏死而引起的心脏病。"});
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
//1.1.1.1.3.2 充血型缺血性心肌病
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

//1.2 心力衰竭
CREATE (:disease {name:"心力衰竭",abbreviation:"心衰",definition:"是各种心脏结构或功能性疾病导致心室充盈和（或）射血功能受损，心排血量不能满足机体组织代谢需要，以肺循环和（或）体循环淤血，器官、组织血液灌注不足为临床表现的一组综合征"});
//1.2.1 急性心力衰竭
CREATE (:disease {name:"急性心力衰竭",english_name:"AHF",definition:"心力衰竭急性发作和（或）加重的一种临床综合征"});
MATCH (dc:disease {name:"心力衰竭"}),(d:disease {name:"急性心力衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.1.1 急性左心衰竭
CREATE (:disease {name:"急性左心衰竭"});
MATCH (dc:disease {name:"急性心力衰竭"}),(d:disease {name:"急性左心衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.1.2 急性右心衰竭
CREATE (:disease {name:"急性右心衰竭"});
MATCH (dc:disease {name:"急性心力衰竭"}),(d:disease {name:"急性右心衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.2 慢性心力衰竭
CREATE (:disease {name:"慢性心力衰竭",english_name:"CHF"});
MATCH (dc:disease {name:"心力衰竭"}),(d:disease {name:"慢性心力衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.2.1 （慢性）左心衰竭
CREATE (:disease {name:"左心衰竭"});
MATCH (dc:disease {name:"慢性心力衰竭"}),(d:disease {name:"左心衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.2.2 （慢性）右心衰竭
CREATE (:disease {name:"右心衰竭"});
MATCH (dc:disease {name:"慢性心力衰竭"}),(d:disease {name:"右心衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.2.3 （慢性）全心衰竭
CREATE (:disease {name:"全心衰竭"});
MATCH (dc:disease {name:"慢性心力衰竭"}),(d:disease {name:"全心衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.3 射血分数降低性心衰
CREATE (:disease {name:"射血分数降低性心衰",enlish_name:"HFrEF",synonym:"收缩性心衰",definition:"LVEF<40%的心衰"});
MATCH (dc:disease {name:"心力衰竭"}),(d:disease {name:"射血分数降低性心衰"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.4 射血分数保留性心衰
CREATE (:disease {name:"射血分数保留性心衰",enlish_name:"HFpEF",synonym:"舒张性心衰",definition:"LVEF≥50%的心衰"});
MATCH (dc:disease {name:"心力衰竭"}),(d:disease {name:"射血分数保留性心衰"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.5 中间范围射血分数心衰
CREATE (:disease {name:"中间范围射血分数心衰",enlish_name:"HFmrEF",definition:"40%≤LVEF<50%的心衰"});
MATCH (dc:disease {name:"心力衰竭"}),(d:disease {name:"中间范围射血分数心衰"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);


//1.3 心脏瓣膜病
CREATE (:disease {name:"心脏瓣膜病",definition:"由多种原因引起的心脏瓣膜狭窄或（和）关闭不全所致的心脏疾病"});
//1.3.1 二尖瓣狭窄
CREATE (:disease {name:"二尖瓣狭窄",english_name:"MS"});
MATCH (dc:disease {name:"心脏瓣膜病"}),(d:disease {name:"二尖瓣狭窄"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.3.2 二尖瓣关闭不全
CREATE (:disease {name:"二尖瓣关闭不全",english_name:"MI/MR"});
MATCH (dc:disease {name:"心脏瓣膜病"}),(d:disease {name:"二尖瓣关闭不全"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.3.2.1 急性二尖瓣关闭不全
CREATE (:disease {name:"急性二尖瓣关闭不全"});
MATCH (dc:disease {name:"二尖瓣关闭不全"}),(d:disease {name:"急性二尖瓣关闭不全"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.3.2.2 慢性二尖瓣关闭不全
CREATE (:disease {name:"慢性二尖瓣关闭不全"});
MATCH (dc:disease {name:"二尖瓣关闭不全"}),(d:disease {name:"慢性二尖瓣关闭不全"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.3.3 主动脉瓣狭窄
CREATE (:disease {name:"主动脉瓣狭窄"});
MATCH (dc:disease {name:"心脏瓣膜病"}),(d:disease {name:"主动脉瓣狭窄"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.3.4 主动脉瓣关闭不全
CREATE (:disease {name:"主动脉瓣关闭不全",english_name:"AI"});
MATCH (dc:disease {name:"心脏瓣膜病"}),(d:disease {name:"主动脉瓣关闭不全"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.3.4.1 急性主动脉瓣关闭不全
CREATE (:disease {name:"急性主动脉瓣关闭不全"});
MATCH (dc:disease {name:"主动脉瓣关闭不全"}),(d:disease {name:"急性主动脉瓣关闭不全"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.3.4.2 慢性主动脉瓣关闭不全
CREATE (:disease {name:"慢性主动脉瓣关闭不全"});
MATCH (dc:disease {name:"主动脉瓣关闭不全"}),(d:disease {name:"慢性主动脉瓣关闭不全"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.3.5 多瓣膜病
CREATE (:disease {name:"多瓣膜病",synonym:"联合瓣膜病",definition:"两个或两个以上瓣膜病变同时存在"});
MATCH (dc:disease {name:"心脏瓣膜病"}),(d:disease {name:"多瓣膜病"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.3.5.1 二尖瓣狭窄伴主动脉瓣关闭不全
CREATE (:disease {name:"二尖瓣狭窄伴主动脉瓣关闭不全"});
MATCH (dc:disease {name:"多瓣膜病"}),(d:disease {name:"二尖瓣狭窄伴主动脉瓣关闭不全"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.3.5.2 二尖瓣狭窄伴主动脉瓣狭窄
CREATE (:disease {name:"二尖瓣狭窄伴主动脉瓣狭窄"});
MATCH (dc:disease {name:"多瓣膜病"}),(d:disease {name:"二尖瓣狭窄伴主动脉瓣狭窄"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.3.5.3 主动脉瓣狭窄伴二尖瓣关闭不全
CREATE (:disease {name:"主动脉瓣狭窄伴二尖瓣关闭不全"});
MATCH (dc:disease {name:"多瓣膜病"}),(d:disease {name:"主动脉瓣狭窄伴二尖瓣关闭不全"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.3.5.4 二尖瓣关闭不全伴主动脉瓣关闭不全
CREATE (:disease {name:"二尖瓣关闭不全伴主动脉瓣关闭不全"});
MATCH (dc:disease {name:"多瓣膜病"}),(d:disease {name:"二尖瓣关闭不全伴主动脉瓣关闭不全"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.3.5.5 二尖瓣狭窄伴三尖瓣和（或）肺动脉瓣关闭不全
CREATE (:disease {name:"二尖瓣狭窄伴三尖瓣和（或）肺动脉瓣关闭不全"});
MATCH (dc:disease {name:"多瓣膜病"}),(d:disease {name:"二尖瓣狭窄伴三尖瓣和（或）肺动脉瓣关闭不全"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.3.6 风湿性心脏病
CREATE (:disease {name:"风湿性心脏病",abbreviation:"风心病",english_name:"RHD",definition:"风湿性炎症导致的瓣膜损害"});
MATCH (dc:disease {name:"心脏瓣膜病"}),(d:disease {name:"风湿性心脏病"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);


//1.4 心律失常
CREATE (:disease {name:"心律失常"});
CREATE (:disease {name:"窦性心律失常"});
CREATE (:disease {name:"房性心律失常"});
CREATE (:disease {name:"房室交界区性心律失常"});
CREATE (:disease {name:"室性心律失常"});
CREATE (:disease {name:"心脏传导阻滞"});
MATCH (dc:disease {name:"心律失常"}),(d:disease {name:"窦性心律失常"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"心律失常"}),(d:disease {name:"房性心律失常"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"心律失常"}),(d:disease {name:"房室交界区性心律失常"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"心律失常"}),(d:disease {name:"室性心律失常"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"心律失常"}),(d:disease {name:"心脏传导阻滞"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);

//1.5 心包疾病
CREATE (:disease {name:"心包疾病",definition:"是由感染、肿瘤、代谢性疾病、尿毒症、自身免疫病、外伤等引起的心包病理性改变"});
CREATE (:disease {name:"急性心包炎"});
CREATE (:disease {name:"心包积液"});
CREATE (:disease {name:"心脏压塞"});
CREATE (:disease {name:"窄缩性心包炎",definition:"是指心脏被致密增厚的纤维化或钙化心包所包围，使心室舒张期充盈受限而产生一系列循环障碍的疾病"});
MATCH (dc:disease {name:"心包疾病"}),(d:disease {name:"急性心包炎"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"心包疾病"}),(d:disease {name:"心包积液"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"心包疾病"}),(d:disease {name:"心脏压塞"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"心包疾病"}),(d:disease {name:"窄缩性心包炎"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);

CREATE (:disease {name:"感染性心内膜炎"});
CREATE (:disease {name:"自体瓣膜心内膜炎"});
CREATE (:disease {name:"人工瓣膜和静脉药瘾者心内膜炎"});
MATCH (dc:disease {name:"感染性心内膜炎"}),(d:disease {name:"自体瓣膜心内膜炎"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"感染性心内膜炎"}),(d:disease {name:"人工瓣膜和静脉药瘾者心内膜炎"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);

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

CREATE (:disease {name:"周围血管病"});
CREATE (:disease {name:"静脉血栓症"});
CREATE (:disease {name:"闭塞性周围动脉粥样硬化"});
MATCH (dc:disease {name:"周围血管病"}),(d:disease {name:"静脉血栓症"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"周围血管病"}),(d:disease {name:"闭塞性周围动脉粥样硬化"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);

CREATE (:disease {name:"心血管神经症"});

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
MATCH (d:disease {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {disease:"冠状动脉粥样硬化性心脏病"}) CREATE (d)<-[:disease_risk_factor {reference:"内科学第九版"}]-(r);
//2.1.1.1.2 隐匿型冠心病
CREATE (:risk_factor {name:"高血压",disease:"隐匿型冠心病"});
CREATE (:risk_factor {name:"糖尿病",disease:"隐匿型冠心病"});
CREATE (:risk_factor {name:"ASCVD风险中危以上",disease:"隐匿型冠心病"});
CREATE (:risk_factor {name:"早发CAD家族史",disease:"隐匿型冠心病"});
MATCH (d:disease {name:"隐匿型冠心病"}),(r:risk_factor {disease:"隐匿型冠心病"}) CREATE (d)<-[:disease_risk_factor {reference:"内科学第九版"}]-(r);

//2.1.2  冠状动脉痉挛
CREATE (:risk_factor {name:"吸烟",disease:"冠状动脉痉挛"});
MATCH (d:disease {name:"冠状动脉痉挛"}),(r:risk_factor {disease:"冠状动脉痉挛"}) CREATE (d)<-[:disease_risk_factor {reference:"内科学第九版"}]-(r);
//2.1.4  X综合征
CREATE (:risk_factor {name:"绝经期前女性",disease:"X综合征"});
MATCH (d:disease {name:"X综合征"}),(r:risk_factor {disease:"X综合征"}) CREATE (d)<-[:disease_risk_factor {reference:"内科学第九版"}]-(r);

//2.2  心力衰竭
CREATE (:risk_factor {name:"年齡>70",disease:"心力衰竭"});
CREATE (:risk_factor {name:"高血压",disease:"心力衰竭"});
CREATE (:risk_factor {name:"冠心病",disease:"心力衰竭"});
CREATE (:risk_factor {name:"代谢综合征",disease:"心力衰竭"});
CREATE (:risk_factor {name:"糖尿病",disease:"心力衰竭"});
CREATE (:risk_factor {name:"应用心脏毒性药物史",disease:"心力衰竭"});
CREATE (:risk_factor {name:"酗酒史",disease:"心力衰竭"});
CREATE (:risk_factor {name:"风湿热史",disease:"心力衰竭"});
CREATE (:risk_factor {name:"既往心肌梗死史",disease:"心力衰竭"});
MATCH (d:disease {name:"心力衰竭"}),(r:risk_factor {disease:"心力衰竭"}) CREATE (d)<-[:disease_risk_factor {reference:"内科学第九版"}]-(r);

//2.3  心脏瓣膜病
CREATE (:risk_factor {name:"年龄40~50岁"});
CREATE (:risk_factor {name:"女性"});
MATCH (d:disease {name:"二尖瓣狭窄"}),(r:risk_factor {name:"年龄40~50岁"}) CREATE (d)<-[:disease_risk_factor {reference:"内科学第九版"}]-(r);
MATCH (d:disease {name:"二尖瓣狭窄"}),(r:risk_factor {name:"女性"}) CREATE (d)<-[:disease_risk_factor {reference:"内科学第九版"}]-(r);

//三、病因
//3.2 心力衰竭
CREATE (:cause {name:"心肌梗死",disease:"心力衰竭"});
CREATE (:cause {name:"慢性心肌缺血",disease:"心力衰竭"});
CREATE (:cause {name:"心肌炎",disease:"心力衰竭"});
CREATE (:cause {name:"扩张型心肌病",disease:"心力衰竭"});
CREATE (:cause {name:"家族性扩张型心肌病",disease:"心力衰竭"});
CREATE (:cause {name:"肥厚型心肌病",disease:"心力衰竭"});
CREATE (:cause {name:"右室心肌病",disease:"心力衰竭"});
CREATE (:cause {name:"心肌致密化不全",disease:"心力衰竭"});
CREATE (:cause {name:"线粒体肌病",disease:"心力衰竭"});
CREATE (:cause {name:"糖尿病",disease:"心力衰竭"});
CREATE (:cause {name:"甲状腺疾病",disease:"心力衰竭"});
CREATE (:cause {name:"心肌淀粉样变性",disease:"心力衰竭"});
CREATE (:cause {name:"结缔组织病",disease:"心力衰竭"});
CREATE (:cause {name:"心脏毒性药物",disease:"心力衰竭"});
CREATE (:cause {name:"高血压",disease:"心力衰竭"});
CREATE (:cause {name:"主动脉瓣狭窄",disease:"心力衰竭"});
CREATE (:cause {name:"肺动脉高压",disease:"心力衰竭"});
CREATE (:cause {name:"肺动脉瓣狭窄",disease:"心力衰竭"});
CREATE (:cause {name:"心脏瓣膜关闭不全",disease:"心力衰竭"});
CREATE (:cause {name:"先天性心血管病",disease:"心力衰竭"});
CREATE (:cause {name:"慢性贫血",disease:"心力衰竭"});
CREATE (:cause {name:"甲状腺功能亢进症",disease:"心力衰竭"});
CREATE (:cause {name:"围生期心肌病",disease:"心力衰竭"});
CREATE (:cause {name:"体循环动静脉瘘",disease:"心力衰竭"});
CREATE (:cause {name:"二尖瓣狭窄",disease:"心力衰竭"});
CREATE (:cause {name:"心脏压塞",disease:"心力衰竭"});
CREATE (:cause {name:"限制性心肌病",disease:"心力衰竭"});
CREATE (:cause {name:"窄缩性心包炎",disease:"心力衰竭"});
MATCH (d:disease {name:"心力衰竭"}),(c:cause {disease:"心力衰竭"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.2.1.1 急性左心衰竭
CREATE (:cause {name:"慢性心衰急性失代偿",disease:"急性左心衰竭"});
CREATE (:cause {name:"急性冠脉综合征",disease:"急性左心衰竭"});
CREATE (:cause {name:"高血压急症",disease:"急性左心衰竭"});
CREATE (:cause {name:"急性心瓣膜功能障碍",disease:"急性左心衰竭"});
CREATE (:cause {name:"急性重症心肌炎",disease:"急性左心衰竭"});
CREATE (:cause {name:"严重心律失常",disease:"急性左心衰竭"});
MATCH (d:disease {name:"急性左心衰竭"}),(c:cause {disease:"急性左心衰竭"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.2.1.1 急性右心衰竭
CREATE (:cause {name:"右心室梗死",disease:"急性右心衰竭"});
CREATE (:cause {name:"急性大面积肺栓塞",disease:"急性右心衰竭"});
CREATE (:cause {name:"右心瓣膜病",disease:"急性右心衰竭"});
MATCH (d:disease {name:"急性右心衰竭"}),(c:cause {disease:"急性右心衰竭"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.2.2 慢性心力衰竭
CREATE (:cause {name:"冠心病",disease:"慢性心力衰竭",comment:"主要病因"});
CREATE (:cause {name:"高血压",disease:"慢性心力衰竭",comment:"主要病因"});
CREATE (:cause {name:"风湿性心脏病",disease:"慢性心力衰竭"});
CREATE (:cause {name:"瓣膜性心脏病",disease:"慢性心力衰竭"});
CREATE (:cause {name:"慢性肺心病",disease:"慢性心力衰竭"});
CREATE (:cause {name:"高原性心脏病",disease:"慢性心力衰竭"});
MATCH (d:disease {name:"慢性心力衰竭"}),(c:cause {disease:"慢性心力衰竭"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//3.3 心脏瓣膜病
CREATE (:cause {name:"炎症",disease:"心脏瓣膜病"});
CREATE (:cause {name:"黏液样变性",disease:"心脏瓣膜病"});
CREATE (:cause {name:"先天性畸形",disease:"心脏瓣膜病"});
CREATE (:cause {name:"缺血性坏死",disease:"心脏瓣膜病"});
CREATE (:cause {name:"创伤",disease:"心脏瓣膜病"});
CREATE (:cause {name:"风湿热",disease:"心脏瓣膜病"});
MATCH (d:disease {name:"心脏瓣膜病"}),(c:cause {disease:"心脏瓣膜病"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.3.1 二尖瓣狭窄
CREATE (:cause {name:"风湿热",disease:"二尖瓣狭窄",comment:"主要病因"});
CREATE (:cause {name:"先天性发育异常",disease:"二尖瓣狭窄"});
CREATE (:cause {name:"瓣环钙化",disease:"二尖瓣狭窄"});
CREATE (:cause {name:"老年性退行性改变",disease:"二尖瓣狭窄"});
CREATE (:cause {name:"风湿关节炎",disease:"二尖瓣狭窄"});
CREATE (:cause {name:"系统性红斑狼疮",disease:"二尖瓣狭窄"});
CREATE (:cause {name:"硬皮病",disease:"二尖瓣狭窄"});
CREATE (:cause {name:"Coxsackie病毒",disease:"二尖瓣狭窄"});
MATCH (d:disease {name:"二尖瓣狭窄"}),(c:cause {disease:"二尖瓣狭窄"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.3.2.1 急性二尖瓣关闭不全
CREATE (:cause {name:"感染性心内膜炎",disease:"急性二尖瓣关闭不全"});
CREATE (:cause {name:"外伤",disease:"急性二尖瓣关闭不全"});
CREATE (:cause {name:"人工瓣瓣周漏",disease:"急性二尖瓣关闭不全"});
CREATE (:cause {name:"原发性腱索断裂",disease:"急性二尖瓣关闭不全"});
CREATE (:cause {name:"继发性腱索断裂",disease:"急性二尖瓣关闭不全"});
CREATE (:cause {name:"感染性心内膜炎或慢性瓣膜病变",disease:"急性二尖瓣关闭不全"});
CREATE (:cause {name:"心肌梗死并发乳头肌功能不全或断裂",disease:"急性二尖瓣关闭不全"});
CREATE (:cause {name:"创伤所致腿索或乳头肌断裂",disease:"急性二尖瓣关闭不全"});
MATCH (d:disease {name:"急性二尖瓣关闭不全"}),(c:cause {disease:"急性二尖瓣关闭不全"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.3.2.2 慢性二尖瓣关闭不全
CREATE (:cause {name:"扩张性心肌病",disease:"慢性二尖瓣关闭不全"});
CREATE (:cause {name:"冠心病",disease:"慢性二尖瓣关闭不全"});
CREATE (:cause {name:"梗阻性肥厚型心肌病",disease:"慢性二尖瓣关闭不全"});
CREATE (:cause {name:"乳头肌功能不全",disease:"慢性二尖瓣关闭不全"});
CREATE (:cause {name:"瓣膜脱垂（腱索或乳头肌过长）",disease:"慢性二尖瓣关闭不全"});
CREATE (:cause {name:"结缔组织病",disease:"慢性二尖瓣关闭不全"});
CREATE (:cause {name:"先天性心脏病",disease:"慢性二尖瓣关闭不全"});
CREATE (:cause {name:"瓣环钙化",disease:"慢性二尖瓣关闭不全"});
CREATE (:cause {name:"瓣叶-瓣环黏液样变性",disease:"慢性二尖瓣关闭不全"});
CREATE (:cause {name:"风湿性损害",disease:"慢性二尖瓣关闭不全"});
MATCH (d:disease {name:"慢性二尖瓣关闭不全"}),(c:cause {disease:"慢性二尖瓣关闭不全"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.3.3 主动脉瓣狭窄
CREATE (:cause {name:"先天性病变",disease:"主动脉瓣狭窄"});
CREATE (:cause {name:"退行性病变",disease:"主动脉瓣狭窄"});
CREATE (:cause {name:"炎症性病变",disease:"主动脉瓣狭窄"});
MATCH (d:disease {name:"主动脉瓣狭窄"}),(c:cause {disease:"主动脉瓣狭窄"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.3.4.1 急性主动脉瓣关闭不全
CREATE (:cause {name:"感染性心内膜炎",disease:"急性主动脉瓣关闭不全"});
CREATE (:cause {name:"人工瓣膜撕裂",disease:"急性主动脉瓣关闭不全"});
CREATE (:cause {name:"胸部创伤致升主动脉根部、瓣叶支持结构和瓣叶破损或瓣叶脱垂",disease:"急性主动脉瓣关闭不全"});
CREATE (:cause {name:"主动脉夹层血肿使主动脉瓣环扩大，瓣叶或瓣环被夹层血肿撕裂",disease:"急性主动脉瓣关闭不全"});
MATCH (d:disease {name:"急性主动脉瓣关闭不全"}),(c:cause {disease:"急性主动脉瓣关闭不全"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.3.4.1 慢性主动脉瓣关闭不全
CREATE (:cause {name:"风湿性心脏病",disease:"慢性主动脉瓣关闭不全"});
CREATE (:cause {name:"风湿性心脏病合并主动脉瓣狭窄",disease:"慢性主动脉瓣关闭不全"});
CREATE (:cause {name:"风湿性心脏病合并二尖瓣病变",disease:"慢性主动脉瓣关闭不全"});
CREATE (:cause {name:"二叶式主动脉瓣穿孔",disease:"慢性主动脉瓣关闭不全"});
CREATE (:cause {name:"主动脉瓣穿孔",disease:"慢性主动脉瓣关闭不全"});
CREATE (:cause {name:"室间隔缺损伴主动脉瓣脱垂",disease:"慢性主动脉瓣关闭不全"});
CREATE (:cause {name:"老年退行性钙化性主动脉瓣狭窄",disease:"慢性主动脉瓣关闭不全"});
CREATE (:cause {name:"主动脉瓣黏液样变性",disease:"慢性主动脉瓣关闭不全"});
CREATE (:cause {name:"Marfan综合征",disease:"慢性主动脉瓣关闭不全"});
CREATE (:cause {name:"梅毒性主动脉炎",disease:"慢性主动脉瓣关闭不全"});
CREATE (:cause {name:"高血压性主动脉环扩张",disease:"慢性主动脉瓣关闭不全"});
CREATE (:cause {name:"特发性升主动脉扩张",disease:"慢性主动脉瓣关闭不全"});
CREATE (:cause {name:"主动脉夹层形成",disease:"慢性主动脉瓣关闭不全"});
CREATE (:cause {name:"强直性脊柱炎",disease:"慢性主动脉瓣关闭不全"});
CREATE (:cause {name:"银屑病性关节炎",disease:"慢性主动脉瓣关闭不全"});
MATCH (d:disease {name:"慢性主动脉瓣关闭不全"}),(c:cause {disease:"慢性主动脉瓣关闭不全"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.3.5 多瓣膜病
CREATE (:cause {name:"风湿性心脏病",disease:"多瓣膜病"});
CREATE (:cause {name:"老年性退行性改变",disease:"多瓣膜病"});
CREATE (:cause {name:"黏液样变性",disease:"多瓣膜病"});
CREATE (:cause {name:"感染性心内膜炎",disease:"多瓣膜病"});
MATCH (d:disease {name:"多瓣膜病"}),(c:cause {disease:"多瓣膜病"}) CREATE (c)<-[:disease_cause {comment:"常见病因",reference:"内科学第九版"}]-(d);

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
//4.1.2
CREATE (:inducement {name:"吸烟",disease:"冠状动脉痉挛"});
CREATE (:inducement {name:"酒精",disease:"冠状动脉痉挛"});
CREATE (:inducement {name:"毒品",disease:"冠状动脉痉挛"});
MATCH (d:disease {name:"冠状动脉痉挛"}),(c:inducement {disease:"冠状动脉痉挛"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);

//4.2 心力衰竭
CREATE (:inducement {name:"呼吸道感染",comment:"常见诱因",disease:"心力衰竭"});
CREATE (:inducement {name:"感染性心内膜炎",disease:"心力衰竭"});
CREATE (:inducement {name:"心房颤动",disease:"心力衰竭"});
CREATE (:inducement {name:"快速型心律失常",disease:"心力衰竭"});
CREATE (:inducement {name:"严重缓慢型心律失常",disease:"心力衰竭"});
CREATE (:inducement {name:"钠盐摄入过多",disease:"心力衰竭"});
CREATE (:inducement {name:"静脉输液过多过快",disease:"心力衰竭"});
CREATE (:inducement {name:"妊娠后期",disease:"心力衰竭"});
CREATE (:inducement {name:"分娩过程",disease:"心力衰竭"});
CREATE (:inducement {name:"暴怒",disease:"心力衰竭"});
CREATE (:inducement {name:"不恰当使用利尿药物",disease:"心力衰竭"});
CREATE (:inducement {name:"不恰当使用降血压药",disease:"心力衰竭"});
CREATE (:inducement {name:"冠心病发生心肌梗死",disease:"心力衰竭"});
CREATE (:inducement {name:"风湿性心瓣膜病出现风湿活动",disease:"心力衰竭"});
CREATE (:inducement {name:"原有心脏病合并甲状腺功能亢进",disease:"心力衰竭"});
CREATE (:inducement {name:"原有心脏病合并贫血",disease:"心力衰竭"});
MATCH (d:disease {name:"心力衰竭"}),(c:inducement {disease:"心力衰竭"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);


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
CREATE (:symptom {characteristic:"坏死区或缺血心室壁运动异常",occur_with:"陈旧性心肌梗死者/严重心肌缺血",examination:"超声心动图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"心肌梗死后瘢痕部位灌注缺损",examination:"核素心肌显像",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"运动负荷可见灌注缺损心肌缺血区",examination:"核素心肌显像",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"冠脉管腔直径减少>70%",examination:"冠状动脉造影",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"冠状动脉狭窄病变",examination:"多层螺旋CT冠状动脉成像",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"冠状动脉管壁钙化",examination:"多层螺旋CT冠状动脉成像",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"心电图正常",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"陈旧性心肌梗死的改变",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"非特异性ST段",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"T波异常",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"房室传导阻滞",status:"静息",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"束支传导阻滞",status:"静息",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"室性期前收缩",status:"静息",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"房性期前收缩",status:"静息",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"心律失常",status:"静息",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"ST段移位",status:"心绞痛发作时",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"T波倒置",status:"心绞痛发作时",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"T波假性正常化",status:"心绞痛发作时",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"运动试验阳性",examination:"心电图",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"ST-T改变",examination:"心电图连续动态监测",disease:"稳定型心绞痛"});
CREATE (:symptom {characteristic:"各种心律失常",examination:"心电图连续动态监测",disease:"稳定型心绞痛"});
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {disease:"稳定型心绞痛"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.1.1.1.2 隐匿型冠心病
CREATE (:symptom {characteristic:"有心肌缺血的客观证据，但无心绞痛症状",disease:"隐匿型冠心病"});
CREATE (:symptom {characteristic:"曾有过心肌梗死史，现有心肌缺血客观证据，但无症状",disease:"隐匿型冠心病"});
CREATE (:symptom {characteristic:"有心肌缺血发作，有时有症状，有时无症状",disease:"隐匿型冠心病"});
CREATE (:symptom {characteristic:"心肌缺血",status:"静息/负荷",examination:"心电图",disease:"隐匿型冠心病"});
CREATE (:symptom {characteristic:"心肌缺血",examination:"心电图连续动态监测",disease:"隐匿型冠心病"});
MATCH (d:disease {name:"隐匿型冠心病"}),(s:symptom {disease:"隐匿型冠心病"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.1.1.1.3.1 充血型缺血性冠心病
CREATE (:symptom {characteristic:"心绞痛",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"明确的冠心病史",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"1次以上心肌梗死病史",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"无症状性心肌缺血",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"胸闷",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"乏力",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"眩晕",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"呼吸困难",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"心力衰竭",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"劳力性呼吸困难",occur_with:"左心室功能不全",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"端坐呼吸",occur_with:"左心室功能不全",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"夜间阵发性呼吸困难",occur_with:"左心室功能不全",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"疲乏",occur_with:"左心室功能不全",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"虚弱",occur_with:"左心室功能不全",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"第一心音减弱",occur_with:"左心室功能不全",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"舒张中晚期奔马律",occur_with:"左心室功能不全",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"两肺底散在湿啰音",occur_with:"左心室功能不全",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"食欲缺乏",occur_with:"合并有右心室功能衰竭",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"周围性水肿",occur_with:"合并有右心室功能衰竭",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"右上腹闷胀感",occur_with:"合并有右心室功能衰竭",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"颈静脉充盈或怒张",occur_with:"合并有右心室功能衰竭",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"心界扩大",occur_with:"合并有右心室功能衰竭",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"肝大",occur_with:"合并有右心室功能衰竭",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"肝压痛",occur_with:"合并有右心室功能衰竭",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"肝颈静脉回流征阳性",occur_with:"合并有右心室功能衰竭",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"心律失常",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"室性期前收缩",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"心房颤动",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"束支传导阻滞",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"血栓和栓塞",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"冠脉显著狭窄",examination:"冠状动脉造影",disease:"充血性缺血型冠心病"});
CREATE (:symptom {characteristic:"冠脉显著狭窄",examination:"冠脉CTA",disease:"充血性缺血型冠心病"});
MATCH (d:disease {name:"充血性缺血型冠心病"}),(s:symptom {disease:"充血性缺血型冠心病"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.1.1.1.3.2 限制型缺血性冠心病
CREATE (:symptom {characteristic:"限制型心肌病体征",disease:"限制型缺血性冠心病"});
CREATE (:symptom {characteristic:"心绞痛",disease:"限制型缺血性冠心病"});
CREATE (:symptom {characteristic:"劳力性呼吸困难",disease:"限制型缺血性冠心病"});
CREATE (:symptom {characteristic:"活动受限",disease:"限制型缺血性冠心病"});
CREATE (:symptom {characteristic:"心脏明显过大",disease:"限制型缺血性冠心病"});
CREATE (:symptom {characteristic:"冠脉显著狭窄",examination:"冠状动脉造影",disease:"限制型缺血性冠心病"});
CREATE (:symptom {characteristic:"冠脉显著狭窄",examination:"冠脉CTA",disease:"限制型缺血性冠心病"});
CREATE (:symptom {characteristic:"心肌坏死",examination:"心电图",disease:"限制型缺血性冠心病"});
CREATE (:symptom {characteristic:"Q波形成",examination:"心电图",disease:"限制型缺血性冠心病"});
CREATE (:symptom {characteristic:"室壁运动减弱或消失征象",examination:"心脏超声",disease:"限制型缺血性冠心病"});
MATCH (d:disease {name:"限制型缺血性冠心病"}),(s:symptom {disease:"限制型缺血性冠心病"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
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
CREATE (:symptom {characteristic:"一过性ST段抬高或压低",status:"胸痛发作时",examination:"心电图",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"T波低平或倒置",status:"胸痛发作时",examination:"心电图",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"ST段动态改变",status:"胸痛发作时",examination:"心电图",disease:"不稳定型心绞痛"});
CREATE (:symptom {characteristic:"U波倒置",status:"胸痛发作时",examination:"心电图",disease:"不稳定型心绞痛"});
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
CREATE (:symptom {characteristic:"一过性ST段抬高或压低",status:"胸痛发作时",examination:"心电图",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"T波低平或倒置",status:"胸痛发作时",examination:"心电图",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"ST段动态改变",status:"胸痛发作时",examination:"心电图",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"U波倒置",status:"胸痛发作时",examination:"心电图",disease:"非ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"持续改变12小时以上",,examination:"心电图连续动态监测",disease:"非ST段抬高型心肌梗死"});
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
CREATE (:symptom {characteristic:"呼吸困难",occur_with:"心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"咳嗽",occur_with:"心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"发绀",occur_with:"心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"烦躁",occur_with:"心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"肺水肿",occur_with:"心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"颈静脉怒张",occur_with:"心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"肝大",occur_with:"心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"水肿",occur_with:"心力衰竭",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"血压下降",occur_with:"右心室心肌梗死",disease:"ST段抬高型心肌梗死"});
CREATE (:symptom {characteristic:"右心衰竭",occur_with:"右心室心肌梗死",disease:"ST段抬高型心肌梗死"});
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
CREATE (:ECG {characteristic:"一过性ST段抬高",examination:"心电图",comment:"冠状动脉痉挛导致血管闭塞",disease:"冠状动脉痉挛"});
CREATE (:ECG {characteristic:"ST段压低",comment:"非闭塞性痉挛",examination:"心电图",disease:"冠状动脉痉挛"});
CREATE (:ECG {characteristic:"T波改变",comment:"非闭塞性痉挛",examination:"心电图",disease:"冠状动脉痉挛"});
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

//5.2.1 急性心力衰竭
CREATE (:symptom {characteristic:"突发严重呼吸困难",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"呼吸频率30~50次/分",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"强迫坐位",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"面色灰白",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"发绀",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"大汗",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"烦躁",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"频繁咳嗽",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"咳粉红色泡沫痰",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"神志模糊",stage:"极重症",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"一过性血压升高",stage:"发病伊始",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"血压下降至休克",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"神志模糊",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"两肺布满湿性啰音和哮鸣音",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"心尖部第一心音减弱、率快",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"舒张早期第三心音奔马律",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"肺动脉瓣第二心音亢进",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"心源性休克",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"持续性低血压",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"收缩压降至90mmHg以下持续30分钟以上",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"PCWP≥18mmHg",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"CI≤2.2L/(min·m2)",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"组织低灌注状态",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"皮肤湿冷",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"苍白",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"发绀",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"尿量显著减少",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"意识障碍",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"代谢性酸中毒",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"上肺静脉充盈",examination:"胸部X线",stage:"早期间质水肿",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"肺门血管影模糊",stage:"早期间质水肿",examination:"胸部X线",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"小叶间隔增厚",stage:"早期间质水肿",examination:"胸部X线",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"蝶形肺门",stage:"肺水肿",examination:"胸部X线",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"弥漫满肺的大片阴影",stage:"严重肺水肿",examination:"胸部X线",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"肺毛细血管楔压随病情加重而增高",stage:"重症",examination:"漂浮导管行床旁血流动力学监测",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"心脏指数随病情加重而降低",stage:"重症",examination:"漂浮导管行床旁血流动力学监测",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"上肺静脉充盈",occur_with:"早期间质水肿",examination:"X线胸片",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"肺门血管影模糊",occur_with:"早期间质水肿",examination:"X线胸片",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"小叶间隔增厚",occur_with:"早期间质水肿",examination:"X线胸片",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"蝶形肺门",occur_with:"肺水肿",examination:"X线胸片",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"弥漫满肺的大片阴影",occur_with:"严重肺水肿",examination:"X线胸片",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"心电图无特异性表现",examination:"心电图",disease:"急性心力衰竭"});
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {disease:"急性心力衰竭"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.2.2.1 （慢性）左心衰竭
CREATE (:symptom {characteristic:"肺循环瘀血",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"心排血量降低",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"劳力性呼吸困难",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"端坐呼吸",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"夜间阵发性呼吸困难",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"急性肺水肿",stage:"重症",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"心源性哮鸣音",stage:"重症",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"咳嗽",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"咳痰",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"白色浆液性泡沫痰",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"痰中带血丝",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"乏力",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"疲倦",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"运动耐量减低",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"头晕",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"心慌",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"少尿",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"血尿素氮",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"肌酐升高",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"肾功能不全",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"湿性啰音",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"心脏扩大",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"相对性二尖瓣关闭不全的反流性杂音",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"肺动脉瓣区第二心音亢进",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"第三心音奔马律",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"第四心音奔马律",disease:"左心衰竭"});
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {disease:"左心衰竭"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.2.2.2 （慢性）右心衰竭
CREATE (:symptom {characteristic:"体循环瘀血",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"腹胀",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"食欲缺乏",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"呕吐",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"恶心",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"劳力性呼吸困难",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"水肿",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"胸腔积液",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"颈静脉搏动增强、充盈、怒张",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"肝淤血肿大伴压痛",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"肝淤血肿大伴压痛",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"心源性肝硬化",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"三尖瓣关闭不全的反流性杂音",disease:"右心衰竭"});
MATCH (d:disease {name:"右心衰竭"}),(s:symptom {disease:"右心衰竭"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.2.2.3 （慢性）全心衰竭
CREATE (:symptom {characteristic:"肺瘀血症状减轻",disease:"全心衰竭"});
CREATE (:symptom {characteristic:"心排血量减少",disease:"全心衰竭"});
MATCH (d:disease {name:"全心衰竭"}),(s:symptom {disease:"全心衰竭"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//5.3.1 二尖瓣狭窄
CREATE (:symptom {characteristic:"呼吸困难",inducement:"运动/情绪激动/妊娠/感染/快速性房颤",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"静息性呼吸困难",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"夜间阵发性呼吸困难",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"端坐呼吸",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"咳嗽",inducement:"夜间睡眠/劳动",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"干咳无痰或泡沫痰",inducement:"夜间睡眠/劳动",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"咳黏液样或浓痰",disease:"二尖瓣狭窄",occur_with:"感染"});
CREATE (:symptom {characteristic:"大咯血",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"痰中带血或血痰",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"咳粉红色泡沫痰",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"咳胶冻状暗红色痰",occur_with:"心力衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"血栓栓塞",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"心房颤动",occur_with:"血栓栓塞",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"声音嘶哑",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"吞咽困难",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"食欲减退",occur_with:"右心室衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"腹胀",occur_with:"右心室衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"恶心",occur_with:"右心室衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"胸痛",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"二尖瓣面容",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"双颧绀红",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"剑突下收缩期抬举样搏动",occur_with:"右心室扩大",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"颈静脉怒张",occur_with:"右心衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"肝颈静脉回流征阳性",occur_with:"右心衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"肝大",occur_with:"右心衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"双下肢水肿",occur_with:"右心衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"亢进的第一心音，呈拍击样",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"开瓣音",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"P2亢进和分裂",occur_with:"肺动脉高压",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"心尖区舒张期隆隆样杂音",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"胸骨左缘第2肋间递减型高调叹气样舒张早期杂音（Graham-Steel杂音）",occur_with:"严重肺动脉高压",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"胸骨左缘第4、5肋间全收缩期吹风样杂音",occur_with:"右心室扩大",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"二尖瓣型P波（p波宽度>0.12秒，伴切迹）",examination:"心电图",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"QRS波群示电轴右偏和右心室肥厚",examination:"心电图",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"合并房颤",examination:"心电图",stage:"晚期",disease:"二尖瓣狭窄"});
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {disease:"二尖瓣狭窄"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.3.2.1 急性二尖瓣关闭不全
CREATE (:symptom {characteristic:"轻微劳力性呼吸困难",disease:"急性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"急性左心衰竭",disease:"急性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"急性肺水肿",disease:"急性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"心源性休克",disease:"急性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"心尖区抬举样搏动",disease:"急性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"肺动脉瓣区第二心音分裂",disease:"急性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"心尖区第四心音",disease:"急性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"心尖区收缩期杂音",disease:"急性二尖瓣关闭不全",comment:"主要体征"});
CREATE (:symptom {characteristic:"双肺干、湿啰音",disease:"急性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"正常或心动过速",examination:"心电图",disease:"急性二尖瓣关闭不全"});
MATCH (d:disease {name:"急性二尖瓣关闭不全"}),(s:symptom {disease:"急性二尖瓣关闭不全"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.3.2.2 慢性二尖瓣关闭不全
CREATE (:symptom {characteristic:"疲乏无力",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"活动耐力下降",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"劳力性呼吸困难",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"静息性呼吸困难",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"夜间阵发性呼吸困难",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"端坐呼吸",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"腹胀",disease:"慢性二尖瓣关闭不全",occur_with:"心力衰竭"});
CREATE (:symptom {characteristic:"食欲缺乏",disease:"慢性二尖瓣关闭不全",occur_with:"心力衰竭"});
CREATE (:symptom {characteristic:"肝脏瘀血肿大",disease:"慢性二尖瓣关闭不全",occur_with:"心力衰竭"});
CREATE (:symptom {characteristic:"水肿",disease:"慢性二尖瓣关闭不全",occur_with:"心力衰竭"});
CREATE (:symptom {characteristic:"胸腔积液",disease:"慢性二尖瓣关闭不全",occur_with:"心力衰竭"});
CREATE (:symptom {characteristic:"腹腔积液",disease:"慢性二尖瓣关闭不全",occur_with:"心力衰竭"});
CREATE (:symptom {characteristic:"心绞痛",disease:"慢性二尖瓣关闭不全",occur_with:"冠状动脉疾病"});
CREATE (:symptom {characteristic:"心界向左下扩大",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"心尖搏动向下向左移位",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"收缩期可触及高动力性心尖搏动",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"颈静脉怒张",disease:"慢性二尖瓣关闭不全",occur_with:"右心衰竭"});
CREATE (:symptom {characteristic:"肝颈回流征阳性",disease:"慢性二尖瓣关闭不全",occur_with:"右心衰竭"});
CREATE (:symptom {characteristic:"肝大",disease:"慢性二尖瓣关闭不全",occur_with:"右心衰竭"});
CREATE (:symptom {characteristic:"双下肢水肿",disease:"慢性二尖瓣关闭不全",occur_with:"右心衰竭"});
CREATE (:symptom {characteristic:"第一心音减弱",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"第二心音分裂",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"低调第三心音",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"心尖区全收缩期吹风样杂音",disease:"慢性二尖瓣关闭不全",comment:"典型杂音"});
CREATE (:symptom {characteristic:"收缩期震颤",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"房颤",examination:"心电图",occur_with:"左心房增大",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"P波增宽且呈双峰状（二尖瓣P波）",examination:"心电图",occur_with:"窦性心律",disease:"慢性二尖瓣关闭不全"});
MATCH (d:disease {name:"慢性二尖瓣关闭不全"}),(s:symptom {disease:"慢性二尖瓣关闭不全"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.3.3 主动脉瓣狭窄
CREATE (:symptom {characteristic:"劳力性呼吸困难",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"夜间阵发性呼吸困难",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"端坐呼吸",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"急性肺水肿",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"心绞痛",inducement:"运动",mitigation:"休息及含服硝酸甘油可缓解",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"晕厥",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"黑矇",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"心界正常或轻度向左扩大",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"心尖区收缩期抬举样搏动",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"收缩压降低",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"脉压减小",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"脉搏细弱",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"颈动脉搏动明显延迟",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"第一心音正常",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"主动脉瓣第二心音成分减弱或消失",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"第二心音中主动脉瓣成分延迟",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"第二心音中主动脉瓣成分呈逆分裂",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"明显的第四心音",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"主动脉瓣射流音",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"粗糙而响亮的射流性杂音",disease:"主动脉瓣狭窄",comment:"典型杂音"});
CREATE (:symptom {characteristic:"QRS波群电压增高",examination:"心电图",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"轻度ST-T改变",examination:"心电图",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"左心室肥厚伴劳损",examination:"心电图",disease:"主动脉瓣狭窄"});
CREATE (:symptom {characteristic:"左心房增大",examination:"心电图",disease:"主动脉瓣狭窄"});
MATCH (d:disease {name:"主动脉瓣狭窄"}),(s:symptom {disease:"主动脉瓣狭窄"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.3.4.1 急性主动脉瓣关闭不全
CREATE (:symptom {characteristic:"呼吸困难",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"不能平卧",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"全身大汗",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"频繁咳嗽",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"咳白色或粉红色泡沫痰",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"烦躁不安",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"神志模糊",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"昏迷",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"面色灰暗",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"唇甲发绀",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"脉搏细数",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"血压下降",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"休克",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"第一减弱或消失",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"病理性第三心音和第四心音",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"舒张期杂音柔和、短促、低音调",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"心尖搏动正常",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"肺部哮鸣音",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"肺底细小水泡音",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"满肺水泡音",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"窦性心动过速",examination:"心电图",disease:"急性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"非特异性ST-T改变"}),(s:symptom {disease:"急性主动脉瓣关闭不全"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.3.4.2 慢性主动脉瓣关闭不全
CREATE (:symptom {characteristic:"心悸",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"心前区不适",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"头颈部强烈动脉搏动感",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"劳力性呼吸困难",disease:"慢性主动脉瓣关闭不全",occur_with:"心力衰竭"});
CREATE (:symptom {characteristic:"夜间阵发性呼吸困难",disease:"慢性主动脉瓣关闭不全",occur_with:"心力衰竭"});
CREATE (:symptom {characteristic:"端坐呼吸",disease:"慢性主动脉瓣关闭不全",occur_with:"心力衰竭"});
CREATE (:symptom {characteristic:"胸痛",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"头晕",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"眩晕",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"面色苍白",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"头随心搏摆动。 ",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"心尖搏动向左下移位",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"心界向左下扩大",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"颈动脉搏动明显增强",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"收缩期震颤",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"第一音减弱",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"主动脉瓣区第二心音减弱或消失",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"心尖区第三心音",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"主动脉瓣区舒张期杂音",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"动脉收缩压增高",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"舒张压降低",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"脉压增宽",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"点头征（De Musset征）",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"水冲脉",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"股动脉枪击音（Traube征）",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"毛细血管搏动征",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"双期杂音（Duroziez双重音）",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"左心室肥厚劳损伴电轴左偏",examination:"心电图",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"房性心律失常",examination:"心电图",occur_with:"心肌损害",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"室性心律失常",examination:"心电图",occur_with:"心肌损害",disease:"慢性主动脉瓣关闭不全"});
MATCH (d:disease {name:"慢性主动脉瓣关闭不全"}),(s:symptom {disease:"慢性主动脉瓣关闭不全"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.3.5.1 二尖瓣狭窄伴主动脉瓣关闭不全
CREATE (:symptom {characteristic:"二尖瓣舒张期杂音可减弱或消失",disease:"二尖瓣狭窄伴主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"周围血管征不明显",disease:"二尖瓣狭窄伴主动脉瓣关闭不全"});
MATCH (d:disease {name:"二尖瓣狭窄伴主动脉瓣关闭不全"}),(s:symptom {disease:"二尖瓣狭窄伴主动脉瓣关闭不全"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.3.5.2 二尖瓣狭窄伴主动脉瓣狭窄
CREATE (:symptom {characteristic:"心绞痛不明显",disease:"二尖瓣狭窄伴主动脉瓣狭窄"});
MATCH (d:disease {name:"二尖瓣狭窄伴主动脉瓣狭窄"}),(s:symptom {disease:"二尖瓣狭窄伴主动脉瓣狭窄"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.3.5.3 主动脉瓣狭窄伴二尖瓣关闭不全
CREATE (:symptom {characteristic:"肺淤血早期发生",disease:"主动脉瓣狭窄伴二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"短期发生左心衰竭",disease:"主动脉瓣狭窄伴二尖瓣关闭不全"});
MATCH (d:disease {name:"主动脉瓣狭窄伴二尖瓣关闭不全"}),(s:symptom {disease:"主动脉瓣狭窄伴二尖瓣关闭不全"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.3.5.4 二尖瓣关闭不全伴主动脉瓣关闭不全 
CREATE (:symptom {characteristic:"较早发生左心室衰竭",disease:"二尖瓣关闭不全伴主动脉瓣关闭不全"});
MATCH (d:disease {name:"二尖瓣关闭不全伴主动脉瓣关闭不全"}),(s:symptom {disease:"二尖瓣关闭不全伴主动脉瓣关闭不全"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);


//六、分期分级分类

//6.1.1.1 稳定型心绞痛分级
CREATE (:degree {name:"Ⅰ级", criterion:"一般体力活动（如步行和登楼）不受限，仅在强、快或持续用力时发生心绞痛",reference:"加拿大心血管病学会(CCS)",disease:"稳定型心绞痛"});
CREATE (:degree {name:"Ⅱ级", criterion:"一般体力活动轻度受限。快步、饭后、寒冷或刮风中、精神应激或醒后数小时内发作心绞痛。一般情况平地步行200m以上或登楼一层以上受限",reference:"加拿大心血管病学会(CCS)",disease:"稳定型心绞痛"});
CREATE (:degree {name:"Ⅲ级", criterion:"一般体力活动明显受限，一般情况下平地步行200m内或登楼一层引起心绞痛",reference:"加拿大心血管病学会(CCS)",disease:"稳定型心绞痛"});
CREATE (:degree {name:"Ⅳ级", criterion:"轻微活动或休息时即可发生心绞痛",reference:"加拿大心血管病学会(CCS)",disease:"稳定型心绞痛"});
MATCH (d:disease {name:"稳定型心绞痛"}),(g:degree {disease:"稳定型心绞痛"}) CREATE (d)-[:disease_degree {reference:"内科学第九版"}]->(g);

//6.1.1.2.1.1 不稳定型心绞痛分级
CREATE (:degree {name:"Ⅰ级", criterion:"严重的初发型心绞痛或恶化型心绞痛，无静息疼痛",mortality_MI_rate_in_one_year:"7.3%",reference:"Braunwald分级",disease:"不稳定型心绞痛"});
CREATE (:degree {name:"Ⅱ级", criterion:"亚急性静息型疼痛（一个月内发作过，但48小时内无发作）",mortality_MI_rate_in_one_year:"10.3%",reference:"Braunwald分级",disease:"不稳定型心绞痛"});
CREATE (:degree {name:"Ⅲ级", criterion:"急性静息型心绞痛（48小时内有发作）",mortality_MI_rate_in_one_year:"10.8%",reference:"Braunwald分级",disease:"不稳定型心绞痛"});
MATCH (d:disease {name:"不稳定型心绞痛"}),(g:degree {disease:"不稳定型心绞痛"}) CREATE (d)-[:disease_degree {reference:"内科学第九版"}]->(g);

//6.2.1 急性心力衰竭分级
CREATE (:degree {name:"Ⅰ级", criterion:"尚无明显心力衰竭",reference:"Killip分级",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅱ级", criterion:"有左心衰竭，肺部啰音<50%肺野",reference:"Killip分级",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅲ级", criterion:"有急性肺水肿，全肺大、小、干、湿啰音",reference:"Killip分级",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅳ级", criterion:"有心源性休克等不同程度或阶段的血流动力学变化",reference:"Killip分级",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅰ类", criterion:"无肺淤血和周围灌注不足；肺毛细血管楔压（PCWP）和心排血指数（CI）正常",reference:"Forrester分类",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅱ类", criterion:"单有肺淤血；PCWP（>18mmHg），CI正常[>2.2L/ (min·m2)]",reference:"Forrester分类",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅲ类", criterion:"单有周围灌注不足；PCWP正常（<18mmHg），CI降低[<2.2L/ (min·m2)]，主要与血容量不足或心动过缓有关",reference:"Forrester分类",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅳ类", criterion:"合并有肺淤血和周围灌注不足；PCWP增高（>18mmHg），CI降低[<2.2L/ (min·m2)]",reference:"Forrester分类",disease:"慢性心力衰竭"});
MATCH (d:disease {english_name:"慢性心力衰竭"}),(g:degree {disease:"慢性心力衰竭"}) CREATE (d)-[:disease_degree {reference:"内科学第九版"}]->(g);

//6.2.2 慢性心力衰竭分期
CREATE (:stage {name:"前心衰阶段", criterion:"病人存在心衰高危因素，但目前尚无心脏结构或功能异常，也无心衰的症状和（或）体征",disease:"慢性心力衰竭"});
CREATE (:stage {name:"前临床心衰阶段", criterion:"病入无心衰的症状和（或）体征，但已出现心脏结构改变，如左心室肥厚、无症状瓣膜性心脏病、既往心肌梗死史等",disease:"慢性心力衰竭"});
CREATE (:stage {name:"临床心衰阶段", criterion:"病人已有心脏结构改变，既往或目前有心衰的症状和（或）体征",disease:"慢性心力衰竭"});
CREATE (:stage {name:"难治性终末期心衰阶段", criterion:" 病人虽经严格优化内科治疗，但休息时仍有症状，常伴 源性恶病质，须反复长期住院",disease:"慢性心力衰竭"});
MATCH (d:disease {name:"慢性心力衰竭"}),(g:stage {disease:"慢性心力衰竭"}) CREATE (d)-[:disease_stage {reference:"内科学第九版"}]->(g);
//6.2.2 慢性心力衰竭分级
CREATE (:degree {name:"Ⅰ级", criterion:"心脏病病人日常活动量不受限制，一般活动不引起乏力、呼吸困难等心衰症状",reference:"NYHA心功能分级",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅱ级", criterion:"心脏病病人体力活动轻度受限，休息时无自觉症状，一般活动下可出现心衰症状",reference:"NYHA心功能分级",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅲ级", criterion:"心脏病病人体力活动明显受限，低于平时一般活动即引起心衰症状",reference:"NYHA心功能分级",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅳ级", criterion:"心脏病病人不能从事任何体力活动，休息状态下也存在心衰症状，活动后加重",reference:"NYHA心功能分级",disease:"慢性心力衰竭"});
CREATE (:degree {name:"轻度心衰", criterion:"6分钟步行试验>450m",reference:"US Carvedilol",disease:"慢性心力衰竭"});
CREATE (:degree {name:"中度心衰", criterion:"6分钟步行试验150~450n",reference:"US Carvedilol",disease:"慢性心力衰竭"});
CREATE (:degree {name:"重度心衰", criterion:"6分钟步行试验<150m",reference:"US Carvedilol",disease:"慢性心力衰竭"});
MATCH (d:disease {name:"慢性心力衰竭"}),(g:degree {disease:"慢性心力衰竭"}) CREATE (d)-[:disease_classification {reference:"内科学第九版"}]->(g);


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
//7.2.1 急性心力衰竭

//7.2.2 慢性心力衰竭
CREATE (:laboratory_test {name:"利钠肽",english_name:"BNP/NT-proBNP",information:"水平正常可基本排除心衰诊断",disease:"慢性心力衰竭"});
CREATE (:laboratory_test {name:"肌钙蛋白",information:"明确是否存在急性冠状动脉综合征/心衰预后",disease:"慢性心力衰竭"});
CREATE (:laboratory_test {name:"血常规",disease:"慢性心力衰竭"});
CREATE (:laboratory_test {name:"尿常规",disease:"慢性心力衰竭"});
CREATE (:laboratory_test {name:"肝肾功能",disease:"慢性心力衰竭"});
CREATE (:laboratory_test {name:"血糖",disease:"慢性心力衰竭"});
CREATE (:laboratory_test {name:"血脂",disease:"慢性心力衰竭"});
CREATE (:laboratory_test {name:"电解质",disease:"慢性心力衰竭"});
CREATE (:laboratory_test {name:"甲状腺功能",disease:"慢性心力衰竭"});
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:laboratory_test {disease:"慢性心力衰竭"}) CREATE (d)-[:disease_laboratory_test {reference:"内科学第九版"}]->(rt);

CREATE (:examination {name:"心电图",information:"能帮助判断心肌缺血、既往肌梗死、传导阻滞及心律失常",disease:"慢性心力衰竭"});

CREATE (:examination {name:"X线检查",information:"确诊左心衰竭肺水肿的主要依据/鉴别心衰与肺部疾病",disease:"慢性心力衰竭"});

//7.3.1 二尖瓣狭窄
CREATE (:examination {name:"X线检查",information:"肺静脉压增高导致肺淤血的迹象/左心房扩大",disease:"二尖瓣狭窄"});
CREATE (:examination {name:"心电图",information:"左心房扩大/QRS波群示电轴右偏/和右心室肥厚表现/房颤",disease:"二尖瓣狭窄"});
CREATE (:examination {name:"M型超声心动图",information:"二尖瓣前叶呈“城墙样”改变（EF斜率降低，A峰消失）/后叶与前叶同向运动/瓣叶回声增强",disease:"二尖瓣狭窄"});
CREATE (:examination {name:"二维超声",information:"瓣叶活动度/瓣叶厚度/瓣叶钙化/瓣膜病变",disease:"二尖瓣狭窄"});
CREATE (:examination {name:"经食管超声",information:"左心耳及左心房附壁血栓的检出",disease:"二尖瓣狭窄"});
CREATE (:examination {name:"彩色多普勒血流显像",information:"二尖瓣狭窄的射流",disease:"二尖瓣狭窄"});
CREATE (:examination {name:"连续波或脉冲波多普勒",information:"二尖瓣狭窄严重程度",disease:"二尖瓣狭窄"});
MATCH (d:disease {name:"二尖瓣狭窄"}),(rt:examination {disease:"二尖瓣狭窄"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//7.3.2 二尖瓣关闭不全
CREATE (:examination {name:"X线检查",disease:"二尖瓣关闭不全"});
CREATE (:examination {name:"心电图",disease:"二尖瓣关闭不全"});
CREATE (:examination {name:"M型超声心动图",information:"左心室超容量负荷改变",disease:"二尖瓣关闭不全"});
CREATE (:examination {name:"二维超声心动图",information:"二尖瓣装置的形态特征",disease:"二尖瓣关闭不全"});
CREATE (:examination {name:"脉冲多普勒超声",information:"确诊二尖瓣反流",disease:"二尖瓣关闭不全"});
CREATE (:examination {name:"彩色多普勒血流显像",information:"像诊断二尖瓣关闭不全",disease:"二尖瓣关闭不全"});
MATCH (d:disease {name:"二尖瓣关闭不全"}),(rt:examination {disease:"二尖瓣关闭不全"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//7.3.3 主动脉瓣狭窄
CREATE (:examination {name:"X线检查",information:"左心房轻度增大/升主动脉扩张/主动脉瓣膜钙化",disease:"主动脉瓣狭窄"});
CREATE (:examination {name:"心电图",information:"QRS波群电压增高伴轻度ST-T改变/左心室肥厚伴劳损/左心房增大",disease:"主动脉瓣狭窄"});
CREATE (:examination {name:"二维超声心动图",information:"主动脉瓣瓣叶增厚/瓣膜钙化/瓣叶收缩期开放幅度减小（<15mm）, 开放速度减慢/左心室后壁及室间隔对称性肥厚/左心房增大/主动脉根部狭窄后扩张/二叶、三叶主动脉瓣畸形",disease:"主动脉瓣狭窄"});
CREATE (:examination {name:"彩色多普勒超声心动图",information:"血流于瓣口下方加速形成五彩镶嵌的射流",disease:"主动脉瓣狭窄"});
CREATE (:examination {name:"连续多普勒",information:"心脏及血管内的血流速度/狭窄程度",disease:"主动脉瓣狭窄"});
MATCH (d:disease {name:"主动脉瓣狭窄"}),(rt:examination {disease:"主动脉瓣狭窄"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//7.3.4 主动脉瓣关闭不全
CREATE (:examination {name:"X线检查",information:"靴型心/肺淤血/肺水肿",disease:"主动脉瓣关闭不全"});
CREATE (:examination {name:"心电图",information:"左心室肥厚劳损伴电轴左偏/心室内传导阻滞/房性心律失常/室性心律失常/窦性心动过速/非特异性ST-T改变",disease:"主动脉瓣关闭不全"});
CREATE (:examination {name:"M型超声心动图",information:"舒张期二尖瓣前叶快速高频的振动",disease:"主动脉瓣关闭不全"});
CREATE (:examination {name:"二维超声",information:"主动脉瓣关闭时不能合拢",disease:"主动脉瓣关闭不全"});
CREATE (:examination {name:"多普勒超声",information:"主动脉瓣下方（左心室流出道）探及全舒张期反流",disease:"主动脉瓣关闭不全"});
MATCH (d:disease {name:"主动脉瓣狭窄"}),(rt:examination {disease:"主动脉瓣关闭不全"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

//辅助检查
CREATE (:examination {name:"心肌肌钙蛋白I",english_name:"cTnI",type:"心肌损伤标志物"});
CREATE (:examination {name:"心肌肌钙蛋白T",english_name:"cTnT",type:"心肌损伤标志物"});
CREATE (:examination {name:"肌酸激酶",english_name:"CK",type:"心肌损伤标志物"});
CREATE (:examination {name:"肌酸激酶同工酶",english_name:"CK-MB",type:"心肌损伤标志物"});
CREATE (:examination {name:"肌红蛋白",type:"心肌损伤标志物"});
CREATE (:examination {name:"利钠肽"});
CREATE (:examination {name:"肌钙蛋白"});
CREATE (:examination {name:"尿常规"});
CREATE (:examination {name:"肝肾功能"});
CREATE (:examination {name:"电解质"});

CREATE (:examination {name:"血糖",type:"实验室检查"});
CREATE (:examination {name:"血脂",type:"实验室检查"});
CREATE (:examination {name:"血常规",type:"实验室检查"});
CREATE (:examination {name:"甲状腺功能",type:"实验室检查"});
CREATE (:examination {name:"心电图",english_name:"ECG"});
CREATE (:examination {name:"运动负荷试验"});
CREATE (:examination {name:"心电图连续动态监测",synonym:"Holter检查"});
CREATE (:examination {name:"多层螺旋CT冠状动脉成像",english_name:"CTA"});
CREATE (:examination {name:"超声心动图"});
CREATE (:examination {name:"核素心肌显像及负荷试验",type:"放射性核素检查"});
CREATE (:examination {name:"心肌灌注显像",type:"放射性核素检查"});
CREATE (:examination {name:"放射性核素心腔造影",type:"放射性核素检查"});
CREATE (:examination {name:"正电子发射断层心肌显像",english_name:"PET",type:"放射性核素检查"});
CREATE (:examination {name:"单光子发射计算机断层显像",english_name:"SPECT",type:"放射性核素检查"});
CREATE (:examination {name:"冠状动脉造影",english_name:"CAG",type:"有创性检查"});
CREATE (:examination {name:"冠脉超声成像",english_name:"IVUS",type:"有创性检查"});
CREATE (:examination {name:"冠脉内光学相干断层显像",english_name:"OCT",type:"有创性检查"});
CREATE (:examination {name:"冠脉血流储备分数测定",english_name:"FFR",type:"有创性检查"});
CREATE (:examination {name:"定量冠脉血流分数",english_name:"QFR",type:"有创性检查"});
CREATE (:examination {name:"乙酰胆碱激发试验"});
CREATE (:examination {name:"麦角新碱激发试验"});
CREATE (:examination {name:"心房调搏术"});
CREATE (:examination {name:"血管内超声及多普勒血流测定"});
CREATE (:examination {name:"胸部X线"});
CREATE (:examination {name:"心脏超声"});
CREATE (:examination {name:"床旁右心漂浮导管检查",synonym:"Swan-Ganz导管检查"});
CREATE (:examination {name:"最大耗氧量",type:"心肺运动试验"});
CREATE (:examination {name:"无氧阈值",type:"心肺运动试验"});


MATCH (d:disease {name:"不稳定型心绞痛"}),(rt:examination {name:"运动负荷试验"}) CREATE (d)-[:prohibit {reference:"内科学第九版"}]->(rt);

// MATCH (d:disease {name:"心力衰竭"}),(rt:examination {name:"运动负荷试验"}) CREATE (d)-[:prohibit_test {reference:"内科学第九版"}]->(rt);
// MATCH (d:disease {name:"心肌梗死急性期"}),(rt:examination {name:"运动负荷试验"}) CREATE (d)-[:prohibit_test {reference:"内科学第九版"}]->(rt);
// MATCH (d:disease {name:"严重心律失常"}),(rt:examination {name:"运动负荷试验"}) CREATE (d)-[:prohibit_test {reference:"内科学第九版"}]->(rt);
// MATCH (d:disease {name:"急性疾病"}),(rt:examination {name:"运动负荷试验"}) CREATE (d)-[:prohibit_test {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(b:examination {name:"心肌肌钙蛋白I"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(b);
MATCH (d:disease {name:"稳定型心绞痛"}),(b:examination {name:"心肌肌钙蛋白T"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(b);
MATCH (d:disease {name:"稳定型心绞痛"}),(b:examination {name:"肌酸激酶"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(b);
MATCH (d:disease {name:"稳定型心绞痛"}),(b:examination {name:"肌酸激酶同工酶"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(b);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"血糖"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"血脂"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"血常规"}) CREATE (d)-[:examine {attention:"贫血",reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"甲状腺功能"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"心电图"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"运动负荷试验"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"心电图连续动态监测"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"多层螺旋CT冠状动脉成像"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"超声心动图"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"核素心肌显像及负荷试验"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"放射性核素心腔造影"}) CREATE (d)-[:examine {content:"左心射血分数及显示心肌缺血区室壁局部运动障碍",reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"正电子发射断层心肌显像"}) CREATE (d)-[:examine {content:"心肌血流灌注和代谢显像匹配分析",reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"冠状动脉造影"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"冠脉超声成像"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"冠脉内光学相干断层显像"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"冠脉血流储备分数测定"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"定量冠脉血流分数"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"STEMI"}),(rt:examination {name:"心电图"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"STEMI"}),(rt:examination {name:"超声心动图"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"STEMI"}),(rt:examination {name:"正电子发射断层心肌显像"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"STEMI"}),(rt:examination {name:"单光子发射计算机断层显像"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"STEMI"}),(rt:examination {name:"血常规"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"STEMI"}),(b:examination {name:"肌红蛋白"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(b);
MATCH (d:disease {english_name:"STEMI"}),(b:examination {name:"心肌肌钙蛋白I"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(b);
MATCH (d:disease {english_name:"STEMI"}),(b:examination {name:"心肌肌钙蛋白T"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(b);
MATCH (d:disease {english_name:"STEMI"}),(b:examination {name:"肌酸激酶同工酶"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(b);
MATCH (d:disease {name:"冠状动脉痉挛"}),(rt:examination {name:"乙酰胆碱激发试验"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"冠状动脉痉挛"}),(rt:examination {name:"麦角新碱激发试验"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"X综合征"}),(rt:examination {name:"运动负荷试验"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"X综合征"}),(rt:examination {name:"心房调搏术"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"X综合征"}),(rt:examination {name:"血管内超声及多普勒血流测定"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEACS"}),(rt:examination {name:"心电图"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEACS"}),(rt:examination {name:"心电图连续动态监测"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEACS"}),(rt:examination {name:"冠状动脉造影"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEACS"}),(rt:examination {name:"冠脉超声成像"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEACS"}),(rt:examination {name:"冠脉内光学相干断层显像"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEACS"}),(rt:examination {name:"胸部X线"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEACS"}),(rt:examination {name:"心脏超声"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEACS"}),(rt:examination {type:"放射性核素检查"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEMI"}),(b:examination {name:"心肌肌钙蛋白I"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(b);
MATCH (d:disease {english_name:"NSTEMI"}),(b:examination {name:"心肌肌钙蛋白T"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(b);

MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"利钠肽"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"肌钙蛋白"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"血常规"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"尿常规"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"肝肾功能"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"血糖"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"血脂"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"电解质"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"心电图"}) CREATE (d)-[:examine {aim:"帮助判断心肌缺血、既往肌梗死、传导阻滞及心律失常等",reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"超声心动图"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"胸部X线"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"心脏磁共振"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"冠状动脉造影"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"放射性核素心腔造影"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"放射性核素心腔造影"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"床旁右心漂浮导管检查"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"最大耗氧量"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"无氧阈值"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {name:"心肌灌注显像"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);

MATCH (d:disease {name:"二尖瓣狭窄"}),(rt:examination {name:"胸部X线"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"二尖瓣狭窄"}),(rt:examination {name:"心电图"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"二尖瓣狭窄"}),(rt:examination {name:"超声心动图"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);

MATCH (d:disease {name:"二尖瓣关闭不全"}),(rt:examination {name:"胸部X线"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"二尖瓣关闭不全"}),(rt:examination {name:"心电图"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"二尖瓣关闭不全"}),(rt:examination {name:"超声心动图"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);

MATCH (d:disease {name:"主动脉瓣狭窄"}),(rt:examination {name:"胸部X线"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"主动脉瓣狭窄"}),(rt:examination {name:"心电图"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"主动脉瓣狭窄"}),(rt:examination {name:"超声心动图"}) CREATE (d)-[:examine {reference:"内科学第九版"}]->(rt);


//八、并发症
//8.1.1.2.2 ST段抬高型心肌梗死
CREATE (d:complication {complication:"乳头肌功能失调或断裂",disease:"ST段抬高型心肌梗死"});
CREATE (d:complication {complication:"心脏破裂",disease:"ST段抬高型心肌梗死"});
CREATE (d:complication {complication:"栓塞",disease:"ST段抬高型心肌梗死"});
CREATE (d:complication {complication:"心室壁瘤",disease:"ST段抬高型心肌梗死"});
CREATE (d:complication {complication:"心肌梗死后综合征",disease:"ST段抬高型心肌梗死"});
MATCH (d1:disease {name:"ST段抬高型心肌梗死"}),(d2:complication {disease:"ST段抬高型心肌梗死"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);

//8.3.1 二尖瓣狭窄
CREATE (:complication {disease:"二尖瓣狭窄",complication:"心房颤动"});
CREATE (:complication {disease:"二尖瓣狭窄",complication:"急性肺水肿"});
CREATE (:complication {disease:"二尖瓣狭窄",complication:"血栓栓塞"});
CREATE (:complication {disease:"二尖瓣狭窄",complication:"右心衰竭"});
CREATE (:complication {disease:"二尖瓣狭窄",complication:"感染性心内膜炎"});
CREATE (:complication {disease:"二尖瓣狭窄",complication:"肺部感染"});
MATCH (d1:disease {name:"二尖瓣狭窄"}),(d2:complication {disease:"二尖瓣狭窄"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);
//8.3.2 二尖瓣关闭不全
CREATE (:complication {disease:"二尖瓣关闭不全",complication:"心力衰竭"});
CREATE (:complication {disease:"二尖瓣关闭不全",complication:"心房颤动"});
CREATE (:complication {disease:"二尖瓣关闭不全",complication:"感染性心内膜炎"});
CREATE (:complication {disease:"二尖瓣关闭不全",complication:"栓塞"});
MATCH (d1:disease {name:"二尖瓣关闭不全"}),(d2:complication {disease:"二尖瓣关闭不全"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);
//8.3.3 主动脉瓣狭窄
CREATE (:complication {disease:"主动脉瓣狭窄",complication:"心律失常"});
CREATE (:complication {disease:"主动脉瓣狭窄",complication:"心脏性猝死"});
CREATE (:complication {disease:"主动脉瓣狭窄",complication:"充血性心力衰竭"});
CREATE (:complication {disease:"主动脉瓣狭窄",complication:"感染性心内膜炎"});
CREATE (:complication {disease:"主动脉瓣狭窄",complication:"体循环栓塞"});
CREATE (:complication {disease:"主动脉瓣狭窄",complication:"胃肠道出血"});
MATCH (d1:disease {name:"主动脉瓣狭窄"}),(d2:complication {disease:"主动脉瓣狭窄"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);
//8.3.4 主动脉瓣关闭不全
CREATE (:complication {disease:"主动脉瓣关闭不全",complication:"感染性心内膜炎"});
CREATE (:complication {disease:"主动脉瓣关闭不全",complication:"心力衰竭"});
CREATE (:complication {disease:"主动脉瓣关闭不全",complication:"心力衰竭"});
CREATE (:complication {disease:"主动脉瓣关闭不全",complication:"心脏性猝死"});
MATCH (d1:disease {name:"主动脉瓣关闭不全"}),(d2:complication {disease:"主动脉瓣关闭不全"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);



//九、鉴别诊断
//9.1.1.1.1 稳定型心绞痛
CREATE (:differential_diagnosis {name:"急性冠状动脉综合征",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"反流性食管炎",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"膈疝",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"心脏神经症",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"消化性溃疡",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"肠道疾病",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"颈椎病",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"肋间神经痛",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"肋软骨炎",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"主动脉瓣狭窄",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"主动脉瓣关闭不全",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"风湿性冠脉炎",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"梅毒主动性脉炎引起的冠脉口狭窄或闭塞",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"肥厚型心肌病",symptom:"心绞痛",disease:"稳定型心绞痛"});
CREATE (:differential_diagnosis {name:"X综合征",symptom:"心绞痛",disease:"稳定型心绞痛"});
//0323
//9.2.1 慢性心力衰竭
CREATE (:differential_diagnosis {name:"支气管哮喘",symptom:"心源性哮鸣音",disease:"慢性心力衰竭"});
CREATE (:differential_diagnosis {name:"心包积液",symptom:"颈静脉怒张、肝大、下肢水肿",disease:"慢性心力衰竭"});
CREATE (:differential_diagnosis {name:"窄缩性心包炎",symptom:"心尖部舒张期隆隆样杂音",disease:"慢性心力衰竭"});
CREATE (:differential_diagnosis {name:"肝硬化腹腔积液伴下肢水肿",symptom:"肝硬化腹腔积液伴下肢水肿",disease:"慢性心力衰竭"});
MATCH (d:disease {name:"慢性心力衰竭"}),(dd:differential_diagnosis {disease:"慢性心力衰竭"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);


//9.3.1 二尖瓣狭窄
CREATE (:differential_diagnosis {name:"主动脉瓣关闭不全",symptom:"心尖部舒张期隆隆样杂音",disease:"二尖瓣狭窄"});
CREATE (:differential_diagnosis {name:"左心房黏液瘤",symptom:"心尖部舒张期隆隆样杂音",disease:"二尖瓣狭窄"});
CREATE (:differential_diagnosis {name:"经二尖瓣口血流增加",symptom:"心尖部舒张期隆隆样杂音",disease:"二尖瓣狭窄"});
MATCH (d:disease {name:"二尖瓣狭窄"}),(dd:differential_diagnosis {disease:"二尖瓣狭窄"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.3.2 二尖瓣关闭不全
CREATE (:differential_diagnosis {name:"三尖瓣关闭不全",symptom:"收缩期杂音",disease:"二尖瓣关闭不全"});
CREATE (:differential_diagnosis {name:"室间隔缺损",symptom:"收缩期杂音",disease:"二尖瓣关闭不全"});
CREATE (:differential_diagnosis {name:"主动脉瓣狭窄",symptom:"收缩期杂音",disease:"二尖瓣关闭不全"});
CREATE (:differential_diagnosis {name:"梗阻性肥厚型心肌病",symptom:"收缩期杂音",disease:"二尖瓣关闭不全"});
CREATE (:differential_diagnosis {name:"肺动脉瓣狭窄",symptom:"收缩期杂音",disease:"二尖瓣关闭不全"});
MATCH (d:disease {name:"二尖瓣关闭不全"}),(dd:differential_diagnosis {disease:"二尖瓣关闭不全"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.3.3 主动脉狭窄
CREATE (:differential_diagnosis {name:"梗阻性肥厚型心肌病",symptom:"收缩期杂音",disease:"主动脉狭窄"});
CREATE (:differential_diagnosis {name:"先天性主动脉瓣上狭窄",symptom:"收缩期杂音",disease:"主动脉狭窄"});
CREATE (:differential_diagnosis {name:"先天性主动脉瓣下狭窄",symptom:"收缩期杂音",disease:"主动脉狭窄"});
CREATE (:differential_diagnosis {name:"先天性主动脉瓣下狭窄",symptom:"收缩期杂音",disease:"主动脉狭窄"});
CREATE (:differential_diagnosis {name:"二尖瓣关闭不全",symptom:"收缩期杂音",disease:"主动脉狭窄"});
CREATE (:differential_diagnosis {name:"三尖瓣关闭不全",symptom:"收缩期杂音",disease:"主动脉狭窄"});
CREATE (:differential_diagnosis {name:"室间隔缺损",symptom:"收缩期杂音",disease:"主动脉狭窄"});
MATCH (d:disease {name:"主动脉狭窄"}),(dd:differential_diagnosis {disease:"主动脉狭窄"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.3.4 主动脉关闭不全
CREATE (:differential_diagnosis {name:"二尖瓣狭窄",symptom:"主动脉瓣关闭不全杂音",disease:"主动脉关闭不全"});
MATCH (d:disease {name:"主动脉关闭不全"}),(dd:differential_diagnosis {disease:"主动脉关闭不全"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);


CREATE (d:disease {name:"主动脉瓣狭窄"});
CREATE (d:disease {name:"主动脉瓣关闭不全"});
CREATE (d:disease {name:"主动脉夹层"});
CREATE (d:disease {name:"急性肺动脉栓塞"});
CREATE (d:disease {name:"急腹症"});
CREATE (d:disease {name:"急性胰腺炎"});
CREATE (d:disease {name:"消化性溃疡穿孔"});
CREATE (d:disease {name:"急性胆囊炎"});
CREATE (d:disease {name:"胆石症"});
MATCH (d1:disease {name:"急腹症"}),(d2:disease {name:"急性胰腺炎"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"急腹症"}),(d2:disease {name:"消化性溃疡穿孔"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"急腹症"}),(d2:disease {name:"急性胆囊炎"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"急腹症"}),(d2:disease {name:"胆石症"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);

CREATE (d:disease {name:"急性心包炎"});
CREATE (d:disease {name:"心绞痛"});
CREATE (d:disease {name:"风湿性冠脉炎"});
CREATE (d:disease {name:"梅毒主动性脉炎引起的冠脉口狭窄或闭塞"});
CREATE (d:disease {name:"肥厚型心肌病"});
CREATE (d:disease {name:"反流性食管炎"});
CREATE (d:disease {name:"膈疝"});
CREATE (d:disease {name:"消化性溃疡"});
CREATE (d:disease {name:"肠道疾病"});
CREATE (d:disease {name:"颈椎病"});
CREATE (d:disease {name:"肋间神经痛"});
CREATE (d:disease {name:"肋软骨炎"});
CREATE (d:disease {name:"心肌炎"});
CREATE (d:disease {name:"心肌病"});
CREATE (d:disease {name:"特发性扩张型心肌病"});
MATCH (d1:disease {name:"心肌病"}),(d2:disease {name:"特发性扩张型心肌病"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);

CREATE (d:disease {name:"心包疾病"});
CREATE (d:disease {name:"电解质失调"});
CREATE (d:disease {name:"内分泌疾病"});
CREATE (d:disease {name:"药物作用"});
CREATE (d:disease {name:"高血压性心脏病"});
CREATE (d:disease {name:"内分泌病性心脏病"});

MATCH (d1:disease {name:"隐匿型冠心病"}),(d2:disease {name:"心肌炎"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"隐匿型冠心病"}),(d2:disease {name:"心肌病"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"隐匿型冠心病"}),(d2:disease {name:"心包疾病"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"隐匿型冠心病"}),(d2:disease {name:"电解质失调"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"隐匿型冠心病"}),(d2:disease {name:"内分泌疾病"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"缺血性心肌病"}),(d2:disease {name:"心肌病"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"缺血性心肌病"}),(d2:disease {name:"心肌炎"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"缺血性心肌病"}),(d2:disease {name:"高血压性心脏病"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"缺血性心肌病"}),(d2:disease {name:"内分泌病性心脏病"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"心绞痛"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"主动脉夹层"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"急性肺动脉栓塞"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"急腹症"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"急性心包炎"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);

CREATE (d:disease {name:"左心房黏液瘤"});
CREATE (d:disease {name:"经二尖瓣口血流增加"});
MATCH (d1:disease {name:"二尖瓣狭窄"}),(d2:disease {name:"主动脉瓣关闭不全"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"二尖瓣狭窄"}),(d2:disease {name:"左心房黏液瘤"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"二尖瓣狭窄"}),(d2:disease {name:"经二尖瓣口血流增加"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);

CREATE (d:disease {name:"三尖瓣关闭不全"});
CREATE (d:disease {name:"室间隔缺损"});
CREATE (d:disease {name:"梗阻性肥厚型心肌病"});
CREATE (d:disease {name:"肺动脉瓣狭窄"});
MATCH (d1:disease {name:"二尖瓣关闭不全"}),(d2:disease {name:"三尖瓣关闭不全"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"二尖瓣关闭不全"}),(d2:disease {name:"室间隔缺损"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"二尖瓣关闭不全"}),(d2:disease {name:"梗阻性肥厚型心肌病"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"二尖瓣关闭不全"}),(d2:disease {name:"肺动脉瓣狭窄"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"二尖瓣关闭不全"}),(d2:disease {name:"主动脉瓣狭窄"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);


//八、药物治疗及禁用药物
//8.1.1.1.1 稳定型心绞痛
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
//8.1.1.1.2 隐匿型冠心病
CREATE (:drug {name:"阿司匹林",disease:"隐匿型冠心病",indication:"有MI既往史"});
CREATE (:drug {name:"β受体阻滞剂",disease:"隐匿型冠心病",indication:"有MI既往史"});
CREATE (:drug {name:"他汀类药物",disease:"隐匿型冠心病",indication:"确诊CAD/2型糖尿病者",aim:"降脂治疗"});
CREATE (:drug {name:"ACEI",disease:"隐匿型冠心病",indication:"伴糖尿病和（或）心脏收缩功能障碍的CAD病人"});
MATCH (ds:disease {name:"隐匿型冠心病"}),(dg:drug {disease:"隐匿型冠心病"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//8.1.1.2.1 非ST段抬高型急性冠脉综合征
CREATE (:drug {name:"硝酸甘油",usage:"舌下含服",dosage:"0.5mg",frequency:"连用3次",indication:"心绞痛发作",side_effect:"头痛/低血压",aim:"抗心肌缺血",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"硝酸甘油",usage:"静脉应用",dosage:"5~10µg/min",indication:"心绞痛发作",aim:"抗心肌缺血",side_effect:"头痛/低血压",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"硝酸异山梨酯",usage:"口服",side_effect:"头痛/低血压",aim:"抗心肌缺血",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"5-单硝酸异山梨酯",usage:"口服",aim:"抗心肌缺血",side_effect:"头痛/低血压",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"美托洛尔",aim:"抗心肌缺血",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"比索洛尔",aim:"抗心肌缺血",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"钙通道阻滞剂",aim:"抗心肌缺血",indication:"血管痉挛性心绞痛病人/β受体拈抗剂与硝酸酕类药物治疗后仍不能控制缺血症状的病人",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"阿司匹林",dosage:"150~300mg",aim:"抗血小板治疗",frequency:"首次应用",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"吲哚布芬",indication:"阿司匹林不耐受",aim:"抗血小板治疗",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"氯吡格雷",dosage:"300~600mg",aim:"抗血小板治疗",frequency:"首次应用",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"替格瑞洛",dosage:"180mg",aim:"抗血小板治疗",frequency:"首次应用",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"阿昔单抗",aim:"抗血小板治疗",indication:"接受PCI的UA/NSTEMI病人/和选用保守治疗策略的中高危UA/NSTEMI病人",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"替罗非班",aim:"抗血小板治疗",indication:"接受PCI的UA/NSTEMI病人/和选用保守治疗策略的中高危UA/NSTEMI病人",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"依替非巴肽",aim:"抗血小板治疗",indication:"接受PCI的UA/NSTEMI病人/和选用保守治疗策略的中高危UA/NSTEMI病人",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"西洛他唑",aim:"抗血小板治疗",indication:"阿司匹林不耐受病人的替代治疗",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"双嘧达莫",aim:"抗血小板治疗",side_effect:"冠状动脉窃血，加重心肌缺血",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"普通肝素",aim:"抗凝治疗",usage:"静脉注射",dosage:"80~85U/kg",side_effect:"血小板减少症",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"依诺肝素",aim:"抗凝治疗",side_effect:"血小板减少症",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"达肝素",aim:"抗凝治疗",side_effect:"血小板减少症",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"那曲肝素",aim:"抗凝治疗",side_effect:"血小板减少症",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"磺达肝葵钠",usage:"皮下注射",dosage:"2.5mg",frequency:"每日一次",aim:"抗凝治疗",indication:"采用保守策略的病人出血风险增加",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"比伐卢定",usage:"静脉滴注",dosage:"0.75mg/kg",aim:"抗凝治疗",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"他汀类药物",aim:"调脂治疗",side_effect:"肝酶升高/肌酶升高",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"ACEI",aim:"降低心血管事件发生率",indication:"不存在低血压压（收缩压<100mmHg或较基线下降30mmHg以上）/其他已知的禁忌证（如肾衰竭、双侧肾动脉狭窄和已知的过敏）",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:drug {name:"ARB",aim:"降低心血管事件发生率",indication:"ACEI不耐受",disease:"非ST段抬高型急性冠脉综合征"});
MATCH (ds:disease {name:"非ST段抬高型急性冠脉综合征"}),(dg:drug {disease:"非ST段抬高型急性冠脉综合征"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//8.1.1.2.2 ST段抬高型心肌梗死
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
CREATE (:drug {name:"阿昔单抗",aim:"抗血小板治疗",indication:"接受PCI的UA/NSTEMI病人/和选用保守治疗策略的中高危UA/NSTEMI病人",disease:"非ST段抬高型急性冠脉综合征"});
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
CREATE (:drug {name:"洋黄地制剂",aim:"抗心律失常和传导障碍治疗",indication:"室上性快速心律失常",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"胺碘酮",aim:"抗心律失常和传导障碍治疗",indication:"室上性快速心律失常",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"右旋糖酐40",usage:"静脉滴注",aim:"抗休克治疗",indication:"血容量不足/中心静脉压低/肺动脉楔压低",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"5%~10%葡萄糖液",usage:"静脉滴注",aim:"抗休克治疗",indication:"血容量不足/中心静脉压低/肺动脉楔压低",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"多巴胺",usage:"静脉滴注",dosage:"3~5µg/（kg·min）",aim:"抗休克治疗",indication:"补充血容量后血压仍不升，而PCWP和CI正常",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"去甲肾上腺素",usage:"静脉滴注",dosage:"2~8µg/（kg·min）",aim:"抗休克治疗",indication:"补充血容量后血压仍不升，而PCWP和CI正常",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"多巴酚丁胺",usage:"静脉滴注",dosage:"3~10µg/（kg·min）",aim:"抗休克治疗",indication:"补充血容量后血压仍不升，而PCWP和CI正常",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"硝普钠",usage:"静脉滴注",dosage:"15µg/（kg·min）",aim:"抗休克治疗",indication:"补充血容量后血压仍不升，而PCWP增高和CI低/周围血管显著收缩以致四肢厥冷并有发绀",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"硝酸甘油",usage:"静脉滴注",dosage:"10~20µg/（kg·min）",aim:"抗休克治疗",indication:"补充血容量后血压仍不升，而PCWP增高和CI低/周围血管显著收缩以致四肢厥冷并有发绀",disease:"ST段抬高型心肌梗死"});
CREATE (:drug {name:"洋黄地制剂",aim:"抗休克治疗",disease:"ST段抬高型心肌梗死"});
MATCH (ds:disease {name:"ST段抬高型心肌梗死"}),(dg:drug {disease:"ST段抬高型心肌梗死"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//8.1.1 冠状动脉痉挛
CREATE (:drug {name:"钙通道阻滞剂",disease:"冠状动脉痉挛"});
CREATE (:drug {name:"硝酸酯类药物",disease:"冠状动脉痉挛"});
CREATE (:drug {name:"β受体拮抗剂",disease:"冠状动脉痉挛",indication:"伴有固定狭窄的病人",side_effect:"加重或诱发痉挛"});
MATCH (ds:disease {name:"冠状动脉痉挛"}),(dg:drug {disease:"冠状动脉痉挛"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//8.1.2 心肌桥
CREATE (:drug {name:"β受体拮抗剂",disease:"心肌桥",aim:"降低心肌收缩力"});
CREATE (:drug {name:"钙通道阻滞剂",disease:"心肌桥",aim:"降低心肌收缩力"});
MATCH (ds:disease {name:"心肌桥"}),(dg:drug {disease:"心肌桥"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
CREATE (:drug {name:"硝酸酯类药物",prohibit_disease:"心肌桥"});
CREATE (:drug {name:"正性肌力药物",prohibit_disease:"心肌桥"});
MATCH (ds:disease {name:"心肌桥"}),(dg:drug {prohibit_disease:"心肌桥"}) CREATE (ds)-[:disease_prohibit_drug {reference:"内科学第九版"}]->(dg);
//8.1.3 X综合征
CREATE (:drug {name:"β受体拮抗剂",disease:"X综合征"});
CREATE (:drug {name:"硝酸酣类药物",disease:"X综合征"});
CREATE (:drug {name:"钙通道阻滞剂",disease:"X综合征"});
CREATE (:drug {name:"曲美他嗪",disease:"X综合征"});
CREATE (:drug {name:"ACEI类药物",disease:"X综合征",aim:"改善内皮功能"});
CREATE (:drug {name:"他汀类药物",disease:"X综合征",aim:"改善内皮功能"});
MATCH (ds:disease {name:"X综合征"}),(dg:drug {disease:"X综合征"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);


//8.2.1 急性心力衰竭
CREATE (:drug {name:"吗啡",dosage:"3~5mg",usage:"静脉注射",disease:"急性心力衰竭",aim:"镇静"});
CREATE (:drug {name:"呋塞米",dosage:"20~40mg",usage:"静脉注射",disease:"急性心力衰竭",aim:"快速利尿"});
CREATE (:drug {name:"氨茶碱",disease:"急性心力衰竭",aim:"解除支气管痉挛"});
CREATE (:drug {name:"毛花苷丙",dosage:"0.4~0.8mg",usage:"静脉注射",disease:"急性心力衰竭",indication:"有快速心室率的心房颤动并心室扩大伴左心室收缩功能不全者"});
CREATE (:drug {name:"硝普钠",dosage:"0.3µg/（kg·min）",usage:"静脉注射",disease:"急性心力衰竭",aim:"血管扩张剂"});
CREATE (:drug {name:"硝酸甘油 ",dosage:"0.3µg/（kg·min）",usage:"静脉注射",disease:"急性心力衰竭",aim:"血管扩张剂"});
CREATE (:drug {name:"双硝酸异山梨醇酯",disease:"急性心力衰竭",aim:"血管扩张剂"});
CREATE (:drug {name:"乌拉地尔",disease:"急性心力衰竭",aim:"血管扩张剂"});
CREATE (:drug {name:"奈西立肽",disease:"急性心力衰竭",aim:"血管扩张剂",indication:"急性失代偿性心衰"});
CREATE (:drug {name:"多巴胺",disease:"急性心力衰竭",aim:"正性肌力药物"});
CREATE (:drug {name:"多巴酚丁胺",disease:"急性心力衰竭",aim:"正性肌力药物",side_effect:"致心律失常"});
CREATE (:drug {name:"米力农",disease:"急性心力衰竭",aim:"正性肌力药物",side_effect:"致心律失常"});
CREATE (:drug {name:"左西孟旦",disease:"急性心力衰竭",aim:"正性肌力药物",indication:"无显著低血压或低血压倾向的急性左心衰病人"});
CREATE (:drug {name:"去甲肾上腺素",disease:"急性心力衰竭",aim:"血管收缩剂",indication:"正性肌力药无明显改善的心源性休克"});
CREATE (:drug {name:"肾上腺索",disease:"急性心力衰竭",aim:"血管收缩剂",indication:"正性肌力药无明显改善的心源性休克"});
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {disease:"急性心力衰竭"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//8.2.2 慢性心力衰竭
CREATE (:drug {name:"呋塞米",dosage:"20mg",usage:"口服",frequency:"每日1次",disease:"慢性心力衰竭",side_effect:"低血钾",aim:"快速利尿"});
CREATE (:drug {name:"氢氯噻嗪",dosage:"12~25mg",frequency:"每日1次",indication:"轻度心力衰竭",disease:"慢性心力衰竭",side_effect:"高尿酸血症/影响糖、脂代谢",aim:"利尿剂"});
CREATE (:drug {name:"螺内酯（安体舒通）",disease:"慢性心力衰竭",aim:"利尿剂",side_effect:"电解质紊乱"});
CREATE (:drug {name:"氨苯蝶啶",disease:"慢性心力衰竭",aim:"利尿剂",side_effect:"电解质紊乱"});
CREATE (:drug {name:"阿米洛利",disease:"慢性心力衰竭",aim:"利尿剂",side_effect:"电解质紊乱"});
CREATE (:drug {name:"托伐普坦",disease:"慢性心力衰竭",aim:"利尿剂",indication:"伴有低血钠症的心力衰竭"});
CREATE (:drug {name:"血管紧张素酶抑制剂",english_name:"ACEI",prohibit_drug:"非甾体类消炎药（NSAIDS）",aim:"RAAS抑制剂",disease:"慢性心力衰竭",side_effect:"低血压/肾功能一过性恶化/高血钾/干咳/血管性水肿",contraindication:"有威胁生命的不良反应（血管性水肿和无尿性肾衰竭）者/妊娠期妇女/ACEI过敏者",use_with_caution:"低血压/双侧肾动脉狭窄/血肌酐明显升高（>265μmol/L）/高血钾（>5.5mmol/L）"});
CREATE (:drug {name:"血管紧张素酶受体拮抗剂",english_name:"ARB",prohibit_drug:"血管紧张素酶抑制剂（ACEI）",aim:"RAAS抑制剂",disease:"慢性心力衰竭",indication:"ACEI引起干咳、血管性水肿/ACEI不耐受"});
CREATE (:drug {name:"血管紧张素酶受体脑啡肽酶抑制剂",english_name:"ARNI",aim:"RAAS抑制剂",disease:"慢性心力衰竭",indication:"HFrEF病人"});
CREATE (:drug {name:"依普利酮",aim:"RAAS抑制剂",disease:"慢性心力衰竭",indication:"老龄/糖尿病/肾功能不全病人"});
CREATE (:drug {name:"螺内酯",aim:"RAAS抑制剂",disease:"慢性心力衰竭",contraindication:"近期有肾功能不全/血肌酐升高/高钾血症病人"});
CREATE (:drug {name:"阿利吉仑",aim:"RAAS抑制剂",disease:"慢性心力衰竭",comment:"目前不推荐使用"});
CREATE (:drug {name:"美托洛尔",aim:"RAAS抑制剂",disease:"慢性心力衰竭",contraindication:"支气管痉挛性疾病/严重心动过缓/二度及二度以上房室阻滞/严重周围血管疾病/重度急性心衰"});
CREATE (:drug {name:"比索洛尔",aim:"RAAS抑制剂",disease:"慢性心力衰竭",contraindication:"支气管痉挛性疾病/严重心动过缓/二度及二度以上房室阻滞/严重周围血管疾病/重度急性心衰"});
CREATE (:drug {name:"卡维地洛",aim:"RAAS抑制剂",disease:"慢性心力衰竭",contraindication:"支气管痉挛性疾病/严重心动过缓/二度及二度以上房室阻滞/严重周围血管疾病/重度急性心衰"});
CREATE (:drug {name:"地高辛",aim:"正性肌力药",disease:"慢性心力衰竭",dosage:"0.125mg",frequency:"每日",side_effect:"洋黄地中毒"});
CREATE (:drug {name:"毛花苷丙",aim:"正性肌力药",disease:"慢性心力衰竭",usage:"静脉注射",indication:"急性心力衰竭/慢性心衰加重",side_effect:"洋黄地中毒"});
CREATE (:drug {name:"毒毛花苷K",aim:"正性肌力药",disease:"慢性心力衰竭",usage:"静脉注射",indication:"急性心力衰竭/慢性心衰加重",side_effect:"洋黄地中毒"});
CREATE (:drug {name:"多巴胺",aim:"正性肌力药",disease:"慢性心力衰竭",usage:"静脉注射",indication:"短期静脉应用"});
CREATE (:drug {name:"多巴酚丁胺",aim:"正性肌力药",disease:"慢性心力衰竭",usage:"静脉注射",indication:"短期静脉应用"});
CREATE (:drug {name:"米力农",aim:"正性肌力药",disease:"慢性心力衰竭",side_effect:"长期使用死亡率增加",indication:"对心脏术后急性收缩性心力衰竭/难治性心力衰竭/心脏移植前的终末期心力衰竭短期应用"});
CREATE (:drug {name:"伊伐布雷定",disease:"慢性心力衰竭",aim:"正性肌力药"});
CREATE (:drug {name:"扩血管药物",disease:"慢性心力衰竭",indication:"伴有心绞痛或高血压的病人",contraindication:"存在心脏流出道或瓣膜狭窄的病人"});
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {disease:"慢性心力衰竭"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//8.2.4 射血分数保留性心衰
CREATE (:drug {name:"利尿剂",disease:"射血分数保留性心衰",aim:"降低肺静脉压"});
CREATE (:drug {name:"静脉扩张剂（硝酸盐制剂）",disease:"射血分数保留性心衰",aim:"降低肺静脉压",side_effect:"过量致左心室充盈量和心排血量明显下降"});
CREATE (:drug {name:"β受体阻滞剂",disease:"射血分数保留性心衰",aim:"维持基础心律50~60次/分"});
CREATE (:drug {name:"维拉帕米",disease:"射血分数保留性心衰",aim:"改善舒张功能",indication:"肥厚型心肌病",side_effect:"负性肌力作用"});
CREATE (:drug {name:"地尔硫䓬",disease:"射血分数保留性心衰",aim:"改善舒张功能",indication:"肥厚型心肌病",side_effect:"负性肌力作用"});
CREATE (:drug {name:"ACEI",disease:"射血分数保留性心衰",aim:"改善舒张功能",indication:"高血压性心脏病/冠心病"});
CREATE (:drug {name:"ARB",disease:"射血分数保留性心衰",aim:"改善舒张功能",indication:"高血压性心脏病/冠心病"});
MATCH (ds:disease {name:"射血分数保留性心衰"}),(dg:drug {disease:"射血分数保留性心衰"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
CREATE (:drug {name:"正性肌力药物",prohibit_disease:"射血分数保留性心衰",indication:"无收缩障碍"});
MATCH (ds:disease {name:"射血分数保留性心衰"}),(dg:drug {prohibit_disease:"射血分数保留性心衰"}) CREATE (ds)-[:disease_prohibit_drug {reference:"内科学第九版"}]->(dg);

//8.3.1 二尖瓣狭窄
CREATE (:drug {name:"苄星青霉素",dosage:"120万U",usage:"肌内注射",disease:"二尖瓣狭窄",aim:"治疗风湿热"});
CREATE (:drug {name:"β受体拮抗剂",indication:"窦性心律病人在心律加快时呼吸困难",aim:"降低心律",disease:"二尖瓣狭窄"});
CREATE (:drug {name:"非二氢咄唗类钙通道阻滞剂",indication:"窦性心律病人在心律加快时呼吸困难",aim:"降低心律",disease:"二尖瓣狭窄"});
CREATE (:drug {name:"利尿药",indication:"存在肺淤血导致的呼吸困难",disease:"二尖瓣狭窄"});
CREATE (:drug {name:"镇静剂",indication:"并发大量咯血",disease:"二尖瓣狭窄",aim:"降低肺动脉压"});
CREATE (:drug {name:"利尿剂",indication:"并发大量咯血",usage:"静脉注射",aim:"降低肺动脉压",disease:"二尖瓣狭窄"});
CREATE (:drug {name:"毛花苷丙",indication:"并发房颤伴快速心室率",usage:"静脉注射",aim:"减慢心室率",disease:"二尖瓣狭窄"});
CREATE (:drug {name:"硝酸酯类药物",indication:"并发急性肺水肿",aim:"扩张静脉系统、减轻心脏前负荷",disease:"二尖瓣狭窄"});
CREATE (:drug {name:"洋地黄类药物",indication:"并发房颤",usage:"静脉注射",aim:"控制心室率",disease:"二尖瓣狭窄"});
CREATE (:drug {name:"地尔硫䓬",indication:"并发房颤",usage:"静脉注射",aim:"控制心室率",disease:"二尖瓣狭窄"});
CREATE (:drug {name:"艾司洛尔",indication:"并发房颤",usage:"静脉注射",aim:"控制心室率",disease:"二尖瓣狭窄"});
MATCH (ds:disease {name:"二尖瓣狭窄"}),(dg:drug {disease:"二尖瓣狭窄"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
CREATE (:drug {name:"地高辛",indication:"窦性心律的二尖瓣狭窄病人",prohibit_disease:"二尖瓣狭窄"});
MATCH (ds:disease {name:"二尖瓣狭窄"}),(dg:drug {prohibit_disease:"二尖瓣狭窄"}) CREATE (ds)-[:disease_prohibit_drug {reference:"内科学第九版"}]->(dg);
//8.3.2.1 急性二尖瓣关闭不全
CREATE (:drug {name:"动脉扩张剂",aim:"减低体循环血流阻力",disease:"急性二尖瓣关闭不全"});
MATCH (ds:disease {name:"急性二尖瓣关闭不全"}),(dg:drug {disease:"急性二尖瓣关闭不全"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
CREATE (:drug {name:"动脉扩张剂",indication:"低血压",prohibit_disease:"急性二尖瓣关闭不全"});
MATCH (ds:disease {name:"急性二尖瓣关闭不全"}),(dg:drug {prohibit_disease:"急性二尖瓣关闭不全"}) CREATE (ds)-[:disease_prohibit_drug {reference:"内科学第九版"}]->(dg);
//8.3.2.2 慢性二尖瓣关闭不全
CREATE (:drug {name:"血管紧张素酶抑制剂",english_name:"ACEI",indication:"有症状",aim:"减低左心室容积，缓解症状",disease:"慢性二尖瓣关闭不全"});
CREATE (:drug {name:"抗凝药物",indication:"合并房颤",disease:"慢性二尖瓣关闭不全"});
MATCH (ds:disease {name:"慢性二尖瓣关闭不全"}),(dg:drug {disease:"慢性二尖瓣关闭不全"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//8.3.3 主动脉瓣狭窄
CREATE (:drug {name:"利尿剂",indication:"心衰病人等待手术者过程中",aim:"缓解肺充血",disease:"主动脉瓣狭窄"});
MATCH (ds:disease {name:"主动脉瓣狭窄"}),(dg:drug {disease:"主动脉瓣狭窄"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
CREATE (:drug {name:"血管紧张素酶抑制剂",english_name:"ACEI",prohibit_disease:"主动脉瓣狭窄"});
CREATE (:drug {name:"β受体拮抗剂",prohibit_disease:"主动脉瓣狭窄"});
MATCH (ds:disease {name:"主动脉瓣狭窄"}),(dg:drug {prohibit_disease:"主动脉瓣狭窄"}) CREATE (ds)-[:disease_prohibit_drug {reference:"内科学第九版"}]->(dg);
//8.3.4.1 急性主动脉瓣关闭不全
CREATE (:drug {name:"多巴胺",indication:"外科术前",usage:"静脉注射",disease:"急性主动脉瓣关闭不全"});
CREATE (:drug {name:"多巴酚丁胺",indication:"外科术前",usage:"静脉注射",disease:"急性主动脉瓣关闭不全"});
CREATE (:drug {name:"硝普钠",indication:"外科术前",usage:"静脉注射",disease:"急性主动脉瓣关闭不全"});
CREATE (:drug {name:"呋塞米",indication:"外科术前",usage:"静脉注射",disease:"急性主动脉瓣关闭不全"});
MATCH (ds:disease {name:"急性主动脉瓣关闭不全"}),(dg:drug {disease:"急性主动脉瓣关闭不全"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//8.3.4.1 慢性主动脉瓣关闭不全
CREATE (:drug {name:"尼群地平",indication:"左心室扩大但收缩功能正常",aim:"延迟或减少主动脉瓣手术的需要",disease:"慢性主动脉瓣关闭不全"});
CREATE (:drug {name:"肼屈嗪",indication:"左心室扩大但收缩功能正常",aim:"延迟或减少主动脉瓣手术的需要",disease:"慢性主动脉瓣关闭不全"});
CREATE (:drug {name:"血管紧张素酶抑制剂",english_name:"ACEI",indication:"左心室扩大但收缩功能正常",aim:"延迟或减少主动脉瓣手术的需要",disease:"慢性主动脉瓣关闭不全"});
MATCH (ds:disease {name:"慢性主动脉瓣关闭不全"}),(dg:drug {disease:"慢性主动脉瓣关闭不全"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);

//十、非药物治疗
//10.1.1.1.1 稳定型心绞痛
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
//10.1.1.1.3 缺血性心肌病
CREATE (:treatment {name:"控制冠心病危险因素",disease:"缺血性心肌病"});
CREATE (:treatment {name:"改善心肌缺血",disease:"缺血性心肌病"});
CREATE (:treatment {name:"纠正心律失常",disease:"缺血性心肌病"});
CREATE (:treatment {name:"积极治疗心功能不全",disease:"缺血性心肌病"});
CREATE (:treatment {name:"经皮冠状动脉介入治疗",english_name:"PCI",disease:"缺血性心肌病",aim:"改善心肌功能"});
CREATE (:treatment {name:"冠状动脉旁路移植术",english_name:"CABG",disease:"缺血性心肌病",aim:"改善心肌功能"});
CREATE (:treatment {name:"自体骨髓干细胞移植",disease:"缺血性心肌病"});
CREATE (:treatment {name:"血管内皮生长因子基因治疗",disease:"缺血性心肌病"});
MATCH (d:disease {name:"缺血性心肌病"}),(t:treatment {disease:"缺血性心肌病"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//8.1.1.2.1 非ST段抬高型急性冠脉综合征
CREATE (:treatment {name:"卧床休息",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:treatment {name:"吸氧",indication:"有发组、呼吸困难或其他高危表现病人",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:treatment {name:"监测血氧饱和度（Sa02）",indication:"有发组、呼吸困难或其他高危表现病人",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:treatment {name:"积极处理可能引起心肌耗氧量增加的疾病",indication:"有发组、呼吸困难或其他高危表现病人",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:treatment {name:"经皮冠状动脉介入治疗",english_name:"PCI",disease:"非ST段抬高型急性冠脉综合征"});
CREATE (:treatment {name:"冠状动脉旁路移植术",english_name:"CABG",indication:"病变严重/有多支血管病变的症状严重/左心室功弄不全者",disease:"非ST段抬高型急性冠脉综合征"});
MATCH (d:disease {name:"非ST段抬高型急性冠脉综合征"}),(t:treatment {disease:"非ST段抬高型急性冠脉综合征"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//10.1.1.2.2 ST段抬高型心肌梗死
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

//10.1.2 冠状动脉痉挛
CREATE (:treatment {name:"戒烟",disease:"冠状动脉痉挛"});
CREATE (:treatment {name:"戒酒",disease:"冠状动脉痉挛"});
MATCH (d:disease {name:"冠状动脉痉挛"}),(t:treatment {disease:"冠状动脉痉挛"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//10.1.3 心肌桥
CREATE (:treatment {name:"手术分离壁冠状动脉",disease:"心肌桥"});
MATCH (d:disease {name:"心肌桥"}),(t:treatment {disease:"心肌桥"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);

//10.2.1 急性心力衰竭
CREATE (:treatment {name:"半卧位或端坐位，双腿下垂",disease:"急性心力衰竭"});
CREATE (:treatment {name:"吸氧",disease:"急性心力衰竭"});
CREATE (:treatment {name:"救治准备",disease:"急性心力衰竭"});
CREATE (:treatment {name:"出入量管理",disease:"急性心力衰竭"});
CREATE (:treatment {name:"机械通气",indication:"合并严重呼吸衰竭经常规治疗不能改善者及心肺复苏病人",disease:"急性心力衰竭"});
CREATE (:treatment {name:"连续性肾脏替代治疗",english_name:"CRRT",indication:"高容量负荷且对利尿剂抵抗、低钠血症且出现相应临床症状、肾功能严重受损且药物不能控制时",disease:"急性心力衰竭"});
CREATE (:treatment {name:"主动脉内球囊反搏",english_name:"IABP",indication:"冠心病急性左心衰病人",disease:"急性心力衰竭"});
CREATE (:treatment {name:"体外膜式氧合",english_name:"ECMO",indication:"心脏不能维持全身灌注/肺不能进行充分气体交换",disease:"急性心力衰竭"});
CREATE (:treatment {name:"可植入式电动左心室辅助泵Impella",indication:"高危险冠心病人/急性心肌梗死病人",disease:"急性心力衰竭"});
MATCH (d:disease {name:"急性心力衰竭"}),(t:treatment {disease:"急性心力衰竭"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//10.2.2 慢性心力衰竭
CREATE (:treatment {name:"病人教育",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"体重管理",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"饮食管理",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"休息与活动",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"病因治疗",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"消除诱因",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"心脏再同步化治疗",english_name:"CRT",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"植入型心律转复除颤器",english_name:"ICD",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"左室辅助装置",english_name:"LVAD",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"经导管二尖瓣修复术",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"经皮左心室室壁瘤减容术",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"心血管再生治疗",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"基因治疗",disease:"慢性心力衰竭"});
MATCH (d:disease {name:"慢性心力衰竭"}),(t:treatment {disease:"慢性心力衰竭"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//10.2.4 射血分数保留性心衰
CREATE (:treatment {name:"积极寻找并治疗基础病因",disease:"射血分数保留性心衰"});
CREATE (:treatment {name:"限制钠盐摄入",disease:"射血分数保留性心衰"});
CREATE (:treatment {name:"尽量维持窦性心律",disease:"射血分数保留性心衰"});
CREATE (:treatment {name:"保持房室顺序传导",disease:"射血分数保留性心衰"});
CREATE (:treatment {name:"保证心室舒张期充分的容量",disease:"射血分数保留性心衰"});
MATCH (d:disease {name:"射血分数保留性心衰"}),(t:treatment {disease:"射血分数保留性心衰"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//10.3.1 二尖瓣狭窄
CREATE (:treatment {name:"避免剧烈的体力活动",indication:"轻度二尖瓣狭窄无症状者",disease:"二尖瓣狭窄"});
CREATE (:treatment {name:"减少体力活动",indication:"存在肺淤血导致的呼吸困难",disease:"二尖瓣狭窄"});
CREATE (:treatment {name:"限制钠盐摄入",indication:"存在肺淤血导致的呼吸困难",disease:"二尖瓣狭窄"});
CREATE (:treatment {name:"电复律",indication:"合并房颤、出现肺水肿/休克/心绞痛/晕厥",disease:"二尖瓣狭窄"});
CREATE (:treatment {name:"经皮球囊二尖瓣成形术",english_name:"PBMV",indication:"单纯的二尖瓣狭窄病人",disease:"二尖瓣狭窄"});
CREATE (:treatment {name:"二尖瓣分离术",indication:"瓣叶严重钙化/病变累及腱索和乳头肌/左心房内有血栓者",disease:"二尖瓣狭窄"});
CREATE (:treatment {name:"人工瓣膜置换术",indication:"严重瓣叶和瓣下结构钙化、畸形，不宜做经皮球囊二尖瓣成形术或分离术者/二尖瓣狭窄合并明显二尖瓣关闭不全者",disease:"二尖瓣狭窄"});
MATCH (d:disease {name:"二尖瓣狭窄"}),(t:treatment {disease:"二尖瓣狭窄"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//10.3.2.1 急性二尖瓣关闭不全
CREATE (:treatment {name:"主动脉内球囊反搏",english_name:"IABP",indication:"低血压",disease:"急性二尖瓣关闭不全"});
CREATE (:treatment {name:"二尖瓣修补术",indication:"瓣膜损坏较轻，瓣叶无钙化，瓣环又扩大，但瓣下腱索无严重增厚者",disease:"急性二尖瓣关闭不全"});
CREATE (:treatment {name:"二尖瓣置换术",indication:"瓣膜损坏严重者",disease:"急性二尖瓣关闭不全"});
MATCH (d:disease {name:"急性二尖瓣关闭不全"}),(t:treatment {disease:"急性二尖瓣关闭不全"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//10.3.2.2 慢性二尖瓣关闭不全
CREATE (:treatment {name:"定期随访",indication:"无症状",disease:"慢性二尖瓣关闭不全"});
CREATE (:treatment {name:"避免竞技性运动",indication:"左心室明显增大（左心室舒张末内径≥60mm）/静息时存在左心室缩功能不全/存在肺动脉高压",disease:"慢性二尖瓣关闭不全"});
CREATE (:treatment {name:"二尖瓣修补术",indication:"瓣膜损坏较轻，瓣叶无钙化，瓣环又扩大，但瓣下腱索无严重增厚者",disease:"慢性二尖瓣关闭不全"});
CREATE (:treatment {name:"二尖瓣置换术",indication:"瓣膜损坏严重者",disease:"慢性二尖瓣关闭不全"});
MATCH (d:disease {name:"慢性二尖瓣关闭不全"}),(t:treatment {disease:"慢性二尖瓣关闭不全"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//10.3.3 主动脉瓣狭窄
CREATE (:treatment {name:"定期随访",indication:"无症状",disease:"主动脉瓣狭窄"});
CREATE (:treatment {name:"每2年复查一次",indication:"轻度狭窄，体力活动不受限制",disease:"主动脉瓣狭窄"});
CREATE (:treatment {name:"每6-12个月复查一次",indication:"避免剧烈体力活动",disease:"主动脉瓣狭窄"});
CREATE (:treatment {name:"电转复",indication:"出现房颤",disease:"主动脉瓣狭窄"});
CREATE (:treatment {name:"人工瓣膜置换术",indication:"重度狭窄伴心绞痛晕厥或心力衰竭症状的病人/无症状病人伴有有进行性心脏增大和（或）左心室功能进行性减退，活动时血压下降",disease:"主动脉瓣狭窄"});
CREATE (:treatment {name:"直视下主动脉瓣分离术",indication:"儿童和青少年的非钙化性先天性主动脉瓣严重狭窄者/无症状者",disease:"主动脉瓣狭窄"});
CREATE (:treatment {name:"经皮主动脉瓣球囊成形术",indication:"由于严重主动脉瓣狭窄的心源性休克/严重主动脉瓣狭窄需急诊非心脏手术治疗/严重主动脉瓣狭窄的妊娠妇女/严重主动脉瓣狭窄，拒绝手术治疗的病人",disease:"主动脉瓣狭窄"});
CREATE (:treatment {name:"经皮主动脉瓣置换术",english_name:"TAVI",indication:"不适合外科手术的高危病人（如极高龄、慢性肺部疾病、肾衰竭、贫血、肿瘤）",disease:"主动脉瓣狭窄"});
MATCH (d:disease {name:"主动脉瓣狭窄"}),(t:treatment {disease:"主动脉瓣狭窄"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//10.3.4.1 急性主动脉瓣关闭不全
CREATE (:treatment {name:"吸氧",indication:"外科术前",disease:"急性主动脉瓣关闭不全"});
CREATE (:treatment {name:"镇静",indication:"外科术前",disease:"急性主动脉瓣关闭不全"});
CREATE (:treatment {name:"Swan-Ganz导管床旁血流动力学监测",aim:"降低肺静脉压、增加心排出量、稳定血流动力学 ",disease:"急性主动脉瓣关闭不全"});
CREATE (:treatment {name:"人工瓣膜置换术",disease:"急性主动脉瓣关闭不全"});
CREATE (:treatment {name:"主动脉瓣修复术",disease:"急性主动脉瓣关闭不全"});
MATCH (d:disease {name:"急性主动脉瓣关闭不全"}),(t:treatment {disease:"急性主动脉瓣关闭不全"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//10.3.4.2 慢性主动脉瓣关闭不全
CREATE (:treatment {name:"随访",indication:"无症状且左心室功能正常者",disease:"慢性主动脉瓣关闭不全"});
CREATE (:treatment {name:"每1-2年随访一次",indication:"轻中度主动脉瓣关闭不全",disease:"慢性主动脉瓣关闭不全"});
CREATE (:treatment {name:"每半年随访一次",indication:"重度主动脉瓣关闭不全",disease:"慢性主动脉瓣关闭不全"});
CREATE (:treatment {name:"限制体力活动",indication:"预防感染性心内膜炎/预防风湿活动/左心室功能减低的病人",disease:"慢性主动脉瓣关闭不全"});
CREATE (:treatment {name:"主动脉瓣置换术",indication:"原发性主动脉瓣关闭不全",disease:"慢性主动脉瓣关闭不全"});
CREATE (:treatment {name:"主动脉瓣成形术",indication:"继发性主动脉瓣关闭不全",disease:"慢性主动脉瓣关闭不全"});
CREATE (:treatment {name:"瓣膜修复术",indication:"瓣叶穿孔",disease:"慢性主动脉瓣关闭不全"});
MATCH (d:disease {name:"慢性主动脉瓣关闭不全"}),(t:treatment {disease:"慢性主动脉瓣关闭不全"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//10.4 多瓣膜病
CREATE (:treatment {name:"手术治疗",disease:"多瓣膜病"});
MATCH (d:disease {name:"多瓣膜病"}),(t:treatment {disease:"多瓣膜病"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
