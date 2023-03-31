MATCH (n) detach delete n;

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
MATCH (d:disease {name:"多瓣膜病"}),(c:cause {disease:"多瓣膜病"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//5.3.1 二尖瓣狭窄
CREATE (:symptom {characteristic:"呼吸困难",inducement:"运动/情绪激动/妊娠/感染/快速性房颤",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"静息性呼吸困难",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"夜间阵发性呼吸困难",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"端坐呼吸",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"咳嗽",inducement:"夜间睡眠/劳动",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"干咳无痰或泡沫痰",inducement:"夜间睡眠/劳动",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"咳黏液样或浓痰",disease:"二尖瓣狭窄",comment:"感染"});
CREATE (:symptom {characteristic:"大咯血",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"痰中带血或血痰",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"咳粉红色泡沫痰",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"咳胶冻状暗红色痰",comment:"心力衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"血栓栓塞",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"心房颤动",comment:"血栓栓塞",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"声音嘶哑",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"吞咽困难",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"食欲减退",comment:"右心室衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"腹胀",comment:"右心室衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"恶心",comment:"右心室衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"胸痛",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"二尖瓣面容",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"双颧绀红",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"剑突下收缩期抬举样搏动",comment:"右心室扩大",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"颈静脉怒张",comment:"右心衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"肝颈静脉回流征阳性",comment:"右心衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"肝大",comment:"右心衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"双下肢水肿",comment:"右心衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"亢进的第一心音，呈拍击样",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"开瓣音",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"P2亢进和分裂",comment:"肺动脉高压",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"心尖区舒张期隆隆样杂音",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"胸骨左缘第2肋间递减型高调叹气样舒张早期杂音（Graham-Steel杂音）",comment:"严重肺动脉高压",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"胸骨左缘第4、5肋间全收缩期吹风样杂音",comment:"右心室扩大",disease:"二尖瓣狭窄"});
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
CREATE (:symptom {characteristic:"腹胀",disease:"慢性二尖瓣关闭不全",comment:"心力衰竭"});
CREATE (:symptom {characteristic:"食欲缺乏",disease:"慢性二尖瓣关闭不全",comment:"心力衰竭"});
CREATE (:symptom {characteristic:"肝脏瘀血肿大",disease:"慢性二尖瓣关闭不全",comment:"心力衰竭"});
CREATE (:symptom {characteristic:"水肿",disease:"慢性二尖瓣关闭不全",comment:"心力衰竭"});
CREATE (:symptom {characteristic:"胸腔积液",disease:"慢性二尖瓣关闭不全",comment:"心力衰竭"});
CREATE (:symptom {characteristic:"腹腔积液",disease:"慢性二尖瓣关闭不全",comment:"心力衰竭"});
CREATE (:symptom {characteristic:"心绞痛",disease:"慢性二尖瓣关闭不全",comment:"冠状动脉疾病"});
CREATE (:symptom {characteristic:"心界向左下扩大",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"心尖搏动向下向左移位",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"收缩期可触及高动力性心尖搏动",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"颈静脉怒张",disease:"慢性二尖瓣关闭不全",comment:"右心衰竭"});
CREATE (:symptom {characteristic:"肝颈回流征阳性",disease:"慢性二尖瓣关闭不全",comment:"右心衰竭"});
CREATE (:symptom {characteristic:"肝大",disease:"慢性二尖瓣关闭不全",comment:"右心衰竭"});
CREATE (:symptom {characteristic:"双下肢水肿",disease:"慢性二尖瓣关闭不全",comment:"右心衰竭"});
CREATE (:symptom {characteristic:"第一心音减弱",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"第二心音分裂",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"低调第三心音",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"心尖区全收缩期吹风样杂音",disease:"慢性二尖瓣关闭不全",comment:"典型杂音"});
CREATE (:symptom {characteristic:"收缩期震颤",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"房颤",examination:"心电图",comment:"左心房增大",disease:"慢性二尖瓣关闭不全"});
CREATE (:symptom {characteristic:"P波增宽且呈双峰状（二尖瓣P波）",examination:"心电图",comment:"窦性心律",disease:"慢性二尖瓣关闭不全"});
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
CREATE (:symptom {characteristic:"非特异性ST-T改变",examination:"心电图",disease:"急性主动脉瓣关闭不全"});
MATCH (d:disease {name:"急性主动脉瓣关闭不全"}),(s:symptom {disease:"急性主动脉瓣关闭不全"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.3.4.2 慢性主动脉瓣关闭不全
CREATE (:symptom {characteristic:"心悸",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"心前区不适",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"头颈部强烈动脉搏动感",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"劳力性呼吸困难",disease:"慢性主动脉瓣关闭不全",comment:"心力衰竭"});
CREATE (:symptom {characteristic:"夜间阵发性呼吸困难",disease:"慢性主动脉瓣关闭不全",comment:"心力衰竭"});
CREATE (:symptom {characteristic:"端坐呼吸",disease:"慢性主动脉瓣关闭不全",comment:"心力衰竭"});
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
CREATE (:symptom {characteristic:"房性心律失常",examination:"心电图",comment:"心肌损害",disease:"慢性主动脉瓣关闭不全"});
CREATE (:symptom {characteristic:"室性心律失常",examination:"心电图",comment:"心肌损害",disease:"慢性主动脉瓣关闭不全"});
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


//8.3.1 二尖瓣狭窄
CREATE (:complication {disease:"二尖瓣狭窄",name:"心房颤动"});
CREATE (:complication {disease:"二尖瓣狭窄",name:"急性肺水肿"});
CREATE (:complication {disease:"二尖瓣狭窄",name:"血栓栓塞"});
CREATE (:complication {disease:"二尖瓣狭窄",name:"右心衰竭"});
CREATE (:complication {disease:"二尖瓣狭窄",name:"感染性心内膜炎"});
CREATE (:complication {disease:"二尖瓣狭窄",name:"肺部感染"});
MATCH (d1:disease {name:"二尖瓣狭窄"}),(d2:complication {disease:"二尖瓣狭窄"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);
//8.3.2 二尖瓣关闭不全
CREATE (:complication {disease:"二尖瓣关闭不全",name:"心力衰竭"});
CREATE (:complication {disease:"二尖瓣关闭不全",name:"心房颤动"});
CREATE (:complication {disease:"二尖瓣关闭不全",name:"感染性心内膜炎"});
CREATE (:complication {disease:"二尖瓣关闭不全",name:"栓塞"});
MATCH (d1:disease {name:"二尖瓣关闭不全"}),(d2:complication {disease:"二尖瓣关闭不全"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);
//8.3.3 主动脉瓣狭窄
CREATE (:complication {disease:"主动脉瓣狭窄",name:"心律失常"});
CREATE (:complication {disease:"主动脉瓣狭窄",name:"心脏性猝死"});
CREATE (:complication {disease:"主动脉瓣狭窄",name:"充血性心力衰竭"});
CREATE (:complication {disease:"主动脉瓣狭窄",name:"感染性心内膜炎"});
CREATE (:complication {disease:"主动脉瓣狭窄",name:"体循环栓塞"});
CREATE (:complication {disease:"主动脉瓣狭窄",name:"胃肠道出血"});
MATCH (d1:disease {name:"主动脉瓣狭窄"}),(d2:complication {disease:"主动脉瓣狭窄"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);
//8.3.4 主动脉瓣关闭不全
CREATE (:complication {disease:"主动脉瓣关闭不全",name:"感染性心内膜炎"});
CREATE (:complication {disease:"主动脉瓣关闭不全",name:"心力衰竭"});
CREATE (:complication {disease:"主动脉瓣关闭不全",name:"心力衰竭"});
CREATE (:complication {disease:"主动脉瓣关闭不全",name:"心脏性猝死"});
MATCH (d1:disease {name:"主动脉瓣关闭不全"}),(d2:complication {disease:"主动脉瓣关闭不全"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);


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
//9.3.3 主动脉瓣狭窄
CREATE (:differential_diagnosis {name:"梗阻性肥厚型心肌病",symptom:"收缩期杂音",disease:"主动脉瓣狭窄"});
CREATE (:differential_diagnosis {name:"先天性主动脉瓣上狭窄",symptom:"收缩期杂音",disease:"主动脉瓣狭窄"});
CREATE (:differential_diagnosis {name:"先天性主动脉瓣下狭窄",symptom:"收缩期杂音",disease:"主动脉瓣狭窄"});
CREATE (:differential_diagnosis {name:"先天性主动脉瓣下狭窄",symptom:"收缩期杂音",disease:"主动脉瓣狭窄"});
CREATE (:differential_diagnosis {name:"二尖瓣关闭不全",symptom:"收缩期杂音",disease:"主动脉瓣狭窄"});
CREATE (:differential_diagnosis {name:"三尖瓣关闭不全",symptom:"收缩期杂音",disease:"主动脉瓣狭窄"});
CREATE (:differential_diagnosis {name:"室间隔缺损",symptom:"收缩期杂音",disease:"主动脉瓣狭窄"});
MATCH (d:disease {name:"主动脉瓣狭窄"}),(dd:differential_diagnosis {disease:"主动脉瓣狭窄"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.3.4 主动脉瓣关闭不全
CREATE (:differential_diagnosis {name:"二尖瓣狭窄",symptom:"主动脉瓣关闭不全杂音",disease:"主动脉瓣关闭不全"});
MATCH (d:disease {name:"主动脉瓣关闭不全"}),(dd:differential_diagnosis {disease:"主动脉瓣关闭不全"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);


//10.3.1 二尖瓣狭窄
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
//10.3.2.1 急性二尖瓣关闭不全
CREATE (:drug {name:"动脉扩张剂",aim:"减低体循环血流阻力",disease:"急性二尖瓣关闭不全"});
MATCH (ds:disease {name:"急性二尖瓣关闭不全"}),(dg:drug {disease:"急性二尖瓣关闭不全"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
CREATE (:drug {name:"动脉扩张剂",indication:"低血压",prohibit_disease:"急性二尖瓣关闭不全"});
MATCH (ds:disease {name:"急性二尖瓣关闭不全"}),(dg:drug {prohibit_disease:"急性二尖瓣关闭不全"}) CREATE (ds)-[:disease_prohibit_drug {reference:"内科学第九版"}]->(dg);
//10.3.2.2 慢性二尖瓣关闭不全
CREATE (:drug {name:"血管紧张素酶抑制剂",english_name:"ACEI",indication:"有症状",aim:"减低左心室容积，缓解症状",disease:"慢性二尖瓣关闭不全"});
CREATE (:drug {name:"抗凝药物",indication:"合并房颤",disease:"慢性二尖瓣关闭不全"});
MATCH (ds:disease {name:"慢性二尖瓣关闭不全"}),(dg:drug {disease:"慢性二尖瓣关闭不全"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.3.3 主动脉瓣狭窄
CREATE (:drug {name:"利尿剂",indication:"心衰病人等待手术者过程中",aim:"缓解肺充血",disease:"主动脉瓣狭窄"});
MATCH (ds:disease {name:"主动脉瓣狭窄"}),(dg:drug {disease:"主动脉瓣狭窄"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
CREATE (:drug {name:"血管紧张素酶抑制剂",english_name:"ACEI",prohibit_disease:"主动脉瓣狭窄"});
CREATE (:drug {name:"β受体拮抗剂",prohibit_disease:"主动脉瓣狭窄"});
MATCH (ds:disease {name:"主动脉瓣狭窄"}),(dg:drug {prohibit_disease:"主动脉瓣狭窄"}) CREATE (ds)-[:disease_prohibit_drug {reference:"内科学第九版"}]->(dg);
//10.3.4.1 急性主动脉瓣关闭不全
CREATE (:drug {name:"多巴胺",indication:"外科术前",usage:"静脉注射",disease:"急性主动脉瓣关闭不全"});
CREATE (:drug {name:"多巴酚丁胺",indication:"外科术前",usage:"静脉注射",disease:"急性主动脉瓣关闭不全"});
CREATE (:drug {name:"硝普钠",indication:"外科术前",usage:"静脉注射",disease:"急性主动脉瓣关闭不全"});
CREATE (:drug {name:"呋塞米",indication:"外科术前",usage:"静脉注射",disease:"急性主动脉瓣关闭不全"});
MATCH (ds:disease {name:"急性主动脉瓣关闭不全"}),(dg:drug {disease:"急性主动脉瓣关闭不全"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.3.4.1 慢性主动脉瓣关闭不全
CREATE (:drug {name:"尼群地平",indication:"左心室扩大但收缩功能正常",aim:"延迟或减少主动脉瓣手术的需要",disease:"慢性主动脉瓣关闭不全"});
CREATE (:drug {name:"肼屈嗪",indication:"左心室扩大但收缩功能正常",aim:"延迟或减少主动脉瓣手术的需要",disease:"慢性主动脉瓣关闭不全"});
CREATE (:drug {name:"血管紧张素酶抑制剂",english_name:"ACEI",indication:"左心室扩大但收缩功能正常",aim:"延迟或减少主动脉瓣手术的需要",disease:"慢性主动脉瓣关闭不全"});
MATCH (ds:disease {name:"慢性主动脉瓣关闭不全"}),(dg:drug {disease:"慢性主动脉瓣关闭不全"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);

//11.3.1 二尖瓣狭窄
CREATE (:treatment {name:"避免剧烈的体力活动",indication:"轻度二尖瓣狭窄无症状者",disease:"二尖瓣狭窄"});
CREATE (:treatment {name:"减少体力活动",indication:"存在肺淤血导致的呼吸困难",disease:"二尖瓣狭窄"});
CREATE (:treatment {name:"限制钠盐摄入",indication:"存在肺淤血导致的呼吸困难",disease:"二尖瓣狭窄"});
CREATE (:treatment {name:"电复律",indication:"合并房颤、出现肺水肿/休克/心绞痛/晕厥",disease:"二尖瓣狭窄"});
CREATE (:treatment {name:"经皮球囊二尖瓣成形术",english_name:"PBMV",indication:"单纯的二尖瓣狭窄病人",disease:"二尖瓣狭窄"});
CREATE (:treatment {name:"二尖瓣分离术",indication:"瓣叶严重钙化/病变累及腱索和乳头肌/左心房内有血栓者",disease:"二尖瓣狭窄"});
CREATE (:treatment {name:"人工瓣膜置换术",indication:"严重瓣叶和瓣下结构钙化、畸形，不宜做经皮球囊二尖瓣成形术或分离术者/二尖瓣狭窄合并明显二尖瓣关闭不全者",disease:"二尖瓣狭窄"});
MATCH (d:disease {name:"二尖瓣狭窄"}),(t:treatment {disease:"二尖瓣狭窄"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.3.2.1 急性二尖瓣关闭不全
CREATE (:treatment {name:"主动脉内球囊反搏",english_name:"IABP",indication:"低血压",disease:"急性二尖瓣关闭不全"});
CREATE (:treatment {name:"二尖瓣修补术",indication:"瓣膜损坏较轻，瓣叶无钙化，瓣环又扩大，但瓣下腱索无严重增厚者",disease:"急性二尖瓣关闭不全"});
CREATE (:treatment {name:"二尖瓣置换术",indication:"瓣膜损坏严重者",disease:"急性二尖瓣关闭不全"});
MATCH (d:disease {name:"急性二尖瓣关闭不全"}),(t:treatment {disease:"急性二尖瓣关闭不全"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.3.2.2 慢性二尖瓣关闭不全
CREATE (:treatment {name:"定期随访",indication:"无症状",disease:"慢性二尖瓣关闭不全"});
CREATE (:treatment {name:"避免竞技性运动",indication:"左心室明显增大（左心室舒张末内径≥60mm）/静息时存在左心室缩功能不全/存在肺动脉高压",disease:"慢性二尖瓣关闭不全"});
CREATE (:treatment {name:"二尖瓣修补术",indication:"瓣膜损坏较轻，瓣叶无钙化，瓣环又扩大，但瓣下腱索无严重增厚者",disease:"慢性二尖瓣关闭不全"});
CREATE (:treatment {name:"二尖瓣置换术",indication:"瓣膜损坏严重者",disease:"慢性二尖瓣关闭不全"});
MATCH (d:disease {name:"慢性二尖瓣关闭不全"}),(t:treatment {disease:"慢性二尖瓣关闭不全"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.3.3 主动脉瓣狭窄
CREATE (:treatment {name:"定期随访",indication:"无症状",disease:"主动脉瓣狭窄"});
CREATE (:treatment {name:"每2年复查一次",indication:"轻度狭窄，体力活动不受限制",disease:"主动脉瓣狭窄"});
CREATE (:treatment {name:"每6-12个月复查一次",indication:"避免剧烈体力活动",disease:"主动脉瓣狭窄"});
CREATE (:treatment {name:"电转复",indication:"出现房颤",disease:"主动脉瓣狭窄"});
CREATE (:treatment {name:"人工瓣膜置换术",indication:"重度狭窄伴心绞痛晕厥或心力衰竭症状的病人/无症状病人伴有有进行性心脏增大和（或）左心室功能进行性减退，活动时血压下降",disease:"主动脉瓣狭窄"});
CREATE (:treatment {name:"直视下主动脉瓣分离术",indication:"儿童和青少年的非钙化性先天性主动脉瓣严重狭窄者/无症状者",disease:"主动脉瓣狭窄"});
CREATE (:treatment {name:"经皮主动脉瓣球囊成形术",indication:"由于严重主动脉瓣狭窄的心源性休克/严重主动脉瓣狭窄需急诊非心脏手术治疗/严重主动脉瓣狭窄的妊娠妇女/严重主动脉瓣狭窄，拒绝手术治疗的病人",disease:"主动脉瓣狭窄"});
CREATE (:treatment {name:"经皮主动脉瓣置换术",english_name:"TAVI",indication:"不适合外科手术的高危病人（如极高龄、慢性肺部疾病、肾衰竭、贫血、肿瘤）",disease:"主动脉瓣狭窄"});
MATCH (d:disease {name:"主动脉瓣狭窄"}),(t:treatment {disease:"主动脉瓣狭窄"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.3.4.1 急性主动脉瓣关闭不全
CREATE (:treatment {name:"吸氧",indication:"外科术前",disease:"急性主动脉瓣关闭不全"});
CREATE (:treatment {name:"镇静",indication:"外科术前",disease:"急性主动脉瓣关闭不全"});
CREATE (:treatment {name:"Swan-Ganz导管床旁血流动力学监测",aim:"降低肺静脉压、增加心排出量、稳定血流动力学 ",disease:"急性主动脉瓣关闭不全"});
CREATE (:treatment {name:"人工瓣膜置换术",disease:"急性主动脉瓣关闭不全"});
CREATE (:treatment {name:"主动脉瓣修复术",disease:"急性主动脉瓣关闭不全"});
MATCH (d:disease {name:"急性主动脉瓣关闭不全"}),(t:treatment {disease:"急性主动脉瓣关闭不全"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.3.4.2 慢性主动脉瓣关闭不全
CREATE (:treatment {name:"随访",indication:"无症状且左心室功能正常者",disease:"慢性主动脉瓣关闭不全"});
CREATE (:treatment {name:"每1-2年随访一次",indication:"轻中度主动脉瓣关闭不全",disease:"慢性主动脉瓣关闭不全"});
CREATE (:treatment {name:"每半年随访一次",indication:"重度主动脉瓣关闭不全",disease:"慢性主动脉瓣关闭不全"});
CREATE (:treatment {name:"限制体力活动",indication:"预防感染性心内膜炎/预防风湿活动/左心室功能减低的病人",disease:"慢性主动脉瓣关闭不全"});
CREATE (:treatment {name:"主动脉瓣置换术",indication:"原发性主动脉瓣关闭不全",disease:"慢性主动脉瓣关闭不全"});
CREATE (:treatment {name:"主动脉瓣成形术",indication:"继发性主动脉瓣关闭不全",disease:"慢性主动脉瓣关闭不全"});
CREATE (:treatment {name:"瓣膜修复术",indication:"瓣叶穿孔",disease:"慢性主动脉瓣关闭不全"});
MATCH (d:disease {name:"慢性主动脉瓣关闭不全"}),(t:treatment {disease:"慢性主动脉瓣关闭不全"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.3.4 多瓣膜病
CREATE (:treatment {name:"手术治疗",disease:"多瓣膜病"});
MATCH (d:disease {name:"多瓣膜病"}),(t:treatment {disease:"多瓣膜病"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
