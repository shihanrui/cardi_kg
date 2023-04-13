MATCH (n) detach delete n;

//1.13.1 心脏骤停
CREATE (:disease {name:"心脏骤停",english_name:"CA",definition:"心脏射血功能突然终止，造成全身血液循环中断、呼吸停止和 意识丧失。"});

//1.13.1 心脏性猝死
CREATE (:disease {name:"心脏性猝死",english_name:"SCD",definition:"急性症状发作后1小时内发生的以意识突然丧失为 特征的、由心脏原因引起的自然死亡。 意识丧失。"});

CREATE (:cause {name:"心脏骤停",disease:"心脏性猝死"});
CREATE (:cause {name:"冠心病",disease:"心脏性猝死"});
CREATE (:cause {name:"心肌梗死",disease:"心脏性猝死"});
CREATE (:cause {name:"LVEF降低",disease:"心脏性猝死"});
CREATE (:cause {name:"室性期前收缩",disease:"心脏性猝死"});
CREATE (:cause {name:"心肌病",disease:"心脏性猝死"});
CREATE (:cause {name:"梗阻性肥厚型心肌病",disease:"心脏性猝死"});
CREATE (:cause {name:"致心律失常型右心室心肌病",disease:"心脏性猝死"});
CREATE (:cause {name:"离子通道病",disease:"心脏性猝死"});
CREATE (:cause {name:"长QT间期综合征",disease:"心脏性猝死"});
CREATE (:cause {name:"Brugada综合征",disease:"心脏性猝死"});
MATCH (d:disease {name:"心脏性猝死"}),(c:cause {disease:"心脏性猝死"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

CREATE (:inducement {name:"极度情绪变化",disease:"心脏骤停"});
CREATE (:inducement {name:"精神刺激",disease:"心脏骤停"});
CREATE (:inducement {name:"儿茶酚胺敏感性多形室性心动过速",disease:"心脏骤停"});
CREATE (:inducement {name:"应激性心肌病",disease:"心脏骤停"});
MATCH (d:disease {name:"心脏骤停"}),(c:inducement {disease:"心脏骤停"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);

CREATE (:symptom {characteristic:"胸痛", disease:"心脏骤停"});
CREATE (:symptom {characteristic:"气促", disease:"心脏骤停"});
CREATE (:symptom {characteristic:"疲乏", disease:"心脏骤停"});
CREATE (:symptom {characteristic:"心悸", disease:"心脏骤停"});
CREATE (:symptom {characteristic:"瞬间发生心脏骤停", disease:"心脏骤停"});
CREATE (:symptom {characteristic:"严重胸痛", disease:"心脏骤停"});
CREATE (:symptom {characteristic:"急性呼吸困难", disease:"心脏骤停"});
CREATE (:symptom {characteristic:"突发心悸或眩晕", disease:"心脏骤停"});
CREATE (:symptom {characteristic:"心电活动的改变（如心率加快和室性异位搏动增加）", disease:"心脏骤停"});
CREATE (:symptom {characteristic:"循环衰竭", disease:"心脏骤停"});
CREATE (:symptom {characteristic:"意识突然丧失", disease:"心脏骤停"});
CREATE (:symptom {characteristic:"局部或全身性抽搐", disease:"心脏骤停"});
CREATE (:symptom {characteristic:"呼吸断续，呈叹息样或短促痉挛性呼吸", disease:"心脏骤停"});
CREATE (:symptom {characteristic:"皮肤苍白或发绀", disease:"心脏骤停"});
CREATE (:symptom {characteristic:"瞳孔散大", disease:"心脏骤停"});
CREATE (:symptom {characteristic:"大小便失禁", disease:"心脏骤停"});
MATCH (d:disease {name:"心脏骤停"}),(s:symptom {disease:"心脏骤停"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

CREATE (:symptom {characteristic:"胸痛", disease:"心脏性猝死"});
CREATE (:symptom {characteristic:"气促", disease:"心脏性猝死"});
CREATE (:symptom {characteristic:"疲乏", disease:"心脏性猝死"});
CREATE (:symptom {characteristic:"心悸", disease:"心脏性猝死"});
CREATE (:symptom {characteristic:"瞬间发生心脏骤停", disease:"心脏性猝死"});
CREATE (:symptom {characteristic:"严重胸痛", disease:"心脏性猝死"});
CREATE (:symptom {characteristic:"急性呼吸困难", disease:"心脏性猝死"});
CREATE (:symptom {characteristic:"突发心悸或眩晕", disease:"心脏性猝死"});
CREATE (:symptom {characteristic:"心电活动的改变（如心率加快和室性异位搏动增加）", disease:"心脏性猝死"});
CREATE (:symptom {characteristic:"循环衰竭", disease:"心脏性猝死"});
CREATE (:symptom {characteristic:"意识突然丧失", disease:"心脏性猝死"});
CREATE (:symptom {characteristic:"局部或全身性抽搐", disease:"心脏性猝死"});
CREATE (:symptom {characteristic:"呼吸断续，呈叹息样或短促痉挛性呼吸", disease:"心脏性猝死"});
CREATE (:symptom {characteristic:"皮肤苍白或发绀", disease:"心脏性猝死"});
CREATE (:symptom {characteristic:"瞳孔散大", disease:"心脏性猝死"});
CREATE (:symptom {characteristic:"大小便失禁", disease:"心脏性猝死"});
CREATE (:symptom {characteristic:"不可逆脑损害", disease:"心脏性猝死"});
CREATE (:symptom {characteristic:"生物学死亡", disease:"心脏性猝死"});
MATCH (d:disease {name:"心脏性猝死"}),(s:symptom {disease:"心脏性猝死"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

CREATE (:drug {name:"肾上腺素",disease:"心脏骤停"});
CREATE (:drug {name:"血管升压素",disease:"心脏骤停"});
CREATE (:drug {name:"去甲肾上腺素",disease:"心脏骤停"});
CREATE (:drug {name:"多巴胺",disease:"心脏骤停"});
CREATE (:drug {name:"多巴酚丁胺",disease:"心脏骤停"});
CREATE (:drug {name:"碳酸氢盐",disease:"心脏骤停"});
CREATE (:drug {name:"胺碘酮",disease:"心脏骤停"});
CREATE (:drug {name:"利多卡因",disease:"心脏骤停"});
CREATE (:drug {name:"硫酸镁",disease:"心脏骤停"});
CREATE (:drug {name:"静脉β受体拮抗剂",disease:"心脏骤停"});
CREATE (:drug {name:"异丙肾上腺素",disease:"心脏骤停"});
MATCH (ds:disease {name:"心脏骤停"}),(dg:drug {disease:"心脏骤停"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);



