MATCH (n) detach delete n;

//1.12 感染性心内膜炎
CREATE (:disease {name:"感染性心内膜炎",english_name:"IE"});
//1.12.1 自体瓣膜心内膜炎
CREATE (:disease {name:"自体瓣膜心内膜炎"});
MATCH (dc:disease {name:"感染性心内膜炎"}),(d:disease {name:"自体瓣膜心内膜炎"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);

//1.12.2 人工瓣膜心内膜炎
CREATE (:disease {name:"人工瓣膜心内膜炎"});
MATCH (dc:disease {name:"感染性心内膜炎"}),(d:disease {name:"人工瓣膜心内膜炎"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.12.2 静脉药瘾者心内膜炎
CREATE (:disease {name:"静脉药瘾者心内膜炎"});
MATCH (dc:disease {name:"感染性心内膜炎"}),(d:disease {name:"静脉药瘾者心内膜炎"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);

CREATE (:cause {name:"链球菌",disease:"自体瓣膜心内膜炎"});
CREATE (:cause {name:"葡萄球菌",disease:"自体瓣膜心内膜炎"});
CREATE (:cause {name:"金黄色葡萄球菌",disease:"自体瓣膜心内膜炎"});
CREATE (:cause {name:"肺炎球菌",disease:"自体瓣膜心内膜炎"});
CREATE (:cause {name:"淋球菌",disease:"自体瓣膜心内膜炎"});
CREATE (:cause {name:"A族链球菌",disease:"自体瓣膜心内膜炎"});
CREATE (:cause {name:"流感嗜血杆菌",disease:"自体瓣膜心内膜炎"});
CREATE (:cause {name:"草绿色链球菌",disease:"自体瓣膜心内膜炎"});
CREATE (:cause {name:"D族链球菌",disease:"自体瓣膜心内膜炎"});
CREATE (:cause {name:"牛链球菌",disease:"自体瓣膜心内膜炎"});
CREATE (:cause {name:"肠球菌",disease:"自体瓣膜心内膜炎"});
CREATE (:cause {name:"表皮葡萄球菌",disease:"自体瓣膜心内膜炎"});
CREATE (:cause {name:"真菌",disease:"自体瓣膜心内膜炎"});
CREATE (:cause {name:"立克次体",disease:"自体瓣膜心内膜炎"});
CREATE (:cause {name:"衣原体",disease:"自体瓣膜心内膜炎"});
MATCH (d:disease {name:"自体瓣膜心内膜炎"}),(c:cause {disease:"自体瓣膜心内膜炎"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

CREATE (:cause {name:"葡萄球菌",disease:"人工瓣膜心内膜炎"});
CREATE (:cause {name:"革兰阴性杆菌",disease:"人工瓣膜心内膜炎"});
CREATE (:cause {name:"真菌",disease:"人工瓣膜心内膜炎"});
CREATE (:cause {name:"链球菌",disease:"人工瓣膜心内膜炎"});
CREATE (:cause {name:"肠球菌",disease:"人工瓣膜心内膜炎"});
MATCH (d:disease {name:"人工瓣膜心内膜炎"}),(c:cause {disease:"人工瓣膜心内膜炎"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

CREATE (:cause {name:"金黄色葡萄球菌",disease:"静脉药瘾者心内膜炎"});
CREATE (:cause {name:"链球菌",disease:"静脉药瘾者心内膜炎"});
CREATE (:cause {name:"革兰阴性杆菌",disease:"静脉药瘾者心内膜炎"});
CREATE (:cause {name:"真菌",disease:"静脉药瘾者心内膜炎"});
MATCH (d:disease {name:"静脉药瘾者心内膜炎"}),(c:cause {disease:"静脉药瘾者心内膜炎"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

CREATE (:symptom {characteristic:"全身不适", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"乏力", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"食欲缺乏", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"体重减轻", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"弛张热", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"头痛", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"背痛", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"肌肉关节痛", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"暴发性败血症过程", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"高热寒战", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"突发心力衰竭", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"心脏杂音", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"闭合不全杂音", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"主动脉瓣关闭不全", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"瘀点", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"指和趾甲下线状出血", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"Roth斑", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"Osler结节", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"Janeway损害", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"无痛性出血红斑", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"亚临床型栓塞", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"脑、心脏、脾、肾、肠系膜和四肢的栓塞", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"左向右分流的先天性心血管病", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"右心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"肺循环栓塞", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"肺栓塞", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"咳嗽", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"呼吸困难", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"咯血", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"肺坏死", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"肺空洞", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"脓气胸", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"胸痛", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"脾大", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"贫血", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"苍白无力", disease:"自体瓣膜心内膜炎"});
CREATE (:symptom {characteristic:"多汗", disease:"自体瓣膜心内膜炎"});
MATCH (d:disease {name:"自体瓣膜心内膜炎"}),(s:symptom {disease:"自体瓣膜心内膜炎"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

CREATE (:symptom {characteristic:"持续发热", disease:"静脉药瘾者心内膜炎"});
CREATE (:symptom {characteristic:"菌血症", disease:"静脉药瘾者心内膜炎"});
CREATE (:symptom {characteristic:"多发性感染性肺栓塞", disease:"静脉药瘾者心内膜炎"});
CREATE (:symptom {characteristic:"单纯右心衰竭", disease:"静脉药瘾者心内膜炎"});
CREATE (:symptom {characteristic:"无心脏杂音",comment:"三尖瓣受累", disease:"静脉药瘾者心内膜炎"});
MATCH (d:disease {name:"静脉药瘾者心内膜炎"}),(s:symptom {disease:"静脉药瘾者心内膜炎"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);


CREATE (d:complication {name:"心力衰竭",disease:"自体瓣膜心内膜炎"});
CREATE (d:complication {name:"心肌脓肿",disease:"自体瓣膜心内膜炎"});
CREATE (d:complication {name:"急性心肌梗死",disease:"自体瓣膜心内膜炎"});
CREATE (d:complication {name:"化脓性心包炎",disease:"自体瓣膜心内膜炎"});
CREATE (d:complication {name:"心肌炎",disease:"自体瓣膜心内膜炎"});
CREATE (d:complication {name:"细菌性动脉瘤",disease:"自体瓣膜心内膜炎"});
CREATE (d:complication {name:"迁移性脓肿",disease:"自体瓣膜心内膜炎"});
CREATE (d:complication {name:"脑栓塞",disease:"自体瓣膜心内膜炎"});
CREATE (d:complication {name:"脑细菌性动脉瘤",disease:"自体瓣膜心内膜炎"});
CREATE (d:complication {name:"脑出血",disease:"自体瓣膜心内膜炎"});
CREATE (d:complication {name:"中毒性脑病",disease:"自体瓣膜心内膜炎"});
CREATE (d:complication {name:"化脓性脑膜炎",disease:"自体瓣膜心内膜炎"});
CREATE (d:complication {name:"肾损害",disease:"自体瓣膜心内膜炎"});
MATCH (d1:disease {name:"自体瓣膜心内膜炎"}),(d2:complication {disease:"自体瓣膜心内膜炎"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);


CREATE (:differential_diagnosis {name:"急性风湿热",disease:"自体瓣膜心内膜炎"});
CREATE (:differential_diagnosis {name:"急性风湿热", disease:"自体瓣膜心内膜炎"});
CREATE (:differential_diagnosis {name:"系统性红斑狼疮", disease:"自体瓣膜心内膜炎"});
CREATE (:differential_diagnosis {name:"左房黏液瘤", disease:"自体瓣膜心内膜炎"});
CREATE (:differential_diagnosis {name:"淋巴瘤腹腔内感染", disease:"自体瓣膜心内膜炎"});
CREATE (:differential_diagnosis {name:"结核病", disease:"自体瓣膜心内膜炎"});
CREATE (:differential_diagnosis {name:"金黄色葡萄球菌败血症", disease:"自体瓣膜心内膜炎"});
CREATE (:differential_diagnosis {name:"淋球菌败血症", disease:"自体瓣膜心内膜炎"});
CREATE (:differential_diagnosis {name:"肺炎球菌败血症", disease:"自体瓣膜心内膜炎"});
CREATE (:differential_diagnosis {name:"革兰阴性杆菌败血症", disease:"自体瓣膜心内膜炎"});
MATCH (d:disease {name:"自体瓣膜心内膜炎"}),(dd:differential_diagnosis {disease:"自体瓣膜心内膜炎"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);


CREATE (:drug {name:"苯唑西林", comment:"葡萄球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"氯唑西林", comment:"葡萄球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"耐酶青霉素类", comment:"葡萄球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"头孢唑林", comment:"葡萄球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"万古霉素", comment:"葡萄球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"利福平", comment:"葡萄球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"达托霉素", comment:"葡萄球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"庆大霉素", comment:"葡萄球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"青霉素", comment:"链球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"头孢曲松", comment:"链球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"庆大霉素", comment:"链球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"万古霉素", comment:"链球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"替考拉宁", comment:"链球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"青霉素", comment:"肠球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"阿莫西林", comment:"肠球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"氨苄西林", comment:"肠球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"万古霉素", comment:"肠球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"替考拉宁", comment:"肠球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"利奈唑烷", comment:"肠球菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"哌拉西林", comment:"需氧革兰阴性杆菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"头孢他啶", comment:"需氧革兰阴性杆菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"庆大霉素", comment:"需氧革兰阴性杆菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"妥布霉素", comment:"需氧革兰阴性杆菌心内膜炎", disease:"自体瓣膜心内膜炎"});
CREATE (:drug {name:"氨基糖苷类", comment:"需氧革兰阴性杆菌心内膜炎", disease:"自体瓣膜心内膜炎"});
MATCH (ds:disease {name:"自体瓣膜心内膜炎"}),(dg:drug {disease:"自体瓣膜心内膜炎"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);

CREATE (:drug {name:"庆大霉素",disease:"静脉药瘾者心内膜炎"});
CREATE (:drug {name:"利福平",disease:"静脉药瘾者心内膜炎"});
CREATE (:drug {name:"万古霉素",disease:"静脉药瘾者心内膜炎"});
CREATE (:drug {name:"氟氯西林",disease:"静脉药瘾者心内膜炎"});
CREATE (:drug {name:"达托霉素",disease:"静脉药瘾者心内膜炎"});
CREATE (:drug {name:"甲氧西林",disease:"静脉药瘾者心内膜炎"});
MATCH (ds:disease {name:"人工瓣膜心内膜炎"}),(dg:drug {disease:"人工瓣膜心内膜炎"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);

CREATE (:drug {name:"苯唑西林",disease:"静脉药瘾者心内膜炎"});
MATCH (ds:disease {name:"静脉药瘾者心内膜炎"}),(dg:drug {disease:"静脉药瘾者心内膜炎"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);

CREATE (:treatment {name:"紧急手术",disease:"自体瓣膜心内膜炎"});
CREATE (:treatment {name:"外科手术",disease:"自体瓣膜心内膜炎"});
MATCH (d:disease {name:"自体瓣膜心内膜炎"}),(t:treatment {disease:"自体瓣膜心内膜炎"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
CREATE (:treatment {name:"瓣膜再置换术",disease:"人工瓣膜心内膜炎"});
MATCH (d:disease {name:"人工瓣膜心内膜炎"}),(t:treatment {disease:"人工瓣膜心内膜炎"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
