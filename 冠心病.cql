MATCH (n) detach delete n;

//冠状动脉粥样硬化性心脏病、冠心病、缺血性心脏病等同
CREATE (:disease_category {name:"冠状动脉粥样硬化性心脏病",abbreviation:"冠心病",synonym:"缺血性心脏病",definition:"指冠状动脉（冠脉）发生粥样硬
化引起管腔狭窄或闭，导致心肌缺血缺氧或坏死而引起的心脏病。"});

//冠心病包含慢性心肌缺血综合征（又称慢性冠脉疾病）和急性冠状动脉综合征
CREATE (:disease_category {name:"慢性心肌缺血综合征",synonym:"慢性冠脉疾病"});
CREATE (:disease_category {name:"急性冠状动脉综合征"});
MATCH (dc1:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(dc2:disease_category {name:"慢性心肌缺血综合征"}) CREATE (dc1)-[:Include_disease_category {referrence:"内科学第九版"}]->(dc2);
MATCH (dc1:disease_category {name:"冠状动脉粥样硬化性心脏病"}),(dc2:disease_category {name:"急性冠状动脉综合征"}) CREATE (dc1)-[:Include_disease_category {referrence:"内科学第九版"}]->(dc2);


CREATE (:disease {name:"隐匿性冠心病",synonym:"无症状冠心病"});
CREATE (:disease {name:"稳定型心绞痛",synonym:"劳力性心绞痛"});
CREATE (:disease {name:"缺血性心肌病",english_name:"ICM",definition:"指由冠状动脉粥样硬化引起长期心肌缺血，导致心肌弥漫性纤维化，产生与原发性扩张型心肌病类似的临床表现。"});
CREATE (:disease {name:"不稳定型心绞痛"});
CREATE (:disease {name:"非ST段抬高型心肌梗死"});
CREATE (:disease {name:"ST段抬高型心肌梗死"});
CREATE (:disease {name:"猝死"});
MATCH (dc:disease_category {name:"慢性冠脉疾病"}),(d:disease {name:"稳定型心绞痛"}) CREATE (dc)-[:include_disease {referrence:"内科学第九版"}]->(d);
MATCH (dc:disease_category {name:"慢性冠脉疾病"}),(d:disease {name:"隐匿性冠心病"}) CREATE (dc)-[:include_disease {referrence:"内科学第九版"}]->(d);
MATCH (dc:disease_category {name:"慢性冠脉疾病"}),(d:disease {name:"缺血性心肌病"}) CREATE (dc)-[:include_disease {referrence:"内科学第九版"}]->(d);
MATCH (dc:disease_category {name:"急性冠状动脉综合征"}),(d:disease {name:"非ST段抬高型心肌梗死"}) CREATE (dc)-[:include_disease {referrence:"内科学第九版"}]->(d);
MATCH (dc:disease_category {name:"急性冠状动脉综合征"}),(d:disease {name:"ST段抬高型心肌梗死"}) CREATE (dc)-[:include_disease {referrence:"内科学第九版"}]->(d);
MATCH (dc:disease_category {name:"急性冠状动脉综合征"}),(d:disease {name:"猝死"}) CREATE (dc)-[:include_disease {referrence:"内科学第九版"}]->(d);
MATCH (dc:disease_category {name:"急性冠状动脉综合征"}),(d:disease {name:"不稳定型心绞痛"}) CREATE (dc)-[:include_disease {referrence:"内科学第九版"}]->(d);


//冠状动脉造影
CREATE (:CAG {description:"左冠脉主干狭窄",percentage:"5~10%"});
CREATE (:CAG {description:"无显著狭窄",percentage:"15%"});
CREATE (:CAG {description:"1支冠脉管腔直径减少>70%",percentage:"25%"});
CREATE (:CAG {description:"2支冠脉管腔直径减少>70%",percentage:"25%"});
CREATE (:CAG {description:"3支冠脉管腔直径减少>70%",percentage:"25%"});
MATCH (d:disease {name:"稳定型心绞痛"}),(cag:CAG {description:"左冠脉主干狭窄"}) CREATE (d)-[:pathology_show {referrence:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"稳定型心绞痛"}),(cag:CAG {description:"无显著狭窄"}) CREATE (d)-[:pathology_show {referrence:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"稳定型心绞痛"}),(cag:CAG {description:"1支冠脉管腔直径减少>70%"}) CREATE (d)-[:pathology_show {referrence:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"稳定型心绞痛"}),(cag:CAG {description:"2支冠脉管腔直径减少>70%"}) CREATE (d)-[:pathology_show {referrence:"内科学第九版"}]->(cag);
MATCH (d:disease {name:"稳定型心绞痛"}),(cag:CAG {description:"3支冠脉管腔直径减少>70%"}) CREATE (d)-[:pathology_show {referrence:"内科学第九版"}]->(cag);

//危险因素

//病理
CREATE (:pathology {description:"心脏顺应性减低"});
CREATE (:pathology {description:"肺顺应性减低"});
CREATE (:pathology {description:"左心室收缩力和收缩速度降低",type:"左心室收缩与舒张功能障碍"});
CREATE (:pathology {description:"射血速度减慢",type:"左心室收缩与舒张功能障碍"});
CREATE (:pathology {description:"左心室收缩压下降",type:"左心室收缩与舒张功能障碍"});
CREATE (:pathology {description:"心搏量降低",type:"左心室收缩与舒张功能障碍"});
CREATE (:pathology {description:"心排血量降低",type:"左心室收缩与舒张功能障碍"});
CREATE (:pathology {description:"左心室舒张末期压和血容量增加"});
CREATE (:pathology {description:"左心室壁收缩不协调或部分收缩减弱"});
MATCH (d:disease {name:"稳定型心绞痛"}),(p:pathology {description:"心脏顺应性减低"}) CREATE (d)-[:pathology_explaination {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {name:"稳定型心绞痛"}),(p:pathology {description:"肺顺应性减低"}) CREATE (d)-[:pathology_explaination {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {name:"稳定型心绞痛"}),(p:pathology {description:"左心室舒张末期压和血容量增加"}) CREATE (d)-[:pathology_explaination {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {name:"稳定型心绞痛"}),(p:pathology {description:"左心室收缩力和收缩速度降低"}) CREATE (d)-[:pathology_explaination {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {name:"稳定型心绞痛"}),(p:pathology {description:"射血速度减慢"}) CREATE (d)-[:pathology_explaination {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {name:"稳定型心绞痛"}),(p:pathology {description:"左心室收缩压下降"}) CREATE (d)-[:pathology_explaination {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {name:"稳定型心绞痛"}),(p:pathology {description:"心搏量降低"}) CREATE (d)-[:pathology_explaination {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {name:"稳定型心绞痛"}),(p:pathology {description:"心排血量降低"}) CREATE (d)-[:pathology_explaination {referrence:"内科学第九版"}]->(p);
MATCH (d:disease {name:"稳定型心绞痛"}),(p:pathology {description:"左心室壁收缩不协调或部分收缩减弱"}) CREATE (d)-[:pathology_explaination {referrence:"内科学第九版"}]->(p);



//诱因cause
CREATE (:cause {name:"体力劳动"});
CREATE (:cause {name:"情绪激动",eg:"愤怒、焦急、过度兴奋"});
CREATE (:cause {name:"饱食"});
CREATE (:cause {name:"寒冷"});
CREATE (:cause {name:"吸烟"})
CREATE (:cause {name:"心动过速"});
CREATE (:cause {name:"休克"});
MATCH (d:disease {name:"稳定型心绞痛"}),(c:cause {name:"体力劳动"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:cause {name:"情绪激动"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:cause {name:"饱食"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:cause {name:"寒冷"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:cause {name:"吸烟"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:cause {name:"心动过速"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(d);
MATCH (d:disease {name:"稳定型心绞痛"}),(c:cause {name:"休克"}) CREATE (c)-[:induce {referrence:"内科学第九版"}]->(d);

//发作部位
CREATE (:pain_location {name:"胸骨体后"});
CREATE (:pain_location {name:"心前区"});
CREATE (:pain_location {name:"前胸"});
MATCH (d:disease {name:"稳定型心绞痛"}),(l:pain_location {name:"胸骨体后"}) CREATE (d)-[:pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (d:disease {name:"稳定型心绞痛"}),(l:pain_location {name:"心前区"}) CREATE (d)-[:pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (d:disease {name:"稳定型心绞痛"}),(l:pain_location {name:"前胸"}) CREATE (d)-[:pain_locate {referrence:"内科学第九版"}]->(l);


//放射痛
CREATE (:radiating_pain_location {name:"左肩"});
CREATE (:radiating_pain_location {name:"左臂内侧"});
CREATE (:radiating_pain_location {name:"无名指"});
CREATE (:radiating_pain_location {name:"小指"});
CREATE (:radiating_pain_location {name:"颈部"});
CREATE (:radiating_pain_location {name:"咽部"});
CREATE (:radiating_pain_location {name:"下颌部"});
MATCH (d:disease {name:"稳定型心绞痛"}),(l:radiating_pain_location {name:"左肩"}) CREATE (d)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (d:disease {name:"稳定型心绞痛"}),(l:radiating_pain_location {name:"左臂内侧"}) CREATE (d)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (d:disease {name:"稳定型心绞痛"}),(l:radiating_pain_location {name:"无名指"}) CREATE (d)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (d:disease {name:"稳定型心绞痛"}),(l:radiating_pain_location {name:"小指"}) CREATE (d)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (d:disease {name:"稳定型心绞痛"}),(l:radiating_pain_location {name:"颈部"}) CREATE (d)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (d:disease {name:"稳定型心绞痛"}),(l:radiating_pain_location {name:"咽部"}) CREATE (d)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);
MATCH (d:disease {name:"稳定型心绞痛"}),(l:radiating_pain_location {name:"下颌部"}) CREATE (d)-[:radiating_pain_locate {referrence:"内科学第九版"}]->(l);

//发作时长
CREATE (:duaration {time:"3~5min"});
CREATE (:duaration {time:"<0.5h"});
MATCH (d:disease {name:"稳定型心绞痛"}),(t:duaration {time:"3~5min"}) CREATE (d)-[:span {referrence:"内科学第九版"}]->(t);
MATCH (d:disease {name:"稳定型心绞痛"}),(t:duaration {time:"<0.5h"}) CREATE (d)-[:span {referrence:"内科学第九版"}]->(t);


//缓解方式
CREATE (:mitigation {name:"停止活动"});
CREATE (:mitigation {name:"舌下含用硝酸甘油"});
MATCH (d:disease {name:"稳定型心绞痛"}),(m:mitigation {name:"停止活动"}) CREATE (d)<-[:mitigate {referrence:"内科学第九版"}]-(m);
MATCH (d:disease {name:"稳定型心绞痛"}),(m:mitigation {name:"舌下含用硝酸甘油"}) CREATE (d)<-[:mitigate {referrence:"内科学第九版"}]-(m);

//症状symptom
CREATE (:symptom {description:"心律增快"});
CREATE (:symptom {description:"血压增高"});
CREATE (:symptom {description:"表情焦虑"});
CREATE (:symptom {description:"皮肤冷"});
CREATE (:symptom {description:"出汗"});
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {description:"心律增快"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {description:"血压增高"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {description:"表情焦虑"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {description:"皮肤冷"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);
MATCH (d:disease {name:"稳定型心绞痛"}),(s:symptom {description:"出汗"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(s);

//心音
CREATE (:heart_sound {description:"第四心音奔马律"});
CREATE (:heart_sound {description:"第三心音奔马律"});
CREATE (:heart_sound {description:"暂时性心尖部收缩期杂音"});
MATCH (d:disease {name:"稳定型心绞痛"}),(hs:heart_sound {description:"第四心音奔马律"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(hs);
MATCH (d:disease {name:"稳定型心绞痛"}),(hs:heart_sound {description:"第三心音奔马律"}) CREATE (d)-[:patient_show {referrence:"内科学第九版"}]->(hs);
MATCH (d:disease {name:"稳定型心绞痛"}),(hs:heart_sound {description:"暂时性心尖部收缩期杂音"}) CREATE (d)-[:patient_show {cause:"乳头肌缺血以致功能失调引起尖瓣
关闭不全",referrence:"内科学第九版"}]->(hs);


//生物标志物
CREATE (:biomarker {name:"心肌肌钙蛋白I",type:"心肌损伤标志物"});
CREATE (:biomarker {name:"心肌肌钙蛋白T",type:"心肌损伤标志物"});
CREATE (:biomarker {name:"肌酸激酶",english_name:"CK",type:"心肌损伤标志物"});
CREATE (:biomarker {name:"肌酸激酶同工酶",english_name:"CK-MB",type:"心肌损伤标志物"});
MATCH (d:disease {name:"稳定型心绞痛"}),(b:biomarker {name:"心肌肌钙蛋白I"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(b);
MATCH (d:disease {name:"稳定型心绞痛"}),(b:biomarker {name:"心肌肌钙蛋白T"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(b);
MATCH (d:disease {name:"稳定型心绞痛"}),(b:biomarker {name:"肌酸激酶"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(b);
MATCH (d:disease {name:"稳定型心绞痛"}),(b:biomarker {name:"肌酸激酶同工酶"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(b);

//常规检查
CREATE (:regular_test {name:"血糖"});
CREATE (:regular_test {name:"血脂"});
CREATE (:regular_test {name:"血常规"});
CREATE (:regular_test {name:"甲状腺功能"});
CREATE (:regular_test {name:"心电图",english_name:"ECG"});
CREATE (:special_test {name:"多层螺旋CT冠状动脉成像",english_name:"CTA"});
CREATE (:special_test {name:"超声心动图"});
CREATE (:special_test {name:"核素心肌显像及负荷试验",type:"放射性核素检查"});
CREATE (:special_test {name:"放射性核素心腔造影",type:"放射性核素检查"});
CREATE (:special_test {name:"正电子发射断层心肌显像",english_name:"PET",type:"放射性核素检查"});
CREATE (:special_test {name:"冠状动脉造影",abbreviation:"冠脉造影",english_name:"CAG",type:"有创性检查"});
CREATE (:special_test {name:"冠脉超声成像",english_name:"IVUS",type:"有创性检查"});
CREATE (:special_test {name:"冠脉内光学相干断层显像",english_name:"OCT",type:"有创性检查"});
CREATE (:special_test {name:"冠脉血流储备分数测定",english_name:"FFR",type:"有创性检查"});
CREATE (:special_test {name:"定量冠脉血流分数",english_name:"QFR",type:"有创性检查"});
//核素相关
CREATE (:nuclide {name:"201_Tl"});
CREATE (:nuclide {name:"99m_TC-MIBI"});
CREATE (:nuclide {name:"99m_TC"});
CREATE (:nuclide {name:"18_F"});
CREATE (:nuclide {name:"11_T"});
CREATE (:nuclide {name:"13_N"});
MATCH (n:nuclide {name:"201_Tl"}),(st:special_test {name:"核素心肌显像及负荷试验"}) CREATE (st)-[use_nuclide {referrence:"内科学第九版"}]-(n);
MATCH (n:nuclide {name:"99m_TC-MIBI"}),(st:special_test {name:"核素心肌显像及负荷试验"}) CREATE (st)-[use_nuclide {referrence:"内科学第九版"}]-(n);
MATCH (n:nuclide {name:"99m_TC"}),(st:special_test {name:"放射性核素心腔造影"}) CREATE (st)-[use_nuclide {referrence:"内科学第九版"}]-(n);
MATCH (n:nuclide {name:"11_T"}),(st:special_test {name:"正电子发射断层心肌显像"}) CREATE (st)-[use_nuclide {referrence:"内科学第九版"}]-(n);
MATCH (n:nuclide {name:"13_N"}),(st:special_test {name:"正电子发射断层心肌显像"}) CREATE (st)-[use_nuclide {referrence:"内科学第九版"}]-(n);
MATCH (n:nuclide {name:"18_F"}),(st:special_test {name:"正电子发射断层心肌显像"}) CREATE (st)-[use_nuclide {referrence:"内科学第九版"}]-(n);


MATCH (d:disease {name:"稳定型心绞痛"}),(rt:regular_test {name:"血糖"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:regular_test {name:"血脂"}) CREATE (d)-[:test {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:regular_test {name:"血常规"}) CREATE (d)-[:examine {attention:"贫血",referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:regular_test {name:"甲状腺功能"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:regular_test {name:"心电图"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:special_test {name:"多层螺旋CT冠状动脉成像"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:special_test {name:"超声心动图"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:special_test {name:"核素心肌显像及负荷试验"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:special_test {name:"放射性核素心腔造影"}) CREATE (d)-[:examine {content:"左心射血分数及显示心肌缺血区室壁局部运动障碍",referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:special_test {name:"正电子发射断层心肌显像"}) CREATE (d)-[:examine {content:"心肌血流灌注和代谢显像匹配分析",referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:special_test {name:"冠状动脉造影"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:special_test {name:"冠脉超声成像"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:special_test {name:"冠脉内光学相干断层显像"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:special_test {name:"冠脉血流储备分数测定"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"稳定型心绞痛"}),(rt:special_test {name:"定量冠脉血流分数"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(rt);



//心电图检查
//导联
CREATE (:lead {name:"Ⅰ"});
CREATE (:lead {name:"Ⅱ"});
CREATE (:lead {name:"Ⅲ"});
CREATE (:lead {name:"aVF"});
CREATE (:lead {name:"V4"});
CREATE (:lead {name:"V5"});
CREATE (:lead {name:"V6"});

CREATE (:ECG {type:"静息时心电图",characteristic:"正常"});
CREATE (:ECG {type:"静息时心电图",characteristic:"陈旧性心肌梗死的改变"});
CREATE (:ECG {type:"静息时心电图",characteristic:"非特异性ST段和T波异常"});
CREATE (:ECG {type:"静息时心电图",characteristic:"房室传导阻滞"});
CREATE (:ECG {type:"静息时心电图",characteristic:"束支传导阻滞"});
CREATE (:ECG {type:"静息时心电图",characteristic:"室性期前收缩"});
CREATE (:ECG {type:"静息时心电图",characteristic:"房性期前收缩"});
MATCH (e:ECG {type:"静息时心电图",characteristic:"正常"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"50%", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {type:"静息时心电图",characteristic:"陈旧性心肌梗死的改变"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"probable", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {type:"静息时心电图",characteristic:"非特异性ST段和T波异常"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"probable", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {type:"静息时心电图",characteristic:"房室传导阻滞"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {type:"静息时心电图",characteristic:"束支传导阻滞"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {type:"静息时心电图",characteristic:"室性期前收缩"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {type:"静息时心电图",characteristic:"房性期前收缩"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often", referrence:"内科学第九版"}]->(e);

CREATE (:ECG {type:"心绞痛发作时心电图",characteristic:"ST段移位",cause:"暂时性心肌缺血"});
CREATE (:ECG {type:"心绞痛发作时心电图",characteristic:"ST段压低",range:"≥0.1mV",cause:"心内膜下心肌缺血"});
MATCH (e:ECG {type:"心绞痛发作时心电图",characteristic:"ST段压低"}), (l:lead {name:"Ⅰ"}) CREATE (e)-[:relevant_lead {referrence:"内科学第九版"}]->(l);
MATCH (e:ECG {type:"心绞痛发作时心电图",characteristic:"ST段压低"}), (l:lead {name:"Ⅱ"}) CREATE (e)-[:relevant_lead {referrence:"内科学第九版"}]->(l);
MATCH (e:ECG {type:"心绞痛发作时心电图",characteristic:"ST段压低"}), (l:lead {name:"Ⅲ"}) CREATE (e)-[:relevant_lead {referrence:"内科学第九版"}]->(l);
MATCH (e:ECG {type:"心绞痛发作时心电图",characteristic:"ST段压低"}), (l:lead {name:"aVF"}) CREATE (e)-[:relevant_lead {referrence:"内科学第九版"}]->(l);
MATCH (e:ECG {type:"心绞痛发作时心电图",characteristic:"ST段压低"}), (l:lead {name:"V4"}) CREATE (e)-[:relevant_lead {referrence:"内科学第九版"}]->(l);
MATCH (e:ECG {type:"心绞痛发作时心电图",characteristic:"ST段压低"}), (l:lead {name:"V5"}) CREATE (e)-[:relevant_lead {referrence:"内科学第九版"}]->(l);
MATCH (e:ECG {type:"心绞痛发作时心电图",characteristic:"ST段压低"}), (l:lead {name:"V6"}) CREATE (e)-[:relevant_lead {referrence:"内科学第九版"}]->(l);
CREATE (:ECG {type:"心绞痛发作时心电图",characteristic:"T波倒置"});
CREATE (:ECG {type:"心绞痛发作时心电图",characteristic:"T波直立"});
MATCH (e:ECG {type:"心绞痛发作时心电图",characteristic:"ST段移位"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"most", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {type:"心绞痛发作时心电图",characteristic:"ST段压低"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"common", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {type:"心绞痛发作时心电图",characteristic:"T波倒置"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often", referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {type:"心绞痛发作时心电图",characteristic:"T波直立"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {frequency_probability:"often",condition:"平时T波持续倒置", referrence:"内科学第九版"}]->(e);


CREATE (:ECG {type:"心电图负荷试验",characteristic:"运动试验阳性"});
MATCH (e:ECG {type:"心电图负荷试验",characteristic:"运动试验阳性"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);

CREATE (:ECG {type:"心电图连续动态监测",synonym:"Holter检查",characteristic:"ST-T改变"});
CREATE (:ECG {type:"心电图连续动态监测",synonym:"Holter检查",characteristic:"心律失常"});
MATCH (e:ECG {type:"心电图连续动态监测",characteristic:"ST-T改变"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);
MATCH (e:ECG {type:"心电图连续动态监测",characteristic:"心律失常"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ecg_show {referrence:"内科学第九版"}]->(e);



CREATE (:CTA {characteristic:"冠状动脉狭窄病变"});
CREATE (:CTA {characteristic:"冠状动脉管壁钙化"});
MATCH (cta:CTA {characteristic:"冠状动脉狭窄病变"}), (d:disease {name:"稳定型心绞痛"}) CREATE (cta)<-[:cta_show {referrence:"内科学第九版"}]-(d);
MATCH (cta:CTA {characteristic:"冠状动脉管壁钙化"}), (d:disease {name:"稳定型心绞痛"}) CREATE (cta)<-[:cta_show {referrence:"内科学第九版"}]-(d);


//超声心动图
CREATE (:UCG {characteristic:"无异常"});
CREATE (:UCG {characteristic:"坏死区心室壁运动异常"});
CREATE (:UCG {characteristic:"缺血区心室壁运动异常"});
MATCH (u:UCG {characteristic:"无异常"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ucg_show {frequency_probability:"most", referrence:"内科学第九版"}]->(u);
MATCH (u:UCG {characteristic:"坏死区心室壁运动异常"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ucg_show {condition:"陈旧性心肌梗死", referrence:"内科学第九版"}]->(u);
MATCH (u:UCG {characteristic:"坏死区心室壁运动异常"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:ucg_show {condition:"严重心肌缺血", referrence:"内科学第九版"}]->(u);

//放射性核素检查

CREATE (:radionuclide_examination {type:"核素心肌显像及负荷试验",characteristic:"心肌梗死后瘢痕部位灌注缺损"});
CREATE (:radionuclide_examination {type:"核素心肌显像及负荷试验",characteristic:"灌注缺损心肌缺血区"});
CREATE (:radionuclide_examination {type:"放射性核素心腔造影"});
CREATE (:radionuclide_examination {type:"PET"});
MATCH (r:radionuclide_examination {type:"核素心肌显像及负荷试验",characteristic:"心肌梗死后瘢痕部位灌注缺损"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {condition:"静息", referrence:"内科学第九版"}]->(r);
MATCH (r:radionuclide_examination {type:"核素心肌显像及负荷试验",characteristic:"灌注缺损心肌缺血区"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {condition:"运动", referrence:"内科学第九版"}]->(r);
MATCH (r:radionuclide_examination {type:"核素心肌显像及负荷试验",characteristic:"灌注缺损心肌缺血区"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {condition:"药物负荷", referrence:"内科学第九版"}]->(r);


//分级
CREATE (:grade {name:"Ⅰ级", criterion:"一般体力活动（如步行和登楼）不受限，仅在强、快或持续用力时发生心绞痛",referrence:"加拿大心血管病学会(CCS)"});
CREATE (:grade {name:"Ⅱ级", criterion:"一般体力活动轻度受限。快步、饭后、寒冷或刮风中、精神应激或醒后数小时内发作心绞痛。一般情况平地步行200m以上或登楼一层以上受限",referrence:"加拿大心血管病学会(CCS)"});
CREATE (:grade {name:"Ⅲ级", criterion:"一般体力活动明显受限，一般情况下平地步行200m内或登楼一层引起心绞痛",referrence:"加拿大心血管病学会(CCS)"});
CREATE (:grade {name:"Ⅳ级", criterion:"轻微活动或休息时即可发生心绞痛",referrence:"加拿大心血管病学会(CCS)"});

MATCH (d:disease {name:"稳定型心绞痛"}),(g:grade {name:"Ⅰ级"}) CREATE (d)-[:severe_classification {referrence:"内科学第九版"}]->(g);
MATCH (d:disease {name:"稳定型心绞痛"}),(g:grade {name:"Ⅱ级"}) CREATE (d)-[:severe_classification {referrence:"内科学第九版"}]->(g);
MATCH (d:disease {name:"稳定型心绞痛"}),(g:grade {name:"Ⅲ级"}) CREATE (d)-[:severe_classification {referrence:"内科学第九版"}]->(g);
MATCH (d:disease {name:"稳定型心绞痛"}),(g:grade {name:"Ⅳ级"}) CREATE (d)-[:severe_classification {referrence:"内科学第九版"}]->(g);



//鉴别诊断
CREATE (d:disease {name:"心脏神经症"});
CREATE (d:disease {name:"主动脉瓣狭窄"});
CREATE (d:disease {name:"主动脉瓣关闭不全"});
CREATE (d:disease {name:"风湿性冠脉炎"});
CREATE (d:disease {name:"梅毒主动性脉炎引起的冠脉口狭窄或闭塞"});
CREATE (d:disease {name:"肥厚型心肌病"});
CREATE (d:disease {name:"X综合征"});
CREATE (d:disease {name:"反流性食管炎"});
CREATE (d:disease {name:"膈疝"});
CREATE (d:disease {name:"消化性溃疡"});
CREATE (d:disease {name:"肠道疾病"});
CREATE (d:disease {name:"颈椎病"});
CREATE (d:disease {name:"肋间神经痛"});
CREATE (d:disease {name:"肋软骨炎"});
CREATE (d:disease {name:"心肌炎"});
CREATE (d:disease {name:"心肌病"});
CREATE (d:disease {name:"心包疾病"});
CREATE (d:disease {name:"电解质失调"});
CREATE (d:disease {name:"内分泌疾病"});
CREATE (d:disease {name:"药物作用"});

MATCH (d:disease {name:"稳定型心绞痛"}),(d:disease_category {name:"急性冠状动脉综合征"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"稳定型心绞痛"}),(d:disease {name:"反流性食管炎"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"稳定型心绞痛"}),(d:disease {name:"膈疝"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"稳定型心绞痛"}),(d:disease {name:"心脏神经症"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"稳定型心绞痛"}),(d:disease {name:"消化性溃疡"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"稳定型心绞痛"}),(d:disease {name:"肠道疾病"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"稳定型心绞痛"}),(d:disease {name:"颈椎病"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"稳定型心绞痛"}),(d:disease {name:"肋间神经痛"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"稳定型心绞痛"}),(d:disease {name:"肋软骨炎"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);内科学第九版
MATCH (d:disease {name:"稳定型心绞痛"}),(d:disease {name:"主动脉瓣狭窄"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"稳定型心绞痛"}),(d:disease {name:"主动脉瓣关闭不全"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"稳定型心绞痛"}),(d:disease {name:"风湿性冠脉炎"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"稳定型心绞痛"}),(d:disease {name:"梅毒主动性脉炎引起的冠脉口狭窄或闭塞"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"稳定型心绞痛"}),(d:disease {name:"肥厚型心肌病"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"稳定型心绞痛"}),(d:disease {name:"X综合征"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"隐匿性冠心病"}),(d:disease {name:"心肌炎"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"隐匿性冠心病"}),(d:disease {name:"心肌病"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"隐匿性冠心病"}),(d:disease {name:"心包疾病"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"隐匿性冠心病"}),(d:disease {name:"电解质失调"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);
MATCH (d:disease {name:"隐匿性冠心病"}),(d:disease {name:"内分泌疾病"}) CREATE (d1)-[:discriminate {referrence:"内科学第九版"}]->(d2);

//drug
//β受体拮抗剂
//CREATE (:pathology {description:"抑制心脏β肾上腺素能受体，减慢心率、减弱心肌收缩力、降低血压，从而降低心肌耗氧以减少心绞痛发作和增加运动耐量。"})
CREATE (:drug {type:"β受体拮抗剂",name:"美托洛尔"});
CREATE (:drug {type:"β受体拮抗剂",name:"比索洛尔"});
CREATE (:contraindication {condition:"严重心动过缓"});
CREATE (:contraindication {condition:"高度房室传导阻滞"});
CREATE (:contraindication {condition:"窦房结功能紊乱"});
CREATE (:contraindication {condition:"支气管痉挛"});
CREATE (:contraindication {condition:"支气管哮喘"});
CREATE (:contraindication {condition:"外周血管疾病"});
CREATE (:contraindication {condition:"严重抑郁"});
CREATE (:contraindication {condition:"慢性肺心病"});
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


CREATE (:drug {type:"硝酸酯类药",name:"单硝酸异山梨酯"});
CREATE (:drug {type:"硝酸酯类药",name:"硝酸甘油"});
CREATE (:drug {type:"硝酸酯类药",name:"硝酸异山梨酯"});

CREATE (:side_effect {description:"头痛"});
CREATE (:side_effect {description:"面色潮红"});
CREATE (:side_effect {description:"心律反射加快"});
CREATE (:side_effect {description:"低血压"});
CREATE (:side_effect {description:"直立性低血压"});

MATCH (d:drug {type:"硝酸酯类药"}),(se:side_effect {description:"头痛"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {type:"硝酸酯类药"}),(se:side_effect {description:"面色潮红"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {type:"硝酸酯类药"}),(se:side_effect {description:"心律反射加快"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {type:"硝酸酯类药"}),(se:side_effect {description:"低血压"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {name:"硝酸甘油"}),(se:side_effect {description:"直立性低血压"}) CREATE (d)-[:drug_side_effect {condition:"第一次含服",referrence:"内科学第九版"}]->(se);

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"单硝酸异山梨酯"}) CREATE (ds)<-[:cure {period:"缓解期",type:"普通片",dosage:"5~20mg",frequency:"每日2次口服",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"单硝酸异山梨酯"}) CREATE (ds)<-[:cure {period:"缓解期",type:"缓释片",dosage:"40~60mg",frequency:"每日1次口服",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"硝酸甘油"}) CREATE (ds)<-[:cure {period:"发作期",dosage:"0.5mg",usag:"舌下含化",onset_time:"1~2min",actuation_duaration:"0.5h",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"硝酸异山梨酯"}) CREATE (ds)<-[:cure {period:"发作期",dosage:"5~10mg",usag:"舌下含化",onset_time:"2~5min",actuation_duaration:"2~3h",referrence:"内科学第九版"}]-(dg);

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


CREATE (:drug {name:"曲美他嗪"});
CREATE (:drug {name:"尼可地尔",type:"钾通道开放剂"});
CREATE (:drug {name:"盐酸伊伐布雷定"});
CREATE (:drug {name:"雷诺嗪"});
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"曲美他嗪"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"20~60mg",frequency:"每日3次",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"尼可地尔"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"2mg",frequency:"每日3次",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"盐酸伊伐布雷定"}) CREATE (ds)<-[:cure {period:"缓解期",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"雷诺嗪"}) CREATE (ds)<-[:cure {period:"缓解期",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);


CREATE (:drug {type:"抗血小板药物",name:"阿司匹林",family:"环氧化酶（COX）抑制剂"});
CREATE (:drug {type:"抗血小板药物",name:"吲哚布芬",family:"环氧化酶（COX）抑制剂"});
CREATE (:side_effect {description:"胃肠道出血"});
CREATE (:side_effect {description:"阿司匹林过敏"});
MATCH (d:drug {name:"阿司匹林"}),(se:side_effect {description:"胃肠道出血"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {name:"阿司匹林"}),(se:side_effect {description:"阿司匹林过敏"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"阿司匹林"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"75~150mg",frequency:"每日1次",condition:"无禁忌症",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"吲哚布芬"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"100mg",frequency:"每日2次",condition:"阿司匹林不耐受",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);


CREATE (:drug {type:"抗血小板药物",name:"氯吡格雷",family:"P2Y12受体拮抗剂"});
CREATE (:drug {type:"抗血小板药物",name:"替格瑞洛",family:"P2Y12受体拮抗剂"});
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"氯吡格雷"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"75mg",frequency:"每日",condition:"支架植入以后或有阿司匹林禁忌症",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"替格瑞洛"}) CREATE (ds)<-[:cure {period:"缓解期",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);

CREATE (:drug {type:"降LDL-C药物",name:"辛伐他汀",family:"他汀类药物"});
CREATE (:drug {type:"降LDL-C药物",name:"阿托伐他汀",family:"他汀类药物"});
CREATE (:drug {type:"降LDL-C药物",name:"普伐他汀",family:"他汀类药物"});
CREATE (:drug {type:"降LDL-C药物",name:"氟伐他汀",family:"他汀类药物"});
CREATE (:drug {type:"降LDL-C药物",name:"瑞舒伐他汀",family:"他汀类药物"});
CREATE (:drug {type:"降LDL-C药物",name:"依折麦布"});
CREATE (:drug {type:"降LDL-C药物",name:"PCSK9抑制剂"});
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


CREATE (:drug {type:"ACEI/ARB",name:"卡托普利"});
CREATE (:drug {type:"ACEI/ARB",name:"依那普利"});
CREATE (:drug {type:"ACEI/ARB",name:"培哚普利"});
CREATE (:drug {type:"ACEI/ARB",name:"雷米普利"});
CREATE (:drug {type:"ACEI/ARB",name:"贝那普利"});
CREATE (:drug {type:"ACEI/ARB",name:"赖诺普利"});
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"卡托普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"12.5~50mg",frequency:"每日3次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"依那普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"5~10mg",frequency:"每日2次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"培哚普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"4~8mg",frequency:"每日1次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"雷米普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"5~10mg",frequency:"每日1次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"贝那普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"10~20mg",frequency:"每日1次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"赖诺普利"}) CREATE (ds)<-[:cure {period:"缓解期",dosage:"10~20mg",frequency:"每日1次",condition:"稳定型心绞痛病人合并高血压、糖尿病、心力衰竭或左心室收缩功能不全的高危病人",referrence:"内科学第九版"}]-(dg);

//其他治疗
CREATE (:treatment {name:"休息"});
CREATE (:treatment {name:"经皮冠状动脉介入治疗",english_name:"PCI"});
CREATE (:treatment {name:"冠状动脉旁路移植术",english_name:"CABG"});
CREATE (:side_effect {description:"围术期死亡率为1%-4%"});
CREATE (:side_effect {description:"血管闭塞"});
MATCH (t:treatment {english_name:"CABG"}),(se:side_effect {description:"围术期死亡率为1%-4%"}) CREATE (t)-[:treatment_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (t:treatment {english_name:"CABG"}),(se:side_effect {description:"血管闭塞"}) CREATE (t)-[:treatment_side_effect {referrence:"内科学第九版"}]->(se);

MATCH (ds:disease {name:"稳定型心绞痛"}),(t:treatment {name:"PCI"}) CREATE (t)-[:cure {period:"缓解期",condition:"FPR<0.75",referrence:"内科学第九版"}]->(d);
MATCH (ds:disease {name:"稳定型心绞痛"}),(t:treatment {name:"CABG"}) CREATE (t)-[:cure {period:"缓解期",condition:"全身情况能耐受开胸手术，左主干合并2支以上冠脉病变（病变复杂程度评分，如SYNTAX评分较高），或多支血管病变合并糖尿病者",referrence:"内科学第九版"}]->(d);
MATCH (ds:disease {name:"稳定型心绞痛"}),(t:treatment {name:"休息"}) CREATE (t)-[:cure {period:"发作期",referrence:"内科学第九版"}]->(d);
