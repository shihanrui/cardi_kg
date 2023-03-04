MATCH (n) detach delete n;

//冠状动脉粥样硬化性心脏病、冠心病、缺血性心脏病等同
CREATE (:disease_category {name:"冠状动脉粥样硬化性心脏病",abbreviation:"冠心病",synonym:"缺血性心脏病",definition:"指冠状动脉（冠脉）发生粥样硬
化引起管腔狭窄或闭，导致心肌缺血缺氧或坏死而引起的心脏病。"});

//冠心病包含慢性心肌缺血综合征（又称慢性冠脉疾病）和急性冠状动脉综合征
CREATE (:disease_category {name:"慢性心肌缺血综合征",enlish_name:"CIS/CAD",synonym:"慢性冠脉疾病"});
CREATE (:disease_category {name:"急性冠状动脉综合征",english_name:"ACS",abbreviation:"急性冠脉综合征",definition:"一组由3急性心肌缺血引起的临床综合征"});
MATCH (dc1:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(dc2:disease_category {name:"慢性心肌缺血综合征"}) CREATE (dc1)-[:Include_disease_category {referrence:"内科学第九版"}]->(dc2);
MATCH (dc1:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(dc2:disease_category {name:"急性冠状动脉综合征"}) CREATE (dc1)-[:Include_disease_category {referrence:"内科学第九版"}]->(dc2);

CREATE (:disease {name:"猝死"});
CREATE (:disease {name:"稳定型心绞痛",synonym:"劳力性心绞痛"});
CREATE (:disease {name:"隐匿型冠心病",synonym:"无症状冠心病",definition:"没有心绞痛的临床症状，但有心肌缺血的客观证据（心电活动、心肌血流灌注及心肌代谢等异常）的冠心病"});
CREATE (:disease {name:"缺血性心肌病",english_name:"ICM",definition:"冠心病的一种特殊类型或晚期阶段。指由冠状动脉粥样硬化引起长期心肌缺血，导致心肌弥漫性纤维化，产生与原发性扩张型心肌病类似的临床表现。"});
CREATE (:disease {name:"不稳定型心绞痛",english_name:"UA"});
CREATE (:disease {name:"非ST段抬高型心肌梗死",english_name:"NSTEMI"});
CREATE (:disease {name:"非ST段抬高型急性冠脉综合征",english_name:"NSTEACS",definition:"由于动脉粥样斑块破裂或糜烂，伴有不同程度的表面血栓形成、血管痉挛以及血管栓塞所导致的一组临床症状"});
MATCH (d1:disease {name:"非ST段抬高型急性冠脉综合征"}), (d2:disease {name:"非ST段抬高型心肌梗死"}) CREATE (d1)-[:include_disease {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"非ST段抬高型急性冠脉综合征"}), (d2:disease {name:"不稳定型心绞痛"}) CREATE (d1)-[:include_disease {referrence:"内科学第九版"}]->(d2);
CREATE (:disease {name:"ST段抬高型心肌梗死",english_name:"STEMI"});
CREATE (:disease {name:"冠状动脉非阻塞性心肌梗死",english_name:"MINOCA"});

MATCH (dc:disease_category {name:"慢性心肌缺血综合征"}),(d:disease {name:"稳定型心绞痛"}) CREATE (dc)-[:include_disease {referrence:"内科学第九版"}]->(d);
MATCH (dc:disease_category {name:"慢性心肌缺血综合征"}),(d:disease {name:"隐匿型冠心病"}) CREATE (dc)-[:include_disease {referrence:"内科学第九版"}]->(d);
MATCH (dc:disease_category {name:"慢性心肌缺血综合征"}),(d:disease {name:"缺血性心肌病"}) CREATE (dc)-[:include_disease {referrence:"内科学第九版"}]->(d);
MATCH (dc:disease_category {name:"急性冠状动脉综合征"}),(d:disease {name:"非ST段抬高型急性冠脉综合征"}) CREATE (dc)-[:include_disease {referrence:"内科学第九版"}]->(d);
MATCH (dc:disease_category {name:"急性冠状动脉综合征"}),(d:disease {name:"猝死"}) CREATE (dc)-[:include_disease {referrence:"内科学第九版"}]->(d);
MATCH (dc:disease_category {name:"急性冠状动脉综合征"}),(d:disease {name:"ST段抬高型心肌梗死"}) CREATE (dc)-[:include_disease {referrence:"内科学第九版"}]->(d);

CREATE (:disease {name:"充血型缺血性心肌病"});
CREATE (:disease {name:"限制型缺血性心肌病",synonym:"硬心综合征"});
MATCH (d1:disease {name:"缺血性心肌病"}), (d2:disease {name:"充血型缺血性心肌病"}) CREATE (d1)-[:include_disease {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"缺血性心肌病"}), (d2:disease {name:"限制型缺血性心肌病"}) CREATE (d1)-[:include_disease {referrence:"内科学第九版"}]->(d2);

CREATE (:disease {name:"冠状动脉痉挛"});
CREATE (:disease {name:"冠状动脉闭塞性痉挛"});
CREATE (:disease {name:"冠状动脉非闭塞性痉挛"});
MATCH (d1:disease {name:"冠状动脉痉挛"}), (d2:disease {name:"冠状动脉闭塞性痉挛"}) CREATE (d1)-[:include_disease {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"冠状动脉痉挛"}), (d2:disease {name:"冠状动脉非闭塞性痉挛"}) CREATE (d1)-[:include_disease {referrence:"内科学第九版"}]->(d2);

CREATE (:disease {name:"心肌桥"});
CREATE (:disease {name:"X综合征"});

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
MATCH (d:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"年齡>40"}) CREATE (d)<-[:risk {referrence:"内科学第九版"}]-(r);
MATCH (d:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"血脂异常"}) CREATE (d)<-[:risk {referrence:"内科学第九版"}]-(r);
MATCH (d:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"男性"}) CREATE (d)<-[:risk {referrence:"内科学第九版"}]-(r);
MATCH (d:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"高血压"}) CREATE (d)<-[:risk {referrence:"内科学第九版"}]-(r);
MATCH (d:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"糖尿病"}) CREATE (d)<-[:risk {referrence:"内科学第九版"}]-(r);
MATCH (d:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"吸烟"}) CREATE (d)<-[:risk {referrence:"内科学第九版"}]-(r);
MATCH (d:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"高热量饮食"}) CREATE (d)<-[:risk {referrence:"内科学第九版"}]-(r);
MATCH (d:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"口服避孕药"}) CREATE (d)<-[:risk {referrence:"内科学第九版"}]-(r);
MATCH (d:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"家族史"}) CREATE (d)<-[:risk {referrence:"内科学第九版"}]-(r);
MATCH (d:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"肥胖"}) CREATE (d)<-[:risk {referrence:"内科学第九版"}]-(r);
MATCH (d:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"糖耐量异常"}) CREATE (d)<-[:risk {referrence:"内科学第九版"}]-(r);
MATCH (d:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(r:risk_factor {factor:"A型性格"}) CREATE (d)<-[:risk {referrence:"内科学第九版"}]-(r);
MATCH (d:disease {name:"冠状动脉痉挛"}),(r:risk_factor {factor:"吸烟"}) CREATE (d)<-[:risk {referrence:"内科学第九版"}]-(r);
MATCH (d:disease {name:"X综合征"}),(r:risk_factor {factor:"绝经期前女性"}) CREATE (d)<-[:risk {referrence:"内科学第九版"}]-(r);



//诱因cause
CREATE (:cause {name:"体力劳动"});
CREATE (:cause {name:"情绪激动"});
CREATE (:cause {name:"饱食"});
CREATE (:cause {name:"受寒"});
CREATE (:cause {name:"吸烟"});
CREATE (:cause {name:"休克"});
CREATE (:cause {name:"心动过速"});
CREATE (:cause {name:"晨起6时至12时"});
CREATE (:cause {name:"血压剧升"});
CREATE (:cause {name:"用力排便"});
CREATE (:cause {name:"脱水"});
CREATE (:cause {name:"出血"});
CREATE (:cause {name:"外科手术"});
CREATE (:cause {name:"心律失常"});
CREATE (:cause {name:"感染"});
CREATE (:cause {name:"甲状腺功能亢进"});
CREATE (:cause {name:"低血压"});
CREATE (:cause {name:"贫血"});
CREATE (:cause {name:"低血氧症"});
CREATE (:cause {name:"酒精"});
CREATE (:cause {name:"毒品"});

MATCH (d:disease {name:"稳定型心绞痛"}),(c:cause {name:"体力劳动"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:cause {name:"情绪激动"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:cause {name:"饱食"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:cause {name:"受寒"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:cause {name:"吸烟"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:cause {name:"心动过速"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:cause {name:"休克"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:cause {name:"晨起6时至12时"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:cause {name:"饱食"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:cause {name:"体力劳动"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:cause {name:"情绪激动"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:cause {name:"血压剧升"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:cause {name:"用力排便"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:cause {name:"休克"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:cause {name:"脱水"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:cause {name:"外科手术"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:cause {name:"心律失常"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"STEMI"}),(c:cause {name:"出血"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"NSTEACS"}),(c:cause {name:"感染"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"NSTEACS"}),(c:cause {name:"甲状腺功能亢进"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"NSTEACS"}),(c:cause {name:"心律失常"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"NSTEACS"}),(c:cause {name:"低血氧症"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"NSTEACS"}),(c:cause {name:"低血压"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {english_name:"NSTEACS"}),(c:cause {name:"贫血"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {name:"冠状动脉痉挛"}),(c:cause {name:"吸烟"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {name:"冠状动脉痉挛"}),(c:cause {name:"酒精"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);
MATCH (d:disease {name:"冠状动脉痉挛"}),(c:cause {name:"毒品"}) CREATE (c)<-[:disease_cause {referrence:"内科学第九版"}]-(d);

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
MATCH (m:mechanism {description:"心脏负荷增加"}),(c:cause {name:"体力劳动"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心脏负荷增加"}),(c:cause {name:"情绪激动"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心脏负荷增加"}),(c:cause {name:"饱食"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心脏负荷增加"}),(c:cause {name:"受寒"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心脏负荷增加"}),(c:cause {name:"吸烟"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心脏负荷增加"}),(c:cause {name:"心动过速"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心脏负荷增加"}),(c:cause {name:"休克"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m1:mechanism {description:"心脏负荷增加"}),(m2:mechanism {description:"心率增快"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心脏负荷增加"}),(m2:mechanism {description:"心肌张力增加"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心脏负荷增加"}),(m2:mechanism {description:"心肌收缩力增加"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心率增快"}),(m2:mechanism {description:"心肌耗氧量增加"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌张力增加"}),(m2:mechanism {description:"心肌耗氧量增加"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌收缩力增加"}),(m2:mechanism {description:"心肌耗氧量增加"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"冠状动脉固定狭窄"}),(m2:mechanism {description:"冠状动脉供血不足"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);

CREATE (:mechanism {description:"冠脉粥样硬化"});
CREATE (:mechanism {description:"心肌缺血"});
CREATE (:mechanism {description:"心肌缺氧"});
CREATE (:mechanism {description:"心肌细胞减少"});
CREATE (:mechanism {description:"心肌细胞坏死"});
CREATE (:mechanism {description:"心肌瘢痕"});
CREATE (:mechanism {description:"心肌弥漫性纤维化"});
MATCH (m1:mechanism {description:"冠脉粥样硬化"}),(m2:mechanism {description:"心肌缺血"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"冠脉粥样硬化"}),(m2:mechanism {description:"心肌缺氧"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌缺血"}),(m2:mechanism {description:"心肌细胞减少"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌缺血"}),(m2:mechanism {description:"心肌细胞坏死"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌缺血"}),(m2:mechanism {description:"心肌弥漫性纤维化"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌缺血"}),(m2:mechanism {description:"心肌瘢痕"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌缺氧"}),(m2:mechanism {description:"心肌细胞减少"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌缺氧"}),(m2:mechanism {description:"心肌细胞坏死"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌缺氧"}),(m2:mechanism {description:"心肌弥漫性纤维化"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌缺氧"}),(m2:mechanism {description:"心肌瘢痕"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);

CREATE (:mechanism {description:"不稳定粥样硬化斑块破裂、糜烂"});
CREATE (:mechanism {description:"血小板聚集"});
CREATE (:mechanism {description:"血栓形成"});
CREATE (:mechanism {description:"冠状动脉痉挛收缩"});
CREATE (:mechanism {description:"微血管栓塞"});
CREATE (:mechanism {description:"心肌供氧减少"});
CREATE (:mechanism {description:"心肌缺血加重"});
MATCH (m1:mechanism {description:"冠脉粥样硬化"}),(m2:mechanism {description:"不稳定粥样硬化斑块破裂、糜烂"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"冠脉粥样硬化"}),(m2:mechanism {description:"不稳定粥样硬化斑块糜烂"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"不稳定粥样硬化斑块破裂、糜烂"}),(m2:mechanism {description:"血小板聚集"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"不稳定粥样硬化斑块破裂、糜烂"}),(m2:mechanism {description:"血栓形成"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"不稳定粥样硬化斑块破裂、糜烂"}),(m2:mechanism {description:"冠状动脉痉挛收缩"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"不稳定粥样硬化斑块破裂、糜烂"}),(m2:mechanism {description:"微血管栓塞"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"血小板聚集"}),(m2:mechanism {description:"心肌供氧减少"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"血栓形成"}),(m2:mechanism {description:"心肌供氧减少"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"冠状动脉痉挛收缩"}),(m2:mechanism {description:"心肌供氧减少"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"微血管栓塞"}),(m2:mechanism {description:"心肌缺血加重"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"血小板聚集"}),(m2:mechanism {description:"心肌缺血加重"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"血栓形成"}),(m2:mechanism {description:"心肌缺血加重"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"冠状动脉痉挛收缩"}),(m2:mechanism {description:"心肌缺血加重"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);

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

MATCH (m:mechanism {description:"交感神经活动增强"}),(c:cause {name:"晨起6时至12时"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"血脂增高"}),(c:cause {name:"饱食"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"血粘稠度增高"}),(c:cause {name:"饱食"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"左心室负荷加重"}),(c:cause {name:"体力劳动"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"左心室负荷加重"}),(c:cause {name:"情绪激动"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"左心室负荷加重"}),(c:cause {name:"血压剧升"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"左心室负荷加重"}),(c:cause {name:"用力排便"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心排量骤降"}),(c:cause {name:"休克"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心排量骤降"}),(c:cause {name:"脱水"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心排量骤降"}),(c:cause {name:"出血"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心排量骤降"}),(c:cause {name:"外科手术"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);
MATCH (m:mechanism {description:"心排量骤降"}),(c:cause {name:"心律失常"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(m);

MATCH (m1:mechanism {description:"交感神经活动增强"}),(m2:mechanism {description:"机体应激反应性增强"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"机体应激反应性增强"}),(m2:mechanism {description:"心肌张力增加"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"机体应激反应性增强"}),(m2:mechanism {description:"心率增快"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"机体应激反应性增强"}),(m2:mechanism {description:"血压增高"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"机体应激反应性增强"}),(m2:mechanism {description:"冠状动脉张力增高"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心肌张力增加"}),(m2:mechanism {description:"不稳定粥样硬化斑块破溃"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心率增快"}),(m2:mechanism {description:"不稳定粥样硬化斑块破溃"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"血压增高"}),(m2:mechanism {description:"不稳定粥样硬化斑块破溃"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"冠状动脉张力增高"}),(m2:mechanism {description:"不稳定粥样硬化斑块破溃"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"血脂增高"}),(m2:mechanism {description:"不稳定粥样硬化斑块破溃"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"血粘稠度增高"}),(m2:mechanism {description:"不稳定粥样硬化斑块破溃"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"左心室负荷加重"}),(m2:mechanism {description:"不稳定粥样硬化斑块破溃"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心排量骤降"}),(m2:mechanism {description:"冠状动脉灌注量锐减"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"心排量骤降"}),(m2:mechanism {description:"不稳定粥样硬化斑块破溃"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"不稳定粥样硬化斑块破溃"}),(m2:mechanism {description:"继发血栓形成"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
MATCH (m1:mechanism {description:"继发血栓形成"}),(m2:mechanism {description:"血管管腔闭塞"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);
CREATE (:mechanism {description:"壁冠状动脉在收缩期被挤压"});
CREATE (:mechanism {description:"远端心肌缺血"});
MATCH (m1:mechanism {description:"壁冠状动脉在收缩期被挤压"}),(m2:mechanism {description:"远端心肌缺血"}) CREATE (m1)-[:mechanism_subsequence {referrence:"内科学第九版"}]->(m2);

MATCH (d:disease {name:"稳定型心绞痛"}),(m:mechanism {description:"冠状动脉供血不足"}) CREATE (d)<-[:lead_to {referrence:"内科学第九版"}]-(m);
MATCH (d:disease {name:"稳定型心绞痛"}),(m:mechanism {description:"心肌耗氧量增加"}) CREATE (d)<-[:lead_to {referrence:"内科学第九版"}]-(m);
MATCH (d:disease {name:"缺血性心肌病"}),(m:mechanism {description:"心肌细胞减少"}) CREATE (d)<-[:lead_to {referrence:"内科学第九版"}]-(m);
MATCH (d:disease {name:"缺血性心肌病"}),(m:mechanism {description:"心肌细胞坏死"}) CREATE (d)<-[:lead_to {referrence:"内科学第九版"}]-(m);
MATCH (d:disease {name:"缺血性心肌病"}),(m:mechanism {description:"心肌弥漫性纤维化"}) CREATE (d)<-[:lead_to {referrence:"内科学第九版"}]-(m);
MATCH (d:disease {name:"缺血性心肌病"}),(m:mechanism {description:"心肌瘢痕"}) CREATE (d)<-[:lead_to {referrence:"内科学第九版"}]-(m);
MATCH (d:disease {english_name:"UA"}),(m:mechanism {description:"心肌供氧减少"}) CREATE (d)<-[:lead_to {referrence:"内科学第九版"}]-(m);
MATCH (d:disease {english_name:"UA"}),(m:mechanism {description:"心肌缺血"}) CREATE (d)<-[:lead_to {referrence:"内科学第九版"}]-(m);
MATCH (d:disease {english_name:"NSTEMI"}),(m:mechanism {description:"心肌供氧减少"}) CREATE (d)<-[:lead_to {referrence:"内科学第九版"}]-(m);
MATCH (d:disease {english_name:"NSTEMI"}),(m:mechanism {description:"心肌缺血加重"}) CREATE (d)<-[:lead_to {referrence:"内科学第九版"}]-(m);
MATCH (d:disease {english_name:"STEMI"}),(m:mechanism {description:"血管管腔闭塞"}) CREATE (d)<-[:lead_to {referrence:"内科学第九版"}]-(m);
MATCH (d:disease {name:"心肌桥"}),(m:mechanism {description:"远端心肌缺血"}) CREATE (d)<-[:lead_to {referrence:"内科学第九版"}]-(m);

//病理
CREATE (:pathology {description:"冠脉狭窄或部分闭塞"});
CREATE (:pathology {description:"心肺顺应性降低"});
CREATE (:pathology {description:"左心室收缩与舒张功能障碍"});
CREATE (:pathology {description:"灶性心肌坏死"});
CREATE (:pathology {description:"心内膜下心肌坏死"});
CREATE (:pathology {description:"心肌瘢痕"});
CREATE (:pathology {description:"心肌纤维化"});
CREATE (:pathology {description:"心肌细胞减少、坏死"});
CREATE (:pathology {description:"冠状动脉病变"});
CREATE (:pathology {description:"心肌病变"});

MATCH (d:disease {name:"稳定型心绞痛"}),(p:pathology {description:"冠脉狭窄或部分闭塞"}) CREATE (d)-[:pathology_show {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {name:"稳定型心绞痛"}),(p:pathology {description:"心肺顺应性降低"}) CREATE (d)-[:pathology_show {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {name:"稳定型心绞痛"}),(p:pathology {description:"左心室收缩与舒张功能障碍"}) CREATE (d)-[:pathology_show {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {english_name:"NSTEMI"}),(p:pathology {description:"灶性心肌坏死"}) CREATE (d)-[:pathology_show {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {english_name:"NSTEMI"}),(p:pathology {description:"灶性心肌坏死"}) CREATE (d)-[:pathology_show {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {name:"缺血性心肌病"}),(p:pathology {description:"心肌瘢痕"}) CREATE (d)-[:pathology_show {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {name:"缺血性心肌病"}),(p:pathology {description:"心肌纤维化"}) CREATE (d)-[:pathology_show {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {name:"缺血性心肌病"}),(p:pathology {description:"心肌细胞减少、坏死"}) CREATE (d)-[:pathology_show {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {english_name:"STEMI"}),(p:pathology {description:"冠状动脉病变"}) CREATE (d)-[:pathology_show {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {english_name:"STEMI"}),(p:pathology {description:"心肌病变"}) CREATE (d)-[:pathology_show {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {english_name:"STEMI"}),(p:pathology {description:"左心室收缩与舒张功能障碍"}) CREATE (d)-[:pathology_show {referrence:"内科学第九版"}]->(p);

//病史
CREATE (:history {characteristic:"冠心病史"});
CREATE (:history {characteristic:"1次以上心肌梗死病史"});
CREATE (:history {characteristic:"心肌梗死史",synonym:"MI史"});
CREATE (:history {characteristic:"急性冠脉综合征"});
CREATE (:history {characteristic:"血管重建病史"});
CREATE (:history {characteristic:"PCI"});
CREATE (:history {characteristic:"CAGB"});
MATCH (h1:history {characteristic:"血管重建病史"}),(h2:history {characteristic:"PCI"}) CREATE (h1)-[:include_characteristic {referrence:"内科学第九版"}]->(h2);
MATCH (h1:history {characteristic:"血管重建病史"}),(h2:history {characteristic:"CABG"}) CREATE (h1)-[:include_characteristic {referrence:"内科学第九版"}]->(h2);

MATCH  (d:disease {name:"隐匿型冠心病"}),(h:history {characteristic:"心肌梗死史"}) CREATE (d)-[:history_show {referrence:"内科学第九版"}]->(h);

MATCH  (d:disease {name:"缺血性心肌病"}),(h:history {characteristic:"心肌梗死史"}) CREATE (d)-[:history_show {referrence:"内科学第九版"}]->(h);
MATCH  (d:disease {name:"缺血性心肌病"}),(h:history {characteristic:"冠心病史"}) CREATE (d)-[:history_show {referrence:"内科学第九版"}]->(h);

MATCH  (d:disease {name:"缺血性心肌病"}),(h:history {characteristic:"急性冠脉综合征"}) CREATE (d)-[:history_show {referrence:"内科学第九版"}]->(h);
MATCH  (d:disease {name:"缺血性心肌病"}),(h:history {characteristic:"血管重建病史"}) CREATE (d)-[:history_show {referrence:"内科学第九版"}]->(h);

//视诊inspection
CREATE (:inspection {characteristic:"颈静脉充盈或怒张"});
//触诊palpation
CREATE (:palpation {characteristic:"肝大"});
CREATE (:palpation {characteristic:"肝压痛"});
CREATE (:palpation {characteristic:"肝颈静脉回流征阳性"});
//叩诊percussion
CREATE (:percussion {characteristic:"心界扩大"});
//听诊auscultation
CREATE (:auscultation {characteristic:"两肺底散在湿啰音"});
//嗅诊olfactory

//心音
CREATE (:heart_sound {characteristic:"第四心音奔马律"});
CREATE (:heart_sound {characteristic:"第三心音奔马律"});
CREATE (:heart_sound {characteristic:"暂时性心尖部收缩期杂音"});
CREATE (:heart_sound {characteristic:"第一心音减弱"});
CREATE (:heart_sound {characteristic:"舒张中晚期奔马律"});
CREATE (:heart_sound {characteristic:"一过性第三心音"});
CREATE (:heart_sound {characteristic:"一过性第四心音"});
CREATE (:heart_sound {characteristic:"一过性收缩性杂音"});
CREATE (:heart_sound {characteristic:"心脏浊音界正常"});
CREATE (:heart_sound {characteristic:"心脏浊音界轻度增大"});
CREATE (:heart_sound {characteristic:"心脏浊音界中度增大"});
CREATE (:heart_sound {characteristic:"心尖区第一心音减弱"});
CREATE (:heart_sound {characteristic:"心包摩擦音"});
CREATE (:heart_sound {characteristic:"心尖区收缩期杂音"});
CREATE (:heart_sound {characteristic:"心尖区收缩期喀喇音"});
CREATE (:heart_sound {characteristic:"胸骨左缘3~4肋间收缩期杂音伴震颤"});

MATCH (hs:heart_sound {characteristic:"一过性收缩性杂音"}),(p:pathology {description:"二尖瓣反流"}) CREATE (hs)-[:pathology_show {referrence:"内科学第九版"}]->(p);
MATCH (hs:heart_sound {characteristic:"暂时性心尖部收缩期杂音"}),(p:pathology {description:"乳头肌缺血"}) CREATE (hs)-[:pathology_show {referrence:"内科学第九版"}]->(p);

MATCH (d:disease {english_name:"NSTEACS"}),(hs:heart_sound {characteristic:"一过性第三心音"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:heart_sound {characteristic:"一过性第四心音"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:heart_sound {characteristic:"一过性收缩性杂音"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(hs);
MATCH (d:disease {name:"稳定型心绞痛"}),(hs:heart_sound {characteristic:"一过性第三心音"}) CREATE (d)-[:patient_show {referrence:"内科学第九版 p230"}]->(hs);
MATCH (d:disease {name:"稳定型心绞痛"}),(hs:heart_sound {characteristic:"一过性第四心音"}) CREATE (d)-[:patient_show {referrence:"内科学第九版 p230"}]->(hs);
MATCH (d:disease {name:"稳定型心绞痛"}),(hs:heart_sound {characteristic:"一过性收缩性杂音"}) CREATE (d)-[:patient_show {referrence:"内科学第九版 p230"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:heart_sound {characteristic:"心脏浊音界正常"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:heart_sound {characteristic:"心脏浊音界轻度增大"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:heart_sound {characteristic:"心脏浊音界中度增大"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:heart_sound {characteristic:"心尖区第一心音减弱"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:heart_sound {characteristic:"心包摩擦音"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:heart_sound {characteristic:"心尖区收缩期杂音"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:heart_sound {characteristic:"心尖区收缩期喀喇音"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(hs);
MATCH (d:disease {english_name:"NSTEACS"}),(hs:heart_sound {characteristic:"胸骨左缘3~4肋间收缩期杂音伴震颤"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(hs);




//症状symptom
CREATE (:symptom {characteristic:"无心绞痛"});
CREATE (:symptom {characteristic:"心绞痛"});
CREATE (:symptom {characteristic:"服用硝酸甘油缓解"});
CREATE (:symptom {characteristic:"服用硝酸甘油不缓解"});
MATCH (s1:symptom {characteristic:"心绞痛"}),(s2:symptom {characteristic:"服用硝酸甘油缓解"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
CREATE (:symptom {characteristic:"自行缓解"});

CREATE (:symptom {characteristic:"心律增快"});
CREATE (:symptom {characteristic:"血压增高"});
CREATE (:symptom {characteristic:"表情焦虑"});
CREATE (:symptom {characteristic:"皮肤冷"});
CREATE (:symptom {characteristic:"出汗"});
CREATE (:symptom {characteristic:"无症状性心肌缺血"});
CREATE (:symptom {characteristic:"无心肌梗死"});
MATCH (s1:symptom {characteristic:"无症状性心肌缺血"}),(s2:symptom {characteristic:"无心绞痛"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"无症状性心肌缺血"}),(s2:symptom {characteristic:"无心肌梗死"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
CREATE (:symptom {characteristic:"胸闷"});
CREATE (:symptom {characteristic:"胸部不适"});
CREATE (:symptom {characteristic:"心悸"});
CREATE (:symptom {characteristic:"烦躁"});
CREATE (:symptom {characteristic:"气急"});
CREATE (:symptom {characteristic:"恐惧"});
CREATE (:symptom {characteristic:"濒死感"});
CREATE (:symptom {characteristic:"休克"});
CREATE (:symptom {characteristic:"急性心力衰竭"});

CREATE (:symptom {characteristic:"乏力"});
CREATE (:symptom {characteristic:"眩晕"});
CREATE (:symptom {characteristic:"呼吸困难"});
CREATE (:symptom {characteristic:"充血性心力衰竭"});
MATCH (s1:symptom {characteristic:"无症状性心肌缺血"}),(s2:symptom {characteristic:"充血性心力衰竭"}) CREATE (s1)-[:subsequenct_symptom {referrence:"内科学第九版"}]->(s2);

CREATE (:symptom {characteristic:"心力衰竭"});
CREATE (:symptom {characteristic:"劳力性呼吸困难",cause:"左心室功能不全"});
CREATE (:symptom {characteristic:"端坐呼吸",cause:"左心室功能不全"});
CREATE (:symptom {characteristic:"夜间阵发性呼吸困难",cause:"左心室功能不全"});
CREATE (:symptom {characteristic:"疲乏"});
CREATE (:symptom {characteristic:"食欲缺乏",cause:"左心室功能不全合并右心室功能衰竭"});
CREATE (:symptom {characteristic:"周围性水肿",cause:"左心室功能不全合并右心室功能衰竭"});
CREATE (:symptom {characteristic:"右上腹闷胀感",cause:"左心室功能不全合并右心室功能衰竭"});
CREATE (:symptom {characteristic:"虚弱"});
CREATE (:symptom {characteristic:"活动受限"});
CREATE (:symptom {characteristic:"恶心"});
CREATE (:symptom {characteristic:"呕吐"});
CREATE (:symptom {characteristic:"胸痛"});
CREATE (:symptom {characteristic:"发热"});
CREATE (:symptom {characteristic:"心动过速"});
CREATE (:symptom {characteristic:"上腹胀痛"});
CREATE (:symptom {characteristic:"肠胀气"});
CREATE (:symptom {characteristic:"呃逆"});
CREATE (:symptom {characteristic:"晕厥"});
CREATE (:symptom {characteristic:"低血压"});
CREATE (:symptom {characteristic:"猝死"});
CREATE (:symptom {characteristic:"心肌梗死"});
CREATE (:symptom {characteristic:"清晨发病"});
CREATE (:symptom {characteristic:"午夜至上午8点发病"});
CREATE (:symptom {characteristic:"发作时间3~5分钟"});
CREATE (:symptom {characteristic:"发作时间>20分钟"});


MATCH (s1:symptom {characteristic:"心力衰竭"}),(s2:symptom {characteristic:"劳力性呼吸困难"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心力衰竭"}),(s2:symptom {characteristic:"端坐呼吸"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心力衰竭"}),(s2:symptom {characteristic:"夜间阵发性呼吸困难"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心力衰竭"}),(s2:symptom {characteristic:"疲乏"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心力衰竭"}),(s2:symptom {characteristic:"虚弱"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心力衰竭"}),(s2:heart_sound {characteristic:"第一心音减弱"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心力衰竭"}),(s2:heart_sound {characteristic:"舒张中晚期奔马律"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心力衰竭"}),(s2:auscultation {characteristic:"两肺底散在湿啰音"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心力衰竭"}),(s2:symptom {characteristic:"食欲缺乏"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心力衰竭"}),(s2:symptom {characteristic:"周围性水肿"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心力衰竭"}),(s2:symptom {characteristic:"右上腹闷胀感"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心力衰竭"}),(s2:inspection {characteristic:"颈静脉充盈或怒张"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心力衰竭"}),(s2:percussion {characteristic:"心界扩大"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心力衰竭"}),(s2:palpation {characteristic:"肝大"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心力衰竭"}),(s2:palpation {characteristic:"肝压痛"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心力衰竭"}),(s2:palpation {characteristic:"肝颈静脉回流征阳性"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);

CREATE (:symptom {characteristic:"心律失常"});
MATCH (s1:symptom {characteristic:"心律失常"}),(s2:ECG {characteristic:"心房颤动"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心律失常"}),(s2:ECG {characteristic:"室性期前收缩"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心律失常"}),(s2:ECG {characteristic:"束支传导阻滞"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);

CREATE (:symptom {characteristic:"血栓和栓塞"});
CREATE (:symptom {characteristic:"肺水肿"});
CREATE (:disease:symptom {characteristic:"静息型心绞痛"});
MATCH (s1:symptom {characteristic:"静息型心绞痛"}),(s2:duration {time:">20min"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
CREATE (:disease:symptom {characteristic:"初发型心绞痛"});
CREATE (:disease:symptom {characteristic:"恶化型心绞痛"});
MATCH (s1:symptom {characteristic:"静息型心绞痛"}),(s2:symptom {characteristic:"心绞痛"}) CREATE (s1)-[:include_characteristic {condition:"发作于休息时",referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"初发型心绞痛"}),(s2:symptom {characteristic:"心绞痛"}) CREATE (s1)-[:include_characteristic {condition:"发作于休息时",referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"恶化型心绞痛"}),(s2:symptom {characteristic:"心绞痛"}) CREATE (s1)-[:include_characteristic {condition:"在稳定型心绞痛基础上增强至少Ⅰ级",CCS:"≥Ⅲ级",referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"静息型心绞痛"}),(s2:symptom {characteristic:"发作时间>20分钟"}) CREATE (s1)-[:include_characteristic {condition:"发作于休息时",referrence:"内科学第九版"}]->(s2);


//心绞痛对应症状
MATCH (s1:symptom {characteristic:"心绞痛"}),(s2:symptom {characteristic:"心律增快"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心绞痛"}),(s2:symptom {characteristic:"血压增高"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心绞痛"}),(s2:symptom {characteristic:"表情焦虑"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心绞痛"}),(s2:symptom {characteristic:"皮肤冷"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s1:symptom {characteristic:"心绞痛"}),(s2:symptom {characteristic:"出汗"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);
MATCH (s:symptom {characteristic:"心绞痛"}),(hs:heart_sound {characteristic:"第四心音奔马律"}) CREATE (s)-[:include_characteristic {referrence:"内科学第九版"}]->(hs);
MATCH (s:symptom {characteristic:"心绞痛"}),(hs:heart_sound {characteristic:"第三心音奔马律"}) CREATE (s)-[:include_characteristic {referrence:"内科学第九版"}]->(hs);
MATCH (s:symptom {characteristic:"心绞痛"}),(hs:heart_sound {characteristic:"暂时性心尖部收缩期杂音"}) CREATE (s)-[:include_characteristic {referrence:"内科学第九版"}]->(hs);
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {characteristic:"发作时间3~5分钟"}) CREATE (d)-[:patient_show {frequency_probability:"probable",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {characteristic:"心绞痛"}) CREATE (d)-[:patient_show {frequency_probability:"probable",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"隐匿型冠心病"}),(s:symptom {characteristic:"无症状性心肌缺血"}) CREATE (d)-[:patient_show {frequency_probability:"probable",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"无症状性心肌缺血"}) CREATE (d)-[:patient_show {frequency_probability:"probable",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"心绞痛"}) CREATE (d)-[:patient_show {frequency_probability:"probable",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"胸闷"}) CREATE (d)-[:patient_show {frequency_probability:"probable",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"乏力"}) CREATE (d)-[:patient_show {frequency_probability:"probable",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"眩晕"}) CREATE (d)-[:patient_show {frequency_probability:"probable",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"呼吸困难"}) CREATE (d)-[:patient_show {frequency_probability:"probable",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"心力衰竭"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"心律失常"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"血栓或栓塞"}) CREATE (d)-[:patient_show {condition:"心脏腔室明显扩大",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"血栓或栓塞"}) CREATE (d)-[:patient_show {condition:"心房颤动而未积极抗凝治疗",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"充血型缺血性心肌病"}),(s:symptom {characteristic:"血栓或栓塞"}) CREATE (d)-[:patient_show {condition:"心输出量明显降低",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"限制型缺血性心肌病"}),(s:symptom {characteristic:"劳力性呼吸困难"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"限制型缺血性心肌病"}),(s:symptom {characteristic:"心绞痛"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"限制型缺血性心肌病"}),(s:symptom {characteristic:"活动受限"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"限制型缺血性心肌病"}),(s:symptom {characteristic:"肺水肿"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"NSTEACS"}),(s:symptom {characteristic:"静息型心绞痛"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"NSTEACS"}),(s:symptom {characteristic:"初发型心绞痛"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"NSTEACS"}),(s:symptom {characteristic:"恶化型心绞痛"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"NSTEACS"}),(s:symptom {characteristic:"出汗"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"NSTEACS"}),(s:symptom {characteristic:"恶心"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"NSTEACS"}),(s:symptom {characteristic:"呕吐"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"NSTEACS"}),(s:symptom {characteristic:"心悸"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"NSTEACS"}),(s:symptom {characteristic:"呼吸困难"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"NSTEACS"}),(s:symptom {characteristic:"服用硝酸甘油不缓解"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"乏力"}) CREATE (d)-[:patient_omen_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"胸部不适"}) CREATE (d)-[:patient_omen_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"心悸"}) CREATE (d)-[:patient_omen_show {condition:"活动时",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"烦躁"}) CREATE (d)-[:patient_omen_show {condition:"活动时",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"气急"}) CREATE (d)-[:patient_omen_show {condition:"活动时",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"初发型心绞痛"}) CREATE (d)-[:patient_omen_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"恶化型心绞痛"}) CREATE (d)-[:patient_omen_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"服用硝酸甘油不缓解"}) CREATE (d)-[:patient_omen_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"心绞痛"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"服用硝酸甘油不缓解"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"烦躁"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"恐惧"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"胸闷"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"濒死感"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"休克"}) CREATE (d)-[:patient_show {frequency_probability:"minority",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"急性心力衰竭"}) CREATE (d)-[:patient_show {frequency_probability:"minority",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"发热"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"恶心"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"上腹胀痛"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"肠胀气"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"呃逆"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"心律失常"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"乏力"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"头晕"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"晕厥"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"心力衰竭"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"低血压"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {english_name:"STEMI"}),(s:symptom {characteristic:"清晨发病"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"冠状动脉痉挛"}),(s:symptom {characteristic:"晕厥"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"冠状动脉痉挛"}),(s:symptom {characteristic:"心律失常"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"冠状动脉痉挛"}),(s:symptom {characteristic:"心肌梗死"}) CREATE (d)-[:patient_show {condtion:"冠状动脉持续严重痉挛",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"冠状动脉痉挛"}),(s:symptom {characteristic:"猝死"}) CREATE (d)-[:patient_show {condtion:"冠状动脉持续严重痉挛",referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"冠状动脉痉挛"}),(s:symptom {characteristic:"自行缓解"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"冠状动脉痉挛"}),(s:symptom {characteristic:"午夜至上午8点发病"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"冠状动脉闭塞性痉挛"}),(s:symptom {characteristic:"静息型心绞痛"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"心肌桥"}),(s:symptom {characteristic:"心绞痛"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"心肌桥"}),(s:symptom {characteristic:"心律失常"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"心肌桥"}),(s:symptom {characteristic:"猝死"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"心肌桥"}),(s:symptom {characteristic:"心肌梗死"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"X综合征"}),(s:symptom {characteristic:"心绞痛"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);

//发作部位
CREATE (:pain_location {name:"胸骨体后"});
CREATE (:pain_location {name:"心前区"});
CREATE (:pain_location {name:"前胸"});
CREATE (:pain_location {name:"上腹部"});

MATCH (s:symptom {characteristic:"心绞痛"}),(l:pain_location {name:"胸骨体后"}) CREATE (s)-[:pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (s:symptom {characteristic:"心绞痛"}),(l:pain_location {name:"心前区"}) CREATE (s)-[:pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (s:symptom {characteristic:"心绞痛"}),(l:pain_location {name:"前胸"}) CREATE (s)-[:pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (d:disease {english_name:"STEMI"}),(l:pain_location {name:"上腹部"}) CREATE (d)-[:pain_locate {referrence:"内科学第九版"}]->(l);

//性质
CREATE (:pain_property {name:"压榨性"});
CREATE (:pain_property {name:"窒息性"});
CREATE (:pain_property {name:"紧缩性"});
CREATE (:pain_property {name:"灼烧感"});

MATCH (s:symptom {characteristic:"心绞痛"}),(pp:pain_property {name:"压榨性"}) CREATE (s)-[:pain_locate {referrence:"内科学第九版"}]->(pp);
MATCH (s:symptom {characteristic:"心绞痛"}),(pp:pain_property {name:"窒息性"}) CREATE (s)-[:pain_locate {referrence:"内科学第九版"}]->(pp);
MATCH (s:symptom {characteristic:"心绞痛"}),(pp:pain_property {name:"紧缩性"}) CREATE (s)-[:pain_locate {referrence:"内科学第九版"}]->(pp);
MATCH (s:symptom {characteristic:"心绞痛"}),(pp:pain_property {name:"灼烧感"}) CREATE (s)-[:pain_locate {referrence:"内科学第九版"}]->(pp);

//放射痛
CREATE (:radiating_pain_location {name:"左肩"});
CREATE (:radiating_pain_location {name:"左臂内侧"});
CREATE (:radiating_pain_location {name:"无名指"});
CREATE (:radiating_pain_location {name:"小指"});
CREATE (:radiating_pain_location {name:"颈部"});
CREATE (:radiating_pain_location {name:"咽部"});
CREATE (:radiating_pain_location {name:"下颌部"});
CREATE (:radiating_pain_location {name:"背部"});
MATCH (s:symptom {characteristic:"心绞痛"}),(l:radiating_pain_location {name:"左肩"}) CREATE (s)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (s:symptom {characteristic:"心绞痛"}),(l:radiating_pain_location {name:"左臂内侧"}) CREATE (s)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (s:symptom {characteristic:"心绞痛"}),(l:radiating_pain_location {name:"无名指"}) CREATE (s)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (s:symptom {characteristic:"心绞痛"}),(l:radiating_pain_location {name:"小指"}) CREATE (s)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (s:symptom {characteristic:"心绞痛"}),(l:radiating_pain_location {name:"颈部"}) CREATE (s)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (s:symptom {characteristic:"心绞痛"}),(l:radiating_pain_location {name:"咽部"}) CREATE (s)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (s:symptom {characteristic:"心绞痛"}),(l:radiating_pain_location {name:"下颌部"}) CREATE (s)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (d:disease {english_name:"STEMI"}),(l:radiating_pain_location {name:"背部"}) CREATE (d)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);



//常规检查
CREATE (:examination {name:"心肌肌钙蛋白I",english_name:"cTnI",type:"心肌损伤标志物"});
CREATE (:examination {name:"心肌肌钙蛋白T",english_name:"cTnT",type:"心肌损伤标志物"});
CREATE (:examination {name:"肌酸激酶",english_name:"CK",type:"心肌损伤标志物"});
CREATE (:examination {name:"肌酸激酶同工酶",english_name:"CK-MB",type:"心肌损伤标志物"});
CREATE (:examination {name:"肌红蛋白",type:"心肌损伤标志物"});


CREATE (:examination {name:"血糖"});
CREATE (:examination {name:"血脂"});
CREATE (:examination {name:"血常规"});
CREATE (:examination {name:"甲状腺功能"});
CREATE (:examination {name:"心电图",english_name:"ECG"});
CREATE (:examination {name:"运动负荷试验"});
CREATE (:examination {name:"心电图连续动态监测",synonym:"Holter检查"});
CREATE (:examination {name:"多层螺旋CT冠状动脉成像",english_name:"CTA"});
CREATE (:examination {name:"超声心动图"});
CREATE (:examination {name:"核素心肌显像及负荷试验",type:"放射性核素检查"});
CREATE (:examination {name:"放射性核素心腔造影",type:"放射性核素检查"});
CREATE (:examination {name:"正电子发射断层心肌显像",english_name:"PET",type:"放射性核素检查"});
CREATE (:examination {name:"单光子发射计算机断层显像",english_name:"SPECT",type:"放射性核素检查"});
CREATE (:examination {name:"冠状动脉造影",abbreviation:"冠脉造影",english_name:"CAG",type:"有创性检查"});
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


MATCH (d:disease {name:"不稳定型心绞痛"}),(rt:examination {name:"运动负荷试验"}) CREATE (d)-[:prohibit_test {referrence:"内科学第九版"}]->(rt);
// MATCH (d:disease {name:"心力衰竭"}),(rt:examination {name:"运动负荷试验"}) CREATE (d)-[:prohibit_test {referrence:"内科学第九版"}]->(rt);
// MATCH (d:disease {name:"心肌梗死急性期"}),(rt:examination {name:"运动负荷试验"}) CREATE (d)-[:prohibit_test {referrence:"内科学第九版"}]->(rt);
// MATCH (d:disease {name:"严重心律失常"}),(rt:examination {name:"运动负荷试验"}) CREATE (d)-[:prohibit_test {referrence:"内科学第九版"}]->(rt);
// MATCH (d:disease {name:"急性疾病"}),(rt:examination {name:"运动负荷试验"}) CREATE (d)-[:prohibit_test {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(b:examination {name:"心肌肌钙蛋白I"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(b);
MATCH (d:disease {name:"稳定型心绞痛"}),(b:examination {name:"心肌肌钙蛋白T"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(b);
MATCH (d:disease {name:"稳定型心绞痛"}),(b:examination {name:"肌酸激酶"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(b);
MATCH (d:disease {name:"稳定型心绞痛"}),(b:examination {name:"肌酸激酶同工酶"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(b);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"血糖"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"血脂"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"血常规"}) CREATE (d)-[:examine {attention:"贫血",referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"甲状腺功能"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"心电图"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"运动负荷试验"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"心电图连续动态监测"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"多层螺旋CT冠状动脉成像"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"超声心动图"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"核素心肌显像及负荷试验"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"放射性核素心腔造影"}) CREATE (d)-[:examine {content:"左心射血分数及显示心肌缺血区室壁局部运动障碍",referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"正电子发射断层心肌显像"}) CREATE (d)-[:examine {content:"心肌血流灌注和代谢显像匹配分析",referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"冠状动脉造影"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"冠脉超声成像"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"冠脉内光学相干断层显像"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"冠脉血流储备分数测定"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:examination {name:"定量冠脉血流分数"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"STEMI"}),(rt:examination {name:"心电图"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"STEMI"}),(rt:examination {name:"超声心动图"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"STEMI"}),(rt:examination {name:"正电子发射断层心肌显像"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"STEMI"}),(rt:examination {name:"单光子发射计算机断层显像"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"STEMI"}),(rt:examination {name:"血常规"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"STEMI"}),(b:examination {name:"肌红蛋白"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(b);
MATCH (d:disease {english_name:"STEMI"}),(b:examination {name:"心肌肌钙蛋白I"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(b);
MATCH (d:disease {english_name:"STEMI"}),(b:examination {name:"心肌肌钙蛋白T"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(b);
MATCH (d:disease {english_name:"STEMI"}),(b:examination {name:"肌酸激酶同工酶"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(b);
MATCH (d:disease {name:"冠状动脉痉挛"}),(rt:examination {name:"乙酰胆碱激发试验"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"冠状动脉痉挛"}),(rt:examination {name:"麦角新碱激发试验"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"X综合征"}),(rt:examination {name:"运动负荷试验"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"X综合征"}),(rt:examination {name:"心房调搏术"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"X综合征"}),(rt:examination {name:"血管内超声及多普勒血流测定"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEACS"}),(rt:examination {name:"心电图"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEACS"}),(rt:examination {name:"心电图连续动态监测"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEACS"}),(rt:examination {name:"冠状动脉造影"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEACS"}),(rt:examination {name:"冠脉超声成像"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEACS"}),(rt:examination {name:"冠脉内光学相干断层显像"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEACS"}),(rt:examination {name:"胸部X线"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEACS"}),(rt:examination {name:"心脏超声"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEACS"}),(rt:examination {type:"放射性核素检查"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {english_name:"NSTEMI"}),(b:examination {name:"心肌肌钙蛋白I"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(b);
MATCH (d:disease {english_name:"NSTEMI"}),(b:examination {name:"心肌肌钙蛋白T"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(b);

//血常规
CREATE (:blood_test {characteristic:"白细胞计数增高"});
CREATE (:blood_test {characteristic:"红细胞沉降率增快"});
MATCH (d:disease {english_name:"STEMI"}),(bt:blood_test {characteristic:"白细胞计数增高"})CREATE (d)-[:examine {blood_test_show:"内科学第九版"}]->(bt);
MATCH (d:disease {english_name:"STEMI"}),(bt:blood_test {characteristic:"红细胞沉降率增快"})CREATE (d)-[:examine {blood_test_show:"内科学第九版"}]->(bt);

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

MATCH (e1:ECG {status:"静息",characteristic:"心肌坏死"}), (e2:ECG {status:"静息",characteristic:"Q波形成"}) CREATE (e1)-[:include_characteristic {referrence:"内科学第九版"}]->(e2);
CREATE (:ECG {status:"静息",characteristic:"一过性ST段改变"});
CREATE (:ECG {status:"静息",characteristic:"一过性ST段抬高"});
CREATE (:ECG {status:"静息",characteristic:"T波改变"});

MATCH (e:ECG {status:"静息",characteristic:"正常"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"50%", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"陈旧性心肌梗死的改变"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"probable", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"ST段压低"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"probable", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"房室传导阻滞"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"束支传导阻滞"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"室性期前收缩"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"房性期前收缩"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"心肌坏死"}), (d:disease {name:"缺血性心肌病"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"正常"}), (d:disease {name:"X综合征"}) CREATE (d)-[:ecg_show {frequency_probability:"probable", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"静息",characteristic:"非特异性ST段和T波异常"}), (d:disease {name:"X综合征"}) CREATE (d)-[:ecg_show {frequency_probability:"probable", referrence:"内科学第九版"}]->(e);
MATCH (d:disease {english_name:"STEMI"}),(ecg:ECG {characteristic:"一过性ST段改变"}) CREATE (d)-[:ecg_omen_show {referrence:"内科学第九版"}]->(ecg);
MATCH (d:disease {english_name:"STEMI"}),(ecg:ECG {characteristic:"T波假性正常化"}) CREATE (d)-[:ecg_omen_show {referrence:"内科学第九版"}]->(ecg);
MATCH (d:disease {name:"冠状动脉痉挛",classification:"血管闭塞型"}),(ecg:ECG {characteristic:"一过性ST段抬高"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(ecg);
MATCH (e:ECG {status:"静息",characteristic:"ST段压低"}), (d:disease {name:"冠状动脉痉挛",classification:"非血管闭塞型"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);
MMATCH (e:ECG {status:"静息",characteristic:"T波改变"}), (d:disease {name:"冠状动脉痉挛",classification:"非血管闭塞型"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);
ATCH (d:disease {name:"隐匿型冠心病"}),(ecg:ECG {characteristic:"心肌缺血"}) CREATE (d)-[:ecg_show {frequency_probability:"probable",referrence:"内科学第九版"}]->(ecg);
MATCH (e:ECG {status:"静息",characteristic:"ST-T改变",duration:"≥12h"}), (d:disease {english_name:"NSTEMI"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {characteristic:"ST段抬高呈弓背向上型",lead:"面向坏死区周围心肌损伤区的导联"}), (d:disease {english_name:"STEMI"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {characteristic:"宽而深的Q波",lead:"面向透壁心肌坏死区的导联"}), (d:disease {english_name:"STEMI"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {characteristic:"T波倒置",lead:"面向损伤区缺血区的导联"}), (d:disease {english_name:"STEMI"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {characteristic:"R波增高",lead:"背向心肌梗死区的导联"}), (d:disease {english_name:"STEMI"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {characteristic:"ST段压低",lead:"背向心肌梗死区的导联"}), (d:disease {english_name:"STEMI"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {characteristic:"T波直立并增高",lead:"背向心肌梗死区的导联"}), (d:disease {english_name:"STEMI"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {characteristic:"正常"}), (d:disease {name:"X综合征"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {characteristic:"非特异性ST-T改变"}), (d:disease {name:"X综合征"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);

CREATE (:ECG {status:"心绞痛发作",characteristic:"ST段压低",range:"≥0.1mV",cause:"心肌缺血",location:"心内膜下",lead:"Ⅰ"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"ST段压低",range:"≥0.1mV",cause:"心肌缺血",location:"心内膜下",lead:"Ⅱ"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"ST段压低",range:"≥0.1mV",cause:"心肌缺血",location:"心内膜下",lead:"Ⅲ"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"ST段压低",range:"≥0.1mV",cause:"心肌缺血",location:"心内膜下",lead:"aVF"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"ST段压低",range:"≥0.1mV",cause:"心肌缺血",location:"心内膜下",lead:"V4"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"ST段压低",range:"≥0.1mV",cause:"心肌缺血",location:"心内膜下",lead:"V5"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"ST段压低",range:"≥0.1mV",cause:"心肌缺血",location:"心内膜下",lead:"V6"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"T波倒置"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"T波直立"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"一过性ST段改变"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"一过性T波改变"});
CREATE (:ECG {status:"心绞痛发作",characteristic:"U波倒置"});
MATCH (e:ECG {status:"心绞痛发作",characteristic:"ST段压低"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"common", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"心绞痛发作",characteristic:"T波倒置"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"心绞痛发作",characteristic:"T波直立"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often",condition:"平时T波持续倒置", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"心绞痛发作",characteristic:"一过性ST段改变"}), (d:disease {english_name:"NSTEACS"}) CREATE (d)-[:ecg_show {frequency_probability:"most",condition:"平时T波持续倒置", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"心绞痛发作",characteristic:"一过性T波改变"}), (d:disease {english_name:"NSTEACS"}) CREATE (d)-[:ecg_show {frequency_probability:"most",condition:"平时T波持续倒置", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"心绞痛发作",characteristic:"U波倒置"}), (d:disease {english_name:"NSTEACS"}) CREATE (d)-[:ecg_show {frequency_probability:"rare",condition:"平时T波持续倒置", referrence:"内科学第九版"}]->(e);

CREATE (:symptom {characteristic:"运动试验阳性"});
CREATE (:ECG {status:"运动时",characteristic:"ST段水平型",duration:"2min"});
CREATE (:ECG {status:"运动时",characteristic:"ST段压低",range:"≥0.1mV",duration:"2min",lead:"V5"});
CREATE (:ECG {status:"运动后",characteristic:"ST段压低",range:"≥0.1mV",lead:"Ⅰ"});
CREATE (:ECG {status:"运动后",characteristic:"ST段压低",range:"≥0.1mV",lead:"Ⅱ"});
CREATE (:ECG {status:"运动后",characteristic:"ST段压低",range:"≥0.1mV",lead:"Ⅲ"});
CREATE (:ECG {status:"运动后",characteristic:"ST段压低",range:"≥0.1mV",lead:"aVF"});
CREATE (:ECG {status:"运动后",characteristic:"ST段压低",range:"≥0.1mV",lead:"V3});
CREATE (:ECG {status:"运动后",characteristic:"ST段压低",range:"≥0.1mV",lead:"V4});
CREATE (:ECG {status:"运动后",characteristic:"ST段压低",range:"≥0.1mV",lead:"V5});
CREATE (:ECG {status:"运动后",characteristic:"ST段压低",range:"≥0.1mV",lead:"V6});
CREATE (:ECG {status:"运动后",characteristic:"T波倒置",lead:"Ⅰ});
CREATE (:ECG {status:"运动后",characteristic:"T波倒置",lead:"Ⅱ"});
CREATE (:ECG {status:"运动后",characteristic:"T波倒置",lead:"Ⅲ"});
CREATE (:ECG {status:"运动后",characteristic:"T波倒置",lead:"V3"});
CREATE (:ECG {status:"运动后",characteristic:"T波倒置",lead:"V4"});
CREATE (:ECG {status:"运动后",characteristic:"T波倒置",lead:"V5"});
CREATE (:ECG {status:"运动后",characteristic:"T波倒置",lead:"V6"});
CREATE (:ECG {status:"运动时",characteristic:"心肌缺血"});
CREATE (:ECG {status:"运动平板试验",characteristic:"ST段下移"});
MATCH (s:symptom {characteristic:"运动试验阳性"}), (e2:ECG {status:"运动时",characteristic:"ST段压低"}) CREATE (s)-[:include_characteristic {referrence:"内科学第九版"}]->(e2);
MATCH (s:symptom {characteristic:"运动试验阳性"}), (e2:ECG {status:"运动时",characteristic:"ST段水平型"}) CREATE (s)-[:include_characteristic {referrence:"内科学第九版"}]->(e2);
MATCH (s:symptom {characteristic:"运动试验阳性"}), (e2:ECG {status:"运动后",characteristic:"ST段压低"}) CREATE (s)-[:include_characteristic {referrence:"内科学第九版"}]->(e2);
MATCH (s1:symptom {characteristic:"运动试验阳性"}), (s2:symptom {characteristic:"心绞痛"}) CREATE (s1)-[:include_characteristic {referrence:"内科学第九版"}]->(s2);

CREATE (:ECG {status:"运动",characteristic:"心肌坏死"});
CREATE (:ECG {status:"运动",characteristic:"Q波形成"});
MATCH (e1:ECG {status:"运动",characteristic:"心肌坏死"}), (e2:ECG {status:"运动",characteristic:"Q波形成"}) CREATE (e1)-[:include_characteristic {referrence:"内科学第九版"}]->(e2);

MATCH (s:symptom {characteristic:"运动试验阳性"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(s);
MATCH (e:ECG {status:"运动时",characteristic:"心肌缺血"}), (d:disease {name:"隐匿型冠心病"}) CREATE (d)-[:ecg_show {frequency_probability:"probable",referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"运动",characteristic:"心肌坏死"}), (d:disease {name:"缺血性心肌病"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"运动平板试验",characteristic:"ST段下移"}), (d:disease {name:"X综合征"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);
MATCH (s:symptom {characteristic:"运动试验阳性"}), (d:disease {name:"X综合征"}) CREATE (d)-[:ecg_show {frequency_probability:"20%",referrence:"内科学第九版"}]->(s);

CREATE (:ECG {status:"连续监测",characteristic:"ST-T改变"});
CREATE (:ECG {status:"连续监测",characteristic:"心律失常"});
CREATE (:ECG {status:"连续监测",characteristic:"心肌缺血"});

MATCH (e:ECG {status:"连续监测",characteristic:"ST-T改变"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"连续监测",characteristic:"心律失常"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"连续监测",characteristic:"心肌缺血"}), (d:disease {name:"隐匿型"}) CREATE (d)-[:ecg_show {frequency_probability:"often",referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {status:"连续监测",characteristic:"ST-T改变"}), (d:disease {english_name:"NSTEACS"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);


CREATE (:radiology {characteristic:"冠状动脉狭窄病变",type:"多层螺旋CT冠状动脉成像"});
CREATE (:radiology {characteristic:"冠脉显著狭窄",type:"多层螺旋CT冠状动脉成像"});
CREATE (:radiology {characteristic:"冠状动脉管壁钙化",type:"多层螺旋CT冠状动脉成像"});
MATCH (cta:radiology {characteristic:"冠状动脉狭窄病变",type:"多层螺旋CT冠状动脉成像"}), (d:disease {name:"稳定型心绞痛"}) CREATE (cta)<-[:radiology_show {referrence:"内科学第九版"}]-(d);
MATCH (cta:radiology {characteristic:"冠状动脉管壁钙化",type:"多层螺旋CT冠状动脉成像"}), (d:disease {name:"稳定型心绞痛"}) CREATE (cta)<-[:radiology_show {referrence:"内科学第九版"}]-(d);

//冠状动脉造影
CREATE (:radiography {description:"左冠脉主干狭窄",type:"冠状动脉造影"});
CREATE (:radiography {description:"无显著狭窄",type:"冠状动脉造影"});
CREATE (:radiography {description:"1支冠脉管腔直径减少>70%",type:"冠状动脉造影"});
CREATE (:radiography {description:"2支冠脉管腔直径减少>70%",type:"冠状动脉造影"});
CREATE (:radiography {description:"3支冠脉管腔直径减少>70%",type:"冠状动脉造影"});
CREATE (:radiography {description:"冠脉显著狭窄",type:"冠状动脉造影"});
CREATE (:radiography {characteristic:"无异常",type:"冠状动脉造影"});
CREATE (:radiography {characteristic:"冠脉粥样硬化",type:"冠状动脉造影"});
CREATE (:radiography {description:"多支冠状动脉病变",type:"冠状动脉造影"});
CREATE (:radiography {description:"单支冠状动脉病变",type:"冠状动脉造影"});
CREATE (:radiography {characteristic:"动脉粥样硬化斑块"});

MATCH (d:disease {name:"稳定型心绞痛"}),(cag:radiography {description:"左冠脉主干狭窄",type:"冠状动脉造影"}) CREATE (d)-[:radiology_show {frequency_probability:"5~10%",referrence:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"稳定型心绞痛"}),(cag:radiography {description:"无显著狭窄",type:"冠状动脉造影"}) CREATE (d)-[:radiology_show {frequency_probability:"15%",referrence:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"稳定型心绞痛"}),(cag:radiography {description:"1支冠脉管腔直径减少>70%",type:"冠状动脉造影"}) CREATE (d)-[:radiology_show {frequency_probability:"25%",referrence:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"稳定型心绞痛"}),(cag:radiography {description:"2支冠脉管腔直径减少>70%",type:"冠状动脉造影"}) CREATE (d)-[:radiology_show {frequency_probability:"25%",referrence:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"稳定型心绞痛"}),(cag:radiography {description:"3支冠脉管腔直径减少>70%",type:"冠状动脉造影"}) CREATE (d)-[:radiology_show {frequency_probability:"25%",referrence:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"缺血性心肌病"}),(cag:radiography {description:"冠脉显著狭窄"}) CREATE (d)-[:radiology_show {referrence:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"X综合征"}),(cag:radiography {characteristic:"无异常",type:"冠状动脉造影"}) CREATE (d)-[:radiology_show {referrence:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"冠状动脉痉挛"}),(cag:radiography {characteristic:"无异常",type:"冠状动脉造影"}) CREATE (d)-[:radiology_show {referrence:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"冠状动脉痉挛"}),(cag:radiography {characteristic:"冠脉粥样硬化",type:"冠状动脉造影"}) CREATE (d)-[:radiology_show {referrence:"内科学第九版"}]->(cag);
MATCH (d:disease {english_name:"UA"}),(cag:radiography {characteristic:"多支冠状动脉病变",type:"冠状动脉造影"}) CREATE (d)-[:radiology_show {condition:" 有长期稳定型心绞痛基础",referrence:"内科学第九版"}]->(cag);
MATCH (d:disease {english_name:"UA"}),(cag:radiography {characteristic:"单支冠状动脉病变",type:"冠状动脉造影"}) CREATE (d)-[:radiology_show {condition:" 新发型心绞痛",referrence:"内科学第九版"}]->(cag);
MATCH (d:disease {english_name:"UA"}),(cag:radiography {characteristic:"无异常",type:"冠状动脉造影"}) CREATE (d)-[:radiology_show {condition:" 新发型心绞痛",referrence:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"心肌桥"}),(cag:radiography {characteristic:"动脉粥样硬化斑块"}) CREATE (d)-[:radiology_show {referrence:"内科学第九版"}]->(cag);

//血管内超声 多普勒
CREATE (:radiography {characteristic:"冠状动脉内膜增厚",type:"血管内超声及多普勒血流测定"});
CREATE (:radiography {characteristic:"早期动脉粥样硬化斑块形成",type:"血管内超声及多普勒血流测定"});
CREATE (:radiography {characteristic:"冠状动脉血流储备降低",type:"血管内超声及多普勒血流测定"});
MATCH (d:disease {name:"X综合征"}),(r:radiography {characteristic:"冠状动脉内膜增厚",type:"血管内超声及多普勒血流测定"}) CREATE (d)-[:radiology_show {referrence:"内科学第九版"}]->(r);
MATCH (d:disease {name:"X综合征"}),(r:radiography {characteristic:"早期动脉粥样硬化斑块形成",type:"血管内超声及多普勒血流测定"}) CREATE (d)-[:radiology_show {referrence:"内科学第九版"}]->(r);
MATCH (d:disease {name:"X综合征"}),(r:radiography {characteristic:"冠状动脉血流储备降低",type:"血管内超声及多普勒血流测定"}) CREATE (d)-[:radiology_show {referrence:"内科学第九版"}]->(r);

//超声心动图
CREATE (:radiology {characteristic:"无异常",type:"超声心动图"});
CREATE (:radiology {characteristic:"坏死区心室壁运动异常",type:"超声心动图"});
CREATE (:radiology {characteristic:"缺血区心室壁运动异常",type:"超声心动图"});
MATCH (u:radiology {characteristic:"无异常",type:"超声心动图"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:radiology_show {frequency_probability:"most", referrence:"内科学第九版"}]->(u);
MATCH (u:radiology {characteristic:"坏死区心室壁运动异常",type:"超声心动图"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:radiology_show {condition:"陈旧性心肌梗死", referrence:"内科学第九版"}]->(u);
MATCH (u:radiology {characteristic:"坏死区心室壁运动异常",type:"超声心动图"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:radiology_show {condition:"严重心肌缺血", referrence:"内科学第九版"}]->(u);

//放射性核素检查

CREATE (:radiology {type:"核素心肌显像",status:"静息",characteristic:"心肌梗死后瘢痕部位灌注缺损"});
CREATE (:radiology {type:"核素心肌显像",status:"运动负荷",characteristic:"灌注缺损心肌缺血区"});
CREATE (:radiology {type:"放射性核素心腔造影"});
CREATE (:radiology {type:"PET"});
MATCH (r:radiology {type:"核素心肌显像",status:"静息",characteristic:"心肌梗死后瘢痕部位灌注缺损"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:radiology_show {referrence:"内科学第九版"}]->(r);
MATCH (r:radiology {type:"核素心肌显像",status:"运动负荷",characteristic:"灌注缺损心肌缺血区"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:radiology_show {referrence:"内科学第九版"}]->(r);
MATCH (r:radiology {type:"核素心肌显像",characteristic:"灌注缺损心肌缺血区"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:radiology_show {referrence:"内科学第九版"}]->(r);


//分级
CREATE (:grade {name:"Ⅰ级", criterion:"一般体力活动（如步行和登楼）不受限，仅在强、快或持续用力时发生心绞痛",referrence:"加拿大心血管病学会(CCS)"});
CREATE (:grade {name:"Ⅱ级", criterion:"一般体力活动轻度受限。快步、饭后、寒冷或刮风中、精神应激或醒后数小时内发作心绞痛。一般情况平地步行200m以上或登楼一层以上受限",referrence:"加拿大心血管病学会(CCS)"});
CREATE (:grade {name:"Ⅲ级", criterion:"一般体力活动明显受限，一般情况下平地步行200m内或登楼一层引起心绞痛",referrence:"加拿大心血管病学会(CCS)"});
CREATE (:grade {name:"Ⅳ级", criterion:"轻微活动或休息时即可发生心绞痛",referrence:"加拿大心血管病学会(CCS)"});

CREATE (:grade {name:"Ⅰ级", criterion:"严重的初发型心绞痛或恶化型心绞痛，无静息疼痛",mortality_MI_rate_in_one_year:"7.3%",referrence:"Braunwald分级"});
CREATE (:grade {name:"Ⅱ级", criterion:"亚急性静息型疼痛（一个月内发作过，但48小时内无发作）",mortality_MI_rate_in_one_year:"10.3%",referrence:"Braunwald分级"});
CREATE (:grade {name:"Ⅲ级", criterion:"急性静息型心绞痛（48小时内有发作）",mortality_MI_rate_in_one_year:"10.8%",referrence:"Braunwald分级"});

CREATE (:grade {name:"A", criterion:"继发性心绞痛，在冠状动脉狭窄基础上，存在加剧心肌缺血的冠状动脉以外的疾病",mortality_MI_rate_in_one_year:"14.1%",referrence:"Braunwald分级"});
CREATE (:grade {name:"B", criterion:"原发性心绞痛，无加剧心肌缺血的冠状动脉以外的疾病",mortality_MI_rate_in_one_year:"8.5%",referrence:"Braunwald分级"});
CREATE (:grade {name:"C", criterion:"心肌梗死后心绞痛，心肌梗死后两周内发生的不稳定型心绞痛",mortality_MI_rate_in_one_year:"18.5%",referrence:"Braunwald分级"});

MATCH (d:disease {name:"稳定型心绞痛"}),(g:grade {referrence:"加拿大心血管病学会(CCS)"}) CREATE (d)-[:severe_classification {referrence:"内科学第九版"}]->(g);
MATCH (d:disease {name:"不稳定型心绞痛"}),(g:grade {name:"Ⅰ级", referrence:"Braunwald分级"}) CREATE (d)-[:severe_classification {referrence:"内科学第九版"}]->(g);
MATCH (d:disease {name:"不稳定型心绞痛"}),(g:grade {name:"Ⅱ级", referrence:"Braunwald分级"}) CREATE (d)-[:severe_classification {referrence:"内科学第九版"}]->(g);
MATCH (d:disease {name:"不稳定型心绞痛"}),(g:grade {name:"Ⅲ级", referrence:"Braunwald分级"}) CREATE (d)-[:severe_classification {referrence:"内科学第九版"}]->(g);
MATCH (d:disease {name:"不稳定型心绞痛"}),(g:grade {name:"A", referrence:"Braunwald分级"}) CREATE (d)-[:clinical_setting_classification {referrence:"内科学第九版"}]->(g);
MATCH (d:disease {name:"不稳定型心绞痛"}),(g:grade {name:"B", referrence:"Braunwald分级"}) CREATE (d)-[:clinical_setting_classification {referrence:"内科学第九版"}]->(g);
MATCH (d:disease {name:"不稳定型心绞痛"}),(g:grade {name:"C", referrence:"Braunwald分级"}) CREATE (d)-[:clinical_setting_classification {referrence:"内科学第九版"}]->(g);


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
MATCH (d1:disease {name:"急腹症"}),(d2:disease {name:"急性胰腺炎"}) CREATE (d1)-[:include_disease {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"急腹症"}),(d2:disease {name:"消化性溃疡穿孔"}) CREATE (d1)-[:include_disease {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"急腹症"}),(d2:disease {name:"急性胆囊炎"}) CREATE (d1)-[:include_disease {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"急腹症"}),(d2:disease {name:"胆石症"}) CREATE (d1)-[:include_disease {referrence:"内科学第九版"}]->(d2);

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
MATCH (d1:disease {name:"心肌病"}),(d2:disease {name:"特发性扩张型心肌病"}) CREATE (d1)-[:include_disease {referrence:"内科学第九版"}]->(d2);

CREATE (d:disease {name:"心包疾病"});
CREATE (d:disease {name:"电解质失调"});
CREATE (d:disease {name:"内分泌疾病"});
CREATE (d:disease {name:"药物作用"});
CREATE (d:disease {name:"高血压性心脏病"});
CREATE (d:disease {name:"内分泌病性心脏病"});


MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease_category {name:"急性冠状动脉综合征"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"反流性食管炎"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"膈疝"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"心脏神经症"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"消化性溃疡"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"肠道疾病"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"颈椎病"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"肋间神经痛"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"肋软骨炎"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"主动脉瓣狭窄"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"主动脉瓣关闭不全"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"风湿性冠脉炎"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"梅毒主动性脉炎引起的冠脉口狭窄或闭塞"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"肥厚型心肌病"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"X综合征"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"隐匿型冠心病"}),(d2:disease {name:"心肌炎"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"隐匿型冠心病"}),(d2:disease {name:"心肌病"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"隐匿型冠心病"}),(d2:disease {name:"心包疾病"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"隐匿型冠心病"}),(d2:disease {name:"电解质失调"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"隐匿型冠心病"}),(d2:disease {name:"内分泌疾病"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"缺血性心肌病"}),(d2:disease {name:"心肌病"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"缺血性心肌病"}),(d2:disease {name:"心肌炎"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"缺血性心肌病"}),(d2:disease {name:"高血压性心脏病"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"缺血性心肌病"}),(d2:disease {name:"内分泌病性心脏病"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"心绞痛"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"主动脉夹层"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"急性肺动脉栓塞"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"急腹症"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"急性心包炎"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);


//并发症
CREATE (d:disease {name:"乳头肌功能失调或断裂"});
CREATE (d:disease {name:"心脏破裂"});
CREATE (d:disease {name:"栓塞"});
CREATE (d:disease {name:"心室壁瘤"});
CREATE (d:disease {name:"心肌梗死后综合征"});
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"乳头肌功能失调或断裂"}) CREATE (d1)-[:complicate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"心脏破裂"}) CREATE (d1)-[:complicate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"栓塞"}) CREATE (d1)-[:complicate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"心室壁瘤"}) CREATE (d1)-[:complicate {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {english_name:"STEMI"}),(d2:disease {name:"心肌梗死后综合征"}) CREATE (d1)-[:complicate {referrence:"内科学第九版"}]->(d2);


//drug
//β受体拮抗剂
//CREATE (:pathology {description:"抑制心脏β肾上腺素能受体，减慢心率、减弱心肌收缩力、降低血压，从而降低心肌耗氧以减少心绞痛发作和增加运动耐量。"})
CREATE (:drug {type:"β受体拮抗剂",name:"美托洛尔"});
CREATE (:drug {type:"β受体拮抗剂",name:"比索洛尔"});
CREATE (:drug {type:"β受体拮抗剂",name:"艾司洛尔"});
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

MATCH (d:drug {type:"β受体拮抗剂"}),(c:contraindication {condition:"严重心动过缓"}) CREATE (d)<-[:prohibit {referrence:"内科学第九版"}]-(c);
MATCH (d:drug {type:"β受体拮抗剂"}),(c:contraindication {condition:"高度房室传导阻滞"}) CREATE (d)<-[:prohibit {referrence:"内科学第九版"}]-(c);
MATCH (d:drug {type:"β受体拮抗剂"}),(c:contraindication {condition:"窦房结功能紊乱"}) CREATE (d)<-[:prohibit {referrence:"内科学第九版"}]-(c);
MATCH (d:drug {type:"β受体拮抗剂"}),(c:contraindication {condition:"支气管痉挛"}) CREATE (d)<-[:prohibit {referrence:"内科学第九版"}]-(c);
MATCH (d:drug {type:"β受体拮抗剂"}),(c:contraindication {condition:"支气管哮喘"}) CREATE (d)<-[:prohibit {referrence:"内科学第九版"}]-(c);
MATCH (d:drug {type:"β受体拮抗剂"}),(c:contraindication {condition:"外周血管疾病"}) CREATE (d)<-[:relatively_prohibit {referrence:"内科学第九版"}]-(c);
MATCH (d:drug {type:"β受体拮抗剂"}),(c:contraindication {condition:"严重抑郁"}) CREATE (d)<-[:relatively_prohibit {referrence:"内科学第九版"}]-(c);
MATCH (d:drug {type:"β受体拮抗剂"}),(c:contraindication {condition:"慢性肺心病"}) CREATE (d)<-[:use_with_care {referrence:"内科学第九版"}]-(c);

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"美托洛尔"}) CREATE (ds)<-[:cure {period:"缓解期",type:"普通片",dosage:"25~100mg",frequency:"每日2次口服",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"美托洛尔"}) CREATE (ds)<-[:cure {period:"缓解期",type:"缓释片",dosage:"47.5~190mg",frequency:"每日1次口服",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"比索洛尔"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"5~10mg",frequency:"每日1次口服",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"X综合征"}),(dg:drug {type:"β受体拮抗剂"}) CREATE (ds)<-[:cure {effect:"改善少部分病人症状，总体效果不佳",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"心肌桥"}),(dg:drug {type:"β受体拮抗剂"}) CREATE (ds)<-[:cure {effect:"改善少部分病人症状，总体效果不佳",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"冠状动脉痉挛"}),(dg:drug {type:"β受体拮抗剂"}) CREATE (ds)<-[:prohibit_drug {effect:"加重或诱发痉挛",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"冠状动脉痉挛"}),(dg:drug {type:"β受体拮抗剂"}) CREATE (ds)<-[:cure {condition:"伴有固定性狭窄",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"美托洛尔"}) CREATE (ds)<-[:cure {effect:"抗心肌缺血",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"比索洛尔"}) CREATE (ds)<-[:cure {effect:"抗心肌缺血",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"艾司洛尔"}) CREATE (ds)<-[:cure {effect:"抗心肌缺血",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"美托洛尔"}) CREATE (ds)<-[:cure {effect:"解除疼痛",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"比索洛尔"}) CREATE (ds)<-[:cure {effect:"解除疼痛",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"艾司洛尔"}) CREATE (ds)<-[:cure {effect:"解除疼痛",referrence:"内科学第九版"}]-(dg);


CREATE (:drug {type:"正性肌力药",familiy:"硝酸酯类药",name:"单硝酸异山梨酯"});
CREATE (:drug {type:"正性肌力药",familiy:"硝酸酯类药",name:"硝酸甘油"});
CREATE (:drug {type:"正性肌力药",familiy:"硝酸酯类药",name:"硝酸异山梨酯"});
CREATE (:drug {type:"正性肌力药",familiy:"硝酸酯类药",name:"5-单硝酸异山梨酯"});
CREATE (:drug {type:"正性肌力药",name:"多巴胺"});

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
MATCH (d:drug {familiy:"硝酸酯类药"}),(c:contraindication {condition:"下壁MI"}) CREATE (d)<-[:prohibit {referrence:"内科学第九版"}]-(c);
MATCH (d:drug {familiy:"硝酸酯类药"}),(c:contraindication {condition:"可疑右室MI"}) CREATE (d)<-[:prohibit {referrence:"内科学第九版"}]-(c);
MATCH (d:drug {familiy:"硝酸酯类药"}),(c:contraindication {condition:"收缩压<90mmHg"}) CREATE (d)<-[:prohibit {referrence:"内科学第九版"}]-(c);
MATCH (d:drug {familiy:"硝酸酯类药"}),(c:contraindication {condition:"心肌梗死早期"}) CREATE (d)<-[:use_with_care {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {familiy:"硝酸酯类药"}),(c:contraindication {condition:"严重低血压"}) CREATE (d)<-[:use_with_care {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {familiy:"硝酸酯类药"}),(c:contraindication {condition:"心动过速"}) CREATE (d)<-[:use_with_care {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {familiy:"硝酸酯类药"}),(c:contraindication {condition:"严重贫血"}) CREATE (d)<-[:use_with_care {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {familiy:"硝酸酯类药"}),(c:contraindication {condition:"青光眼"}) CREATE (d)<-[:use_with_care {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {familiy:"硝酸酯类药"}),(c:contraindication {condition:"颅内压增高"}) CREATE (d)<-[:use_with_care {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);
MATCH (d:drug {familiy:"硝酸酯类药"}),(c:contraindication {condition:"硝酸甘油过敏"}) CREATE (d)<-[:use_with_care {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]-(c);



MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"头痛"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"面色潮红"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"心律反射加快"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"直立性低血压"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"眩晕"}) CREATE (d)-[:drug_side_effect {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"虚弱"}) CREATE (d)-[:drug_side_effect {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"心悸"}) CREATE (d)-[:drug_side_effect {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"心动过速"}) CREATE (d)-[:drug_side_effect {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"口干"}) CREATE (d)-[:drug_side_effect {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"恶心"}) CREATE (d)-[:drug_side_effect {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"呕吐"}) CREATE (d)-[:drug_side_effect {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"虚弱"}) CREATE (d)-[:drug_side_effect {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"苍白"}) CREATE (d)-[:drug_side_effect {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"虚脱"}) CREATE (d)-[:drug_side_effect {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"晕厥"}) CREATE (d)-[:drug_side_effect {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"心动过缓"}) CREATE (d)-[:drug_side_effect {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"心绞痛加重"}) CREATE (d)-[:drug_side_effect {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"药疹"}) CREATE (d)-[:drug_side_effect {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);
MATCH (d:drug {familiy:"硝酸酯类药"}),(se:side_effect {description:"剥脱性皮炎"}) CREATE (d)-[:drug_side_effect {referrence:"ST段抬高型心肌梗死基层合理用药指南"}]->(se);

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"单硝酸异山梨酯"}) CREATE (ds)<-[:cure {period:"缓解期",type:"普通片",dosage:"5~20mg",frequency:"每日2次口服",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"单硝酸异山梨酯"}) CREATE (ds)<-[:cure {period:"缓解期",type:"缓释片",dosage:"40~60mg",frequency:"每日1次口服",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"硝酸甘油"}) CREATE (ds)<-[:cure {period:"发作期",dosage:"0.5mg",usag:"舌下含化",onset_time:"1~2min",actuation_duaration:"0.5h",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"硝酸异山梨酯"}) CREATE (ds)<-[:cure {period:"发作期",dosage:"5~10mg",usag:"舌下含化",onset_time:"2~5min",actuation_duaration:"2~3h",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"X综合征"}),(dg:drug {familiy:"硝酸酯类药"}) CREATE (ds)<-[:cure {effect:"改善少部分病人症状，总体效果不佳",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"心肌桥"}),(dg:drug {type:"正性肌力药"}) CREATE (ds)<-[:prohibit_drug {referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"冠状动脉痉挛"}),(dg:drug {familiy:"硝酸酯类药"}) CREATE (ds)<-[:cure {effect:"主要治疗手段",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"硝酸甘油"}) CREATE (ds)<-[:cure {period:"心绞痛发作期",type:"静脉滴注",dosage:"5~10μg/min,每5~10分钟增加10μg/min，<200μg/min",effect:"抗心肌缺血",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"硝酸异山梨酯"}) CREATE (ds)<-[:cure {period:"心绞痛消失后12~24h",usage:"口服",effect:"抗心肌缺血",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"5-单硝酸异山梨酯"}) CREATE (ds)<-[:cure {period:"心绞痛消失后12~24h",usage:"口服",effect:"抗心肌缺血",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"硝酸甘油"}) CREATE (ds)<-[:cure {effect:"解除疼痛",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"硝酸异山梨酯"}) CREATE (ds)<-[:cure {effect:"解除疼痛",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"单硝酸异山梨酯"}) CREATE (ds)<-[:cure {effect:"解除疼痛",referrence:"内科学第九版"}]-(dg);

CREATE (:drug {type:"钙通道阻滞剂",name:"维拉帕米",family:"非二氢吡啶类"});
CREATE (:drug {type:"钙通道阻滞剂",name:"地尔硫䓬",family:"非二氢吡啶类"});
CREATE (:drug {type:"钙通道阻滞剂",name:"硝苯地平"});
CREATE (:drug {type:"钙通道阻滞剂",name:"氨氯地平",family:"二氢吡啶类"});
CREATE (:contraindication {condition:"左室功能不全"});
CREATE (:contraindication {condition:"与β受体阻滞剂联合使用"});
CREATE (:contraindication {condition:"病态窦房结综合征"});
MATCH (d:drug {family:"非二氢吡啶类"}),(c:contraindication {condition:"左室功能不全"}) CREATE (d)<-[:prohibit {referrence:"内科学第九版"}]-(c);
MATCH (d:drug {family:"非二氢吡啶类"}),(c:contraindication {condition:"与β受体阻滞剂联合使用"}) CREATE (d)<-[:use_with_care {referrence:"内科学第九版"}]-(c);
MATCH (d:drug {family:"非二氢吡啶类"}),(c:contraindication {condition:"严重心动过缓"}) CREATE (d)<-[:prohibit {referrence:"内科学第九版"}]-(c);
MATCH (d:drug {family:"非二氢吡啶类"}),(c:contraindication {condition:"高度房室传导阻滞"}) CREATE (d)<-[:prohibit {referrence:"内科学第九版"}]-(c);
MATCH (d:drug {family:"非二氢吡啶类"}),(c:contraindication {condition:"病态窦房结综合征"}) CREATE (d)<-[:prohibit {referrence:"内科学第九版"}]-(c);

CREATE (:side_effect {description:"外周水肿"});
CREATE (:side_effect {description:"便秘"});
CREATE (:side_effect {description:"心悸"});
CREATE (:side_effect {description:"头晕"});
CREATE (:side_effect {description:"虚弱无力"});
MATCH (d:drug {type:"钙通道阻滞剂"}),(se:side_effect {description:"外周水肿"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {type:"钙通道阻滞剂"}),(se:side_effect {description:"便秘"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {type:"钙通道阻滞剂"}),(se:side_effect {description:"心悸"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {type:"钙通道阻滞剂"}),(se:side_effect {description:"头痛"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {type:"钙通道阻滞剂"}),(se:side_effect {description:"头晕"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {type:"钙通道阻滞剂"}),(se:side_effect {description:"虚弱无力"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {type:"钙通道阻滞剂"}),(se:side_effect {description:"面色潮红"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"维拉帕米"}) CREATE (ds)<-[:cure {period:"缓解期",type:"普通片",dosage:"40~80mg",frequency:"每日3次口服",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"维拉帕米"}) CREATE (ds)<-[:cure {period:"缓解期",type:"缓释片",dosage:"240mg",frequency:"每日1次口服",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"地尔硫䓬"}) CREATE (ds)<-[:cure {period:"缓解期",type:"普通片",dosage:"30~60mg",frequency:"每日3次",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"地尔硫䓬"}) CREATE (ds)<-[:cure {period:"缓解期",type:"缓释片",dosage:"90mg",frequency:"每日1次",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"硝苯地平"}) CREATE (ds)<-[:cure {period:"缓解期",type:"控释片",condition:"同时有高血压",dosage:"30mg",frequency:"每日1次",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"氨氯地平"}) CREATE (ds)<-[:cure {period:"缓解期",condition:"同时有高血压",dosage:"5~10mg",frequency:"每日1次",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"X综合征"}),(dg:drug {type:"钙通道阻滞剂"}) CREATE (ds)<-[:cure {effect:"改善少部分病人症状，总体效果不佳",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"心肌桥"}),(dg:drug {type:"钙通道阻滞剂"}) CREATE (ds)<-[:cure {effect:"可有效缓解症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"冠状动脉痉挛"}),(dg:drug {type:"钙通道阻滞剂"}) CREATE (ds)<-[:cure {effect:"主要治疗手段",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {type:"钙通道阻滞剂"}) CREATE (ds)<-[:cure {condition:"血管痉挛性心绞痛首选，或足量β受体拮抗剂与硝酸酯类药物治疗后仍不能控制缺血症状",effect:"抗心肌缺血",referrence:"内科学第九版"}]-(dg);


CREATE (:drug {name:"曲美他嗪"});
CREATE (:drug {name:"尼可地尔",type:"钾通道开放剂"});
CREATE (:drug {name:"盐酸伊伐布雷定"});
CREATE (:drug {name:"雷诺嗪"});
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"曲美他嗪"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"20~60mg",frequency:"每日3次",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"尼可地尔"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"2mg",frequency:"每日3次",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"盐酸伊伐布雷定"}) CREATE (ds)<-[:cure {period:"缓解期",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"雷诺嗪"}) CREATE (ds)<-[:cure {period:"缓解期",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"X综合征"}),(dg:drug {name:"曲美他嗪"}) CREATE (ds)<-[:cure {effect:"改善少部分病人症状，总体效果不佳",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"尼可地尔"}) CREATE (ds)<-[:cure {referrence:"内科学第九版"}]-(dg);


CREATE (:drug {type:"抗血小板药物",name:"阿司匹林",family:"环氧化酶（COX）抑制剂"});
CREATE (:drug {type:"抗血小板药物",name:"吲哚布芬",family:"环氧化酶（COX）抑制剂"});
CREATE (:drug {type:"抗血小板药物",name:"氯吡格雷",family:"P2Y12受体拮抗剂"});
CREATE (:drug {type:"抗血小板药物",name:"替格瑞洛",family:"P2Y12受体拮抗剂"});

CREATE (:side_effect {description:"胃肠道出血"});
CREATE (:side_effect {description:"阿司匹林过敏"});
MATCH (d:drug {name:"阿司匹林"}),(se:side_effect {description:"胃肠道出血"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {name:"阿司匹林"}),(se:side_effect {description:"阿司匹林过敏"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"阿司匹林"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"75~150mg",frequency:"每日1次",condition:"无禁忌症",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"吲哚布芬"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"100mg",frequency:"每日2次",condition:"阿司匹林不耐受",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"氯吡格雷"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"75mg",frequency:"每日",condition:"支架植入以后或有阿司匹林禁忌症",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"替格瑞洛"}) CREATE (ds)<-[:cure {period:"缓解期",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"氯吡格雷"}) CREATE (ds)<-[:cure {referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"阿司匹林"}) CREATE (ds)<-[:cure {referrence:"内科学第九版"}]-(dg);



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
MATCH (d:drug {family:"他汀类药物"}),(se:side_effect {description:"肝脏损害"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {family:"他汀类药物"}),(se:side_effect {description:"肌病"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"辛伐他汀"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"20~40mg",frequency:"每晚一次",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"阿托伐他汀"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"10~80mg",frequency:"每日一次",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"普伐他汀"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"20~40mg",frequency:"每晚一次",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"氟伐他汀"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"40~80mg",frequency:"每晚一次",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"瑞舒伐他汀"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"5~20mg",frequency:"每晚一次",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"依折麦布"}) CREATE (ds)<-[:cure {period:"缓解期",condition:"单独应用他汀类药物胆固醇水平不能达标或不能耐受较大剂量他汀治疗",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"PCSK9抑制剂"}) CREATE (ds)<-[:cure {period:"缓解期",condition:"杂合子家族性高胆固醇血症、临床动脉粥样硬化性心血管疾病、在控制饮食和最大耐受剂量他汀治疗下仍需进一步降低LDL-C",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"X综合征"}),(dg:drug {family:"他汀类药物"}) CREATE (ds)<-[:cure {effect:"改善内皮功能",effect:"疗效尚不确定",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"辛伐他汀"}) CREATE (ds)<-[:cure {referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"阿托伐他汀"}) CREATE (ds)<-[:cure {referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"瑞舒伐他汀"}) CREATE (ds)<-[:cure {referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"依折麦布"}) CREATE (ds)<-[:cure {referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"非诺贝特"}) CREATE (ds)<-[:cure {referrence:"内科学第九版"}]-(dg);


CREATE (:drug {type:"ACEI",name:"卡托普利"});
CREATE (:drug {type:"ACEI",name:"依那普利"});
CREATE (:drug {type:"ACEI",name:"培哚普利"});
CREATE (:drug {type:"ACEI",name:"雷米普利"});
CREATE (:drug {type:"ACEI",name:"贝那普利"});
CREATE (:drug {type:"ACEI",name:"赖诺普利"});
CREATE (:drug {type:"ACEI",name:"缬沙坦"});

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"卡托普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"12.5~50mg",frequency:"每日3次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"依那普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"5~10mg",frequency:"每日2次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"培哚普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"4~8mg",frequency:"每日1次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"雷米普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"5~10mg",frequency:"每日1次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"贝那普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"10~20mg",frequency:"每日1次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"赖诺普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"10~20mg",frequency:"每日1次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"X综合征"}),(dg:drug {type:"ACEI"}) CREATE (ds)<-[:cure {effect:"改善内皮功能,疗效尚不确定",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"赖诺普利"}) CREATE (ds)<-[:cure {referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"缬沙坦"}) CREATE (ds)<-[:cure {referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"卡托普利"}) CREATE (ds)<-[:cure {referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"依那普利"}) CREATE (ds)<-[:cure {referrence:"内科学第九版"}]-(dg);

CREATE (:drug {type:"抗凝药",name:"普通肝素"});
CREATE (:drug {type:"抗凝药",name:"低分子量肝素"});
CREATE (:drug {type:"抗凝药",name:"黄达肝葵钠"});
CREATE (:drug {type:"抗凝药",name:"比伐卢定"});
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"普通肝素"}) CREATE (ds)<-[:cure {effect:"抗凝治疗",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"低分子量肝素"}) CREATE (ds)<-[:cure {effect:"抗凝治疗",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"黄达肝葵钠"}) CREATE (ds)<-[:cure {effect:"抗凝治疗",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"NSTEACS"}),(dg:drug {name:"比伐卢定"}) CREATE (ds)<-[:cure {effect:"抗凝治疗",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"普通肝素"}) CREATE (ds)<-[:cure {effect:"抗凝治疗",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"低分子量肝素"}) CREATE (ds)<-[:cure {effect:"抗凝治疗",referrence:"内科学第九版"}]-(dg);

CREATE (:drug {type:"溶栓药",name:"尿激酶",familiy:"非特异性溶栓药"});
CREATE (:drug {type:"溶栓药",name:"链激酶",familiy:"非特异性溶栓药"});
CREATE (:drug {type:"溶栓药",name:"阿替普酶",familiy:"特异性纤溶酶原激活剂"});
CREATE (:drug {type:"溶栓药",name:"瑞替普酶",familiy:"特异性纤溶酶原激活剂"});
CREATE (:drug {type:"溶栓药",name:"奈替普酶",familiy:"特异性纤溶酶原激活剂"});
CREATE (:side_effect {description:"出血风险增加"});
MATCH (d:drug {familiy:"非特异性溶栓药"}),(se:side_effect {description:"出血风险增加"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);

MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"尿激酶"}) CREATE (ds)<-[:cure {effect:"抗凝治疗",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"阿替普酶"}) CREATE (ds)<-[:cure {effect:"抗凝治疗",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"瑞替普酶"}) CREATE (ds)<-[:cure {effect:"抗凝治疗",referrence:"内科学第九版"}]-(dg);

CREATE (:drug {type:"醛固酮受体拮抗剂",name:"螺内酯"});
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"螺内酯"}) CREATE (ds)<-[:cure {dosage:"2~4mg",usage:"静脉注射",frequency:"5~10min后重复",effect:"解除疼痛",referrence:"内科学第九版"}]-(dg);

CREATE (:drug {type:"镇痛药",name:"吗啡"});
CREATE (:drug {type:"镇痛药",name:"哌替啶"});
CREATE (:side_effect {description:"呼吸功能抑制"});
MATCH (d:drug {type:"镇痛药"}),(se:side_effect {description:"呼吸功能抑制"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {type:"镇痛药"}),(se:side_effect {description:"低血压"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"吗啡"}) CREATE (ds)<-[:cure {dosage:"2~4mg",usage:"静脉注射",frequency:"5~10min后重复",effect:"解除疼痛",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {english_name:"STEMI"}),(dg:drug {name:"哌替啶"}) CREATE (ds)<-[:cure {dosage:"50~100mg",usage:"肌内注射",frequency:"5~10min后重复",effect:"解除疼痛",referrence:"内科学第九版"}]-(dg);

//其他治疗
CREATE (:treatment {name:"休息"});
CREATE (:treatment {name:"戒烟"});
CREATE (:treatment {name:"戒酒"});

CREATE (:treatment {name:"经皮冠状动脉介入治疗",english_name:"PCI"});
CREATE (:treatment {name:"冠状动脉旁路移植术",english_name:"CABG"});
CREATE (:side_effect {description:"围术期死亡率为1%-4%"});
CREATE (:side_effect {description:"血管闭塞"});
MATCH (t:treatment {english_name:"CABG"}),(se:side_effect {description:"围术期死亡率为1%-4%"}) CREATE (t)-[:treatment_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (t:treatment {english_name:"CABG"}),(se:side_effect {description:"血管闭塞"}) CREATE (t)-[:treatment_side_effect {referrence:"内科学第九版"}]->(se);

MATCH (ds:disease {name:"稳定型心绞痛"}),(t:treatment {english_name:"PCI"}) CREATE (t)-[:cure {period:"缓解期",condition:"FPR<0.75",referrence:"内科学第九版"}]->(d);
MATCH (ds:disease {name:"稳定型心绞痛"}),(t:treatment {english_name:"CABG"}) CREATE (t)-[:cure {period:"缓解期",condition:"全身情况能耐受开胸手术，左主干合并2支以上冠脉病变（病变复杂程度评分，如SYNTAX评分较高），或多支血管病变合并糖尿病者",referrence:"内科学第九版"}]->(d);
MATCH (ds:disease {name:"稳定型心绞痛"}),(t:treatment {name:"休息"}) CREATE (t)-[:cure {period:"发作期",referrence:"内科学第九版"}]->(d);
MATCH (ds:disease {name:"冠状动脉痉挛"}),(t:treatment {name:"戒烟"}) CREATE (t)-[:cure {referrence:"内科学第九版"}]->(d);
MATCH (ds:disease {name:"冠状动脉痉挛"}),(t:treatment {name:"戒酒"}) CREATE (t)-[:cure {referrence:"内科学第九版"}]->(d);
MATCH (ds:disease {english_name:"NSTEACS"}),(t:treatment {english_name:"PCI"}) CREATE (t)-[:cure {referrence:"内科学第九版"}]->(d);
MATCH (ds:disease {english_name:"NSTEACS"}),(t:treatment {english_name:"CABG"}) CREATE (t)-[:cure {condition:"病变严重、有多支血管病变的症状严重和左心室功能不全的病人",referrence:"内科学第九版"}]->(d);
