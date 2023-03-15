MATCH (n) detach delete n;

CREATE (:disease {name:"心脏瓣膜病",definition:"由多种原因引起的心脏瓣膜狭窄或（和）关闭不全所致的心脏疾病"});
CREATE (:disease {name:"二尖瓣狭窄",english_name:"MS"});
CREATE (:disease {name:"急性二尖瓣关闭不全"});
CREATE (:disease {name:"慢性二尖瓣关闭不全"});
CREATE (:disease {name:"二尖瓣关闭不全",english_name:"MI/MR"});
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

//风险因子
CREATE (:risk_factor {factor:"年龄40~50岁"});
CREATE (:risk_factor {factor:"女性"});
MATCH (d:disease {name:"二尖瓣狭窄"}),(r:risk_factor {factor:"年龄40~50岁"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);
MATCH (d:disease {name:"二尖瓣狭窄"}),(r:risk_factor {factor:"女性"}) CREATE (d)<-[:risk {reference:"内科学第九版"}]-(r);


//病因
CREATE (:cause {name:"风湿热",comment:"主要病因"});
CREATE (:cause {name:"先天性发育异常"});
CREATE (:cause {name:"瓣环钙化"});
CREATE (:cause {name:"老年性退行性改变"});
CREATE (:cause {name:"风湿关节炎"});
CREATE (:cause {name:"系统性红斑狼疮"});
CREATE (:cause {name:"硬皮病"});
CREATE (:cause {name:"Coxsackie病毒"});
MATCH (d:disease {name:"二尖瓣狭窄"}),(c:cause {name:"风湿热"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"二尖瓣狭窄"}),(c:cause {name:"先天性发育异常"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"二尖瓣狭窄"}),(c:cause {name:"瓣环钙化"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"二尖瓣狭窄"}),(c:cause {name:"老年性退行性改变"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"二尖瓣狭窄"}),(c:cause {name:"风湿关节炎"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"二尖瓣狭窄"}),(c:cause {name:"系统性红斑狼疮"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"二尖瓣狭窄"}),(c:cause {name:"硬皮病"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
MATCH (d:disease {name:"二尖瓣狭窄"}),(c:cause {name:"Coxsackie病毒"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);


//症状
CREATE (:symptom {characteristic:"呼吸困难",stage:"早期",comment:"常见",inducement:"运动/情绪激动/妊娠/感染/快速性房颤",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"静息性呼吸困难",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"夜间阵发性呼吸困难",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"端坐呼吸",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"咳嗽",comment:"常见",inducement:"夜间睡眠/劳动",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"干咳无痰或泡沫痰",comment:"常见",inducement:"夜间睡眠/劳动",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"咳黏液样或浓痰",complicate:"并发感染",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"大咯血",stage:"早期",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"痰中带血或血痰",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"咳粉红色泡沫痰",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"咳胶冻状暗红色痰",complicate:"心力衰竭",stage:"晚期",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"血栓栓塞",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"心房颤动",complicate:"血栓栓塞",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"声音嘶哑",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"吞咽困难",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"食欲减退",complicate:"右心室衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"腹胀",complicate:"右心室衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"恶心",complicate:"右心室衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"胸痛",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"二尖瓣面容",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"双颧绀红",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"剑突下收缩期抬举样搏动",complicate:"右心室扩大",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"颈静脉怒张",complicate:"右心衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"肝颈静脉回流征阳性",complicate:"右心衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"肝大",complicate:"右心衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"双下肢水肿",complicate:"右心衰竭",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"亢进的第一心音，呈拍击样",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"开瓣音",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"P2亢进和分裂",complicate:"肺动脉高压",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"心尖区舒张期隆隆样杂音",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"胸骨左缘第2肋间递减型高调叹气样舒张早期杂音（Graham-Steel杂音）",complicate:"严重肺动脉高压",disease:"二尖瓣狭窄"});
CREATE (:symptom {characteristic:"胸骨左缘第4、5肋间全收缩期吹风样杂音",complicate:"右心室扩大",disease:"二尖瓣狭窄"});

MATCH (d:disease {name:"二尖瓣狭窄"}),(s:symptom {disease:"二尖瓣狭窄"}) CREATE (d)-[:diseas_symtom {reference:"内科学第九版"}]->(s);


//实验室检查
// CREATE (:examination {name:"X线检查",characteristic:"肺淤血"});
// CREATE (:examination {name:"X线检查",characteristic:"肺门扩大，边缘模糊"});
// CREATE (:examination {name:"X线检查",characteristic:"上肺纹理增多"});
// CREATE (:examination {name:"X线检查",characteristic:"Kerley B线"});
// CREATE (:examination {name:"X线检查",characteristic:"上肺纹理增多"});
// CREATE (:examination {name:"X线检查",characteristic:"肺泡水肿"});
// CREATE (:examination {name:"X线检查",characteristic:"中下肺野内中带有片状或蝶翼状模糊影"});
// CREATE (:examination {name:"X线检查",characteristic:"左心房增大"});
// CREATE (:examination {name:"X线检查",characteristic:"双心房影"});
// CREATE (:examination {name:"X线检查",characteristic:"左心缘变直"});
// CREATE (:examination {name:"X线检查",characteristic:"左主支气管上抬"});
// CREATE (:examination {name:"X线检查",characteristic:"增大的左心房压迫食管下段"});
// CREATE (:examination {name:"X线检查",characteristic:"主动脉弓缩小"});
// CREATE (:examination {name:"X线检查",characteristic:"肺动脉主干突出"});
// CREATE (:examination {name:"X线检查",characteristic:"右心室增大"});
// CREATE (:examination {name:"X线检查",characteristic:"心脏呈梨形"});

// CREATE (:examination {name:"心电图",characteristic:"二尖瓣型P波 （p波宽度>0.12秒，伴切迹）",hint:"左心房扩大",complicate:"窦性心律"});
// CREATE (:examination {name:"心电图",characteristic:"QRS波群示电轴右偏和右心室肥厚"});
// CREATE (:examination {name:"心电图",characteristic:"房颤",stage:"晚期"});

// CREATE (:examination {name:"M型超声心动图",characteristic:"二尖瓣前叶呈“城墙样”改变（EF斜率降低，A峰消失）"});
// CREATE (:examination {name:"M型超声心动图",characteristic:"后叶与前叶同向运动"});
// CREATE (:examination {name:"M型超声心动图",characteristic:"瓣叶回声增强"});
// CREATE (:examination {name:"二维超声",characteristic:"舒张期前叶呈圆拱状"});
// CREATE (:examination {name:"二维超声",characteristic:"后叶活动度减少"});
// CREATE (:examination {name:"二维超声",characteristic:"交界处粘连融合"});
// CREATE (:examination {name:"二维超声",characteristic:"瓣叶增厚"});
// CREATE (:examination {name:"二维超声",characteristic:"瓣口面积缩小"});

CREATE (:examination {name:"X线检查",information:"肺静脉压增高导致肺淤血的迹象/左心房扩大",disease:"二尖瓣狭窄"});
CREATE (:examination {name:"心电图",information:"左心房扩大",disease:"二尖瓣狭窄"});
CREATE (:examination {name:"超声心动图",information:"二尖瓣狭窄的确诊",disease:"二尖瓣狭窄"});
CREATE (:examination {name:"二维超声",information:"瓣叶活动度/瓣叶厚度/瓣叶钙化/瓣膜病变",disease:"二尖瓣狭窄"});
CREATE (:examination {name:"经食管超声",information:"左心耳及左心房附壁血栓的检出",disease:"二尖瓣狭窄"});
CREATE (:examination {name:"彩色多普勒血流显像",information:"二尖瓣狭窄的射流",disease:"二尖瓣狭窄"});
CREATE (:examination {name:"连续波或脉冲波多普勒",information:"二尖瓣狭窄严重程度",disease:"二尖瓣狭窄"});
MATCH (d:disease {name:"二尖瓣狭窄"}),(rt:examination {disease:"二尖瓣狭窄"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);


//并发症
CREATE (d:complication {name:"心房颤动"});
CREATE (d:complication {name:"急性肺水肿"});
CREATE (d:complication {name:"血栓栓塞"});
CREATE (d:complication {name:"右心衰竭"});
CREATE (d:complication {name:"感染性心内膜炎"});
CREATE (d:complication {name:"肺部感染"});
MATCH (d1:disease {name:"二尖瓣狭窄"}),(d2:complication {name:"心房颤动"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"二尖瓣狭窄"}),(d2:complication {name:"急性肺水肿"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"二尖瓣狭窄"}),(d2:complication {name:"血栓栓塞"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"二尖瓣狭窄"}),(d2:complication {name:"右心衰竭"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"二尖瓣狭窄"}),(d2:complication {name:"感染性心内膜炎"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);
MATCH (d1:disease {name:"二尖瓣狭窄"}),(d2:complication {name:"肺部感染"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);



//非药物干预
CREATE (:operation {name:"经皮球囊二尖瓣成形术",english_name:"PBMV",indication:"单纯的二尖瓣狭窄病人"});
CREATE (:operation {name:"二尖瓣分离术",indication:"瓣叶严重钙化/病变累及腱索和乳头肌/左心房内有血栓者"});
CREATE (:operation {name:"人工瓣膜置换术",indication:"严重瓣叶和瓣下结构钙化、畸形，不宜做经皮球囊二尖瓣成形术或分离术者/二尖瓣狭窄合并明显二尖瓣关闭不全者"});
MATCH (d:disease {name:"二尖瓣狭窄"}),(t:operation {name:"经皮球囊二尖瓣成形术"}) CREATE (d)-[:disease_operation {reference:"内科学第九版"}]->(t);
MATCH (d:disease {name:"二尖瓣狭窄"}),(t:operation {name:"二尖瓣分离术"}) CREATE (d)-[:disease_operation {reference:"内科学第九版"}]->(t);
MATCH (d:disease {name:"二尖瓣狭窄"}),(t:operation {name:"人工瓣膜置换术"}) CREATE (d)-[:disease_operation {reference:"内科学第九版"}]->(t);
