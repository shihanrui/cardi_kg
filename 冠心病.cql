MATCH (n) detach delete n;

//冠状动脉粥样硬化性心脏病、冠心病、缺血性心脏病等同
CREATE (:disease_category {name:"冠状动脉粥样硬化性心脏病",definition:"指冠状动脉（冠脉）发生粥样硬
化引起管腔狭窄或闭，导致心肌缺血缺氧或坏死而引起的心脏病。"});
CREATE (:disease_category {name:"冠心病"});
CREATE (:disease_category {name:"缺血性心脏病"});
MATCH (dc1:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(dc2:disease_category {name:"冠心病"}) CREATE (dc1)-[:synonym {referrence:"内科学第九版"}]->(dc2);
MATCH (dc1:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(dc2:disease_category {name:"冠心病"}) CREATE (dc1)<-[:synonym {referrence:"内科学第九版"}]-(dc2);
MATCH (dc1:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(dc2:disease_category {name:"缺血性心脏病"}) CREATE (dc1)-[:synonym {referrence:"内科学第九版"}]->(dc2);
MATCH (dc1:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(dc2:disease_category {name:"缺血性心脏病"}) CREATE (dc1)<-[:synonym {referrence:"内科学第九版"}]-(dc2);


//冠心病包含慢性心肌缺血综合征（又称慢性冠脉疾病）和急性冠状动脉综合征
CREATE (:disease_category {name:"慢性心肌缺血综合征"});
CREATE (:disease_category {name:"慢性冠脉疾病"});
MATCH (dc1:disease_category {name:"慢性心肌缺血综合征"}),(dc2:disease_category {name:"慢性冠脉疾病"}) CREATE (dc1)-[:synonym {referrence:"内科学第九版"}]->(dc2);
MATCH (dc1:disease_category {name:"慢性心肌缺血综合征"}),(dc2:disease_category {name:"慢性冠脉疾病"}) CREATE (dc1)<-[:synonym {referrence:"内科学第九版"}]-(dc2);
CREATE (:disease_category {name:"急性冠状动脉综合征"});
MATCH (dc1:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(dc2:disease_category {name:"慢性心肌缺血综合征"}) CREATE (dc1)-[:Include_disease_category {referrence:"内科学第九版"}]->(dc2);
MATCH (dc1:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(dc2:disease_category {name:"急性冠状动脉综合征"}) CREATE (dc1)-[:Include_disease_category {referrence:"内科学第九版"}]->(dc2);


CREATE (:disease {name:"隐匿性冠心病"});
CREATE (:disease {name:"稳定型心绞痛"});CREATE (:disease {name:"劳力性心绞痛"});
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"劳力性心绞痛"}) CREATE (d1)-[:synonym {referrence:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"稳定型心绞痛"}),(d2:disease {name:"劳力性心绞痛"}) CREATE (d1)<-[:synonym {referrence:"内科学第九版"}]-(d2);
CREATE (:disease {name:"不稳定型心绞痛"});
CREATE (:disease {name:"非ST段抬高型心肌梗死"});
CREATE (:disease {name:"ST段抬高型心肌梗"});
CREATE (:disease {name:"猝死"});



//冠状动脉造影
CREATE(:CAG {description:"左冠脉主干狭窄",percentage:"5~10%"});
CREATE(:CAG {description:"无显著狭窄",percentage:"15%"});
CREATE(:CAG {description:"1支冠脉管腔直径减少>70%",percentage:"25%"});
CREATE(:CAG {description:"2支冠脉管腔直径减少>70%",percentage:"25%"});
CREATE(:CAG {description:"3支冠脉管腔直径减少>70%",percentage:"25%"});

//病理
CREATE (:pathology {description:"心脏顺应性减低"});
CREATE (:pathology {description:"肺顺应性减低"});
CREATE (:pathology {description:"左心室舒张末期压和血容量增加"});
CREATE (:pathology {description:"左心室收缩与舒张功能障碍"});
CREATE (:pathology {description:"左心室壁收缩不协调或部分收缩减弱"});



//诱因cause
CREATE (:cause {name:"体力劳动"});
CREATE (:cause {name:"情绪激动"});
CREATE (:cause {name:"饱食"});
CREATE (:cause {name:"寒冷"});
CREATE (:cause {name:"吸烟"})
CREATE (:cause {name:"心动过速"});
CREATE (:cause {name:"休克"});
MATCH (d:disease {name:"稳定型心绞痛"}),(:cause {name:"体力劳动"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(:cause {name:"情绪激动"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(:cause {name:"饱食"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(:cause {name:"寒冷"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(:cause {name:"吸烟"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(:cause {name:"心动过速"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(d);

//发作部位
CREATE (:location {name:"胸骨体后"});
CREATE (:location {name:"心前区"});
CREATE (:location {name:"前胸"});
MATCH (d:disease {name:"稳定型心绞痛"}),(l:location {name:"胸骨体后"}) CREATE (c)-[:locate {referrence:"内科学第九版"}]->(l);
MATCH (d:disease {name:"稳定型心绞痛"}),(l:location {name:"心前区"}) CREATE (c)-[:locate {referrence:"内科学第九版"}]->(l);
MATCH (d:disease {name:"稳定型心绞痛"}),(l:location {name:"前胸"}) CREATE (c)-[:locate {referrence:"内科学第九版"}]->(l);


//放射痛
CREATE (:radiating_pain_location {name:"左肩"});
CREATE (:radiating_pain_location {name:"左臂内侧"});
CREATE (:radiating_pain_location {name:"无名指"});
CREATE (:radiating_pain_location {name:"小指"});
CREATE (:radiating_pain_location {name:"颈部"});
CREATE (:radiating_pain_location {name:"咽部"});
CREATE (:radiating_pain_location {name:"下颌部"});
MATCH (d:disease {name:"稳定型心绞痛"}),(l:radiating_pain_location {name:"左肩"}) CREATE (c)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (d:disease {name:"稳定型心绞痛"}),(l:radiating_pain_location {name:"左臂内侧"}) CREATE (c)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (d:disease {name:"稳定型心绞痛"}),(l:radiating_pain_location {name:"无名指"}) CREATE (c)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (d:disease {name:"稳定型心绞痛"}),(l:radiating_pain_location {name:"小指"}) CREATE (c)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (d:disease {name:"稳定型心绞痛"}),(l:radiating_pain_location {name:"颈部"}) CREATE (c)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (d:disease {name:"稳定型心绞痛"}),(l:radiating_pain_location {name:"咽部"}) CREATE (c)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);

//发作时长
CREATE (:duaration {name:"3~5min"});
MATCH (d:disease {name:"稳定型心绞痛"}),(t:duaration {name:"3~5min"}) CREATE (c)-[:span {referrence:"内科学第九版"}]->(t);




//缓解方式
CREATE (:mitigation {name:"停止活动"});
CREATE (:location {name:"舌下含用硝酸甘油"});
MATCH (d:disease {name:"稳定型心绞痛"}),(m:mitigation {name:"停止活动"}) CREATE (c)<-[:mitigate {referrence:"内科学第九版"}]-(m);

//症状symptom
CREATE (:symptom {name:"心律增快"});
CREATE (:symptom {name:"血压增高"});
CREATE (:symptom {name:"表情焦虑"});
CREATE (:symptom {name:"皮肤冷"});
CREATE (:symptom {name:"出汗"});

//心音
CREATE (:heart_sound {name:"第四心音奔马律"});
CREATE (:heart_sound {name:"第三心音奔马律"});
CREATE (:heart_sound {name:"心尖部收缩期杂音"});


//生物标志物
CREATE (:biomarker {name:"心肌肌钙蛋白I"});
CREATE (:biomarker {name:"心肌肌钙蛋白T"});
CREATE (:biomarker {name:"肌酸激酶",english_name:"CK"});
CREATE (:biomarker {name:"肌酸激酶同工酶",english_name:"CK-MB"});