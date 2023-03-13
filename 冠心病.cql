MATCH (n) detach delete n;

//冠状动脉粥样硬化性心脏病、冠心病、缺血性心脏病等同
CREATE (:disease {name:"冠状动脉粥样硬化性心脏病",abbreviation:"冠心病",synonym:"缺血性心脏病",english_name:"CHD",definition:"指冠状动脉（冠脉）发生粥样硬化引起管腔狭窄或闭，导致心肌缺血缺氧或坏死而引起的心脏病。"});

//冠心病包含慢性心肌缺血综合征（又称慢性冠脉疾病）和急性冠状动脉综合征
CREATE (:disease {name:"慢性心肌缺血综合征",enlish_name:"CIS/CAD",synonym:"慢性冠脉疾病"});
CREATE (:disease {name:"急性冠状动脉综合征",english_name:"ACS",abbreviation:"急性冠脉综合征",definition:"一组由急性心肌缺血引起的临床综合征"});
MATCH (dc1:disease {name:"冠状动脉粥样硬化性心脏病"}),(dc2:disease {name:"慢性心肌缺血综合征"}) CREATE (dc1)-[:include_disease {reference:"内科学第九版"}]->(dc2);
MATCH (dc1:disease {name:"冠状动脉粥样硬化性心脏病"}),(dc2:disease {name:"急性冠状动脉综合征"}) CREATE (dc1)-[:include_disease {reference:"内科学第九版"}]->(dc2);

CREATE (:disease {name:"猝死"});
CREATE (:disease {name:"稳定型心绞痛",synonym:"劳力性心绞痛"});
CREATE (:disease {name:"隐匿型冠心病",synonym:"无症状冠心病",definition:"没有心绞痛的临床症状，但有心肌缺血的客观证据（心电活动、心肌血流灌注及心肌代谢等异常）的冠心病"});
CREATE (:disease {name:"缺血性心肌病",english_name:"ICM",definition:"冠心病的一种特殊类型或晚期阶段。指由冠状动脉粥样硬化引起长期心肌缺血，导致心肌弥漫性纤维化，产生与原发性扩张型心肌病类似的临床表现。"});
CREATE (:disease {name:"不稳定型心绞痛",english_name:"UA"});
CREATE (:disease {name:"非ST段抬高型心肌梗死",english_name:"NSTEMI"});
CREATE (:disease {name:"非ST段抬高型急性冠脉综合征",english_name:"NSTEACS",definition:"由于动脉粥样斑块破裂或糜烂，伴有不同程度的表面血栓形成、血管痉挛以及血管栓塞所导致的一组临床症状"});
MATCH (d1:disease {name:"非ST段抬高型急性冠脉综合征"}), (d2:disease {name:"非ST段抬高型心肌梗死"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"非ST段抬高型急性冠脉综合征"}), (d2:disease {name:"不稳定型心绞痛"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);
CREATE (:disease {name:"ST段抬高型心肌梗死",english_name:"STEMI"});
CREATE (:disease {name:"冠状动脉非阻塞性心肌梗死",english_name:"MINOCA"});

MATCH (dc:disease {name:"慢性心肌缺血综合征"}),(d:disease {name:"稳定型心绞痛"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"慢性心肌缺血综合征"}),(d:disease {name:"隐匿型冠心病"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"慢性心肌缺血综合征"}),(d:disease {name:"缺血性心肌病"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"急性冠状动脉综合征"}),(d:disease {name:"非ST段抬高型急性冠脉综合征"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"急性冠状动脉综合征"}),(d:disease {name:"猝死"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"急性冠状动脉综合征"}),(d:disease {name:"ST段抬高型心肌梗死"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);

CREATE (:disease {name:"充血型缺血性心肌病"});
CREATE (:disease {name:"限制型缺血性心肌病",synonym:"硬心综合征"});
MATCH (d1:disease {name:"缺血性心肌病"}), (d2:disease {name:"充血型缺血性心肌病"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"缺血性心肌病"}), (d2:disease {name:"限制型缺血性心肌病"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);

CREATE (:disease {name:"冠状动脉痉挛"});
CREATE (:disease {name:"冠状动脉闭塞性痉挛"});
CREATE (:disease {name:"冠状动脉非闭塞性痉挛"});
MATCH (d1:disease {name:"冠状动脉痉挛"}), (d2:disease {name:"冠状动脉闭塞性痉挛"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"冠状动脉痉挛"}), (d2:disease {name:"冠状动脉非闭塞性痉挛"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);

CREATE (:disease {name:"心肌桥"});
CREATE (:disease {name:"X综合征"});

CREATE (:disease:symptom {name:"静息型心绞痛",characteristic:"发作于休息时，持续时间>20分钟"});
CREATE (:disease:symptom {name:"初发型心绞痛",characteristic:"通常在首发症状1~2月内、很轻的体力活动可诱发（程度至少达CCSⅢ级）"});
CREATE (:disease:symptom {name:"恶化型心绞痛",characteristic:"在相对稳定的劳力性心绞痛基础上心绞痛逐渐增强（疼痛更剧烈、时间更长或更频繁、按CCS分级至少增加Ⅰ级水平）"});
MATCH (d1:disease {name:"不稳定型心绞痛"}), (d2:disease {name:"静息型心绞痛"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"不稳定型心绞痛"}), (d2:disease {name:"初发型心绞痛"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"不稳定型心绞痛"}), (d2:disease {name:"恶化型心绞痛"}) CREATE (d1)-[:include_disease {reference:"内科学第九版"}]->(d2);



//心衰大类
CREATE (:disease {name:"心力衰竭",abbreviation:"心衰",definition:"是各种心脏结构或功能性疾病导致心室充盈和（或）射血功能受损，心排血量不能满足机体组织代谢需要，以肺循环和（或）体循环淤血，器官、组织血液灌注不足为临床表现的一组综合征"});
CREATE (:disease {name:"左心衰竭"});
CREATE (:disease {name:"右心衰竭"});
CREATE (:disease {name:"全心衰竭"});
CREATE (:disease {name:"急性心力衰竭"});
CREATE (:disease {name:"慢性心力衰竭",english_name:"CHF"});
CREATE (:disease {name:"射血分数降低性心衰",enlish_name:"HFrEF",synonym:"收缩性心衰"});
CREATE (:disease {name:"射血分数保留性心衰",enlish_name:"HFpEF",synonym:"舒张性心衰"});
CREATE (:disease {name:"中间范围射血分数心衰",enlish_name:"HFmrEF"});
CREATE (:disease {name:"急性左心衰竭"});
CREATE (:disease {name:"急性右心衰竭"});

MATCH (dc:disease {name:"心力衰竭"}),(d:disease {name:"急性心力衰竭"}) CREATE (dc)-[:include_disease {taxonomy:"根据心衰发生的时间、速度、严重程度",reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"心力衰竭"}),(d:disease {name:"慢性心力衰竭"}) CREATE (dc)-[:include_disease {taxonomy:"根据心衰发生的时间、速度、严重程度",reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"心力衰竭"}),(d:disease {name:"射血分数保留性心衰"}) CREATE (dc)-[:include_disease {taxonomy:"LVEF≥50%",reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"心力衰竭"}),(d:disease {name:"射血分数降低性心衰"}) CREATE (dc)-[:include_disease {taxonomy:"LVEF<40%",reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"心力衰竭"}),(d:disease {name:"中间范围射血分数心衰"}) CREATE (dc)-[:include_disease {taxonomy:"40%≤LVEF<50%",reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"急性心力衰竭"}),(d:disease {name:"急性左心衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"急性心力衰竭"}),(d:disease {name:"急性右心衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"慢性心力衰竭"}),(d:disease {name:"左心衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"慢性心力衰竭"}),(d:disease {name:"右心衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"慢性心力衰竭"}),(d:disease {name:"全心衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
// MATCH (dc:disease {name:"慢性心力衰竭"}),(d:disease {name:"射血分数降低性心衰"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
// MATCH (dc:disease {name:"慢性心力衰竭"}),(d:disease {name:"射血分数保留性心衰"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
// MATCH (dc:disease {name:"慢性心力衰竭"}),(d:disease {name:"中间范围射血分数心衰"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
// MATCH (dc:disease {name:"急性心力衰竭"}),(d:disease {name:"射血分数降低性心衰"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
// MATCH (dc:disease {name:"急性心力衰竭"}),(d:disease {name:"射血分数保留性心衰"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
// MATCH (dc:disease {name:"急性心力衰竭"}),(d:disease {name:"中间范围射血分数心衰"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);

CREATE (:disease {name:"心脏瓣膜病",definition:"由多种原因引起的心脏瓣膜狭窄或（和）关闭不全所致的心脏疾病"});
CREATE (:disease {name:"二尖瓣狭窄",english_name:"MS"});
CREATE (:disease {name:"急性二尖瓣关闭不全"});
CREATE (:disease {name:"慢性二尖瓣关闭不全"});
CREATE (:disease {name:"二尖瓣关闭不全"});
CREATE (:disease {name:"主动脉瓣狭窄"});
CREATE (:disease {name:"主动脉瓣关闭不全"});
CREATE (:disease {name:"多瓣膜病"});
MATCH (dc:disease {name:"二尖瓣关闭不全"}),(d:disease {name:"急性二尖瓣关闭不全"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"二尖瓣关闭不全"}),(d:disease {name:"慢性二尖瓣关闭不全"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"心脏瓣膜病"}),(d:disease {name:"二尖瓣狭窄"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"心脏瓣膜病"}),(d:disease {name:"二尖瓣狭窄"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"心脏瓣膜病"}),(d:disease {name:"二尖瓣关闭不全"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"心脏瓣膜病"}),(d:disease {name:"主动脉瓣狭窄"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"心脏瓣膜病"}),(d:disease {name:"主动脉瓣关闭不全"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
MATCH (dc:disease {name:"心脏瓣膜病"}),(d:disease {name:"多瓣膜病"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
CREATE (:disease {name:"风湿性心脏病",abbreviation:"风心病",english_name:"RHD",definition:"风湿性炎症导致的瓣膜损害"});
MATCH (dc:disease {name:"心脏瓣膜病"}),(d:disease {name:"风湿性心脏病"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);

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



//危险因素
CREATE (:risk_factor {factor:"年齡>40"});
CREATE (:risk_factor {factor:"男性"});
CREATE (:risk_factor {factor:"血脂异常"});
CREATE (:risk_factor {factor:"高血压"});
CREATE (:risk_factor {factor:"吸烟"});
CREATE (:risk_factor {factor:"糖耐量异常"});
CREATE (:risk_factor {factor:"肥胖"});
CREATE (:risk_factor {factor:"家族史"});
CREATE (:risk_factor {factor:"A型性格"});
CREATE (:risk_factor {factor:"口服避孕药"});
CREATE (:risk_factor {factor:"高热量饮食"});
CREATE (:risk_factor {factor:"绝经期前女性"});
MATCH (d:disease {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"年齡>40"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);
MATCH (d:disease {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"血脂异常"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);
MATCH (d:disease {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"男性"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);
MATCH (d:disease {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"高血压"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);
MATCH (d:disease {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"糖尿病"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);
MATCH (d:disease {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"吸烟"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);
MATCH (d:disease {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"高热量饮食"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);
MATCH (d:disease {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"口服避孕药"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);
MATCH (d:disease {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"家族史"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);
MATCH (d:disease {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"肥胖"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);
MATCH (d:disease {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"糖耐量异常"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);
MATCH (d:disease {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"A型性格"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);
MATCH (d:disease {name:"冠状动脉痉挛"}),(r:risk_factor {factor:"吸烟"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);
MATCH (d:disease {name:"X综合征"}),(r:risk_factor {factor:"绝经期前女性"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);

CREATE (:risk_factor {factor:"年齡>70"});
MATCH (d:disease {name:"心力衰竭"}),(r:risk_factor {factor:"年齡>70"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);

CREATE (:risk_factor {factor:"年龄40~50岁"});
CREATE (:risk_factor {factor:"女性"});
MATCH (d:disease {name:"二尖瓣狭窄"}),(r:risk_factor {factor:"年龄40~50岁"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);
MATCH (d:disease {name:"二尖瓣狭窄"}),(r:risk_factor {factor:"女性"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);

//病因cause
CREATE (:cause {name:"心肌梗死"});
CREATE (:cause {name:"慢性心肌缺血"});
CREATE (:cause {name:"心肌炎"});
CREATE (:cause {name:"扩张型心肌病"});
CREATE (:cause {name:"家族性扩张型心肌病"});
CREATE (:cause {name:"肥厚型心肌病"});
CREATE (:cause {name:"右室心肌病"});
CREATE (:cause {name:"心肌致密化不全"});
CREATE (:cause {name:"线粒体肌病"});
CREATE (:cause {name:"糖尿病"});
CREATE (:cause {name:"甲状腺疾病"});
CREATE (:cause {name:"心肌淀粉样变性"});
CREATE (:cause {name:"结缔组织病"});
CREATE (:cause {name:"心脏毒性药物"});
CREATE (:cause {name:"高血压"});
CREATE (:cause {name:"主动脉瓣狭窄"});
CREATE (:cause {name:"肺动脉高压"});
CREATE (:cause {name:"肺动脉瓣狭窄"});
CREATE (:cause {name:"心脏瓣膜关闭不全"});
CREATE (:cause {name:"先天性心血管病"});
CREATE (:cause {name:"慢性贫血"});
CREATE (:cause {name:"甲状腺功能亢进症"});
CREATE (:cause {name:"围生期心肌病"});
CREATE (:cause {name:"体循环动静脉瘘"});
CREATE (:cause {name:"二尖瓣狭窄"});
CREATE (:cause {name:"心脏压塞"});
CREATE (:cause {name:"限制性心肌病"});
CREATE (:cause {name:"窄缩性心包炎"});

MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"心肌梗死"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"慢性心肌缺血"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"心肌炎"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"扩张型心肌病"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"家族性扩张型心肌病"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"肥厚型心肌病"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"右室心肌病"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"心肌致密化不全"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"线粒体肌病"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"糖尿病"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"甲状腺疾病"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"心肌淀粉样变性"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"结缔组织病"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"心脏毒性药物"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"高血压"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"主动脉瓣狭窄"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"肺动脉高压"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"心脏瓣膜关闭不全"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"先天性心血管病"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"慢性贫血"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"甲状腺功能亢进症"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"围生期心肌病"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"体循环动静脉瘘"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"二尖瓣狭窄"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"心脏压塞"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"限制性心肌病"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"窄缩性心包炎"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:cause {name:"肺动脉瓣狭窄"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

CREATE (:cause {name:"炎症"});
CREATE (:cause {name:"黏液样变性"});
CREATE (:cause {name:"先天性畸形"});
CREATE (:cause {name:"缺血性坏死"});
CREATE (:cause {name:"创伤"});
CREATE (:cause {name:"风湿热"});
MATCH (d:disease {name:"心脏瓣膜病"}),(c:cause {name:"炎症"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心脏瓣膜病"}),(c:cause {name:"黏液样变性"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心脏瓣膜病"}),(c:cause {name:"先天性畸形"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心脏瓣膜病"}),(c:cause {name:"缺血性坏死"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心脏瓣膜病"}),(c:cause {name:"创伤"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心脏瓣膜病"}),(c:cause {name:"风湿热"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

CREATE (:cause {name:"先天性发育异常"});
CREATE (:cause {name:"瓣环钙化"});
CREATE (:cause {name:"老年性退行性改变"});
CREATE (:cause {name:"风湿关节炎"});
CREATE (:cause {name:"系统性红斑狼疮"});
CREATE (:cause {name:"硬皮病"});
CREATE (:cause {name:"Coxsackie病毒"});
MATCH (d:disease {name:"二尖瓣狭窄"}),(c:cause {name:"先天性发育异常"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"二尖瓣狭窄"}),(c:cause {name:"瓣环钙化"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"二尖瓣狭窄"}),(c:cause {name:"老年性退行性改变"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"二尖瓣狭窄"}),(c:cause {name:"风湿关节炎"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"二尖瓣狭窄"}),(c:cause {name:"系统性红斑狼疮"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"二尖瓣狭窄"}),(c:cause {name:"硬皮病"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"二尖瓣狭窄"}),(c:cause {name:"Coxsackie病毒"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);



//诱因
CREATE (:inducement {name:"呼吸道感染"});
CREATE (:inducement {name:"感染性心内膜炎"});
CREATE (:inducement {name:"心房颤动"});
CREATE (:inducement {name:"快速型心律失常"});
CREATE (:inducement {name:"严重缓慢型心律失常"});
CREATE (:inducement {name:"钠盐摄入过多"});
CREATE (:inducement {name:"静脉输液过多过快"});
CREATE (:inducement {name:"妊娠后期"});
CREATE (:inducement {name:"分娩过程"});
CREATE (:inducement {name:"暴怒"});
CREATE (:inducement {name:"不恰当使用利尿药物"});
CREATE (:inducement {name:"不恰当使用降血压药"});
CREATE (:inducement {name:"冠心病发生心肌梗死"});
CREATE (:inducement {name:"风湿性心瓣膜病出现风湿活动"});
CREATE (:inducement {name:"原有心脏病合并甲状腺功能亢进"});
CREATE (:inducement {name:"原有心脏病合并贫血"});

MATCH (d:disease {name:"心力衰竭"}),(c:inducement {name:"呼吸道感染"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:inducement {name:"感染性心内膜炎"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:inducement {name:"心房颤动"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:inducement {name:"快速型心律失常"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:inducement {name:"严重缓慢型心律失常"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:inducement {name:"钠盐摄入过多"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:inducement {name:"静脉输液过多过快"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:inducement {name:"妊娠后期"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:inducement {name:"分娩过程"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:inducement {name:"暴怒"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:inducement {name:"不恰当使用利尿药物"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:inducement {name:"不恰当使用降血压药"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:inducement {name:"冠心病发生心肌梗死"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:inducement {name:"风湿性心瓣膜病出现风湿活动"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:inducement {name:"原有心脏病合并甲状腺功能亢进"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"心力衰竭"}),(c:inducement {name:"原有心脏病合并贫血"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);

CREATE (:inducement {name:"体力劳动"});
CREATE (:inducement {name:"情绪激动"});
CREATE (:inducement {name:"饱食"});
CREATE (:inducement {name:"寒冷"});
CREATE (:inducement {name:"吸烟"});
CREATE (:inducement {name:"心动过速"});
CREATE (:inducement {name:"休克"});
MATCH (d:disease {name:"稳定型心绞痛"}),(c:inducement {name:"体力劳动"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:inducement {name:"情绪激动"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:inducement {name:"饱食"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:inducement {name:"寒冷"}) CREATE (c)<-[:disease_inducement {晨起6时至12时reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:inducement {name:"吸烟"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:inducement {name:"心动过速"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:inducement {name:"休克"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);

CREATE (:inducement {name:"感染"});
CREATE (:inducement {name:"甲状腺功能亢进"});
CREATE (:inducement {name:"心律失常"});
CREATE (:inducement {name:"低血压"});
CREATE (:inducement {name:"贫血"});
CREATE (:inducement {name:"低血氧症"});
MATCH (d:disease {english_name:"NSTEACS"}),(c:inducement {name:"感染"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"NSTEACS"}),(c:inducement {name:"甲状腺功能亢进"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"NSTEACS"}),(c:inducement {name:"心律失常"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"NSTEACS"}),(c:inducement {name:"低血氧症"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"NSTEACS"}),(c:inducement {name:"低血压"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"NSTEACS"}),(c:inducement {name:"贫血"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);

CREATE (:inducement {name:"晨起"});
CREATE (:inducement {name:"饱餐"});
CREATE (:inducement {name:"重体力活动"});
CREATE (:inducement {name:"情绪过分激动"});
CREATE (:inducement {name:"血压剧升"});
CREATE (:inducement {name:"用力排便"});
// CREATE (:inducement {name:"休克"});
CREATE (:inducement {name:"脱水"});
CREATE (:inducement {name:"出血"});
CREATE (:inducement {name:"外科手术"});
CREATE (:inducement {name:"严重心律失常"});
MATCH (d:disease {english_name:"STEMI"}),(c:inducement {name:"晨起"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:inducement {name:"饱餐"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:inducement {name:"重体力活动"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:inducement {name:"情绪过分激动"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:inducement {name:"血压剧升"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:inducement {name:"用力排便"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:inducement {name:"休克"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:inducement {name:"脱水"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:inducement {name:"外科手术"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:inducement {name:"严重心律失常"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:inducement {name:"出血"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);

// CREATE (:inducement {name:"吸烟"});
CREATE (:inducement {name:"酒精"});
CREATE (:inducement {name:"毒品"});
MATCH (d:disease {name:"冠状动脉痉挛"}),(c:inducement {name:"吸烟"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"冠状动脉痉挛"}),(c:inducement {name:"酒精"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"冠状动脉痉挛"}),(c:inducement {name:"毒品"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);

//mechanism
// CREATE (:mechanism {description:"暂时的缺血缺氧"});
// CREATE (:mechanism {description:"持续严重的心肌缺血"});


CREATE (:mechanism {description:"冠状动脉固定狭窄"});
CREATE (:mechanism {description:"心脏负荷增加"});
CREATE (:mechanism {description:"心率增快"});
CREATE (:mechanism {description:"心肌张力增加"});
CREATE (:mechanism {description:"心肌收缩力增加"});
CREATE (:mechanism {description:"冠状动脉供血不足"});
CREATE (:mechanism {description:"心肌耗氧量增加"});
MATCH (m:mechanism {description:"心脏负荷增加"}),(c:inducement {name:"体力劳动"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心脏负荷增加"}),(c:inducement {name:"情绪激动"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心脏负荷增加"}),(c:inducement {name:"饱食"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心脏负荷增加"}),(c:inducement {name:"寒冷"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心脏负荷增加"}),(c:inducement {name:"吸烟"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心脏负荷增加"}),(c:inducement {name:"心动过速"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心脏负荷增加"}),(c:inducement {name:"休克"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m1:mechanism {description:"心脏负荷增加"}),(m2:mechanism {description:"心率增快"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心脏负荷增加"}),(m2:mechanism {description:"心肌张力增加"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心脏负荷增加"}),(m2:mechanism {description:"心肌收缩力增加"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心率增快"}),(m2:mechanism {description:"心肌耗氧量增加"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌张力增加"}),(m2:mechanism {description:"心肌耗氧量增加"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌收缩力增加"}),(m2:mechanism {description:"心肌耗氧量增加"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"冠状动脉固定狭窄"}),(m2:mechanism {description:"冠状动脉供血不足"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);

CREATE (:mechanism {description:"冠脉粥样硬化"});
CREATE (:mechanism {description:"心肌缺血"});
CREATE (:mechanism {description:"心肌缺氧"});
CREATE (:mechanism {description:"心肌细胞减少"});
CREATE (:mechanism {description:"心肌细胞坏死"});
CREATE (:mechanism {description:"心肌瘢痕"});
CREATE (:mechanism {description:"心肌弥漫性纤维化"});
MATCH (m1:mechanism {description:"冠脉粥样硬化"}),(m2:mechanism {description:"心肌缺血"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"冠脉粥样硬化"}),(m2:mechanism {description:"心肌缺氧"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌缺血"}),(m2:mechanism {description:"心肌细胞减少"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌缺血"}),(m2:mechanism {description:"心肌细胞坏死"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌缺血"}),(m2:mechanism {description:"心肌弥漫性纤维化"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌缺血"}),(m2:mechanism {description:"心肌瘢痕"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌缺氧"}),(m2:mechanism {description:"心肌细胞减少"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌缺氧"}),(m2:mechanism {description:"心肌细胞坏死"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌缺氧"}),(m2:mechanism {description:"心肌弥漫性纤维化"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌缺氧"}),(m2:mechanism {description:"心肌瘢痕"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);

CREATE (:mechanism {description:"不稳定粥样硬化斑块破裂、糜烂"});
CREATE (:mechanism {description:"血小板聚集"});
CREATE (:mechanism {description:"血栓形成"});
CREATE (:mechanism {description:"冠状动脉痉挛收缩"});
CREATE (:mechanism {description:"微血管栓塞"});
CREATE (:mechanism {description:"心肌供氧减少"});
CREATE (:mechanism {description:"心肌缺血加重"});
MATCH (m1:mechanism {description:"冠脉粥样硬化"}),(m2:mechanism {description:"不稳定粥样硬化斑块破裂、糜烂"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"冠脉粥样硬化"}),(m2:mechanism {description:"不稳定粥样硬化斑块糜烂"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"不稳定粥样硬化斑块破裂、糜烂"}),(m2:mechanism {description:"血小板聚集"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"不稳定粥样硬化斑块破裂、糜烂"}),(m2:mechanism {description:"血栓形成"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"不稳定粥样硬化斑块破裂、糜烂"}),(m2:mechanism {description:"冠状动脉痉挛收缩"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"不稳定粥样硬化斑块破裂、糜烂"}),(m2:mechanism {description:"微血管栓塞"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"血小板聚集"}),(m2:mechanism {description:"心肌供氧减少"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"血栓形成"}),(m2:mechanism {description:"心肌供氧减少"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"冠状动脉痉挛收缩"}),(m2:mechanism {description:"心肌供氧减少"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"微血管栓塞"}),(m2:mechanism {description:"心肌缺血加重"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"血小板聚集"}),(m2:mechanism {description:"心肌缺血加重"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"血栓形成"}),(m2:mechanism {description:"心肌缺血加重"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"冠状动脉痉挛收缩"}),(m2:mechanism {description:"心肌缺血加重"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);

CREATE (:mechanism {description:"血管管腔闭塞",duration:"≥20~30min"});
CREATE (:mechanism {description:"不稳定粥样硬化斑块破溃"});
CREATE (:mechanism {description:"继发血栓形成"});
CREATE (:mechanism {description:"交感神经活动增强"});
CREATE (:mechanism {description:"机体应激反应性增强"});
CREATE (:mechanism {description:"血压增高"});
CREATE (:mechanism {description:"冠状动脉张力增高"});
CREATE (:mechanism {description:"血脂增高"});
CREATE (:mechanism {description:"血粘稠度增高"});
CREATE (:mechanism {description:"左心室负荷加重"});
CREATE (:mechanism {description:"心排量骤降"});
CREATE (:mechanism {description:"冠状动脉灌注量锐减"});

MATCH (m:mechanism {description:"交感神经活动增强"}),(c:inducement {name:"晨起"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"血脂增高"}),(c:inducement {name:"饱餐"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"血粘稠度增高"}),(c:inducement {name:"饱餐"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"左心室负荷加重"}),(c:inducement {name:"重体力活动"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"左心室负荷加重"}),(c:inducement {name:"情绪过分激动"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"左心室负荷加重"}),(c:inducement {name:"血压剧升"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"左心室负荷加重"}),(c:inducement {name:"用力排便"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心排量骤降"}),(c:inducement {name:"休克"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心排量骤降"}),(c:inducement {name:"脱水"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心排量骤降"}),(c:inducement {name:"出血"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心排量骤降"}),(c:inducement {name:"外科手术"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心排量骤降"}),(c:inducement {name:"严重心律失常"}) CREATE (c)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m);

MATCH (m1:mechanism {description:"交感神经活动增强"}),(m2:mechanism {description:"机体应激反应性增强"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"机体应激反应性增强"}),(m2:mechanism {description:"心肌张力增加"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"机体应激反应性增强"}),(m2:mechanism {description:"心率增快"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"机体应激反应性增强"}),(m2:mechanism {description:"血压增高"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"机体应激反应性增强"}),(m2:mechanism {description:"冠状动脉张力增高"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌张力增加"}),(m2:mechanism {description:"不稳定粥样硬化斑块破溃"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心率增快"}),(m2:mechanism {description:"不稳定粥样硬化斑块破溃"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"血压增高"}),(m2:mechanism {description:"不稳定粥样硬化斑块破溃"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"冠状动脉张力增高"}),(m2:mechanism {description:"不稳定粥样硬化斑块破溃"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"血脂增高"}),(m2:mechanism {description:"不稳定粥样硬化斑块破溃"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"血粘稠度增高"}),(m2:mechanism {description:"不稳定粥样硬化斑块破溃"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"左心室负荷加重"}),(m2:mechanism {description:"不稳定粥样硬化斑块破溃"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心排量骤降"}),(m2:mechanism {description:"冠状动脉灌注量锐减"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心排量骤降"}),(m2:mechanism {description:"不稳定粥样硬化斑块破溃"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"不稳定粥样硬化斑块破溃"}),(m2:mechanism {description:"继发血栓形成"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"继发血栓形成"}),(m2:mechanism {description:"血管管腔闭塞"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
CREATE (:mechanism {description:"壁冠状动脉在收缩期被挤压"});
CREATE (:mechanism {description:"远端心肌缺血"});
MATCH (m1:mechanism {description:"壁冠状动脉在收缩期被挤压"}),(m2:mechanism {description:"远端心肌缺血"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);

MATCH (d:disease {name:"稳定型心绞痛"}),(m:mechanism {description:"冠状动脉供血不足"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);
MATCH (d:disease {name:"稳定型心绞痛"}),(m:mechanism {description:"心肌耗氧量增加"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);
MATCH (d:disease {name:"缺血性心肌病"}),(m:mechanism {description:"心肌细胞减少"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);
MATCH (d:disease {name:"缺血性心肌病"}),(m:mechanism {description:"心肌细胞坏死"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);
MATCH (d:disease {name:"缺血性心肌病"}),(m:mechanism {description:"心肌弥漫性纤维化"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);
MATCH (d:disease {name:"缺血性心肌病"}),(m:mechanism {description:"心肌瘢痕"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);
MATCH (d:disease {english_name:"UA"}),(m:mechanism {description:"心肌供氧减少"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);
MATCH (d:disease {english_name:"UA"}),(m:mechanism {description:"心肌缺血"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);
MATCH (d:disease {english_name:"NSTEMI"}),(m:mechanism {description:"心肌供氧减少"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);
MATCH (d:disease {english_name:"NSTEMI"}),(m:mechanism {description:"心肌缺血加重"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);
MATCH (d:disease {english_name:"STEMI"}),(m:mechanism {description:"血管管腔闭塞"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);
MATCH (d:disease {name:"心肌桥"}),(m:mechanism {description:"远端心肌缺血"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);


CREATE (:mechanism {description:"心肌损伤"});
CREATE (:mechanism {description:"Frank-Starling机制"});
CREATE (:mechanism {description:"心室重塑"});
CREATE (:mechanism {description:"交感神经兴奋性增强"});
CREATE (:mechanism {description:"RAAS激活"});
CREATE (:mechanism {description:"精氨酸加压素增加"});
CREATE (:mechanism {description:"利钠肽分泌增加"});

MATCH (m1:mechanism {description:"心肌损伤"}),(m2:mechanism {description:"Frank-Starling机制"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌损伤"}),(m2:mechanism {description:"心室重塑"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌损伤"}),(m2:mechanism {description:"交感神经兴奋性增强"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌损伤"}),(m2:mechanism {description:"RAAS激活"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌损伤"}),(m2:mechanism {description:"精氨酸加压素增加"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌损伤"}),(m2:mechanism {description:"利钠肽分泌增加"}) CREATE (m1)-[:mechanism_subsequence {reference:"内科学第九版"}]->(m2);

MATCH (d:disease {name:"心力衰竭"}),(m:mechanism {description:"Frank-Starling机制"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);
MATCH (d:disease {name:"心力衰竭"}),(m:mechanism {description:"心室重塑"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);
MATCH (d:disease {name:"心力衰竭"}),(m:mechanism {description:"交感神经兴奋性增强"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);
MATCH (d:disease {name:"心力衰竭"}),(m:mechanism {description:"RAAS激活"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);
MATCH (d:disease {name:"心力衰竭"}),(m:mechanism {description:"精氨酸加压素增加"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);
MATCH (d:disease {name:"心力衰竭"}),(m:mechanism {description:"利钠肽分泌增加"}) CREATE (d)<-[:mechanism_subsequence {reference:"内科学第九版"}]-(m);



// //病理
// CREATE (:pathology {description:"冠脉狭窄或部分闭塞"});
// CREATE (:pathology {description:"心肺顺应性降低"});
// CREATE (:pathology {description:"左心室收缩与舒张功能障碍"});
// CREATE (:pathology {description:"灶性心肌坏死"});
// CREATE (:pathology {description:"心内膜下心肌坏死"});
// CREATE (:pathology {description:"心肌瘢痕"});
// CREATE (:pathology {description:"心肌纤维化"});
// CREATE (:pathology {description:"心肌细胞减少、坏死"});
// CREATE (:pathology {description:"冠状动脉病变"});
// CREATE (:pathology {description:"心肌病变"});

// MATCH (d:disease {name:"稳定型心绞痛"}),(p:pathology {description:"冠脉狭窄或部分闭塞"}) CREATE (d)-[:pathology_show {reference:"内科学第九版"}]->(p);
// MATCH (d:disease {name:"稳定型心绞痛"}),(p:pathology {description:"心肺顺应性降低"}) CREATE (d)-[:pathology_show {reference:"内科学第九版"}]->(p);
// MATCH (d:disease {name:"稳定型心绞痛"}),(p:pathology {description:"左心室收缩与舒张功能障碍"}) CREATE (d)-[:pathology_show {reference:"内科学第九版"}]->(p);
// MATCH (d:disease {english_name:"NSTEMI"}),(p:pathology {description:"灶性心肌坏死"}) CREATE (d)-[:pathology_show {reference:"内科学第九版"}]->(p);
// MATCH (d:disease {english_name:"NSTEMI"}),(p:pathology {description:"灶性心肌坏死"}) CREATE (d)-[:pathology_show {reference:"内科学第九版"}]->(p);
// MATCH (d:disease {name:"缺血性心肌病"}),(p:pathology {description:"心肌瘢痕"}) CREATE (d)-[:pathology_show {reference:"内科学第九版"}]->(p);
// MATCH (d:disease {name:"缺血性心肌病"}),(p:pathology {description:"心肌纤维化"}) CREATE (d)-[:pathology_show {reference:"内科学第九版"}]->(p);
// MATCH (d:disease {name:"缺血性心肌病"}),(p:pathology {description:"心肌细胞减少、坏死"}) CREATE (d)-[:pathology_show {reference:"内科学第九版"}]->(p);
// MATCH (d:disease {english_name:"STEMI"}),(p:pathology {description:"冠状动脉病变"}) CREATE (d)-[:pathology_show {reference:"内科学第九版"}]->(p);
// MATCH (d:disease {english_name:"STEMI"}),(p:pathology {description:"心肌病变"}) CREATE (d)-[:pathology_show {reference:"内科学第九版"}]->(p);
// MATCH (d:disease {english_name:"STEMI"}),(p:pathology {description:"左心室收缩与舒张功能障碍"}) CREATE (d)-[:pathology_show {reference:"内科学第九版"}]->(p);


//症状symptom
CREATE (:symptom {characteristic:"心绞痛"});
CREATE (:symptom {characteristic:"体力劳动或情绪激动诱发"});
CREATE (:symptom {characteristic:"胸骨体后发作，可波及心前区，也可横贯前胸"});
CREATE (:symptom {characteristic:"放射痛至左肩、左臂内侧达无名指和小指，或至颈、咽或下颌部"});
CREATE (:symptom {characteristic:"压迫、发闷或紧缩性，也可有烧灼感，偶伴濒死感"});
CREATE (:symptom {characteristic:"持续时间多为3~5分钟，不超过半小时"});
CREATE (:symptom {characteristic:"停止活动缓解；硝酸甘油缓解"});
MATCH (s1:symptom {characteristic:"心绞痛"}),(s2:symptom {characteristic:"体力劳动或情绪激动诱发"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心绞痛"}),(s2:symptom {characteristic:"胸骨体后发作，可波及心前区，也可横贯前胸"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心绞痛"}),(s2:symptom {characteristic:"放射痛至左肩、左臂内侧达无名指和小指，或至颈、咽或下颌部"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心绞痛"}),(s2:symptom {characteristic:"压迫、发闷或紧缩性，也可有烧灼感，偶伴濒死感"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心绞痛"}),(s2:symptom {characteristic:"持续时间多为3~5分钟，不超过半小时"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心绞痛"}),(s2:symptom {characteristic:"停止活动缓解；硝酸甘油缓解"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);

CREATE (:symptom {characteristic:"心率增快"});
CREATE (:symptom {characteristic:"血压增高"});
CREATE (:symptom {characteristic:"表情焦虑"});
CREATE (:symptom {characteristic:"皮肤冷"});
CREATE (:symptom {characteristic:"出汗"});
CREATE (:symptom {characteristic:"第三心音奔马律",type:"心音听诊"});
CREATE (:symptom {characteristic:"第四心音奔马律",type:"心音听诊"});
CREATE (:symptom {characteristic:"暂时性心尖部收缩期杂音",type:"心音听诊"});
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {characteristic:"心绞痛"}) CREATE (d)-[:patient_show {reference:"内科学第九版 p230"}]->(s);
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {characteristic:"心率增快"}) CREATE (d)-[:patient_show {reference:"内科学第九版 p230"}]->(s);
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {characteristic:"血压增高"}) CREATE (d)-[:patient_show {reference:"内科学第九版 p230"}]->(s);
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {characteristic:"表情焦虑"}) CREATE (d)-[:patient_show {reference:"内科学第九版 p230"}]->(s);
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {characteristic:"皮肤冷"}) CREATE (d)-[:patient_show {reference:"内科学第九版 p230"}]->(s);
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {characteristic:"出汗"}) CREATE (d)-[:patient_show {reference:"内科学第九版 p230"}]->(s);
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {characteristic:"第三心音奔马律"}) CREATE (d)-[:patient_show {reference:"内科学第九版 p230"}]->(s);
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {characteristic:"第四心音奔马律"}) CREATE (d)-[:patient_show {reference:"内科学第九版 p230"}]->(s);
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {characteristic:"暂时性心尖部收缩期杂音"}) CREATE (d)-[:patient_show {reference:"内科学第九版 p230"}]->(s);

CREATE (:symptom {characteristic:"有心肌缺血的客观证据，但无心绞痛症状"});
CREATE (:symptom {characteristic:"曾有过心肌梗死史，现有心肌缺血客观证据，但无症状"});
CREATE (:symptom {characteristic:"有心肌缺血发作，有时有症状，有时无症状"});
MATCH (d:disease {name:"隐匿型冠心病"}),(s:symptom {characteristic:"有心肌缺血的客观证据，但无心绞痛症状"}) CREATE (d)-[:patient_show {reference:"内科学第九版 p230"}]->(s);
MATCH (d:disease {name:"隐匿型冠心病"}),(s:symptom {characteristic:"曾有过心肌梗死史，现有心肌缺血客观证据，但无症状"}) CREATE (d)-[:patient_show {reference:"内科学第九版 p230"}]->(s);
MATCH (d:disease {name:"隐匿型冠心病"}),(s:symptom {characteristic:"有心肌缺血发作，有时有症状，有时无症状"}) CREATE (d)-[:patient_show {reference:"内科学第九版 p230"}]->(s);

CREATE (:symptom {characteristic:"心绞痛"});
CREATE (:symptom {characteristic:"明确的冠心病史"});
CREATE (:symptom {characteristic:"1次以上心肌梗死病史"});
CREATE (:symptom {characteristic:"无症状性心肌缺血"});
CREATE (:symptom {characteristic:"胸闷"});
CREATE (:symptom {characteristic:"乏力"});
CREATE (:symptom {characteristic:"眩晕"});
CREATE (:symptom {characteristic:"呼吸困难"});
CREATE (:symptom {characteristic:"心力衰竭"});
CREATE (:symptom {characteristic:"劳力性呼吸困难"});
CREATE (:symptom {characteristic:"端坐呼吸"});
CREATE (:symptom {characteristic:"夜间阵发性呼吸困难"});
CREATE (:symptom {characteristic:"疲乏"});
CREATE (:symptom {characteristic:"虚弱"});
CREATE (:symptom {characteristic:"第一心音减弱",type:"心音听诊"});
CREATE (:symptom {characteristic:"舒张中晚期奔马律",type:"心音听诊"});
CREATE (:symptom {characteristic:"两肺底散在湿啰音",type:"听诊"});
CREATE (:symptom {characteristic:"食欲缺乏"});
CREATE (:symptom {characteristic:"周围性水肿"});
CREATE (:symptom {characteristic:"右上腹闷胀感"});
CREATE (:symptom {characteristic:"颈静脉充盈或怒张"});
CREATE (:symptom {characteristic:"心界扩大"});
CREATE (:symptom {characteristic:"肝大"});
CREATE (:symptom {characteristic:"肝压痛"});
CREATE (:symptom {characteristic:"肝颈静脉回流征阳性"});
CREATE (:symptom {characteristic:"心律失常"});
CREATE (:symptom {characteristic:"室性期前收缩"});
CREATE (:symptom {characteristic:"心房颤动"});
CREATE (:symptom {characteristic:"束支传导阻滞"});
CREATE (:symptom {characteristic:"血栓和栓塞"});
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"心绞痛"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"明确的冠心病史"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"1次以上心肌梗死病史"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"无症状性心肌缺血"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"胸闷"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"乏力"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"眩晕"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"呼吸困难"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"心力衰竭"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"劳力性呼吸困难"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"端坐呼吸"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"夜间阵发性呼吸困难"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"第一心音减弱"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"舒张中晚期奔马律"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"两肺底散在湿啰音"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"食欲缺乏"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"周围性水肿"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"右上腹闷胀感"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"颈静脉充盈或怒张"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"心界扩大"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"肝大"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"肝压痛"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"肝颈静脉回流征阳性"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"无症状性心肌缺血"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"心律失常"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"心房颤动"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"血栓和栓塞"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"束支传导阻滞"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"室性期前收缩"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"疲乏"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"虚弱"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);

// CREATE (:symptom {characteristic:"心绞痛"});
// CREATE (:symptom {characteristic:"劳力性呼吸困难"});
CREATE (:symptom {characteristic:"活动受限"});
CREATE (:symptom {characteristic:"反复发生肺水肿"});
MATCH (d:disease {name:"限制型缺血性心肌病"}),(s:symptom {characteristic:"劳力性呼吸困难"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"限制型缺血性心肌病"}),(s:symptom {characteristic:"活动受限"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"限制型缺血性心肌病"}),(s:symptom {characteristic:"反复发生肺水肿"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"限制型缺血性心肌病"}),(s:symptom {characteristic:"心绞痛"}) CREATE (d)-[:patient_show {frequency_probability:"probable",reference:"内科学第九版"}]->(s);


CREATE (:symptom {characteristic:"诱发心绞痛的体力活动阈值突然或持久降低"});
CREATE (:symptom {characteristic:"心绞痛发生频率、严重程度和持续时间增加"});
CREATE (:symptom {characteristic:"出现静息或夜间心绞痛"});
CREATE (:symptom {characteristic:"胸痛放射至新的部位"});
CREATE (:symptom {characteristic:"心绞痛发作伴出汗、恶心、呕吐、心悸或呼吸困难"});
CREATE (:symptom {characteristic:"常规休息或舌下含服硝酸甘油只能暂时甚至不能完全缓解症状"});
CREATE (:symptom {characteristic:"一过性第三心音",type:"心音听诊"});
CREATE (:symptom {characteristic:"一过性第四心音",type:"心音听诊"});
CREATE (:symptom {characteristic:"二尖瓣反流引起的一过性收缩性杂音",type:"心音听诊"});


MATCH (d:disease {english_name:"NSTEACS"}),(hs:symptom {characteristic:"一过性第三心音"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:symptom {characteristic:"一过性第四心音"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:symptom {characteristic:"二尖瓣反流引起的一过性收缩性杂音"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:symptom {characteristic:"诱发心绞痛的体力活动阈值突然或持久降低"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:symptom {characteristic:"心绞痛发生频率、严重程度和持续时间增加"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:symptom {characteristic:"出现静息或夜间心绞痛"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:symptom {characteristic:"胸痛放射至新的部位"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:symptom {characteristic:"心绞痛发作伴出汗、恶心、呕吐、心悸或呼吸困难"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:symptom {characteristic:"常规休息或舌下含服硝酸甘油只能暂时甚至不能完全缓解症状"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(hs);

CREATE (:symptom {characteristic:"发病数日前乏力"});
CREATE (:symptom {characteristic:"发病数日前胸部不适"});
CREATE (:symptom {characteristic:"活动时心悸"});
CREATE (:symptom {characteristic:"活动时气急"});
CREATE (:symptom {characteristic:"活动时烦躁"});
CREATE (:symptom {characteristic:"活动时心绞痛"});
CREATE (:symptom {characteristic:"新发生心绞痛"});
CREATE (:symptom {characteristic:"原有心绞痛加重"});
CREATE (:symptom {characteristic:"心绞痛发作较以往频繁、程度较剧、持续较久、硝酸甘油疗效差、诱发因素不明显"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"ST段一过性明显抬高或压低"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"T波倒置或增高"});
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"发病数日前乏力"}) CREATE (d)-[:patient_show {comment:"先兆症状",reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"发病数日前胸部不适"}) CREATE (d)-[:patient_show {comment:"先兆症状",reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"活动时心悸"}) CREATE (d)-[:patient_show {comment:"先兆症状",reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"活动时气急"}) CREATE (d)-[:patient_show {comment:"先兆症状",reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"活动时烦躁"}) CREATE (d)-[:patient_show {comment:"先兆症状",reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"活动时心绞痛"}) CREATE (d)-[:patient_show {comment:"先兆症状",reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"新发生心绞痛"}) CREATE (d)-[:patient_show {comment:"先兆症状",reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"原有心绞痛加重"}) CREATE (d)-[:patient_show {comment:"先兆症状",reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"心绞痛发作较以往频繁、程度较剧、持续较久、硝酸甘油疗效差、诱发因素不明显"}) CREATE (d)-[:patient_show {comment:"先兆症状",reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:ECG {status:"心绞痛发作",characteristic:"ST段一过性明显抬高或压低"}) CREATE (d)-[:ecg_show {comment:"先兆症状",reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:ECG {status:"心绞痛发作",characteristic:"T波倒置或增高"}) CREATE (d)-[:ecg_show {comment:"先兆症状",reference:"内科学第九版"}]->(s);

CREATE (:symptom {characteristic:"疼痛"});
CREATE (:symptom {characteristic:"多发生于清晨"});
// CREATE (:symptom {characteristic:"胸骨体后发作，可波及心前区，也可横贯前胸"});
// CREATE (:symptom {characteristic:"压迫、发闷或紧缩性，也可有烧灼感，偶伴濒死感"});
CREATE (:symptom {characteristic:"常发生于安静时，程度较重，持续时间较长，可达数小时或更长"});
CREATE (:symptom {characteristic:"休息和含用硝酸甘油片多不能缓解"});
CREATE (:symptom {characteristic:"烦躁不安"});
// CREATE (:symptom {characteristic:"出汗"});
CREATE (:symptom {characteristic:"恐惧"});
// CREATE (:symptom {characteristic:"胸闷"});
CREATE (:symptom {characteristic:"濒死感"});
CREATE (:symptom {characteristic:"休克"});
CREATE (:symptom {characteristic:"急性心力衰竭"});
CREATE (:symptom {characteristic:"发热"});
CREATE (:symptom {characteristic:"心动过速"});
CREATE (:symptom {characteristic:"白细胞计数增高"});
CREATE (:symptom {characteristic:"红细胞沉降率增快"});
CREATE (:symptom {characteristic:"恶心"});
CREATE (:symptom {characteristic:"呕吐"});
CREATE (:symptom {characteristic:"上腹胀痛"});
CREATE (:symptom {characteristic:"肠胀气"});
CREATE (:symptom {characteristic:"呃逆"});
// CREATE (:symptom {characteristic:"乏力"});
CREATE (:symptom {characteristic:"头晕"});
CREATE (:symptom {characteristic:"晕厥"});
CREATE (:symptom {characteristic:"室性心律失常"});
// CREATE (:symptom {characteristic:"房室传导阻滞"});
// CREATE (:symptom {characteristic:"束支传导阻滞"});
CREATE (:symptom {characteristic:"低血压"});
CREATE (:symptom {characteristic:"心源性休克"});
CREATE (:symptom {characteristic:"心脏浊音界可正常也可轻度至中度增大",type:"心音听诊"});
CREATE (:symptom {characteristic:"心律多增快，少数也可减慢"});
CREATE (:symptom {characteristic:"心尖区第一心音减弱",type:"心音听诊"});
// CREATE (:symptom {characteristic:"心力衰竭"});
// CREATE (:symptom {characteristic:"呼吸困难"});
CREATE (:symptom {characteristic:"咳嗽"});
CREATE (:symptom {characteristic:"发绀"});
CREATE (:symptom {characteristic:"烦躁"});
CREATE (:symptom {characteristic:"肺水肿"});
CREATE (:symptom {characteristic:"颈静脉怒张"});
// CREATE (:symptom {characteristic:"肝大"});
CREATE (:symptom {characteristic:"水肿"});
CREATE (:symptom {characteristic:"血压下降"});
// CREATE (:symptom {characteristic:"第三心音奔马律",type:"心音听诊"});
// CREATE (:symptom {characteristic:"第四心音奔马律",type:"心音听诊"});
CREATE (:symptom {characteristic:"心包摩擦音",type:"心音听诊"});
CREATE (:symptom {characteristic:"心尖区收缩期杂音",type:"心音听诊"});
CREATE (:symptom {characteristic:"心尖区收缩期喀喇音",type:"心音听诊"});
CREATE (:symptom {characteristic:"胸骨左缘3~4肋间收缩期杂音伴震颤",type:"心音听诊"});
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"疼痛"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"烦躁"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"恐惧"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"胸闷"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"濒死感"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"休克"}) CREATE (d)-[:patient_show {frequency_probability:"minority",reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"心力衰竭"}) CREATE (d)-[:patient_show {frequency_probability:"minority",reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"发热"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"恶心"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"上腹胀痛"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"肠胀气"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"呃逆"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"心律失常"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"乏力"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"头晕"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"晕厥"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"心力衰竭"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"低血压"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"多发生于清晨"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"常发生于安静时，程度较重，持续时间较长，可达数小时或更长"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"休息和含用硝酸甘油片多不能缓解"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"颈静脉怒张"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"肝大"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"水肿"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"肺水肿"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"烦躁"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"发绀"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"咳嗽"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"呼吸困难"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"烦躁不安"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"急性心力衰竭"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"白细胞计数增高"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"红细胞沉降率增快"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"心动过速"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"血压下降"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"室性心律失常"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(hs:symptom {characteristic:"心包摩擦音"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"STEMI"}),(hs:symptom {characteristic:"心尖区收缩期杂音"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"STEMI"}),(hs:symptom {characteristic:"心尖区收缩期喀喇音"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"STEMI"}),(hs:symptom {characteristic:"胸骨左缘3~4肋间收缩期杂音伴震颤"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(hs);

CREATE (:symptom {characteristic:"发病时间集中在午夜至上午8点之间"});
CREATE (:symptom {characteristic:"恶性心律失常"});
CREATE (:symptom {characteristic:"急性心肌梗死"});
CREATE (:symptom {characteristic:"自行缓解"});
CREATE (:ECG {characteristic:"一过性ST段抬高"});
CREATE (:ECG {characteristic:"ST段压低"});
CREATE (:ECG {characteristic:"T波改变"});
MATCH (d:disease {name:"冠状动脉痉挛"}),(s:symptom {characteristic:"静息型心绞痛"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"冠状动脉痉挛"}),(s:symptom {characteristic:"发病时间集中在午夜至上午8点之间"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"冠状动脉痉挛"}),(s:symptom {characteristic:"恶性心律失常"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"冠状动脉痉挛"}),(s:symptom {characteristic:"急性心肌梗死"}) CREATE (d)-[:patient_show {comment:"冠状动脉持续严重痉挛",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"冠状动脉痉挛"}),(s:symptom {characteristic:"猝死"}) CREATE (d)-[:patient_show {comment:"冠状动脉持续严重痉挛",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"冠状动脉非闭塞性痉挛"}),(s:ECG {characteristic:"ST段压低"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"冠状动脉非闭塞性痉挛"}),(s:ECG {characteristic:"T波改变"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"冠状动脉痉挛"}),(s:symptom {characteristic:"自行缓解"}) CREATE (d)-[:patient_show {comment:"冠状动脉持续严重痉挛",reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"冠状动脉闭塞性痉挛"}),(s:ECG {characteristic:"一过性ST段抬高"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);

MATCH (d:disease {name:"心肌桥"}),(s:symptom {characteristic:"心绞痛"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"心肌桥"}),(s:symptom {characteristic:"心律失常"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"心肌桥"}),(s:symptom {characteristic:"猝死"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"心肌桥"}),(s:symptom {characteristic:"心肌梗死"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
CREATE (:ECG {characteristic:"运动平板试验ST段下移"});
CREATE (:imaging {characteristic:"无异常",type:"冠状动脉造影"});
MATCH (d:disease {name:"X综合征"}),(s:symptom {characteristic:"心绞痛"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"X综合征"}),(s:ECG {characteristic:"运动平板试验ST段下移"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"X综合征"}),(s:imaging {characteristic:"无异常",type:"冠状动脉造影"}) CREATE (d)-[:imaging_show {reference:"内科学第九版"}]->(s);


CREATE (:symptom {characteristic:"突发严重呼吸困难"});
CREATE (:symptom {characteristic:"呼吸频率30~50次/分"});
CREATE (:symptom {characteristic:"强迫坐位"});
CREATE (:symptom {characteristic:"面色灰白"});
// CREATE (:symptom {characteristic:"发绀"});
CREATE (:symptom {characteristic:"大汗"});
// CREATE (:symptom {characteristic:"烦躁"});
CREATE (:symptom {characteristic:"频繁咳嗽"});
CREATE (:symptom {characteristic:"咳粉红色泡沫痰"});
CREATE (:symptom {characteristic:"神志模糊"});
CREATE (:symptom {characteristic:"一过性血压升高"});
CREATE (:symptom {characteristic:"血压下降至休克"});
CREATE (:symptom {characteristic:"两肺布满湿性啰音和哮鸣音",type:"听诊"});
CREATE (:symptom {characteristic:"心尖部第一心音减弱、率快",type:"心音听诊"});
CREATE (:symptom {characteristic:"舒张早期第三心音奔马律",type:"心音听诊"});
CREATE (:symptom {characteristic:"肺动脉瓣第二心音亢进",type:"心音听诊"});
CREATE (:symptom {characteristic:"心源性休克"});
CREATE (:symptom {characteristic:"持续性低血压"});
CREATE (:symptom {characteristic:"收缩压降至90mmHg以下持续30分钟以上"});
CREATE (:symptom {characteristic:"PCWP≥18mmHg"});
CREATE (:symptom {characteristic:"CI≤2.2L/(min·m2)"});
CREATE (:symptom {characteristic:"组织低灌注状态"});
CREATE (:symptom {characteristic:"皮肤湿冷"});
CREATE (:symptom {characteristic:"苍白"});
CREATE (:symptom {characteristic:"尿量显著减少"});
CREATE (:symptom {characteristic:"意识障碍"});
CREATE (:symptom {characteristic:"代谢性酸中毒"});
MATCH (s1:symptom {characteristic:"心源性休克"}),(s2:symptom {characteristic:"持续性低血压"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心源性休克"}),(s2:symptom {characteristic:"组织低灌注状态"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心源性休克"}),(s2:symptom {characteristic:"PCWP≥18mmHg"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心源性休克"}),(s2:symptom {characteristic:"收缩压降至90mmHg以下持续30分钟以上"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心源性休克"}),(s2:symptom {characteristic:"CI≤2.2L/(min·m2)"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"组织低灌注状态"}),(s2:symptom {characteristic:"皮肤湿冷"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"组织低灌注状态"}),(s2:symptom {characteristic:"苍白"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"组织低灌注状态"}),(s2:symptom {characteristic:"发绀"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"组织低灌注状态"}),(s2:symptom {characteristic:"尿量显著减少"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"组织低灌注状态"}),(s2:symptom {characteristic:"意识障碍"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"组织低灌注状态"}),(s2:symptom {characteristic:"代谢性酸中毒"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);

MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {characteristic:"突发严重呼吸困难"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {characteristic:"呼吸频率30~50次/分"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {characteristic:"强迫坐位"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {characteristic:"面色灰白"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {characteristic:"发绀"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {characteristic:"大汗"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {characteristic:"烦躁"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {characteristic:"频繁咳嗽"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {characteristic:"咳粉红色泡沫痰"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {characteristic:"神志模糊"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {characteristic:"一过性血压升高"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {characteristic:"血压下降至休克"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {characteristic:"两肺布满湿性啰音和哮鸣音"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {characteristic:"心尖部第一心音减弱、率快"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {characteristic:"舒张早期第三心音奔马律"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {characteristic:"肺动脉瓣第二心音亢进"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {characteristic:"心源性休克"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);

// CREATE (:symptom {characteristic:"劳力性呼吸困难"});
// CREATE (:symptom {characteristic:"端坐呼吸"});
// CREATE (:symptom {characteristic:"夜间阵发性呼吸困难"});
CREATE (:symptom {characteristic:"肺循环瘀血"});
CREATE (:symptom {characteristic:"急性肺水肿"});
CREATE (:symptom {characteristic:"心源性哮鸣音",type:"听诊"});
// CREATE (:symptom {characteristic:"咳嗽"});
CREATE (:symptom {characteristic:"咳白色浆液性泡沫痰"});
CREATE (:symptom {characteristic:"痰中带血丝"});
CREATE (:symptom {characteristic:"咯血"});
// CREATE (:symptom {characteristic:"乏力"});
CREATE (:symptom {characteristic:"疲倦"});
CREATE (:symptom {characteristic:"运动耐量降低"});
// CREATE (:symptom {characteristic:"头晕"});
CREATE (:symptom {characteristic:"心慌"});
CREATE (:symptom {characteristic:"少尿"});
CREATE (:symptom {characteristic:"血尿素氮升高"});
CREATE (:symptom {characteristic:"肌酐升高"});
CREATE (:symptom {characteristic:"肾功能不全"});
CREATE (:symptom {characteristic:"肺部湿性啰音",type:"听诊"});
CREATE (:symptom {characteristic:"心脏扩大",type:"心音听诊"});
CREATE (:symptom {characteristic:"相对性二尖瓣关闭不全的反流性杂音",type:"心音听诊"});
CREATE (:symptom {characteristic:"肺动脉瓣区第二心音亢进",type:"心音听诊"});
// CREATE (:symptom {characteristic:"第三心音奔马律",type:"心音听诊"});
// CREATE (:symptom {characteristic:"第四心音奔马律",type:"心音听诊"});
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"肺循环瘀血"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"劳力性呼吸困难"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"端坐呼吸"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"夜间阵发性呼吸困难"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"急性肺水肿"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"咳嗽"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"咳白色浆液性泡沫痰"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"痰中带血丝"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"咯血"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"乏力"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"疲倦"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"运动耐量降低"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"头晕"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"心慌"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"少尿"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"血尿素氮升高"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"肌酐升高"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"肾功能不全"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"肺部湿性啰音"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"相对性二尖瓣关闭不全的反流性杂音"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"心脏扩大"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"肺动脉瓣区第二心音亢进"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"第三心音奔马律"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"第四心音奔马律"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {characteristic:"心源性哮鸣音"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);

CREATE (:symptom {characteristic:"腹胀"});
CREATE (:symptom {characteristic:"体循环瘀血"});
// CREATE (:symptom {characteristic:"食欲缺乏"});
// CREATE (:symptom {characteristic:"恶心"});
// CREATE (:symptom {characteristic:"呕吐"});
// CREATE (:symptom {characteristic:"劳力性呼吸困难"});
// CREATE (:symptom {characteristic:"水肿"});
CREATE (:symptom {characteristic:"胸腔积液"});
// CREATE (:symptom {characteristic:"肝颈静脉回流征阳性"});
CREATE (:symptom {characteristic:"颈静脉搏动增强、充盈、怒张"});
CREATE (:symptom {characteristic:"肝淤血肿大伴压痛"});
CREATE (:symptom {characteristic:"心源性肝硬化"});
CREATE (:symptom {characteristic:"三尖瓣关闭不全的反流性杂音"});
MATCH (d:disease {name:"右心衰竭"}),(s:symptom {characteristic:"体循环瘀血"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"右心衰竭"}),(s:symptom {characteristic:"腹胀"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"右心衰竭"}),(s:symptom {characteristic:"食欲缺乏"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"右心衰竭"}),(s:symptom {characteristic:"恶心"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"右心衰竭"}),(s:symptom {characteristic:"呕吐"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"右心衰竭"}),(s:symptom {characteristic:"劳力性呼吸困难"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"右心衰竭"}),(s:symptom {characteristic:"水肿"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"右心衰竭"}),(s:symptom {characteristic:"胸腔积液"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"右心衰竭"}),(s:symptom {characteristic:"肝颈静脉回流征阳性"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"右心衰竭"}),(s:symptom {characteristic:"颈静脉搏动增强、充盈、怒张"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"右心衰竭"}),(s:symptom {characteristic:"肝淤血肿大伴压痛"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"右心衰竭"}),(s:symptom {characteristic:"心源性肝硬化"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"右心衰竭"}),(s:symptom {characteristic:"三尖瓣关闭不全的反流性杂音"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);

// CREATE (:symptom {characteristic:"呼吸困难"});
CREATE (:symptom {characteristic:"静息性呼吸困难"});
// CREATE (:symptom {characteristic:"夜间阵发性呼吸困难"});
// CREATE (:symptom {characteristic:"端坐呼吸"});
// CREATE (:symptom {characteristic:"咳嗽"});
CREATE (:symptom {characteristic:"干咳无痰或泡沫痰"});
CREATE (:symptom {characteristic:"并发感染时咳黏液样或浓痰"});
CREATE (:symptom {characteristic:"大咯血"});
CREATE (:symptom {characteristic:"痰中带血或血痰"});
// CREATE (:symptom {characteristic:"咳粉红色泡沫痰"});
CREATE (:symptom {characteristic:"血栓栓塞"});
CREATE (:symptom {characteristic:"声音嘶哑"});
CREATE (:symptom {characteristic:"吞咽困难"});
CREATE (:symptom {characteristic:"食欲减退"});
// CREATE (:symptom {characteristic:"腹胀"});
// CREATE (:symptom {characteristic:"恶心"});
CREATE (:symptom {characteristic:"二尖瓣面容",type:"视诊"});
CREATE (:symptom {characteristic:"双颧绀红",type:"视诊"});
CREATE (:symptom {characteristic:"收缩期抬举样搏动",type:"触诊"});
// CREATE (:symptom {characteristic:"颈静脉怒张",type:"视诊"});
// CREATE (:symptom {characteristic:"肝颈静脉回流征阳性"});
// CREATE (:symptom {characteristic:"肝大",type:"触诊"});
CREATE (:symptom {characteristic:"双下肢水肿",type:"触诊"});
CREATE (:symptom {characteristic:"亢进的第一心音，呈拍击样",type:"心音听诊"});
CREATE (:symptom {characteristic:"开瓣音",type:"心音听诊"});
CREATE (:symptom {characteristic:"P2亢进和分裂",type:"心音听诊"});
CREATE (:symptom {characteristic:"心尖区舒张中晚期低调的隆隆样杂音，呈递增型",type:"心音听诊"});
CREATE (:symptom {characteristic:"胸骨左缘第2肋间可闻及递减型高调叹气样舒张早期杂音",type:"心音听诊"});
CREATE (:symptom {characteristic:"Graham-Steel杂音",type:"心音听诊"});
CREATE (:symptom {characteristic:"于胸骨左缘第4、5肋间闻及全收缩期吹风样杂音",type:"心音听诊"});
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"呼吸困难"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"静息性呼吸困难"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"夜间阵发性呼吸困难"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"端坐呼吸"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"咳嗽"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"干咳无痰或泡沫痰"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"并发感染时咳黏液样或浓痰"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"大咯血"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"痰中带血或血痰"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"血栓栓塞"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"声音嘶哑"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"吞咽困难"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"食欲减退"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"腹胀"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"恶心"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"胸痛"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"二尖瓣面容"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"双颧绀红"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"收缩期抬举样搏动"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"颈静脉怒张"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"肝颈静脉回流征阳性"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"肝大"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"双下肢水肿"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"亢进的第一心音，呈拍击样"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"开瓣音"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"P2亢进和分裂"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"心尖区舒张中晚期低调的隆隆样杂音，呈递增型"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"胸骨左缘第2肋间可闻及递减型高调叹气样舒张早期杂音"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"Graham-Steel杂音"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);
MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {characteristic:"于胸骨左缘第4、5肋间闻及全收缩期吹风样杂音"}) CREATE (d)-[:patient_show {reference:"内科学第九版"}]->(s);

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

//心电图检查
CREATE (:ECG {characteristic:"ST段抬高呈弓背向上型",lead:"面向坏死区周围心肌损伤区的导联"});
CREATE (:ECG {characteristic:"宽而深的Q波",lead:"面向透壁心肌坏死区的导联"});
CREATE (:ECG {characteristic:"T波倒置",lead:"面向损伤区缺血区的导联"});
CREATE (:ECG {characteristic:"R波增高",lead:"背向心肌梗死区的导联"});
CREATE (:ECG {characteristic:"ST段压低",lead:"背向心肌梗死区的导联"});
CREATE (:ECG {characteristic:"T波直立并增高",lead:"背向心肌梗死区的导联"});
CREATE (:ECG {characteristic:"非特异性ST段-T波改变"});

CREATE (:ECG {status:"静息",characteristic:"正常"});
CREATE (:ECG {status:"静息",characteristic:"陈旧性心肌梗死的改变"});
CREATE (:ECG {status:"静息",characteristic:"房室传导阻滞"});
CREATE (:ECG {status:"静息",characteristic:"束支传导阻滞"});
CREATE (:ECG {status:"静息",characteristic:"室性期前收缩"});
CREATE (:ECG {status:"静息",characteristic:"房性期前收缩"});
CREATE (:ECG {status:"静息",characteristic:"心房颤动"});
CREATE (:ECG {status:"静息",characteristic:"心肌坏死"});
CREATE (:ECG {status:"静息",characteristic:"Q波形成"});
CREATE (:ECG {status:"静息",characteristic:"T波假性正常化"});
CREATE (:ECG {status:"静息",characteristic:"ST段压低",lead:"Ⅱ"});
CREATE (:ECG {status:"静息",characteristic:"ST段压低",lead:"Ⅲ"});
CREATE (:ECG {status:"静息",characteristic:"ST段压低",lead:"aVF"});
CREATE (:ECG {status:"静息",characteristic:"ST段压低",lead:"V5"});
CREATE (:ECG {status:"静息",characteristic:"ST段压低",lead:"V6"});
CREATE (:ECG {status:"静息",characteristic:"心肌缺血"});
CREATE (:ECG {status:"静息",characteristic:"ST-T改变",duration:"≥12h"});

MATCH (e1:ECG {status:"静息",characteristic:"心肌坏死"}), (e2:ECG {status:"静息",characteristic:"Q波形成"}) CREATE (e1)-[:include_characteristic {reference:"内科学第九版"}]->(e2);
CREATE (:ECG {status:"静息",characteristic:"一过性ST段改变"});
CREATE (:ECG {status:"静息",characteristic:"一过性ST段抬高"});
CREATE (:ECG {status:"静息",characteristic:"T波改变"});

MATCH (e:ECG {status:"静息",characteristic:"正常"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"50%", reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"陈旧性心肌梗死的改变"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"probable", reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"ST段压低"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"probable", reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"房室传导阻滞"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often", reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"束支传导阻滞"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often", reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"室性期前收缩"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often", reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"房性期前收缩"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often", reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"心肌坏死"}), (d:disease {name:"缺血性心肌病"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"正常"}), (d:disease {name:"X综合征"}) CREATE (d)-[:ecg_show {frequency_probability:"probable", reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"非特异性ST段和T波异常"}), (d:disease {name:"X综合征"}) CREATE (d)-[:ecg_show {frequency_probability:"probable", reference:"内科学第九版"}]->(e);
MATCH (d:disease {english_name:"STEMI"}),(ecg:ECG {characteristic:"一过性ST段改变"}) CREATE (d)-[:ecg_show {comment:"先兆症状",reference:"内科学第九版"}]->(ecg);
MATCH (d:disease {english_name:"STEMI"}),(ecg:ECG {characteristic:"T波假性正常化"}) CREATE (d)-[:ecg_show {comment:"先兆症状",reference:"内科学第九版"}]->(ecg);
MATCH (d:disease {name:"冠状动脉痉挛",classification:"血管闭塞型"}),(ecg:ECG {characteristic:"一过性ST段抬高"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(ecg);
MATCH (e:ECG {status:"静息",characteristic:"ST段压低"}), (d:disease {name:"冠状动脉痉挛",classification:"非血管闭塞型"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"T波改变"}), (d:disease {name:"冠状动脉痉挛",classification:"非血管闭塞型"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);
MATCH (d:disease {name:"隐匿型冠心病"}),(ecg:ECG {characteristic:"心肌缺血"}) CREATE (d)-[:ecg_show {frequency_probability:"probable",reference:"内科学第九版"}]->(ecg);
MATCH (e:ECG {status:"静息",characteristic:"ST-T改变",duration:"≥12h"}), (d:disease {english_name:"NSTEMI"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);
MATCH (e:ECG {characteristic:"ST段抬高呈弓背向上型",lead:"面向坏死区周围心肌损伤区的导联"}), (d:disease {english_name:"STEMI"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);
MATCH (e:ECG {characteristic:"宽而深的Q波",lead:"面向透壁心肌坏死区的导联"}), (d:disease {english_name:"STEMI"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);
MATCH (e:ECG {characteristic:"T波倒置",lead:"面向损伤区缺血区的导联"}), (d:disease {english_name:"STEMI"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);
MATCH (e:ECG {characteristic:"R波增高",lead:"背向心肌梗死区的导联"}), (d:disease {english_name:"STEMI"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);
MATCH (e:ECG {characteristic:"ST段压低",lead:"背向心肌梗死区的导联"}), (d:disease {english_name:"STEMI"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);
MATCH (e:ECG {characteristic:"T波直立并增高",lead:"背向心肌梗死区的导联"}), (d:disease {english_name:"STEMI"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);
MATCH (e:ECG {characteristic:"正常"}), (d:disease {name:"X综合征"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);
MATCH (e:ECG {characteristic:"非特异性ST-T改变"}), (d:disease {name:"X综合征"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);

CREATE (:ECG {status:"心绞痛发作",characteristic:"ST段压低",range:"≥0.1mV",inducement:"心肌缺血",location:"心内膜下",lead:"Ⅰ"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"ST段压低",range:"≥0.1mV",inducement:"心肌缺血",location:"心内膜下",lead:"Ⅱ"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"ST段压低",range:"≥0.1mV",inducement:"心肌缺血",location:"心内膜下",lead:"Ⅲ"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"ST段压低",range:"≥0.1mV",inducement:"心肌缺血",location:"心内膜下",lead:"aVF"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"ST段压低",range:"≥0.1mV",inducement:"心肌缺血",location:"心内膜下",lead:"V4"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"ST段压低",range:"≥0.1mV",inducement:"心肌缺血",location:"心内膜下",lead:"V5"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"ST段压低",range:"≥0.1mV",inducement:"心肌缺血",location:"心内膜下",lead:"V6"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"T波倒置"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"T波直立"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"一过性ST段改变"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"一过性T波改变"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"U波倒置"});
MATCH (e:ECG {status:"心绞痛发作",characteristic:"ST段压低"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"common", reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"心绞痛发作",characteristic:"T波倒置"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often", reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"心绞痛发作",characteristic:"T波直立"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often",condition:"平时T波持续倒置", reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"心绞痛发作",characteristic:"一过性ST段改变"}), (d:disease {english_name:"NSTEACS"}) CREATE (d)-[:ecg_show {frequency_probability:"most",condition:"平时T波持续倒置", reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"心绞痛发作",characteristic:"一过性T波改变"}), (d:disease {english_name:"NSTEACS"}) CREATE (d)-[:ecg_show {frequency_probability:"most",condition:"平时T波持续倒置", reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"心绞痛发作",characteristic:"U波倒置"}), (d:disease {english_name:"NSTEACS"}) CREATE (d)-[:ecg_show {frequency_probability:"rare",condition:"平时T波持续倒置", reference:"内科学第九版"}]->(e);

CREATE (:symptom {characteristic:"运动试验阳性"});
CREATE (:ECG {status:"运动时",characteristic:"ST段水平型",duration:"2min"});
CREATE (:ECG {status:"运动时",characteristic:"ST段压低",range:"≥0.1mV",duration:"2min",lead:"V5"});
CREATE (:ECG {status:"运动后",characteristic:"ST段压低",range:"≥0.1mV",lead:"Ⅰ"});
CREATE (:ECG {status:"运动后",characteristic:"ST段压低",range:"≥0.1mV",lead:"Ⅱ"});
CREATE (:ECG {status:"运动后",characteristic:"ST段压低",range:"≥0.1mV",lead:"Ⅲ"});
CREATE (:ECG {status:"运动后",characteristic:"ST段压低",range:"≥0.1mV",lead:"aVF"});
CREATE (:ECG {status:"运动后",characteristic:"ST段压低",range:"≥0.1mV",lead:"V3"});
CREATE (:ECG {status:"运动后",characteristic:"ST段压低",range:"≥0.1mV",lead:"V4"});
CREATE (:ECG {status:"运动后",characteristic:"ST段压低",range:"≥0.1mV",lead:"V5"});
CREATE (:ECG {status:"运动后",characteristic:"ST段压低",range:"≥0.1mV",lead:"V6"});
CREATE (:ECG {status:"运动后",characteristic:"T波倒置",lead:"Ⅰ"});
CREATE (:ECG {status:"运动后",characteristic:"T波倒置",lead:"Ⅱ"});
CREATE (:ECG {status:"运动后",characteristic:"T波倒置",lead:"Ⅲ"});
CREATE (:ECG {status:"运动后",characteristic:"T波倒置",lead:"V3"});
CREATE (:ECG {status:"运动后",characteristic:"T波倒置",lead:"V4"});
CREATE (:ECG {status:"运动后",characteristic:"T波倒置",lead:"V5"});
CREATE (:ECG {status:"运动后",characteristic:"T波倒置",lead:"V6"});
CREATE (:ECG {status:"运动时",characteristic:"心肌缺血"});
CREATE (:ECG {status:"运动平板试验",characteristic:"ST段下移"});
MATCH (s:symptom {characteristic:"运动试验阳性"}), (e2:ECG {status:"运动时",characteristic:"ST段压低"}) CREATE (s)-[:include_characteristic {reference:"内科学第九版"}]->(e2);
MATCH (s:symptom {characteristic:"运动试验阳性"}), (e2:ECG {status:"运动时",characteristic:"ST段水平型"}) CREATE (s)-[:include_characteristic {reference:"内科学第九版"}]->(e2);
MATCH (s:symptom {characteristic:"运动试验阳性"}), (e2:ECG {status:"运动后",characteristic:"ST段压低"}) CREATE (s)-[:include_characteristic {reference:"内科学第九版"}]->(e2);
MATCH (s1:symptom {characteristic:"运动试验阳性"}), (s2:symptom {characteristic:"心绞痛"}) CREATE (s1)-[:include_characteristic {reference:"内科学第九版"}]->(s2);

CREATE (:ECG {status:"运动",characteristic:"心肌坏死"});
CREATE (:ECG {status:"运动",characteristic:"Q波形成"});
MATCH (e1:ECG {status:"运动",characteristic:"心肌坏死"}), (e2:ECG {status:"运动",characteristic:"Q波形成"}) CREATE (e1)-[:include_characteristic {reference:"内科学第九版"}]->(e2);

MATCH (s:symptom {characteristic:"运动试验阳性"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(s);
MATCH (e:ECG {status:"运动时",characteristic:"心肌缺血"}), (d:disease {name:"隐匿型冠心病"}) CREATE (d)-[:ecg_show {frequency_probability:"probable",reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"运动",characteristic:"心肌坏死"}), (d:disease {name:"缺血性心肌病"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"运动平板试验",characteristic:"ST段下移"}), (d:disease {name:"X综合征"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);
MATCH (s:symptom {characteristic:"运动试验阳性"}), (d:disease {name:"X综合征"}) CREATE (d)-[:ecg_show {frequency_probability:"20%",reference:"内科学第九版"}]->(s);

CREATE (:ECG {status:"连续监测",characteristic:"ST-T改变"});
CREATE (:ECG {status:"连续监测",characteristic:"心律失常"});
CREATE (:ECG {status:"连续监测",characteristic:"心肌缺血"});

MATCH (e:ECG {status:"连续监测",characteristic:"ST-T改变"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"连续监测",characteristic:"心律失常"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"连续监测",characteristic:"心肌缺血"}), (d:disease {name:"隐匿型"}) CREATE (d)-[:ecg_show {frequency_probability:"often",reference:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"连续监测",characteristic:"ST-T改变"}), (d:disease {english_name:"NSTEACS"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);


CREATE (:ECG {characteristic:"无特异性心电图表现"});
MATCH (e:ECG {characteristic:"无特异性心电图表现"}), (d:disease {name:"慢性心力衰竭"}) CREATE (d)-[:ecg_show {reference:"内科学第九版"}]->(e);


CREATE (:imaging {characteristic:"冠状动脉狭窄病变",type:"多层螺旋CT冠状动脉成像"});
CREATE (:imaging {characteristic:"冠脉显著狭窄",type:"多层螺旋CT冠状动脉成像"});
CREATE (:imaging {characteristic:"冠状动脉管壁钙化",type:"多层螺旋CT冠状动脉成像"});
MATCH (cta:imaging {characteristic:"冠状动脉狭窄病变",type:"多层螺旋CT冠状动脉成像"}), (d:disease {name:"稳定型心绞痛"}) CREATE (cta)<-[:imaging_show {reference:"内科学第九版"}]-(d);
MATCH (cta:imaging {characteristic:"冠状动脉管壁钙化",type:"多层螺旋CT冠状动脉成像"}), (d:disease {name:"稳定型心绞痛"}) CREATE (cta)<-[:imaging_show {reference:"内科学第九版"}]-(d);

//冠状动脉造影
CREATE (:imaging {characteristic:"左冠脉主干狭窄",type:"冠状动脉造影"});
CREATE (:imaging {characteristic:"无显著狭窄",type:"冠状动脉造影"});
CREATE (:imaging {characteristic:"1支冠脉管腔直径减少>70%",type:"冠状动脉造影"});
CREATE (:imaging {characteristic:"2支冠脉管腔直径减少>70%",type:"冠状动脉造影"});
CREATE (:imaging {characteristic:"3支冠脉管腔直径减少>70%",type:"冠状动脉造影"});
CREATE (:imaging {characteristic:"冠脉显著狭窄",type:"冠状动脉造影"});
// CREATE (:imaging {characteristic:"无异常",type:"冠状动脉造影"});
CREATE (:imaging {characteristic:"冠脉粥样硬化",type:"冠状动脉造影"});
CREATE (:imaging {characteristic:"多支冠状动脉病变",type:"冠状动脉造影"});
CREATE (:imaging {characteristic:"单支冠状动脉病变",type:"冠状动脉造影"});
CREATE (:imaging {characteristic:"动脉粥样硬化斑块"});

MATCH (d:disease {name:"稳定型心绞痛"}),(cag:imaging {characteristic:"左冠脉主干狭窄",type:"冠状动脉造影"}) CREATE (d)-[:imaging_show {frequency_probability:"5~10%",reference:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"稳定型心绞痛"}),(cag:imaging {characteristic:"无显著狭窄",type:"冠状动脉造影"}) CREATE (d)-[:imaging_show {frequency_probability:"15%",reference:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"稳定型心绞痛"}),(cag:imaging {characteristic:"1支冠脉管腔直径减少>70%",type:"冠状动脉造影"}) CREATE (d)-[:imaging_show {frequency_probability:"25%",reference:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"稳定型心绞痛"}),(cag:imaging {characteristic:"2支冠脉管腔直径减少>70%",type:"冠状动脉造影"}) CREATE (d)-[:imaging_show {frequency_probability:"25%",reference:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"稳定型心绞痛"}),(cag:imaging {characteristic:"3支冠脉管腔直径减少>70%",type:"冠状动脉造影"}) CREATE (d)-[:imaging_show {frequency_probability:"25%",reference:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"缺血性心肌病"}),(cag:imaging {characteristic:"冠脉显著狭窄"}) CREATE (d)-[:imaging_show {reference:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"X综合征"}),(cag:imaging {characteristic:"无异常",type:"冠状动脉造影"}) CREATE (d)-[:imaging_show {reference:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"冠状动脉痉挛"}),(cag:imaging {characteristic:"无异常",type:"冠状动脉造影"}) CREATE (d)-[:imaging_show {reference:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"冠状动脉痉挛"}),(cag:imaging {characteristic:"冠脉粥样硬化",type:"冠状动脉造影"}) CREATE (d)-[:imaging_show {reference:"内科学第九版"}]->(cag);
MATCH (d:disease {english_name:"UA"}),(cag:imaging {characteristic:"多支冠状动脉病变",type:"冠状动脉造影"}) CREATE (d)-[:imaging_show {condition:" 有长期稳定型心绞痛基础",reference:"内科学第九版"}]->(cag);
MATCH (d:disease {english_name:"UA"}),(cag:imaging {characteristic:"单支冠状动脉病变",type:"冠状动脉造影"}) CREATE (d)-[:imaging_show {condition:" 新发型心绞痛",reference:"内科学第九版"}]->(cag);
MATCH (d:disease {english_name:"UA"}),(cag:imaging {characteristic:"无异常",type:"冠状动脉造影"}) CREATE (d)-[:imaging_show {condition:" 新发型心绞痛",reference:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"心肌桥"}),(cag:imaging {characteristic:"动脉粥样硬化斑块"}) CREATE (d)-[:imaging_show {reference:"内科学第九版"}]->(cag);

//血管内超声 多普勒
CREATE (:imaging {characteristic:"冠状动脉内膜增厚",type:"血管内超声及多普勒血流测定"});
CREATE (:imaging {characteristic:"早期动脉粥样硬化斑块形成",type:"血管内超声及多普勒血流测定"});
CREATE (:imaging {characteristic:"冠状动脉血流储备降低",type:"血管内超声及多普勒血流测定"});
MATCH (d:disease {name:"X综合征"}),(r:imaging {characteristic:"冠状动脉内膜增厚",type:"血管内超声及多普勒血流测定"}) CREATE (d)-[:imaging_show {reference:"内科学第九版"}]->(r);
MATCH (d:disease {name:"X综合征"}),(r:imaging {characteristic:"早期动脉粥样硬化斑块形成",type:"血管内超声及多普勒血流测定"}) CREATE (d)-[:imaging_show {reference:"内科学第九版"}]->(r);
MATCH (d:disease {name:"X综合征"}),(r:imaging {characteristic:"冠状动脉血流储备降低",type:"血管内超声及多普勒血流测定"}) CREATE (d)-[:imaging_show {reference:"内科学第九版"}]->(r);

//超声心动图
CREATE (:imaging {characteristic:"无异常",type:"超声心动图"});
CREATE (:imaging {characteristic:"坏死区心室壁运动异常",type:"超声心动图"});
CREATE (:imaging {characteristic:"缺血区心室壁运动异常",type:"超声心动图"});
MATCH (u:imaging {characteristic:"无异常",type:"超声心动图"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:imaging_show {frequency_probability:"most", reference:"内科学第九版"}]->(u);
MATCH (u:imaging {characteristic:"坏死区心室壁运动异常",type:"超声心动图"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:imaging_show {condition:"陈旧性心肌梗死", reference:"内科学第九版"}]->(u);
MATCH (u:imaging {characteristic:"坏死区心室壁运动异常",type:"超声心动图"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:imaging_show {condition:"严重心肌缺血", reference:"内科学第九版"}]->(u);

//放射性核素检查
CREATE (:imaging {type:"核素心肌显像",status:"静息",characteristic:"心肌梗死后瘢痕部位灌注缺损"});
CREATE (:imaging {type:"核素心肌显像",status:"运动负荷",characteristic:"灌注缺损心肌缺血区"});
CREATE (:imaging {type:"放射性核素心腔造影"});
CREATE (:imaging {type:"PET"});
MATCH (r:imaging {type:"核素心肌显像",status:"静息",characteristic:"心肌梗死后瘢痕部位灌注缺损"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:imaging_show {reference:"内科学第九版"}]->(r);
MATCH (r:imaging {type:"核素心肌显像",status:"运动负荷",characteristic:"灌注缺损心肌缺血区"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:imaging_show {reference:"内科学第九版"}]->(r);
MATCH (r:imaging {type:"核素心肌显像",characteristic:"灌注缺损心肌缺血区"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:imaging_show {reference:"内科学第九版"}]->(r);

//X线胸片
CREATE (:imaging {type:"X线胸片",status:"早期间质水肿",characteristic:"上肺静脉充盈"});
CREATE (:imaging {type:"X线胸片",status:"早期间质水肿",characteristic:"肺门血管影模糊"});
CREATE (:imaging {type:"X线胸片",status:"早期间质水肿",characteristic:"小叶间隔增厚"});
CREATE (:imaging {type:"X线胸片",status:"肺水肿",characteristic:"蝶形肺门"});
CREATE (:imaging {type:"X线胸片",status:"严重肺水肿",characteristic:"弥漫满肺的大片阴影"});
MATCH (r:imaging {type:"X线胸片",status:"早期间质水肿",characteristic:"上肺静脉充盈"}), (d:disease {name:"急性心力衰竭"}) CREATE (d)-[:imaging_show {reference:"内科学第九版"}]->(r);
MATCH (r:imaging {type:"X线胸片",status:"早期间质水肿",characteristic:"肺门血管影模糊"}), (d:disease {name:"急性心力衰竭"}) CREATE (d)-[:imaging_show {reference:"内科学第九版"}]->(r);
MATCH (r:imaging {type:"X线胸片",status:"早期间质水肿",characteristic:"小叶间隔增厚"}), (d:disease {name:"急性心力衰竭"}) CREATE (d)-[:imaging_show {reference:"内科学第九版"}]->(r);
MATCH (r:imaging {type:"X线胸片",status:"肺水肿",characteristic:"蝶形肺门"}), (d:disease {name:"急性心力衰竭"}) CREATE (d)-[:imaging_show {reference:"内科学第九版"}]->(r);
MATCH (r:imaging {type:"X线胸片",status:"严重肺水肿",characteristic:"弥漫满肺的大片阴影"}), (d:disease {name:"急性心力衰竭"}) CREATE (d)-[:imaging_show {reference:"内科学第九版"}]->(r);


//分级
CREATE (:grade {name:"Ⅰ级", criterion:"一般体力活动（如步行和登楼）不受限，仅在强、快或持续用力时发生心绞痛",reference:"加拿大心血管病学会(CCS)"});
CREATE (:grade {name:"Ⅱ级", criterion:"一般体力活动轻度受限。快步、饭后、寒冷或刮风中、精神应激或醒后数小时内发作心绞痛。一般情况平地步行200m以上或登楼一层以上受限",reference:"加拿大心血管病学会(CCS)"});
CREATE (:grade {name:"Ⅲ级", criterion:"一般体力活动明显受限，一般情况下平地步行200m内或登楼一层引起心绞痛",reference:"加拿大心血管病学会(CCS)"});
CREATE (:grade {name:"Ⅳ级", criterion:"轻微活动或休息时即可发生心绞痛",reference:"加拿大心血管病学会(CCS)"});

CREATE (:grade {name:"Ⅰ级", criterion:"严重的初发型心绞痛或恶化型心绞痛，无静息疼痛",mortality_MI_rate_in_one_year:"7.3%",reference:"Braunwald分级"});
CREATE (:grade {name:"Ⅱ级", criterion:"亚急性静息型疼痛（一个月内发作过，但48小时内无发作）",mortality_MI_rate_in_one_year:"10.3%",reference:"Braunwald分级"});
CREATE (:grade {name:"Ⅲ级", criterion:"急性静息型心绞痛（48小时内有发作）",mortality_MI_rate_in_one_year:"10.8%",reference:"Braunwald分级"});

CREATE (:grade {name:"A", criterion:"继发性心绞痛，在冠状动脉狭窄基础上，存在加剧心肌缺血的冠状动脉以外的疾病",mortality_MI_rate_in_one_year:"14.1%",reference:"Braunwald分级"});
CREATE (:grade {name:"B", criterion:"原发性心绞痛，无加剧心肌缺血的冠状动脉以外的疾病",mortality_MI_rate_in_one_year:"8.5%",reference:"Braunwald分级"});
CREATE (:grade {name:"C", criterion:"心肌梗死后心绞痛，心肌梗死后两周内发生的不稳定型心绞痛",mortality_MI_rate_in_one_year:"18.5%",reference:"Braunwald分级"});

MATCH (d:disease {name:"稳定型心绞痛"}),(g:grade {reference:"加拿大心血管病学会(CCS)"}) CREATE (d)-[:disease_classification {comment:"严重程度分级",reference:"内科学第九版"}]->(g);
MATCH (d:disease {name:"不稳定型心绞痛"}),(g:grade {name:"Ⅰ级", reference:"Braunwald分级"}) CREATE (d)-[:disease_classification {comment:"严重程度分级",reference:"内科学第九版"}]->(g);
MATCH (d:disease {name:"不稳定型心绞痛"}),(g:grade {name:"Ⅱ级", reference:"Braunwald分级"}) CREATE (d)-[:disease_classification {comment:"严重程度分级",reference:"内科学第九版"}]->(g);
MATCH (d:disease {name:"不稳定型心绞痛"}),(g:grade {name:"Ⅲ级", reference:"Braunwald分级"}) CREATE (d)-[:disease_classification {comment:"严重程度分级",reference:"内科学第九版"}]->(g);
MATCH (d:disease {name:"不稳定型心绞痛"}),(g:grade {name:"A", reference:"Braunwald分级"}) CREATE (d)-[:disease_classification {comment:"临床环境分类",reference:"内科学第九版"}]->(g);
MATCH (d:disease {name:"不稳定型心绞痛"}),(g:grade {name:"B", reference:"Braunwald分级"}) CREATE (d)-[:disease_classification {comment:"临床环境分类",reference:"内科学第九版"}]->(g);
MATCH (d:disease {name:"不稳定型心绞痛"}),(g:grade {name:"C", reference:"Braunwald分级"}) CREATE (d)-[:disease_classification {comment:"临床环境分类",reference:"内科学第九版"}]->(g);

//心肌梗死分型

//心梗引起心力衰竭分级
CREATE (:grade {name:"Ⅰ级", criterion:"尚无明显心力衰竭",reference:"Killip分级"});
CREATE (:grade {name:"Ⅱ级", criterion:"有左心衰竭，肺部啰音<50%肺野",reference:"Killip分级"});
CREATE (:grade {name:"Ⅲ级", criterion:"有急性肺水肿，全肺大、小、干、湿啰音",reference:"Killip分级"});
CREATE (:grade {name:"Ⅳ级", criterion:"有心源性休克等不同程度或阶段的血流动力学变化",reference:"Killip分级"});
MATCH (d:disease {english_name:"STEMI"}),(g:grade {reference:"Killip分级"}) CREATE (d)-[:disease_classification {comment:"严重程度分级",reference:"内科学第九版"}]->(g);

//心力衰竭分级
CREATE (:grade {name:"Ⅰ级", criterion:"心脏病病人日常活动量不受限制，一般活动不引起乏力、呼吸困难等心衰症状",reference:"NYHA心功能分级"});
CREATE (:grade {name:"Ⅱ级", criterion:"心脏病病人体力活动轻度受限，休息时无自觉症状，一般活动下可出现心衰症状",reference:"NYHA心功能分级"});
CREATE (:grade {name:"Ⅲ级", criterion:"心脏病病人体力活动明显受限，低于平时一般活动即引起心衰症状",reference:"NYHA心功能分级"});
CREATE (:grade {name:"Ⅳ级", criterion:"心脏病病人不能从事任何体力活动，休息状态下也存在心衰症状，活动后加重",reference:"NYHA心功能分级"});
CREATE (:grade {name:"轻度心衰", criterion:"6分钟步行试验>450m",reference:"US Carvedilol"});
CREATE (:grade {name:"中度心衰", criterion:"6分钟步行试验150~450n",reference:"US Carvedilol"});
CREATE (:grade {name:"重度心衰", criterion:"6分钟步行试验<150m",reference:"US Carvedilol"});
MATCH (d:disease {name:"慢性心力衰竭"}),(g:grade {reference:"NYHA心功能分级"}) CREATE (d)-[:disease_classification {comment:"严重程度分级",reference:"内科学第九版"}]->(g);
MATCH (d:disease {name:"慢性心力衰竭"}),(g:grade {reference:"US Carvedilol"}) CREATE (d)-[:disease_classification {comment:"严重程度分级",reference:"内科学第九版"}]->(g);

//分类
CREATE (:classification {name:"Ⅰ类", criterion:"无肺淤血和周围灌注不足；肺毛细血管楔压（PCWP）和心排血指数（CI）正常",reference:"Forrester分类"});
CREATE (:classification {name:"Ⅱ类", criterion:"单有肺淤血；PCWP（>18mmHg），CI正常[>2.2L/ (min·m2)]",reference:"Forrester分类"});
CREATE (:classification {name:"Ⅲ类", criterion:"单有周围灌注不足；PCWP正常（<18mmHg），CI降低[<2.2L/ (min·m2)]，主要与血容量不足或心动过缓有关",reference:"Forrester分类"});
CREATE (:classification {name:"Ⅳ类", criterion:"合并有肺淤血和周围灌注不足；PCWP增高（>18mmHg），CI降低[<2.2L/ (min·m2)]",reference:"Forrester分类"});
MATCH (d:disease {english_name:"STEMI"}),(g:classification {reference:"Forrester分类"}) CREATE (d)-[:disease_classification {reference:"内科学第九版"}]->(g);

CREATE (:disease {name:"心肌梗死"});
CREATE (:classification {name:"1型心肌梗死",definition:"由冠状动脉粥样硬化斑块急性破裂或侵蚀，血小板激活，继发冠状动脉血栓性阻塞，引起心肌缺血、损伤或坏死。须具备心肌损伤和至少一项心肌缺血的临床证据。"});
CREATE (:classification {name:"2型心肌梗死",definition:"与冠状动脉粥样斑块急性破裂或侵蚀、血栓形成无关，为心肌供氧和需氧之间失平衡所致。"});
CREATE (:classification {name:"3型心肌梗死",definition:"指心脏性死亡伴心肌缺血症状和新发生缺血性心电图改变或心室颤动,但死亡发生于获得生物标志物的血样本或在明确心脏生物标志物增高之前，尸检证实为心肌梗死。"});
CREATE (:classification {name:"4a型心肌梗死",definition:"经皮冠状动脉介入治疗相关心肌梗死。"});
CREATE (:classification {name:"4b型心肌梗死",definition:"冠状动脉内支架或支撑物血栓形成相关心肌梗死。"});
CREATE (:classification {name:"4c型心肌梗死",definition:"再狭窄相关肌梗死。"});
CREATE (:classification {name:"5型心肌梗死",definition:"为冠状动脉旁路移植术相关的心肌梗死。"});
MATCH (d1:disease {english_name:"STEMI"}), (d2:classification {name:"1型心肌梗死"}) CREATE (d1)-[:disease_classification {reference:"急性ST段抬高型心肌梗死诊断和治疗指南(2019)"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}), (d2:classification {name:"2型心肌梗死"}) CREATE (d1)-[:disease_classification {reference:"急性ST段抬高型心肌梗死诊断和治疗指南(2019)"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}), (d2:classification {name:"3型心肌梗死"}) CREATE (d1)-[:disease_classification {reference:"急性ST段抬高型心肌梗死诊断和治疗指南(2019)"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}), (d2:classification {name:"4a型心肌梗死"}) CREATE (d1)-[:disease_classification {reference:"急性ST段抬高型心肌梗死诊断和治疗指南(2019)"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}), (d2:classification {name:"4b型心肌梗死"}) CREATE (d1)-[:disease_classification {reference:"急性ST段抬高型心肌梗死诊断和治疗指南(2019)"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}), (d2:classification {name:"4c型心肌梗死"}) CREATE (d1)-[:disease_classification {reference:"急性ST段抬高型心肌梗死诊断和治疗指南(2019)"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}), (d2:classification {name:"5型心肌梗死"}) CREATE (d1)-[:disease_classification {reference:"急性ST段抬高型心肌梗死诊断和治疗指南(2019)"}]->(d2);

//心力衰竭分期
CREATE (:stage {name:"前心衰阶段", criterion:"病人存在心衰高危因素，但目前尚无心脏结构或功能异常，也无心衰的症状和（或）体征"});
CREATE (:stage {name:"前临床心衰阶段", criterion:"病入无心衰的症状和（或）体征，但已出现心脏结构改变，如左心室肥厚、无症状瓣膜性心脏病 既往心肌梗死史等"});
CREATE (:stage {name:"临床心衰阶段", criterion:"病人已有心脏结构改变，既往或目前有心衰的症状和（或）体征"});
CREATE (:stage {name:"难治性终末期心衰阶段", criterion:" 病人虽经严格优化内科治疗，但休息时仍有症状，常伴 源性恶病质，须反复长期住院"});
MATCH (d:disease {name:"慢性心力衰竭"}),(g:stage {name:"前心衰阶段"}) CREATE (d)-[:disease_classification {comment:"分期",reference:"内科学第九版"}]->(g);
MATCH (d:disease {name:"慢性心力衰竭"}),(g:stage {name:"前临床心衰阶段"}) CREATE (d)-[:disease_classification {comment:"分期",reference:"内科学第九版"}]->(g);
MATCH (d:disease {name:"慢性心力衰竭"}),(g:stage {name:"临床心衰阶段"}) CREATE (d)-[:disease_classification {comment:"分期",reference:"内科学第九版"}]->(g);
MATCH (d:disease {name:"慢性心力衰竭"}),(g:stage {name:"难治性终末期心衰阶段"}) CREATE (d)-[:disease_classification {comment:"分期",reference:"内科学第九版"}]->(g);


//鉴别诊断
CREATE (d:disease {name:"心脏神经症"});
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

CREATE (d:disease {name:"支气管哮喘"});
CREATE (d:disease {name:"心包积液"});
CREATE (d:disease {name:"窄缩性心包炎"});
CREATE (d:disease {name:"肝硬化腹腔积液伴下肢水肿"});

MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"急性冠状动脉综合征"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"反流性食管炎"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"膈疝"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"心脏神经症"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"消化性溃疡"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"肠道疾病"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"颈椎病"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"肋间神经痛"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"肋软骨炎"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"主动脉瓣狭窄"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"主动脉瓣关闭不全"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"风湿性冠脉炎"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"梅毒主动性脉炎引起的冠脉口狭窄或闭塞"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"肥厚型心肌病"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"X综合征"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
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
MATCH (d1:disease {name:"慢性心力衰竭"}),(d2:disease {name:"支气管哮喘"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"慢性心力衰竭"}),(d2:disease {name:"窄缩性心包炎"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"慢性心力衰竭"}),(d2:disease {name:"心包积液"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"慢性心力衰竭"}),(d2:disease {name:"肝硬化腹腔积液伴下肢水肿"}) CREATE (d1)-[:discriminate {reference:"内科学第九版"}]->(d2);

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


//并发症
CREATE (d:disease {name:"乳头肌功能失调或断裂"});
CREATE (d:disease {name:"心脏破裂"});
CREATE (d:disease {name:"栓塞"});
CREATE (d:disease {name:"心室壁瘤"});
CREATE (d:disease {name:"心肌梗死后综合征"});
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"乳头肌功能失调或断裂"}) CREATE (d1)-[:complicate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"心脏破裂"}) CREATE (d1)-[:complicate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"栓塞"}) CREATE (d1)-[:complicate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"心室壁瘤"}) CREATE (d1)-[:complicate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"心肌梗死后综合征"}) CREATE (d1)-[:complicate {reference:"内科学第九版"}]->(d2);

CREATE (d:disease {name:"心房颤动"});
CREATE (d:disease {name:"急性肺水肿"});
CREATE (d:disease {name:"血栓栓塞"});
CREATE (d:disease {name:"右心衰竭"});
CREATE (d:disease {name:"感染性心内膜炎"});
CREATE (d:disease {name:"肺部感染"});
MATCH (d1:disease {name:"二尖瓣狭窄"}),(d2:disease {name:"心房颤动"}) CREATE (d1)-[:complicate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"二尖瓣狭窄"}),(d2:disease {name:"急性肺水肿"}) CREATE (d1)-[:complicate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"二尖瓣狭窄"}),(d2:disease {name:"血栓栓塞"}) CREATE (d1)-[:complicate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"二尖瓣狭窄"}),(d2:disease {name:"右心衰竭"}) CREATE (d1)-[:complicate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"二尖瓣狭窄"}),(d2:disease {name:"感染性心内膜炎"}) CREATE (d1)-[:complicate {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"二尖瓣狭窄"}),(d2:disease {name:"肺部感染"}) CREATE (d1)-[:complicate {reference:"内科学第九版"}]->(d2);



//drug
//β受体拮抗剂
//CREATE (:pathology {description:"抑制心脏β肾上腺素能受体，减慢心率、减弱心肌收缩力、降低血压，从而降低心肌耗氧以减少心绞痛发作和增加运动耐量。"})
CREATE (:drug {type:"β受体拮抗剂",name:"美托洛尔"});
CREATE (:drug {type:"β受体拮抗剂",name:"比索洛尔"});
CREATE (:drug {type:"β受体拮抗剂",name:"艾司洛尔"});
CREATE (:drug {type:"β受体拮抗剂",name:"卡维地洛"});

CREATE (:contraindication {condition:"严重心动过缓"});
CREATE (:contraindication {condition:"高度房室传导阻滞"});
CREATE (:contraindication {condition:"窦房结功能紊乱"});
CREATE (:contraindication {condition:"支气管痉挛"});
CREATE (:contraindication {condition:"支气管哮喘"});
CREATE (:contraindication {condition:"外周血管疾病"});
CREATE (:contraindication {condition:"严重抑郁"});
CREATE (:contraindication {condition:"慢性肺心病"});
CREATE (:contraindication {condition:"心力衰竭"});
CREATE (:contraindication {condition:"低心输出量状态"});

MATCH (d:drug {type:"β受体拮抗剂"}),(c:contraindication {condition:"严重心动过缓"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);
MATCH (d:drug {type:"β受体拮抗剂"}),(c:contraindication {condition:"高度房室传导阻滞"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);
MATCH (d:drug {type:"β受体拮抗剂"}),(c:contraindication {condition:"窦房结功能紊乱"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);
MATCH (d:drug {type:"β受体拮抗剂"}),(c:contraindication {condition:"支气管痉挛"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);
MATCH (d:drug {type:"β受体拮抗剂"}),(c:contraindication {condition:"支气管哮喘"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);
MATCH (d:drug {type:"β受体拮抗剂"}),(c:contraindication {condition:"外周血管疾病"}) CREATE (d)<-[:prohibit {comment:"相对禁止",reference:"内科学第九版"}]-(c);
MATCH (d:drug {type:"β受体拮抗剂"}),(c:contraindication {condition:"严重抑郁"}) CREATE (d)<-[:prohibit {comment:"相对禁止",reference:"内科学第九版"}]-(c);
MATCH (d:drug {type:"β受体拮抗剂"}),(c:contraindication {condition:"慢性肺心病"}) CREATE (d)<-[:prohibit {comment:"小心使用",reference:"内科学第九版"}]-(c);

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"美托洛尔"}) CREATE (ds)<-[:cure {period:"缓解期",type:"普通片",dosage:"25~100mg",frequency:"每日2次口服",effect:"改善缺血、减轻症状",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"美托洛尔"}) CREATE (ds)<-[:cure {period:"缓解期",type:"缓释片",dosage:"47.5~190mg",frequency:"每日1次口服",effect:"改善缺血、减轻症状",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"比索洛尔"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"5~10mg",frequency:"每日1次口服",effect:"改善缺血、减轻症状",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"X综合征"}),(dg:drug {type:"β受体拮抗剂"}) CREATE (ds)<-[:cure {effect:"改善少部分病人症状，总体效果不佳",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"心肌桥"}),(dg:drug {type:"β受体拮抗剂"}) CREATE (ds)<-[:cure {effect:"改善少部分病人症状，总体效果不佳",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"冠状动脉痉挛"}),(dg:drug {type:"β受体拮抗剂"}) CREATE (ds)<-[:prohibit {effect:"加重或诱发痉挛",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"冠状动脉痉挛"}),(dg:drug {type:"β受体拮抗剂"}) CREATE (ds)<-[:cure {condition:"伴有固定性狭窄",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"美托洛尔"}) CREATE (ds)<-[:cure {effect:"抗心肌缺血",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"比索洛尔"}) CREATE (ds)<-[:cure {effect:"抗心肌缺血",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"艾司洛尔"}) CREATE (ds)<-[:cure {effect:"抗心肌缺血",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"美托洛尔"}) CREATE (ds)<-[:cure {effect:"解除疼痛",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"比索洛尔"}) CREATE (ds)<-[:cure {effect:"解除疼痛",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"艾司洛尔"}) CREATE (ds)<-[:cure {effect:"解除疼痛",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {type:"美托洛尔"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {type:"比索洛尔"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {type:"卡维地洛"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);


CREATE (:drug {type:"正性肌力药",family:"硝酸酯类药",name:"单硝酸异山梨酯"});
CREATE (:drug {type:"正性肌力药",family:"硝酸酯类药",name:"硝酸甘油"});
CREATE (:drug {type:"正性肌力药",family:"硝酸酯类药",name:"硝酸异山梨酯"});
CREATE (:drug {type:"正性肌力药",family:"硝酸酯类药",name:"5-单硝酸异山梨酯"});
CREATE (:drug {type:"正性肌力药",name:"多巴胺"});
CREATE (:drug {type:"正性肌力药",name:"左西孟旦"});
CREATE (:drug {type:"正性肌力药",name:"米力农"});
CREATE (:drug {type:"正性肌力药",name:"多巴酚丁胺"});
CREATE (:drug {type:"正性肌力药",name:"去乙酰毛花苷",family:"洋黄地类药"});
CREATE (:drug {type:"正性肌力药",name:"地高辛",family:"洋黄地类药"});

CREATE (:side_effect {description:"头痛"});
CREATE (:side_effect {description:"眩晕"});
CREATE (:side_effect {description:"虚弱"});
CREATE (:side_effect {description:"心动过速"});
CREATE (:side_effect {description:"口干"});
CREATE (:side_effect {description:"恶心"});
CREATE (:side_effect {description:"出汗"});
CREATE (:side_effect {description:"苍白"});
CREATE (:side_effect {description:"虚脱"});
CREATE (:side_effect {description:"晕厥"});
CREATE (:side_effect {description:"心动过缓"});
CREATE (:side_effect {description:"心绞痛加重"});
CREATE (:side_effect {description:"药疹"});
CREATE (:side_effect {description:"剥脱性皮炎"});

CREATE (:side_effect {description:"面色潮红"});
CREATE (:side_effect {description:"心律反射加快"});
CREATE (:side_effect {description:"低血压"});
CREATE (:side_effect {description:"直立性低血压"});
CREATE (:contraindication {condition:"心肌梗死早期"});
CREATE (:contraindication {condition:"严重低血压"});
CREATE (:contraindication {condition:"心动过速"});
CREATE (:contraindication {condition:"严重贫血"});
CREATE (:contraindication {condition:"青光眼"});
CREATE (:contraindication {condition:"颅内压增高"});
CREATE (:contraindication {condition:"硝酸甘油过敏"});
CREATE (:contraindication {condition:"下壁MI"});
CREATE (:contraindication {condition:"可疑右室MI"});
CREATE (:contraindication {condition:"收缩压<90mmHg"});
MATCH (d:drug {family:"硝酸酯类药"}),(c:contraindication {condition:"下壁MI"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);
MATCH (d:drug {family:"硝酸酯类药"}),(c:contraindication {condition:"可疑右室MI"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);
MATCH (d:drug {family:"硝酸酯类药"}),(c:contraindication {condition:"收缩压<90mmHg"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);
MATCH (d:drug {family:"硝酸酯类药"}),(c:contraindication {condition:"心肌梗死早期"}) CREATE (d)<-[:prohibit {comment:"小心使用",reference:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {family:"硝酸酯类药"}),(c:contraindication {condition:"严重低血压"}) CREATE (d)<-[:prohibit {comment:"小心使用",reference:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {family:"硝酸酯类药"}),(c:contraindication {condition:"心动过速"}) CREATE (d)<-[:prohibit {comment:"小心使用",reference:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {family:"硝酸酯类药"}),(c:contraindication {condition:"严重贫血"}) CREATE (d)<-[:prohibit {comment:"小心使用",reference:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {family:"硝酸酯类药"}),(c:contraindication {condition:"青光眼"}) CREATE (d)<-[:prohibit {comment:"小心使用",reference:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {family:"硝酸酯类药"}),(c:contraindication {condition:"颅内压增高"}) CREATE (d)<-[:prohibit {comment:"小心使用",reference:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {family:"硝酸酯类药"}),(c:contraindication {condition:"硝酸甘油过敏"}) CREATE (d)<-[:prohibit {comment:"小心使用",reference:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);



MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"头痛"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"面色潮红"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"心律反射加快"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"直立性低血压"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"眩晕"}) CREATE (d)-[:drug_side_effect {reference:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"虚弱"}) CREATE (d)-[:drug_side_effect {reference:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"心悸"}) CREATE (d)-[:drug_side_effect {reference:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"心动过速"}) CREATE (d)-[:drug_side_effect {reference:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"口干"}) CREATE (d)-[:drug_side_effect {reference:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"恶心"}) CREATE (d)-[:drug_side_effect {reference:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"呕吐"}) CREATE (d)-[:drug_side_effect {reference:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"虚弱"}) CREATE (d)-[:drug_side_effect {reference:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"苍白"}) CREATE (d)-[:drug_side_effect {reference:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"虚脱"}) CREATE (d)-[:drug_side_effect {reference:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"晕厥"}) CREATE (d)-[:drug_side_effect {reference:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"心动过缓"}) CREATE (d)-[:drug_side_effect {reference:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"心绞痛加重"}) CREATE (d)-[:drug_side_effect {reference:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"药疹"}) CREATE (d)-[:drug_side_effect {reference:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {family:"硝酸酯类药"}),(se:side_effect {description:"剥脱性皮炎"}) CREATE (d)-[:drug_side_effect {reference:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"单硝酸异山梨酯"}) CREATE (ds)<-[:cure {period:"缓解期",type:"普通片",dosage:"5~20mg",frequency:"每日2次口服",effect:"改善缺血、减轻症状",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"单硝酸异山梨酯"}) CREATE (ds)<-[:cure {period:"缓解期",type:"缓释片",dosage:"40~60mg",frequency:"每日1次口服",effect:"改善缺血、减轻症状",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"硝酸甘油"}) CREATE (ds)<-[:cure {period:"发作期",dosage:"0.5mg",usag:"舌下含化",onset_time:"1~2min",actuation_duaration:"0.5h",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"硝酸异山梨酯"}) CREATE (ds)<-[:cure {period:"发作期",dosage:"5~10mg",usag:"舌下含化",onset_time:"2~5min",actuation_duaration:"2~3h",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"X综合征"}),(dg:drug {family:"硝酸酯类药"}) CREATE (ds)<-[:cure {effect:"改善少部分病人症状，总体效果不佳",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"心肌桥"}),(dg:drug {type:"正性肌力药"}) CREATE (ds)<-[:prohibit {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"冠状动脉痉挛"}),(dg:drug {family:"硝酸酯类药"}) CREATE (ds)<-[:cure {effect:"主要治疗手段",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"硝酸甘油"}) CREATE (ds)<-[:cure {period:"心绞痛发作期",type:"静脉滴注",dosage:"5~10μg/min,每5~10分钟增加10μg/min，<200μg/min",effect:"抗心肌缺血",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"硝酸异山梨酯"}) CREATE (ds)<-[:cure {period:"心绞痛消失后12~24h",usage:"口服",effect:"抗心肌缺血",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"5-单硝酸异山梨酯"}) CREATE (ds)<-[:cure {period:"心绞痛消失后12~24h",usage:"口服",effect:"抗心肌缺血",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"硝酸甘油"}) CREATE (ds)<-[:cure {effect:"解除疼痛",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"硝酸异山梨酯"}) CREATE (ds)<-[:cure {effect:"解除疼痛",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"单硝酸异山梨酯"}) CREATE (ds)<-[:cure {effect:"解除疼痛",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {family:"多巴酚丁胺"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {family:"米力农"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {family:"左西孟旦"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {family:"去乙酰毛花苷"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {family:"多巴胺"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {family:"地高辛"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);

CREATE (:drug {type:"钙通道阻滞剂",name:"维拉帕米",family:"非二氢吡啶类"});
CREATE (:drug {type:"钙通道阻滞剂",name:"地尔硫䓬",family:"非二氢吡啶类"});
CREATE (:drug {type:"钙通道阻滞剂",name:"硝苯地平"});
CREATE (:drug {type:"钙通道阻滞剂",name:"氨氯地平",family:"二氢吡啶类"});
CREATE (:contraindication {condition:"左室功能不全"});
CREATE (:contraindication {condition:"与β受体阻滞剂联合使用"});
CREATE (:contraindication {condition:"病态窦房结综合征"});
MATCH (d:drug {family:"非二氢吡啶类"}),(c:contraindication {condition:"左室功能不全"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);
MATCH (d:drug {family:"非二氢吡啶类"}),(c:contraindication {condition:"与β受体阻滞剂联合使用"}) CREATE (d)<-[:prohibit {comment:"小心使用",reference:"内科学第九版"}]-(c);
MATCH (d:drug {family:"非二氢吡啶类"}),(c:contraindication {condition:"严重心动过缓"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);
MATCH (d:drug {family:"非二氢吡啶类"}),(c:contraindication {condition:"高度房室传导阻滞"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);
MATCH (d:drug {family:"非二氢吡啶类"}),(c:contraindication {condition:"病态窦房结综合征"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);

CREATE (:side_effect {description:"外周水肿"});
CREATE (:side_effect {description:"便秘"});
CREATE (:side_effect {description:"心悸"});
CREATE (:side_effect {description:"头晕"});
CREATE (:side_effect {description:"虚弱无力"});
MATCH (d:drug {type:"钙通道阻滞剂"}),(se:side_effect {description:"外周水肿"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {type:"钙通道阻滞剂"}),(se:side_effect {description:"便秘"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {type:"钙通道阻滞剂"}),(se:side_effect {description:"心悸"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {type:"钙通道阻滞剂"}),(se:side_effect {description:"头痛"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {type:"钙通道阻滞剂"}),(se:side_effect {description:"头晕"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {type:"钙通道阻滞剂"}),(se:side_effect {description:"虚弱无力"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {type:"钙通道阻滞剂"}),(se:side_effect {description:"面色潮红"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"维拉帕米"}) CREATE (ds)<-[:cure {period:"缓解期",type:"普通片",dosage:"40~80mg",frequency:"每日3次口服",effect:"改善缺血、减轻症状",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"维拉帕米"}) CREATE (ds)<-[:cure {period:"缓解期",type:"缓释片",dosage:"240mg",frequency:"每日1次口服",effect:"改善缺血、减轻症状",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"地尔硫䓬"}) CREATE (ds)<-[:cure {period:"缓解期",type:"普通片",dosage:"30~60mg",frequency:"每日3次",effect:"改善缺血、减轻症状",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"地尔硫䓬"}) CREATE (ds)<-[:cure {period:"缓解期",type:"缓释片",dosage:"90mg",frequency:"每日1次",effect:"改善缺血、减轻症状",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"硝苯地平"}) CREATE (ds)<-[:cure {period:"缓解期",type:"控释片",condition:"同时有高血压",dosage:"30mg",frequency:"每日1次",effect:"改善缺血、减轻症状",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"氨氯地平"}) CREATE (ds)<-[:cure {period:"缓解期",condition:"同时有高血压",dosage:"5~10mg",frequency:"每日1次",effect:"改善缺血、减轻症状",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"X综合征"}),(dg:drug {type:"钙通道阻滞剂"}) CREATE (ds)<-[:cure {effect:"改善少部分病人症状，总体效果不佳",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"心肌桥"}),(dg:drug {type:"钙通道阻滞剂"}) CREATE (ds)<-[:cure {effect:"可有效缓解症状",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"冠状动脉痉挛"}),(dg:drug {type:"钙通道阻滞剂"}) CREATE (ds)<-[:cure {effect:"主要治疗手段",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {type:"钙通道阻滞剂"}) CREATE (ds)<-[:cure {condition:"血管痉挛性心绞痛首选，或足量β受体拮抗剂与硝酸酯类药物治疗后仍不能控制缺血症状",effect:"抗心肌缺血",reference:"内科学第九版"}]-(dg);


CREATE (:drug {name:"曲美他嗪"});
CREATE (:drug {name:"尼可地尔",type:"钾通道开放剂"});
CREATE (:drug {name:"伊伐布雷定",type:"窦房结I1通道阻滞剂"});
CREATE (:drug {name:"雷诺嗪"});
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"曲美他嗪"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"20~60mg",frequency:"每日3次",effect:"改善缺血、减轻症状",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"尼可地尔"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"2mg",frequency:"每日3次",effect:"改善缺血、减轻症状",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"伊伐布雷定"}) CREATE (ds)<-[:cure {period:"缓解期",effect:"改善缺血、减轻症状",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"雷诺嗪"}) CREATE (ds)<-[:cure {period:"缓解期",effect:"改善缺血、减轻症状",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"X综合征"}),(dg:drug {name:"曲美他嗪"}) CREATE (ds)<-[:cure {effect:"改善少部分病人症状，总体效果不佳",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"尼可地尔"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {name:"伊伐布雷定"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);

CREATE (:drug {type:"抗血小板药物",name:"阿司匹林",family:"环氧化酶（COX）抑制剂"});
CREATE (:drug {type:"抗血小板药物",name:"吲哚布芬",family:"环氧化酶（COX）抑制剂"});
CREATE (:drug {type:"抗血小板药物",name:"氯吡格雷",family:"P2Y12受体拮抗剂"});
CREATE (:drug {type:"抗血小板药物",name:"替格瑞洛",family:"P2Y12受体拮抗剂"});
CREATE (:drug {type:"抗血小板药物",name:"西洛他唑",family:"环核昔酸磷酸二酷酶抑制剂"});
CREATE (:drug {type:"抗血小板药物",name:"双嘧达莫",family:"环核昔酸磷酸二酷酶抑制剂"});
CREATE (:drug {type:"抗血小板药物",name:"替罗非班",family:"血小板糖蛋白受体拮抗剂"});
CREATE (:drug {type:"抗血小板药物",name:"依替非巴肽",family:"血小板糖蛋白受体拮抗剂"});

CREATE (:side_effect {description:"胃肠道出血"});
CREATE (:side_effect {description:"阿司匹林过敏"});
MATCH (d:drug {name:"阿司匹林"}),(se:side_effect {description:"胃肠道出血"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {name:"阿司匹林"}),(se:side_effect {description:"阿司匹林过敏"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
CREATE (:side_effect {description:"灌装动脉窃血"});
MATCH (d:drug {name:"双嘧达莫"}),(se:side_effect {description:"灌装动脉窃血"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"阿司匹林"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"75~150mg",frequency:"每日1次",condition:"无禁忌症",effect:"预防心肌梗死、改善预后",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"吲哚布芬"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"100mg",frequency:"每日2次",condition:"阿司匹林不耐受",effect:"预防心肌梗死、改善预后",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"氯吡格雷"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"75mg",frequency:"每日",condition:"支架植入以后或有阿司匹林禁忌症",effect:"预防心肌梗死、改善预后",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"替格瑞洛"}) CREATE (ds)<-[:cure {period:"缓解期",effect:"预防心肌梗死、改善预后",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"氯吡格雷"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"阿司匹林"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"阿司匹林"}) CREATE (ds)<-[:cure {usage:"口服",dosage:"150~300mg",frequency:"初次服用",effect:"抗血小板治疗",dreference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"阿司匹林"}) CREATE (ds)<-[:cure {usage:"口服",dosage:"75~100mg",frequency:"每日服用",effect:"抗血小板治疗",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"吲哚布芬"}) CREATE (ds)<-[:cure {dosage:"100mg",frequency:"每日2次",condition:"阿司匹林不耐受",effect:"抗血小板治疗",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"氯吡格雷"}) CREATE (ds)<-[:cure {usage:"口服",dosage:"300~600mg",frequency:"初次服用",effect:"抗血小板治疗",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"氯吡格雷"}) CREATE (ds)<-[:cure {usage:"口服",dosage:"75mg",frequency:"每日服用",effect:"抗血小板治疗",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"替格瑞洛"}) CREATE (ds)<-[:cure {usage:"口服",dosage:"180mg",frequency:"初次服用",effect:"抗血小板治疗",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"替格瑞洛"}) CREATE (ds)<-[:cure {usage:"口服",dosage:"90mg",frequency:"每日2次",effect:"抗血小板治疗",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"西洛他唑"}) CREATE (ds)<-[:cure {condition:"阿司匹林不耐受",effect:"抗血小板治疗",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {family:"血小板糖蛋白受体拮抗剂"}) CREATE (ds)<-[:cure {condition:"接受PCI的病人或中高危患者",effect:"抗血小板治疗",reference:"内科学第九版"}]-(dg);


CREATE (:drug {type:"调脂药",name:"辛伐他汀",family:"他汀类药物"});
CREATE (:drug {type:"调脂药",name:"阿托伐他汀",family:"他汀类药物"});
CREATE (:drug {type:"调脂药",name:"普伐他汀",family:"他汀类药物"});
CREATE (:drug {type:"调脂药",name:"氟伐他汀",family:"他汀类药物"});
CREATE (:drug {type:"调脂药",name:"瑞舒伐他汀",family:"他汀类药物"});
CREATE (:drug {type:"调脂药",name:"依折麦布"});
CREATE (:drug {type:"调脂药",name:"非诺贝特"});
CREATE (:drug {type:"调脂药",name:"PCSK9抑制剂"});
CREATE (:side_effect {description:"肝脏损害"});
CREATE (:side_effect {description:"肌病"});
MATCH (d:drug {family:"他汀类药物"}),(se:side_effect {description:"肝脏损害"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {family:"他汀类药物"}),(se:side_effect {description:"肌病"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
CREATE (:contraindication {condition:"肝肾功能不全"});
CREATE (:contraindication {condition:"胆囊疾病史"});
CREATE (:contraindication {condition:"胆石症"});
CREATE (:contraindication {condition:"原发性胆汁性肝硬化"});
CREATE (:contraindication {condition:"不明原因肝功能持续异常"});
CREATE (:contraindication {condition:"哺乳期妇女"});
CREATE (:contraindication {condition:"儿童"});
CREATE (:contraindication {condition:"活动性肝病"});
CREATE (:contraindication {condition:"不明原因的血清转氨酶持续升高者"});

MATCH (d:drug {name:"非诺贝特"}),(c:contraindication {condition:"肝肾功能不全"}) CREATE (d)<-[:prohibit {reference:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {name:"非诺贝特"}),(c:contraindication {condition:"胆囊疾病史"}) CREATE (d)<-[:prohibit {reference:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {name:"非诺贝特"}),(c:contraindication {condition:"胆石症"}) CREATE (d)<-[:prohibit {reference:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {name:"非诺贝特"}),(c:contraindication {condition:"原发性胆汁性肝硬化"}) CREATE (d)<-[:prohibit {reference:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {name:"非诺贝特"}),(c:contraindication {condition:"不明原因肝功能持续异常"}) CREATE (d)<-[:prohibit {reference:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {name:"非诺贝特"}),(c:contraindication {condition:"哺乳期妇女"}) CREATE (d)<-[:prohibit {reference:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {name:"非诺贝特"}),(c:contraindication {condition:"儿童"}) CREATE (d)<-[:prohibit {reference:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {name:"依折麦布"}),(c:contraindication {condition:"活动性肝病"}) CREATE (d)<-[:prohibit {reference:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {name:"依折麦布"}),(c:contraindication {condition:"不明原因的血清转氨酶持续升高者"}) CREATE (d)<-[:prohibit {reference:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"辛伐他汀"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"20~40mg",frequency:"每晚一次",effect:"预防心肌梗死、改善预后",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"阿托伐他汀"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"10~80mg",frequency:"每日一次",effect:"预防心肌梗死、改善预后",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"普伐他汀"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"20~40mg",frequency:"每晚一次",effect:"预防心肌梗死、改善预后",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"氟伐他汀"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"40~80mg",frequency:"每晚一次",effect:"预防心肌梗死、改善预后",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"瑞舒伐他汀"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"5~20mg",frequency:"每晚一次",effect:"预防心肌梗死、改善预后",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"依折麦布"}) CREATE (ds)<-[:cure {period:"缓解期",condition:"单独应用他汀类药物胆固醇水平不能达标或不能耐受较大剂量他汀治疗",effect:"预防心肌梗死、改善预后",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"PCSK9抑制剂"}) CREATE (ds)<-[:cure {period:"缓解期",condition:"杂合子家族性高胆固醇血症、临床动脉粥样硬化性心血管疾病、在控制饮食和最大耐受剂量他汀治疗下仍需进一步降低LDL-C",effect:"预防心肌梗死、改善预后",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"X综合征"}),(dg:drug {family:"他汀类药物"}) CREATE (ds)<-[:cure {effect:"改善内皮功能",effect:"疗效尚不确定",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"辛伐他汀"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"阿托伐他汀"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"瑞舒伐他汀"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"依折麦布"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"非诺贝特"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {family:"他汀类药物"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);


CREATE (:drug {type:"ACEI",name:"卡托普利"});
CREATE (:drug {type:"ACEI",name:"依那普利"});
CREATE (:drug {type:"ACEI",name:"培哚普利"});
CREATE (:drug {type:"ACEI",name:"雷米普利"});
CREATE (:drug {type:"ACEI",name:"贝那普利"});
CREATE (:drug {type:"ACEI",name:"赖诺普利"});
CREATE (:drug {type:"ARB",name:"缬沙坦"});
CREATE (:drug {type:"ARNI",name:"沙库巴曲缬沙坦钠"});

CREATE (:contraindication {condition:"低血压"});
CREATE (:contraindication {condition:"肾衰竭"});
CREATE (:contraindication {condition:"双侧动脉狭窄"});
CREATE (:contraindication {condition:"过敏"});
MATCH (d:drug {type:"ACEI"}),(c:contraindication {condition:"低血压"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);
MATCH (d:drug {type:"ACEI"}),(c:contraindication {condition:"肾衰竭"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);
MATCH (d:drug {type:"ACEI"}),(c:contraindication {condition:"双侧动脉狭窄"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);
MATCH (d:drug {type:"ACEI"}),(c:contraindication {condition:"过敏"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"卡托普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"12.5~50mg",frequency:"每日3次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"依那普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"5~10mg",frequency:"每日2次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"培哚普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"4~8mg",frequency:"每日1次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"雷米普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"5~10mg",frequency:"每日1次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"贝那普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"10~20mg",frequency:"每日1次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"赖诺普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"10~20mg",frequency:"每日1次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"X综合征"}),(dg:drug {type:"ACEI"}) CREATE (ds)<-[:cure {effect:"改善内皮功能,疗效尚不确定",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"赖诺普利"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"缬沙坦"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"卡托普利"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"依那普利"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {type:"ACEI"}) CREATE (ds)<-[:cure {usage:"口服",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {type:"ARB"}) CREATE (ds)<-[:cure {condition:"ACEI不耐受",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {name:"卡托普利"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {name:"依那普利"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {name:"赖诺普利"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {name:"缬沙坦"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {name:"沙库巴曲缬沙坦钠"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);

CREATE (:drug {type:"抗凝药",name:"普通肝素"});
CREATE (:drug {type:"抗凝药",name:"依诺肝素",family:"低分子量肝素"});
CREATE (:drug {type:"抗凝药",name:"达肝素",family:"低分子量肝素"});
CREATE (:drug {type:"抗凝药",name:"那曲肝素",family:"低分子量肝素"});

CREATE (:drug {type:"抗凝药",name:"磺达肝葵钠"});
CREATE (:drug {type:"抗凝药",name:"比伐卢定"});
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"普通肝素"}) CREATE (ds)<-[:cure {usage:"静脉注射",dosage:"90~85U/kg",frequency:"初次使用",effect:"抗凝治疗",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"普通肝素"}) CREATE (ds)<-[:cure {usage:"静脉注射",dosage:"15~18U/(kg·h)",effect:"抗凝治疗",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {family:"低分子量肝素"}) CREATE (ds)<-[:cure {effect:"抗凝治疗",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"磺达肝葵钠"}) CREATE (ds)<-[:cure {usage:"皮下注射",dosage:"2.5mg",frequency:"每日一次",effect:"抗凝治疗",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"比伐卢定"}) CREATE (ds)<-[:cure {usage:"静脉推注",dosage:"0.75mg/kg",frequency:"一次",effect:"抗凝治疗",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"比伐卢定"}) CREATE (ds)<-[:cure {usage:"静脉滴珠",dosage:"1.75mg/(kg·h)",frequency:"至术后3~4小时",effect:"抗凝治疗",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"普通肝素"}) CREATE (ds)<-[:cure {effect:"抗凝治疗",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {family:"低分子量肝素"}) CREATE (ds)<-[:cure {effect:"抗凝治疗",reference:"内科学第九版"}]-(dg);

CREATE (:drug {type:"溶栓药",name:"尿激酶",family:"非特异性溶栓药"});
CREATE (:drug {type:"溶栓药",name:"链激酶",family:"非特异性溶栓药"});
CREATE (:drug {type:"溶栓药",name:"阿替普酶",family:"特异性纤溶酶原激活剂"});
CREATE (:drug {type:"溶栓药",name:"瑞替普酶",family:"特异性纤溶酶原激活剂"});
CREATE (:drug {type:"溶栓药",name:"奈替普酶",family:"特异性纤溶酶原激活剂"});
CREATE (:side_effect {description:"出血风险增加"});
MATCH (d:drug {family:"非特异性溶栓药"}),(se:side_effect {description:"出血风险增加"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);

MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"尿激酶"}) CREATE (ds)<-[:cure {effect:"抗凝治疗",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"阿替普酶"}) CREATE (ds)<-[:cure {effect:"抗凝治疗",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"瑞替普酶"}) CREATE (ds)<-[:cure {effect:"抗凝治疗",reference:"内科学第九版"}]-(dg);

CREATE (:drug {type:"醛固酮受体拮抗剂",name:"螺内酯"});
CREATE (:contraindication {condition:"高钾血症"});
CREATE (:contraindication {condition:"低钠血症"});
MATCH (d:drug {name:"螺内酯"}),(c:contraindication {condition:"高钾血症"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);
MATCH (d:drug {name:"螺内酯"}),(c:contraindication {condition:"低钠血症"}) CREATE (d)<-[:prohibit {reference:"内科学第九版"}]-(c);
CREATE (:side_effect {description:"高钾血症"});
CREATE (:side_effect {description:"胃肠道反应"});
CREATE (:side_effect {description:"低钠血症"});
CREATE (:side_effect {description:"女子毛发增多、月经失调"});
CREATE (:side_effect {description:"男子乳房发育、阳痿、性功能低下"});
CREATE (:side_effect {description:"行走不协调"});
MATCH (d:drug {name:"螺内酯"}),(se:side_effect {description:"高钾血症"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {name:"螺内酯"}),(se:side_effect {description:"胃肠道反应"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {name:"螺内酯"}),(se:side_effect {description:"低钠血症"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {name:"螺内酯"}),(se:side_effect {description:"女子毛发增多、月经失调"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {name:"螺内酯"}),(se:side_effect {description:"男子乳房发育、阳痿、性功能低下"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {name:"螺内酯"}),(se:side_effect {description:"行走不协调"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {name:"螺内酯"}),(se:side_effect {description:"头痛"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {name:"螺内酯"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);

CREATE (:drug {type:"镇痛药",name:"吗啡"});
CREATE (:drug {type:"镇痛药",name:"哌替啶"});
CREATE (:side_effect {description:"呼吸功能抑制"});
MATCH (d:drug {type:"镇痛药"}),(se:side_effect {description:"呼吸功能抑制"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (d:drug {type:"镇痛药"}),(se:side_effect {description:"低血压"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"吗啡"}) CREATE (ds)<-[:cure {dosage:"2~4mg",usage:"静脉注射",frequency:"5~10min后重复",effect:"解除疼痛",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"哌替啶"}) CREATE (ds)<-[:cure {dosage:"50~100mg",usage:"肌内注射",frequency:"5~10min后重复",effect:"解除疼痛",reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {name:"吗啡"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);


//利尿剂
CREATE (:drug {type:"利尿剂",name:"呋塞米"});
CREATE (:drug {type:"利尿剂",name:"托拉塞米"});
CREATE (:drug {type:"利尿剂",name:"吲达帕胺"});
CREATE (:drug {type:"利尿剂",name:"布美他尼"});
CREATE (:drug {type:"利尿剂",name:"氢氯噻嗪"});
CREATE (:drug {type:"利尿剂",name:"托伐普坦"});
CREATE (:drug {type:"利尿剂",name:"氨苯蝶啶"});
CREATE (:drug {type:"利尿剂",name:"阿米洛利"});
CREATE (:side_effect {description:"电解质紊乱"});
MATCH (d:drug {type:"利尿剂"}),(se:side_effect {description:"电解质紊乱"}) CREATE (d)-[:drug_side_effect {reference:"内科学第九版"}]->(se);

MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {name:"呋塞米"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {name:"氢氯噻嗪"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {name:"吲达帕胺"}) CREATE (ds)<-[:cure {reference:"慢性心力衰竭基层合理用药指南"}]-(dg);
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {name:"托伐普坦"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {name:"氨苯蝶啶"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {name:"阿米洛利"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {name:"呋塞米"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {name:"托拉塞米"}) CREATE (ds)<-[:cure {reference:"急性心力衰竭基层合理用药指南"}]-(dg);
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {name:"布美他尼"}) CREATE (ds)<-[:cure {reference:"急性心力衰竭基层合理用药指南"}]-(dg);

CREATE (:drug {type:"血管收缩剂",name:"去甲肾上腺素"});
CREATE (:drug {type:"血管收缩剂",name:"肾上腺素"});
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {name:"去甲肾上腺素"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {name:"肾上腺素"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);

CREATE (:drug {type:"血管扩张剂",name:"硝普钠"});
CREATE (:drug {type:"血管扩张剂",name:"硝酸甘油",family:"硝酸酯类"});
CREATE (:drug {type:"血管扩张剂",name:"双硝酸异山梨酯",family:"硝酸酯类"});
CREATE (:drug {type:"血管扩张剂",name:"乌拉地尔"});
CREATE (:drug {type:"血管扩张剂",name:"人重组脑钠肽"});
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {name:"硝普钠"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {name:"乌拉地尔"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {name:"人重组脑钠肽"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {type:"血管扩张剂",name:"双硝酸异山梨酯"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {type:"血管扩张剂",name:"硝酸甘油"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);

CREATE (:drug {name:"氨茶碱"});
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {name:"氨茶碱"}) CREATE (ds)<-[:cure {reference:"内科学第九版"}]-(dg);


CREATE (:drug {name:"苄星青霉素"});
MATCH (ds:disease {name:"二尖瓣狭窄"}),(dg:drug {name:"苄星青霉素"}) CREATE (ds)<-[:cure {dosage:"120万U",usage:"肌内注射",frequency:"每月一次",reference:"内科学第九版"}]-(dg);


//其他治疗
CREATE (:treatment {name:"休息"});
CREATE (:treatment {name:"戒烟"});
CREATE (:treatment {name:"戒酒"});
CREATE (:treatment {name:"溶栓疗法"});
CREATE (:treatment {name:"经皮冠状动脉介入治疗",english_name:"PCI"});
CREATE (:treatment {name:"冠状动脉旁路移植术",english_name:"CABG"});
CREATE (:side_effect {description:"围术期死亡率为1%-4%"});
CREATE (:side_effect {description:"血管闭塞"});
MATCH (t:treatment {english_name:"CABG"}),(se:side_effect {description:"围术期死亡率为1%-4%"}) CREATE (t)-[:treatment_side_effect {reference:"内科学第九版"}]->(se);
MATCH (t:treatment {english_name:"CABG"}),(se:side_effect {description:"血管闭塞"}) CREATE (t)-[:treatment_side_effect {reference:"内科学第九版"}]->(se);

MATCH (d:disease {name:"稳定型心绞痛"}),(t:treatment {english_name:"PCI"}) CREATE (t)-[:cure {period:"缓解期",condition:"FPR<0.75",reference:"内科学第九版"}]->(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(t:treatment {english_name:"CABG"}) CREATE (t)-[:cure {period:"缓解期",condition:"全身情况能耐受开胸手术，左主干合并2支以上冠脉病变（病变复杂程度评分，如SYNTAX评分较高），或多支血管病变合并糖尿病者",reference:"内科学第九版"}]->(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(t:treatment {name:"休息"}) CREATE (t)-[:cure {period:"发作期",reference:"内科学第九版"}]->(d);
MATCH (d:disease {name:"冠状动脉痉挛"}),(t:treatment {name:"戒烟"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
MATCH (d:disease {name:"冠状动脉痉挛"}),(t:treatment {name:"戒酒"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
MATCH (d:disease {english_name:"NSTEACS"}),(t:treatment {name:"休息"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
MATCH (d:disease {english_name:"NSTEACS"}),(t:treatment {english_name:"PCI"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
MATCH (d:disease {english_name:"NSTEACS"}),(t:treatment {english_name:"CABG"}) CREATE (t)-[:cure {condition:"病变严重、有多支血管病变的症状严重和左心室功能不全的病人",reference:"内科学第九版"}]->(d);
MATCH (d:disease {english_name:"STEMI"}),(t:treatment {english_name:"CABG"}) CREATE (t)-[:cure {condition:"病变严重、有多支血管病变的症状严重和左心室功能不全的病人",reference:"内科学第九版"}]->(d);
MATCH (d:disease {english_name:"STEMI"}),(t:treatment {english_name:"PCI"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
MATCH (d:disease {name:"STEMI"}),(t:treatment {name:"溶栓疗法"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);


CREATE (:treatment {name:"心脏再同步化治疗",english_name:"CRT"});
CREATE (:treatment {name:"植入型心律转复除颤器",english_name:"ICD"});
CREATE (:treatment {name:"左室辅助装置",english_name:"LVAD"});
CREATE (:treatment {name:"经导管二尖瓣修复术"});
CREATE (:treatment {name:"经皮左心室室壁瘤减容术"});
CREATE (:treatment {name:"心血管再生治疗"});
CREATE (:treatment {name:"基因治疗"});
MATCH (d:disease {name:"慢性心力衰竭"}),(t:treatment {name:"心脏再同步化治疗"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
MATCH (d:disease {name:"慢性心力衰竭"}),(t:treatment {name:"植入型心律转复除颤器"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
MATCH (d:disease {name:"慢性心力衰竭"}),(t:treatment {name:"左室辅助装置"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
MATCH (d:disease {name:"慢性心力衰竭"}),(t:treatment {name:"经导管二尖瓣修复术"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
MATCH (d:disease {name:"慢性心力衰竭"}),(t:treatment {name:"经皮左心室室壁瘤减容术"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
MATCH (d:disease {name:"慢性心力衰竭"}),(t:treatment {name:"心血管再生治疗"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
MATCH (d:disease {name:"慢性心力衰竭"}),(t:treatment {name:"基因治疗"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);

CREATE (:treatment {name:"机械通气"});
CREATE (:treatment {name:"连续性肾脏替代治疗",english_name:"CRRT"});
CREATE (:treatment {name:"主动脉内球囊反搏",english_name:"IABP"});
CREATE (:treatment {name:"体外膜式氧合",english_name:"ECMO"});
CREATE (:treatment {name:"可植入式电动左心室辅助泵Impella"});
MATCH (d:disease {name:"急性心力衰竭"}),(t:treatment {name:"机械通气"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
MATCH (d:disease {name:"急性心力衰竭"}),(t:treatment {name:"连续性肾脏替代治疗"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
MATCH (d:disease {name:"急性心力衰竭"}),(t:treatment {name:"主动脉内球囊反搏"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
MATCH (d:disease {name:"急性心力衰竭"}),(t:treatment {name:"体外膜式氧合"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
MATCH (d:disease {name:"急性心力衰竭"}),(t:treatment {name:"可植入式电动左心室辅助泵Impella"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);

CREATE (:treatment {name:"经皮球囊二尖瓣成形术",english_name:"PBMV"});
CREATE (:treatment {name:"二尖瓣分离术"});
CREATE (:treatment {name:"人工瓣膜置换术"});
MATCH (d:disease {name:"二尖瓣狭窄"}),(t:treatment {name:"经皮球囊二尖瓣成形术"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
MATCH (d:disease {name:"二尖瓣狭窄"}),(t:treatment {name:"二尖瓣分离术"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
MATCH (d:disease {name:"二尖瓣狭窄"}),(t:treatment {name:"人工瓣膜置换术"}) CREATE (t)-[:cure {reference:"内科学第九版"}]->(d);
