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
CREATE (:disease {name:"ST段抬高型心肌梗死"});
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
CREATE (:radiating_pain_location {name:"左肩"});稳定型心绞痛
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


//心电图检查
//导联
CREATE (:lead {name:"Ⅰ"});
CREATE (:lead {name:"Ⅱ"});
CREATE (:lead {name:"Ⅲ"});
CREATE (:lead {name:"aVF"});
CREATE (:lead {name:"V4"});
CREATE (:lead {name:"V5"});
CREATE (:lead {name:"V6"});

CREATE (:echocardiogram {type:"静息时心电图",characteristic:"正常"});
CREATE (:echocardiogram {type:"静息时心电图",characteristic:"陈旧性心肌梗死的改变"});
CREATE (:echocardiogram {type:"静息时心电图",characteristic:"非特异性ST段和T波异常"});
CREATE (:echocardiogram {type:"静息时心电图",characteristic:"房室传导阻滞"});
CREATE (:echocardiogram {type:"静息时心电图",characteristic:"束支传导阻滞"});
CREATE (:echocardiogram {type:"静息时心电图",characteristic:"室性期前收缩"});
CREATE (:echocardiogram {type:"静息时心电图",characteristic:"房性期前收缩"});
MATCH (e:echocardiogram {type:"静息时心电图",characteristic:"正常"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {frequency&probability:50%, referrence:"内科学第九版"}]->(e);
MATCH (e:echocardiogram {type:"静息时心电图",characteristic:"陈旧性心肌梗死的改变"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {frequency&probability:"probable", referrence:"内科学第九版"}]->(e);
MATCH (e:echocardiogram {type:"静息时心电图",characteristic:"非特异性ST段和T波异常"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {frequency&probability:"probable", referrence:"内科学第九版"}]->(e);
MATCH (e:echocardiogram {type:"静息时心电图",characteristic:"房室传导阻滞"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {frequency&probability:"often", referrence:"内科学第九版"}]->(e);
MATCH (e:echocardiogram {type:"静息时心电图",characteristic:"束支传导阻滞"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {frequency&probability:"often", referrence:"内科学第九版"}]->(e);
MATCH (e:echocardiogram {type:"静息时心电图",characteristic:"室性期前收缩"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {frequency&probability:"often", referrence:"内科学第九版"}]->(e);
MATCH (e:echocardiogram {type:"静息时心电图",characteristic:"房性期前收缩"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {frequency&probability:"often", referrence:"内科学第九版"}]->(e);

CREATE (:echocardiogram {type:"心绞痛发作时心电图",characteristic:"ST段移位",cause:"暂时性心肌缺血"});
CREATE (:echocardiogram {type:"心绞痛发作时心电图",characteristic:"ST段压低",range:"≥0.1mV",cause:"心内膜下心肌缺血"});
MATCH (e:echocardiogram {type:"心绞痛发作时心电图",characteristic:"ST段压低"}), (l:lead {name:"Ⅰ"}) CREATE (e)-[:relevant_lead {referrence:"内科学第九版"}]->(l);
MATCH (e:echocardiogram {type:"心绞痛发作时心电图",characteristic:"ST段压低"}), (l:lead {name:"Ⅱ"}) CREATE (e)-[:relevant_lead {referrence:"内科学第九版"}]->(l);
MATCH (e:echocardiogram {type:"心绞痛发作时心电图",characteristic:"ST段压低"}), (l:lead {name:"Ⅲ"}) CREATE (e)-[:relevant_lead {referrence:"内科学第九版"}]->(l);
MATCH (e:echocardiogram {type:"心绞痛发作时心电图",characteristic:"ST段压低"}), (l:lead {name:"aVF"}) CREATE (e)-[:relevant_lead {referrence:"内科学第九版"}]->(l);
MATCH (e:echocardiogram {type:"心绞痛发作时心电图",characteristic:"ST段压低"}), (l:lead {name:"V4"}) CREATE (e)-[:relevant_lead {referrence:"内科学第九版"}]->(l);
MATCH (e:echocardiogram {type:"心绞痛发作时心电图",characteristic:"ST段压低"}), (l:lead {name:"V5"}) CREATE (e)-[:relevant_lead {referrence:"内科学第九版"}]->(l);
MATCH (e:echocardiogram {type:"心绞痛发作时心电图",characteristic:"ST段压低"}), (l:lead {name:"V6"}) CREATE (e)-[:relevant_lead {referrence:"内科学第九版"}]->(l);
CREATE (:echocardiogram {type:"心绞痛发作时心电图",characteristic:"T波倒置"});
CREATE (:echocardiogram {type:"心绞痛发作时心电图",characteristic:"T波直立"});
MATCH (e:echocardiogram {type:"心绞痛发作时心电图",characteristic:"ST段移位"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {frequency&probability:"most", referrence:"内科学第九版"}]->(e);
MATCH (e:echocardiogram {type:"心绞痛发作时心电图",characteristic:"ST段压低"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {frequency&probability:"common", referrence:"内科学第九版"}]->(e);
MATCH (e:echocardiogram {type:"心绞痛发作时心电图",characteristic:"T波倒置"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {frequency&probability:"often", referrence:"内科学第九版"}]->(e);
MATCH (e:echocardiogram {type:"心绞痛发作时心电图",characteristic:"T波直立"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {frequency&probability:"often",condition:"平时T波持续倒置", referrence:"内科学第九版"}]->(e);


CREATE (:echocardiogram {type:"心电图负荷试验",characteristic:"运动试验阳性"})
MATCH (e:echocardiogram {type:"心电图负荷试验",characteristic:"运动试验阳性"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {referrence:"内科学第九版"}]->(e);

CREATE (:echocardiogram {type:"心电图连续动态监测",characteristic:"ST-T改变"});
CREATE (:echocardiogram {type:"心电图连续动态监测",characteristic:"心律失常"});
CREATE (:echocardiogram {type:"Holter检查"});
MATCH (e1:echocardiogram {type:"心电图连续动态监测"}), (e2:echocardiogram {type:"Holter检查"}) CREATE (e1)-[:synonym {referrence:"内科学第九版"}]->(e2);
MATCH (e1:echocardiogram {type:"心电图连续动态监测"}), (e2:echocardiogram {type:"Holter检查"}) CREATE (e1)<-[:synonym {referrence:"内科学第九版"}]-(e2);
MATCH (e:echocardiogram {type:"心电图连续动态监测",characteristic:"ST-T改变"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {referrence:"内科学第九版"}]->(e);
MATCH (e:echocardiogram {type:"心电图连续动态监测",characteristic:"心律失常"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {referrence:"内科学第九版"}]->(e);



//CTA
CREATE (:CTA {name:"多层螺旋CT冠状动脉成像"});
MATCH (d:disease {name:"稳定型心绞痛"}),(:CTA {name:"多层螺旋CT冠状动脉成像"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(u);

CREATE (:CTA {characteristic:"冠状动脉狭窄病变"});
CREATE (:CTA {characteristic:"冠状动脉管壁钙化"});

//超声心动图
CREATE (:ultrasonic_cardiogram {name:"超声心动图"});
MATCH (d:disease {name:"稳定型心绞痛"}),(:ultrasonic_cardiogram {name:"超声心动图"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(u);

CREATE (:ultrasonic_cardiogram {description:"无异常"});
CREATE (:ultrasonic_cardiogram {description:"坏死区心室壁运动异常"});
CREATE (:ultrasonic_cardiogram {description:"缺血区心室壁运动异常"});
MATCH (u:ultrasonic_cardiogram {description:"无异常"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {frequency&probability:"most", referrence:"内科学第九版"}]->(u);
MATCH (u:ultrasonic_cardiogram {description:"坏死区心室壁运动异常"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {condition:"陈旧性心肌梗死", referrence:"内科学第九版"}]->(u);
MATCH (u:ultrasonic_cardiogram {description:"坏死区心室壁运动异常"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {condition:"严重心肌缺血", referrence:"内科学第九版"}]->(u);

//放射性核素检查
CREATE (:radionuclide_examination:nuclide {type:"核素心肌显像及负荷试验",name:"201_Tl"});
CREATE (:radionuclide_examination:nuclide {type:"核素心肌显像及负荷试验",name:"99m_TC-MIBI"});
CREATE (:radionuclide_examination:nuclide {type:"放射性核素心腔造影",name:"99m_TC"});
CREATE (:radionuclide_examination:nuclide {type:"PET",name:"18_F"});
CREATE (:radionuclide_examination:nuclide {type:"PET",name:"11_T"});
CREATE (:radionuclide_examination:nuclide {type:"PET",name:"13_N"});
MATCH (d:disease {name:"稳定型心绞痛"}),(r:radionuclide_examination:nuclide {type:"核素心肌显像及负荷试验",name:"201_Tl"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(r);
MATCH (d:disease {name:"稳定型心绞痛"}),(r:radionuclide_examination:nuclide {type:"核素心肌显像及负荷试验",name:"99m_TC-MIBI"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(r);
MATCH (d:disease {name:"稳定型心绞痛"}),(r:radionuclide_examination:nuclide {type:"放射性核素心腔造影",name:"99m_TC"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(r);
MATCH (d:disease {name:"稳定型心绞痛"}),(r:radionuclide_examination:nuclide {type:"放射性核素心腔造影",name:"18_F"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(r);
MATCH (d:disease {name:"稳定型心绞痛"}),(r:radionuclide_examination:nuclide {type:"放射性核素心腔造影",name:"11_T"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(r);
MATCH (d:disease {name:"稳定型心绞痛"}),(r:radionuclide_examination:nuclide {type:"放射性核素心腔造影",name:"13_N"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(r);

CREATE (:radionuclide_examination {type:"核素心肌显像及负荷试验",characteristic:"心肌梗死后瘢痕部位灌注缺损"});
CREATE (:radionuclide_examination {type:"核素心肌显像及负荷试验",characteristic:"灌注缺损心肌缺血区"});
CREATE (:radionuclide_examination {type:"放射性核素心腔造影"});
CREATE (:radionuclide_examination {type:"PET"});
MATCH (r:radionuclide_examination {type:"核素心肌显像及负荷试验",characteristic:"心肌梗死后瘢痕部位灌注缺损"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {condition:"静息", referrence:"内科学第九版"}]->(r);
MATCH (r:radionuclide_examination {type:"核素心肌显像及负荷试验",characteristic:"灌注缺损心肌缺血区"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {condition:"运动", referrence:"内科学第九版"}]->(r);
MATCH (r:radionuclide_examination {type:"核素心肌显像及负荷试验",characteristic:"灌注缺损心肌缺血区"}), (d:disease {name:"稳定型心绞痛"}) CREATE (d)-[:perform {condition:"药物负荷", referrence:"内科学第九版"}]->(r);

//有创检查

CREATE (:invasive_examinationm {type:"CAG"});
CREATE (:invasive_examinationm {type:"冠脉内超声显像"});
MATCH (d:disease {name:"稳定型心绞痛"}),(i:invasive_examinationm {type:"CAG"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(i);
MATCH (d:disease {name:"稳定型心绞痛"}),(i:invasive_examinationm {type:"CAG"}) CREATE (d)-[:examine {referrence:"内科学第九版"}]->(i);


//分级
CREATE (:grade {name:"Ⅰ级", criterion:"一般体力活动（如步行和登楼）不受限，仅在强、快或持续用力时发生心绞痛",referrence:"加拿大心血管病学会(CCS)"});
CREATE (:grade {name:"Ⅱ级", criterion:"一般体力活动轻度受限。快步、饭后、寒冷或刮风中、精神应激或醒后数小时内发作心绞痛。一般情况平地步行200m以上或登楼一层以上受限",referrence:"加拿大心血管病学会(CCS)"});
CREATE (:grade {name:"Ⅲ级", criterion:"一般体力活动明显受限，一般情况下平地步行200m内或登楼一层引起心绞痛",referrence:"加拿大心血管病学会(CCS)"});
CREATE (:grade {name:"Ⅳ级", criterion:"轻微活动或休息时即可发生心绞痛",referrence:"加拿大心血管病学会(CCS)"});

MATCH (d:disease {name:"稳定型心绞痛"}),(g:grade {name:"Ⅰ级", criterion:"一般体力活动（如步行和登楼）不受限，仅在强、快或持续用力时发生心绞痛",referrence:"加拿大心血管病学会(CCS)"})
CREATE (d)-[:severe_classification {referrence:"内科学第九版"}]->(g);
MATCH (d:disease {name:"稳定型心绞痛"}),(g:grade {name:"Ⅰ级", criterion:"一般体力活动轻度受限。快步、饭后、寒冷或刮风中、精神应激或醒后数小时内发作心绞痛。一般情况平地步行200m以上或登楼一层以上受限",referrence:"加拿大心血管病学会(CCS)"})
CREATE (d)-[:severe_classification {referrence:"内科学第九版"}]->(g);
MATCH (d:disease {name:"稳定型心绞痛"}),(g:grade {name:"Ⅰ级", criterion:"一般体力活动明显受限，一般情况下平地步行200m内或登楼一层引起心绞痛",referrence:"加拿大心血管病学会(CCS)"})
CREATE (d)-[:severe_classification {referrence:"内科学第九版"}]->(g);
MATCH (d:disease {name:"稳定型心绞痛"}),(g:grade {name:"Ⅰ级", criterion:"轻微活动或休息时即可发生心绞痛",referrence:"加拿大心血管病学会(CCS)"})
CREATE (d)-[:severe_classification {referrence:"内科学第九版"}]->(g);



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

//drug
CREATE (:drug {type:"β受体拮抗剂",name:"美托洛尔普通片"});
CREATE (:drug {type:"β受体拮抗剂",name:"美托洛尔缓释片"});
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

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"美托洛尔普通片"}) CREATE (ds)<-[:cure {dosage:"25~100mg",frequency:"每日2次口服",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"美托洛尔缓释片"}) CREATE (ds)<-[:cure {dosage:"47.5~190mg",frequency:"每日1次口服",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"比索洛尔"}) CREATE (ds)<-[:cure {dosage:"5~10mg",frequency:"每日1次口服",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);


CREATE (:drug {type:"硝酸酯类药",name:"单硝酸异山梨酯普通片"});
CREATE (:drug {type:"硝酸酯类药",name:"单硝酸异山梨酯缓释片"});
CREATE (:side_effect {description:"头痛"});
CREATE (:side_effect {description:"面色潮红"});
CREATE (:side_effect {description:"心律反射加快"});
CREATE (:side_effect {description:"低血压"});
MATCH (d:drug {type:"硝酸酯类药"}),(se:side_effect {description:"头痛"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {type:"硝酸酯类药"}),(se:side_effect {description:"面色潮红"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {type:"硝酸酯类药"}),(se:side_effect {description:"心律反射加快"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {type:"硝酸酯类药"}),(se:side_effect {description:"低血压"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"单硝酸异山梨酯普通片"}) CREATE (ds)<-[:cure {dosage:"5~20mg",frequency:"每日2次口服",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"单硝酸异山梨酯缓释片"}) CREATE (ds)<-[:cure {dosage:"40~60mg",frequency:"每日1次口服",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);

CREATE (:drug {type:"钙通道阻滞剂",name:"维拉帕米普通片",family:"非二氢吡啶类"});
CREATE (:drug {type:"钙通道阻滞剂",name:"维拉帕米缓释片",family:"非二氢吡啶类"});
CREATE (:drug {type:"钙通道阻滞剂",name:"地尔硫䓬普通片",family:"非二氢吡啶类"});
CREATE (:drug {type:"钙通道阻滞剂",name:"地尔硫䓬缓释片",family:"非二氢吡啶类"});
CREATE (:drug {type:"钙通道阻滞剂",name:"硝苯地平控释片"});
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

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"维拉帕米普通片"}) CREATE (ds)<-[:cure {dosage:"40~80mg",frequency:"每日3次口服",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"维拉帕米缓释片"}) CREATE (ds)<-[:cure {dosage:"240mg",frequency:"每日1次口服",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"地尔硫䓬普通片"}) CREATE (ds)<-[:cure {dosage:"30~60mg",frequency:"每日3次",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"硝苯地平控释片"}) CREATE (ds)<-[:cure {condition:"同时有高血压",dosage:"30mg",frequency:"每日1次",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"氨氯地平"}) CREATE (ds)<-[:cure {condition:"同时有高血压",dosage:"5~10mg",frequency:"每日1次",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);


CREATE (:drug {name:"曲美他嗪"});
CREATE (:drug {name:"尼可地尔",type:"钾通道开放剂"});
CREATE (:drug {name:"盐酸伊伐布雷定"});
CREATE (:drug {name:"雷诺嗪"});
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"曲美他嗪"}) CREATE (ds)<-[:cure {dosage:"20~60mg",frequency:"每日3次",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"尼可地尔"}) CREATE (ds)<-[:cure {dosage:"2mg",frequency:"每日3次",effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"盐酸伊伐布雷定"}) CREATE (ds)<-[:cure {effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"雷诺嗪"}) CREATE (ds)<-[:cure {effect:"改善缺血、减轻症状",referrence:"内科学第九版"}]-(dg);


CREATE (:drug {type:"抗血小板药物",name:"阿司匹林",mechanism:"不可逆抑制环氧化酶"});
CREATE (:side_effect {description:"胃肠道出血"});
CREATE (:side_effect {description:"阿司匹林过敏"});
MATCH (d:drug {name:"阿司匹林"}),(se:side_effect {description:"胃肠道出血"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {name:"阿司匹林"}),(se:side_effect {description:"阿司匹林过敏"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);

CREATE (:drug {type:"抗血小板药物",name:"吲哚布芬",mechanism:"可逆抑制环氧化酶，减少血小板因子3和4"});
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"阿司匹林"}) CREATE (ds)<-[:cure {dosage:"75~150mg",frequency:"每日1次",condition:"无禁忌症",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"吲哚布芬"}) CREATE (ds)<-[:cure {dosage:"100mg",frequency:"每日2次",condition:"阿司匹林不耐受",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);


CREATE (:drug {type:"P2Y12受体拮抗剂",name:"氯吡格雷"});
CREATE (:drug {type:"P2Y12受体拮抗剂",name:"替格瑞洛"});
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"氯吡格雷"}) CREATE (ds)<-[:cure {dosage:"75mg",frequency:"每日",condition:"支架植入以后或有阿司匹林禁忌症",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);

CREATE (:drug {type:"他汀类药物",name:"辛伐他汀"});
CREATE (:drug {type:"他汀类药物",name:"阿托伐他汀"});
CREATE (:drug {type:"他汀类药物",name:"普伐他汀"});
CREATE (:drug {type:"他汀类药物",name:"氟伐他汀"});
CREATE (:drug {type:"他汀类药物",name:"瑞舒伐他汀"});
CREATE (:side_effect {description:"肝脏损害"});
CREATE (:side_effect {description:"肌病"});
MATCH (d:drug {type:"他汀类药物"}),(se:side_effect {description:"肝脏损害"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (d:drug {type:"他汀类药物"}),(se:side_effect {description:"肌病"}) CREATE (d)-[:drug_side_effect {referrence:"内科学第九版"}]->(se);

MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"辛伐他汀"}) CREATE (ds)<-[:cure {dosage:"20~40mg",frequency:"每晚一次",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"阿托伐他汀"}) CREATE (ds)<-[:cure {dosage:"10~80mg",frequency:"每日一次",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"普伐他汀"}) CREATE (ds)<-[:cure {dosage:"20~40mg",frequency:"每晚一次",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"氟伐他汀"}) CREATE (ds)<-[:cure {dosage:"40~80mg",frequency:"每晚一次",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"瑞舒伐他汀"}) CREATE (ds)<-[:cure {dosage:"5~20mg",frequency:"每晚一次",effect:"预防心肌梗死、改善预后",referrence:"内科学第九版"}]-(dg);


CREATE (:drug {type:"ACEI/ARB",name:"卡托普利"});
CREATE (:drug {type:"ACEI/ARB",name:"依那普利"});
CREATE (:drug {type:"ACEI/ARB",name:"培哚普利"});
CREATE (:drug {type:"ACEI/ARB",name:"雷米普利"});
CREATE (:drug {type:"ACEI/ARB",name:"贝那普利"});
CREATE (:drug {type:"ACEI/ARB",name:"赖诺普利"});
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"卡托普利"}) CREATE (ds)<-[:cure {dosage:"12.5~50mg",frequency:"每日3次",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"依那普利"}) CREATE (ds)<-[:cure {dosage:"5~10mg",frequency:"每日2次",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"培哚普利"}) CREATE (ds)<-[:cure {dosage:"4~8mg",frequency:"每日1次",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"雷米普利"}) CREATE (ds)<-[:cure {dosage:"5~10mg",frequency:"每日1次",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"贝那普利"}) CREATE (ds)<-[:cure {dosage:"10~20mg",frequency:"每日1次",referrence:"内科学第九版"}]-(dg);
MATCH (ds:disease {name:"稳定型心绞痛"}),(dg:drug {name:"赖诺普利"}) CREATE (ds)<-[:cure {dosage:"10~20mg",frequency:"每日1次",referrence:"内科学第九版"}]-(dg);

//其他治疗
CREATE (:treatment {name:"PCI"});
CREATE (:treatment {name:"CABG"});
CREATE (:side_effect {description:"围术期死亡率为1%-4%"});
CREATE (:side_effect {description:"血管闭塞"});
MATCH (t:treatment {name:"CABG"}),(se:side_effect {description:"围术期死亡率为1%-4%"}) CREATE (t)-[:treatment_side_effect {referrence:"内科学第九版"}]->(se);
MATCH (t:treatment {name:"CABG"}),(se:side_effect {description:"血管闭塞"}) CREATE (t)-[:treatment_side_effect {referrence:"内科学第九版"}]->(se);


MATCH (ds:disease {name:"稳定型心绞痛"}),(t:treatment {name:"PCI"}) CREATE (t)-[:cure {condition:"FPR<0.75",referrence:"内科学第九版"}]->(d);
MATCH (ds:disease {name:"稳定型心绞痛"}),(t:treatment {name:"CABG"}) CREATE (t)-[:cure {condition:"全身情况能耐受开胸手术，左主干合并2支以上冠脉病变（病变复杂程度评分，如SYNTAX评分较高），或多支血管病变合并糖尿病者",referrence:"内科学第九版"}]->(d);