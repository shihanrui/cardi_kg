MATCH (n) detach delete n;
//1.8 心血管神经症
CREATE (:disease {name:"心血管神经症",definition:"以心血管疾病的有关症状为主要表现的临床综合征，临床上无器质性心脏病的证据"});
//2.8 心血管神经症
CREATE (:risk_factor {name:"女性",disease:"心血管神经症"});
CREATE (:risk_factor {name:"中青年",disease:"心血管神经症"});
MATCH (d:disease {name:"心血管神经症"}),(r:risk_factor {disease:"心血管神经症"}) CREATE (d)-[:disease_risk_factor {reference:"内科学第九版"}]->(r);

//3.8 心血管神经症
CREATE (:cause {name:"抑郁型神经",disease:"心血管神经症"});
CREATE (:cause {name:"焦虑型神经",disease:"心血管神经症"});
CREATE (:cause {name:"忧愁型神经",disease:"心血管神经症"});
CREATE (:cause {name:"精神受到外界环境刺激",disease:"心血管神经症"});
CREATE (:cause {name:"工作紧张",disease:"心血管神经症"});
CREATE (:cause {name:"压力大",disease:"心血管神经症"});
CREATE (:cause {name:"家庭成员中有神经官能症",disease:"心血管神经症"});
CREATE (:cause {name:"对疑似症状产生过度忧虑",disease:"心血管神经症"});
MATCH (d:disease {name:"心血管神经症"}),(c:cause {disease:"心血管神经症"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//5.8 心血管神经症
CREATE (:symptom {characteristic:"心悸",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"呼吸困难",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"心前区痛",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"针刺样、牵扯样或刀割样疼痛",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"含服硝酸甘油不能缓解疼痛",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"失眠",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"多梦",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"失眠",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"焦虑",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"食欲缺乏",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"头晕",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"耳鸣多汗",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"手足发冷",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"双手震颤",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"手足发冷",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"尿频",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"大便次数增多",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"便秘",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"心率增快",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"心音增强",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"短促收缩期杂音",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"期前收缩",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"血压轻度升高",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"腱反射较活跃",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"窦性心动过速",examination:"心电图",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"房性或室性期前收缩",examination:"心电图",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"非特异性ST-T改变",examination:"心电图",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"心绞痛",comment:"精神心理问题",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"心力衰竭",comment:"精神心理问题",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"抑郁",comment:"精神心理问题",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"不安",comment:"精神心理问题",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"压抑",comment:"精神心理问题",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"焦躁不安",comment:"精神心理问题",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"易怒",comment:"精神心理问题",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"易疲劳",comment:"精神心理问题",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"急性发作",comment:"精神心理问题",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"惊恐障碍",comment:"精神心理问题",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"胸痛",comment:"精神心理问题",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"头痛",comment:"精神心理问题",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"出汗发抖",comment:"精神心理问题",disease:"心血管神经症"});
CREATE (:symptom {characteristic:"无器质性病变证据",comment:"精神心理问题",disease:"心血管神经症"});
MATCH (d:disease {name:"心血管神经症"}),(s:symptom {disease:"心血管神经症"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//8.8 心血管神经症
CREATE (:complication {disease:"心血管神经症",name:"精神心理问题"});
MATCH (d1:disease {name:"心血管神经症"}),(d2:complication {disease:"心血管神经症"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);

//9.8 心血管神经症
CREATE (:differential_diagnosis {name:"心绞痛",disease:"心血管神经症"});
CREATE (:differential_diagnosis {name:"甲状腺功能亢进",disease:"心血管神经症"});
CREATE (:differential_diagnosis {name:"心肌炎",disease:"心血管神经症"});
CREATE (:differential_diagnosis {name:"二尖瓣脱垂综合征",disease:"心血管神经症"});
CREATE (:differential_diagnosis {name:"嗜铬细胞瘤",disease:"心血管神经症"});
MATCH (d:disease {name:"心血管神经症"}),(dd:differential_diagnosis {disease:"心血管神经症"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//11.8 心血管神经症
CREATE (:drug {name:"氯硝西泮",indication:"焦虑症状明显",aim:"抗焦虑",disease:"心血管神经症"});
CREATE (:drug {name:"劳拉西泮",indication:"焦虑症状明显",aim:"抗焦虑",disease:"心血管神经症"});
CREATE (:drug {name:"阿米替林",indication:"伴有抑郁",aim:"抗抑郁",disease:"心血管神经症"});
CREATE (:drug {name:"多塞平",indication:"伴有抑郁",aim:"抗抑郁",disease:"心血管神经症"});
CREATE (:drug {name:"氟西汀",indication:"伴有抑郁",aim:"抗抑郁",disease:"心血管神经症"});
CREATE (:drug {name:"舍曲林",indication:"伴有抑郁",aim:"抗抑郁",disease:"心血管神经症"});
MATCH (ds:disease {name:"心血管神经症"}),(dg:drug {disease:"心血管神经症"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);

//11.8 心血管神经症
CREATE (:treatment {name:"心理治疗",disease:"心血管神经症"});
CREATE (:treatment {name:"危险因素干预",indication:"合并高血压、高血脂等心血管危险因素而无明确器质性病变者",disease:"心血管神经症"});
MATCH (d:disease {name:"心血管神经症"}),(t:treatment {disease:"心血管神经症"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
