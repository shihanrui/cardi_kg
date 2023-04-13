MATCH (n) detach delete n;
//1.10 主动脉疾病
CREATE (:disease {name:"主动脉疾病"});
//1.10.1 主动脉夹层
CREATE (:disease {name:"主动脉夹层",synonym:"主动脉夹层动脉瘤",definition:"主动脉内膜撕裂后，腔内的血液通过 内膜破口进入动脉壁中层形成夹层血肿，并沿血管长轴方向扩展，形成动脉真、假腔病理改变的严重主动脉疾病"});
MATCH (dc:disease {name:"主动脉疾病"}),(d:disease {name:"主动脉夹层"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
// CREATE (:disease {name:"主动脉弓中断"});
// CREATE (:disease {name:"主动脉缩窄"});
// CREATE (:disease {name:"先天性血管环"});
// CREATE (:disease {name:"血管悬带"});
// CREATE (:disease {name:"主动脉瓣狭窄"});
// CREATE (:disease {name:"主动脉瘤"});
// CREATE (:disease {name:"多发性大动脉炎"});
// MATCH (dc:disease {name:"主动脉疾病"}),(d:disease {name:"主动脉弓中断"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
// MATCH (dc:disease {name:"主动脉疾病"}),(d:disease {name:"主动脉缩窄"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
// MATCH (dc:disease {name:"主动脉疾病"}),(d:disease {name:"先天性血管环"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
// MATCH (dc:disease {name:"主动脉疾病"}),(d:disease {name:"血管悬带"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
// MATCH (dc:disease {name:"主动脉疾病"}),(d:disease {name:"主动脉瓣狭窄"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
// MATCH (dc:disease {name:"主动脉疾病"}),(d:disease {name:"主动脉瘤"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//2.10.1 主动脉夹层
CREATE (:risk_factor {name:"高血压",disease:"主动脉夹层"});
CREATE (:risk_factor {name:"血压变化率增大",disease:"主动脉夹层"});
CREATE (:risk_factor {name:"动脉粥样硬化",disease:"主动脉夹层"});
CREATE (:risk_factor {name:"增龄",disease:"主动脉夹层"});
CREATE (:risk_factor {name:"Marfan综合征",disease:"主动脉夹层"});
CREATE (:risk_factor {name:"Ehlers-Danlos综合征",disease:"主动脉夹层"});
CREATE (:risk_factor {name:"家族性胸主动脉瘤",disease:"主动脉夹层"});
CREATE (:risk_factor {name:"主动脉瓣二瓣畸形",disease:"主动脉夹层"});
CREATE (:risk_factor {name:"先天性主动脉缩窄",disease:"主动脉夹层"});
MATCH (d:disease {name:"主动脉夹层"}),(r:risk_factor {disease:"主动脉夹层"}) CREATE (d)-[:disease_risk_factor {reference:"内科学第九版"}]->(r);
//3.10.1 主动脉夹层
CREATE (:cause {name:"主动脉内膜撕裂后血流进入中层",disease:"主动脉夹层"});
CREATE (:cause {name:"中层滋养动脉破裂产生血肿后压力过高撕裂内膜",disease:"主动脉夹层"});
CREATE (:cause {name:"主动脉内球囊反搏泵置入",disease:"主动脉夹层"});
CREATE (:cause {name:"主动脉内造影剂注射误伤内膜",disease:"主动脉夹层"});
CREATE (:cause {name:"心脏瓣膜及大动脉手术",disease:"主动脉夹层"});
MATCH (d:disease {name:"主动脉夹层"}),(c:cause {disease:"主动脉夹层"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//5.10.1 主动脉夹层
CREATE (:symptom {characteristic:"疼痛",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"突发前胸或胸背部持续性、撕裂样或刀割样剧痛",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"合并高血压，且两上肢或上下肢血压相差较大",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"低血压",comment:"出现心脏压塞、血胸或冠状动脉供血受阻而引起心肌梗死",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"休克",comment:"夹层破裂出血",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"主动脉瓣关闭不全",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"心力衰竭",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"心肌梗死",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"心脏压塞",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"头晕",comment:"神经系统缺血",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"一过性晕厥",comment:"神经系统缺血",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"精神失常",comment:"神经系统缺血",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"缺血性脑卒中",comment:"神经系统缺血",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"Horner综合征",comment:"神经系统缺血",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"截瘫",comment:"神经系统缺血",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"大小便失禁",comment:"神经系统缺血",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"脉搏减弱、消失",comment:"四肢缺血",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"肢体发凉",comment:"四肢缺血",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"发绀",comment:"四肢缺血",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"腰痛",comment:"内脏缺血",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"血尿",comment:"内脏缺血",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"少尿/无尿",comment:"内脏缺血",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"肠坏死",comment:"内脏缺血",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"黄疸",comment:"肝动脉闭塞缺血",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"血清氨基转移酶升高",comment:"肝动脉闭塞缺血",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"胸腔积液",comment:"夹层动脉瘤破裂",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"呕血",comment:"夹层动脉瘤破裂",disease:"主动脉夹层"});
CREATE (:symptom {characteristic:"咯血",comment:"夹层动脉瘤破裂",disease:"主动脉夹层"});
MATCH (d:disease {name:"主动脉夹层"}),(s:symptom {disease:"主动脉夹层"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//7.10.1 主动脉夹层
CREATE (:examination {name:"心电图",information:"无特异性ST-T改变",disease:"主动脉夹层"});
CREATE (:examination {name:"X线胸部平片",information:"主动脉增宽",disease:"主动脉夹层"});
CREATE (:examination {name:"计算机断层扫描血管造影",enlish_name:"CTA",information:"主动脉全程的二维和三维图像",disease:"主动脉夹层"});
CREATE (:examination {name:"磁共振血管造影 ",enlish_name:"MRA",information:"主动脉夹层真、假腔和累及范围",disease:"主动脉夹层"});
CREATE (:examination {name:"数字减影血管造影 ",enlish_name:"DSA",indication:"腔内修复术",disease:"主动脉夹层"});
MATCH (d:disease {name:"主动脉夹层"}),(rt:examination {disease:"主动脉夹层"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

//九、鉴别诊断
//9.10.1 主动脉夹层
CREATE (:differential_diagnosis {name:"急性心肌梗死",symptom:"急性胸痛",disease:"主动脉夹层"});
CREATE (:differential_diagnosis {name:"急性肺栓塞",symptom:"急性胸痛",disease:"主动脉夹层"});
MATCH (d:disease {name:"主动脉夹层"}),(dd:differential_diagnosis {disease:"主动脉夹层"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);

//十、药物处理
CREATE (:drug {name:"硝普钠",disease:"主动脉夹层",aim:"降压"});
CREATE (:drug {name:"α受体阻断剂",disease:"主动脉夹层",aim:"降压"});
CREATE (:drug {name:"血管紧张素转换酶抑制剂",disease:"主动脉夹层",aim:"降压"});
CREATE (:drug {name:"利尿剂",disease:"主动脉夹层",aim:"降压"});
CREATE (:drug {name:"β受体拮抗剂",disease:"主动脉夹层",aim:"减慢心率"});
CREATE (:drug {name:"地尔硫䓬",indication:"β受体拮抗剂不耐受",disease:"主动脉夹层",aim:"减慢心率"});
CREATE (:drug {name:"维拉帕米",indication:"β受体拮抗剂不耐受",disease:"主动脉夹层",aim:"减慢心率"});
MATCH (ds:disease {name:"主动脉夹层"}),(dg:drug {disease:"主动脉夹层"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//十一、非药物处理
//11.10.1 主动脉夹层
CREATE (:treatment {name:"腔内隔绝术",disease:"主动脉夹层"});
CREATE (:treatment {name:"开胸外科手术",disease:"主动脉夹层"});
CREATE (:treatment {name:"CABG",indication:"病变累及冠状动脉或主动脉瓣膜",disease:"主动脉夹层"});
CREATE (:treatment {name:"主动脉瓣膜修补术或置换术",indication:"病变累及冠状动脉或主动脉瓣膜",disease:"主动脉夹层"});
MATCH (d:disease {name:"主动脉夹层"}),(t:treatment {disease:"主动脉夹层"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);

