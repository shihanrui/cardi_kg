MATCH (n) detach delete n;

//1.7 先天性心血管病
CREATE (:disease {name:"先天性心血管病",abbreviation:"先心病",definition:"心脏及大血管在胎儿期发育异常引起，在出生时病变已存在的疾病"});
//1.7.1 房间隔缺损
CREATE (:disease {name:"房间隔缺损",english_name:"ASD"});
MATCH (dc:disease {name:"先天性心血管病"}),(d:disease {name:"房间隔缺损"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.7.2 室间隔缺损
CREATE (:disease {name:"室间隔缺损",english_name:"VSD"});
MATCH (dc:disease {name:"先天性心血管病"}),(d:disease {name:"室间隔缺损"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.7.3 动脉导管未闭
CREATE (:disease {name:"动脉导管未闭",english_name:"PDA"});
MATCH (dc:disease {name:"先天性心血管病"}),(d:disease {name:"动脉导管未闭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.7.4 卵圆孔未闭
CREATE (:disease {name:"卵圆孔未闭",english_name:"PFO"});
MATCH (dc:disease {name:"先天性心血管病"}),(d:disease {name:"卵圆孔未闭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.7.5 先天性肺动脉瓣狭窄
CREATE (:disease {name:"先天性肺动脉瓣狭窄"});
MATCH (dc:disease {name:"先天性心血管病"}),(d:disease {name:"先天性肺动脉瓣狭窄"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.7.6 二叶主动脉瓣
CREATE (:disease {name:"二叶主动脉瓣"});
MATCH (dc:disease {name:"先天性心血管病"}),(d:disease {name:"二叶主动脉瓣"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.7.7 三尖瓣下移畸形
CREATE (:disease {name:"三尖瓣下移畸形",synonym:"埃博斯坦畸形"});
MATCH (dc:disease {name:"先天性心血管病"}),(d:disease {name:"三尖瓣下移畸形"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.7.8 先天性主动脉缩窄
CREATE (:disease {name:"先天性主动脉缩窄"});
MATCH (dc:disease {name:"先天性心血管病"}),(d:disease {name:"先天性主动脉缩窄"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.7.9 主动脉窦瘤
CREATE (:disease {name:"主动脉窦瘤"});
MATCH (dc:disease {name:"先天性心血管病"}),(d:disease {name:"主动脉窦瘤"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.7.10 冠状动脉瘘
CREATE (:disease {name:"冠状动脉瘘",english_name:"CAF",definition:"冠状动脉心腔、冠状静脉、肺动脉等的异常连接"});
MATCH (dc:disease {name:"先天性心血管病"}),(d:disease {name:"冠状动脉瘘"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.7.11 法洛四联症
CREATE (:disease {name:"法洛四联症"});
MATCH (dc:disease {name:"先天性心血管病"}),(d:disease {name:"法洛四联症"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.7.12 艾森门格综合征
CREATE (:disease {name:"艾森门格综合征"});
MATCH (dc:disease {name:"先天性心血管病"}),(d:disease {name:"艾森门格综合征"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);

//二、风险因子
//2.7.3 动脉导管未闭
CREATE (:risk_factor {name:"女性",disease:"动脉导管未闭"});
MATCH (d:disease {name:"动脉导管未闭"}),(r:risk_factor {disease:"动脉导管未闭"}) CREATE (d)-[:disease_risk_factor {reference:"内科学第九版"}]->(r);
//2.7.9 主动脉窦瘤
CREATE (:risk_factor {name:"男性",disease:"主动脉窦瘤"});
MATCH (d:disease {name:"主动脉窦瘤"}),(r:risk_factor {disease:"主动脉窦瘤"}) CREATE (d)-[:disease_risk_factor {reference:"内科学第九版"}]->(r);

//五、临床表现
//5.7.1 房间隔缺损
CREATE (:symptom {characteristic:"劳力性呼吸困难",disease:"房间隔缺损"});
CREATE (:symptom {characteristic:"心律失常",disease:"房间隔缺损"});
CREATE (:symptom {characteristic:"右心衰竭",disease:"房间隔缺损"});
CREATE (:symptom {characteristic:"艾森门格综合征",disease:"房间隔缺损"});
CREATE (:symptom {characteristic:"肺动脉瓣区第二心音亢进呈固定性分裂",disease:"房间隔缺损"});
CREATE (:symptom {characteristic:"Ⅱ~Ⅲ级收缩期喷射性杂音",disease:"房间隔缺损"});
MATCH (d:disease {name:"房间隔缺损"}),(s:symptom {disease:"房间隔缺损"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.7.2 室间隔缺损
CREATE (:symptom {characteristic:"无症状",comment:"小型室间隔缺损",disease:"室间隔缺损"});
CREATE (:symptom {characteristic:"胸骨左缘第3~4肋间可闻及Ⅳ~Ⅵ级全收缩期杂音伴震颤",comment:"小型室间隔缺损",disease:"室间隔缺损"});
CREATE (:symptom {characteristic:"P2心音可能有轻度分裂，无明显亢进",comment:"小型室间隔缺损",disease:"室间隔缺损"});
CREATE (:symptom {characteristic:"劳力性呼吸困难",comment:"中型室间隔缺损",disease:"室间隔缺损"});
CREATE (:symptom {characteristic:"胸骨左缘可闻及全收缩期杂音伴震颤",comment:"中型室间隔缺损",disease:"室间隔缺损"});
CREATE (:symptom {characteristic:"心尖区闻及舒张中期反流性杂音",comment:"中型室间隔缺损",disease:"室间隔缺损"});
CREATE (:symptom {characteristic:"P2心音可能轻度亢进",comment:"中型室间隔缺损",disease:"室间隔缺损"});
CREATE (:symptom {characteristic:"青紫",comment:"大型室间隔缺损",disease:"室间隔缺损"});
CREATE (:symptom {characteristic:"呼吸困难",comment:"大型室间隔缺损",disease:"室间隔缺损"});
CREATE (:symptom {characteristic:"负荷能力下降",comment:"大型室间隔缺损",disease:"室间隔缺损"});
CREATE (:symptom {characteristic:"胸骨左缘收缩期杂音常减弱至Ⅲ级左右",comment:"大型室间隔缺损",disease:"室间隔缺损"});
CREATE (:symptom {characteristic:"P2心音亢进",comment:"大型室间隔缺损",disease:"室间隔缺损"});
CREATE (:symptom {characteristic:"舒张期杂音",comment:"大型室间隔缺损",disease:"室间隔缺损"});
MATCH (d:disease {name:"室间隔缺损"}),(s:symptom {disease:"室间隔缺损"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.7.3 动脉导管未闭
CREATE (:symptom {characteristic:"无症状",comment:"分流量小",disease:"动脉导管未闭"});
CREATE (:symptom {characteristic:"乏力",comment:"中等分流量",disease:"动脉导管未闭"});
CREATE (:symptom {characteristic:"劳累后心悸",comment:"中等分流量",disease:"动脉导管未闭"});
CREATE (:symptom {characteristic:"气喘胸闷",comment:"中等分流量",disease:"动脉导管未闭"});
CREATE (:symptom {characteristic:"胸骨左缘第2肋间及左锁骨下方可闻及连续性机械样杂音，常伴有震颤，传导范围广泛",comment:"中等分流量",disease:"动脉导管未闭"});
CREATE (:symptom {characteristic:"伴有继发性严重肺动脉高压导致右向左分流",comment:"大量分流",disease:"动脉导管未闭"});
CREATE (:symptom {characteristic:"青紫",comment:"大量分流",disease:"动脉导管未闭"});
CREATE (:symptom {characteristic:"临床症状非常严重",comment:"大量分流",disease:"动脉导管未闭"});
MATCH (d:disease {name:"动脉导管未闭"}),(s:symptom {disease:"动脉导管未闭"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.7.4 卵圆孔未闭
CREATE (:symptom {characteristic:"无症状",comment:"无分流或分流量小",disease:"动脉导管未闭"});
CREATE (:symptom {characteristic:"不明原因脑卒中",comment:"明显分流",disease:"动脉导管未闭"});
CREATE (:symptom {characteristic:"偏头痛",comment:"明显分流",disease:"动脉导管未闭"});
CREATE (:symptom {characteristic:"晕厥",comment:"明显分流",disease:"动脉导管未闭"});
CREATE (:symptom {characteristic:"暂时性失语",comment:"明显分流",disease:"动脉导管未闭"});
CREATE (:symptom {characteristic:"睡眠性呼吸暂停",comment:"明显分流",disease:"动脉导管未闭"});
CREATE (:symptom {characteristic:"平卧性呼吸困难",comment:"明显分流",disease:"动脉导管未闭"});
CREATE (:symptom {characteristic:"斜卧呼吸直立性低氧血症",comment:"明显分流",disease:"动脉导管未闭"});
MATCH (d:disease {name:"卵圆孔未闭"}),(s:symptom {disease:"卵圆孔未闭"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.7.5 先天性肺动脉瓣狭窄
CREATE (:symptom {characteristic:"无症状",comment:"轻症肺动脉瓣狭窄",disease:"先天性肺动脉瓣狭窄"});
CREATE (:symptom {characteristic:"活动时呼吸困难",comment:"中度狭窄者",disease:"先天性肺动脉瓣狭窄"});
CREATE (:symptom {characteristic:"疲倦",comment:"中度狭窄",disease:"先天性肺动脉瓣狭窄"});
CREATE (:symptom {characteristic:"晕厥",comment:"严重狭窄",disease:"先天性肺动脉瓣狭窄"});
CREATE (:symptom {characteristic:"猝死",comment:"严重狭窄",disease:"先天性肺动脉瓣狭窄"});
CREATE (:symptom {characteristic:"胸骨左缘第2肋间有一响亮的收缩期喷射性杂音",disease:"先天性肺动脉瓣狭窄"});
CREATE (:symptom {characteristic:"肺动脉瓣区第二心音减弱",disease:"先天性肺动脉瓣狭窄"});
MATCH (d:disease {name:"先天性肺动脉瓣狭窄"}),(s:symptom {disease:"先天性肺动脉瓣狭窄"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.7.7 三尖瓣下移畸形
CREATE (:symptom {characteristic:"心悸",disease:"三尖瓣下移畸形"});
CREATE (:symptom {characteristic:"气喘",disease:"三尖瓣下移畸形"});
CREATE (:symptom {characteristic:"乏力",disease:"三尖瓣下移畸形"});
CREATE (:symptom {characteristic:"头晕",disease:"三尖瓣下移畸形"});
CREATE (:symptom {characteristic:"右心衰竭",disease:"三尖瓣下移畸形"});
CREATE (:symptom {characteristic:"青紫",disease:"三尖瓣下移畸形"});
CREATE (:symptom {characteristic:"阵发性房室折返性心动过速病史",disease:"三尖瓣下移畸形"});
CREATE (:symptom {characteristic:"心界明显增大",disease:"三尖瓣下移畸形"});
CREATE (:symptom {characteristic:"心前区搏动微弱",disease:"三尖瓣下移畸形"});
CREATE (:symptom {characteristic:"四音心律",disease:"三尖瓣下移畸形"});
CREATE (:symptom {characteristic:"胸骨左缘下端可闻及三尖瓣关闭不全的全收缩期杂音",disease:"三尖瓣下移畸形"});
CREATE (:symptom {characteristic:"颈动脉扩张性搏动",disease:"三尖瓣下移畸形"});
CREATE (:symptom {characteristic:"肝大伴扩张性搏动",disease:"三尖瓣下移畸形"});
MATCH (d:disease {name:"三尖瓣下移畸形"}),(s:symptom {disease:"三尖瓣下移畸形"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.7.8 先天性主动脉缩窄
CREATE (:symptom {characteristic:"劳力性呼吸困难",disease:"先天性主动脉缩窄"});
CREATE (:symptom {characteristic:"头痛",disease:"先天性主动脉缩窄"});
CREATE (:symptom {characteristic:"头晕",disease:"先天性主动脉缩窄"});
CREATE (:symptom {characteristic:"鼻出血",disease:"先天性主动脉缩窄"});
CREATE (:symptom {characteristic:"下肢无力",disease:"先天性主动脉缩窄"});
CREATE (:symptom {characteristic:"麻木",disease:"先天性主动脉缩窄"});
CREATE (:symptom {characteristic:"间歇性跛行",disease:"先天性主动脉缩窄"});
CREATE (:symptom {characteristic:"发凉",disease:"先天性主动脉缩窄"});
CREATE (:symptom {characteristic:"上肢血压有不同程度的增高",disease:"先天性主动脉缩窄"});
CREATE (:symptom {characteristic:"下肢血压下降",disease:"先天性主动脉缩窄"});
CREATE (:symptom {characteristic:"心尖搏动增强",disease:"先天性主动脉缩窄"});
CREATE (:symptom {characteristic:"心界常向左下扩大",disease:"先天性主动脉缩窄"});
CREATE (:symptom {characteristic:"沿胸骨左缘到中上腹可闻及收缩中后期喷射性杂音",disease:"先天性主动脉缩窄"});
CREATE (:symptom {characteristic:"动脉导管未闭",disease:"先天性主动脉缩窄"});
MATCH (d:disease {name:"先天性主动脉缩窄"}),(s:symptom {disease:"先天性主动脉缩窄"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.7.9 主动脉窦瘤
CREATE (:symptom {characteristic:"无临床症状或体征",comment:"瘤体未破裂",disease:"主动脉窦瘤"});
CREATE (:symptom {characteristic:"心悸",comment:"瘤体破裂",disease:"主动脉窦瘤"});
CREATE (:symptom {characteristic:"胸痛",comment:"瘤体破裂",disease:"主动脉窦瘤"});
CREATE (:symptom {characteristic:"呼吸困难",comment:"瘤体破裂",disease:"主动脉窦瘤"});
CREATE (:symptom {characteristic:"咳嗽",comment:"瘤体破裂",disease:"主动脉窦瘤"});
CREATE (:symptom {characteristic:"右心衰竭",comment:"瘤体破裂",disease:"主动脉窦瘤"});
CREATE (:symptom {characteristic:"胸骨左缘第3、4肋间闻及连续性响亮的机器样杂音，伴有震颤",comment:"瘤体破裂",disease:"主动脉窦瘤"});
MATCH (d:disease {name:"主动脉窦瘤"}),(s:symptom {disease:"主动脉窦瘤"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.7.10 冠状动脉瘘
CREATE (:symptom {characteristic:"窃血综合征",comment:"产生大量左向右分流",disease:"冠状动脉瘘"});
CREATE (:symptom {characteristic:"心绞痛",comment:"产生大量左向右分流",disease:"冠状动脉瘘"});
CREATE (:symptom {characteristic:"心力衰竭",comment:"产生大量左向右分流",disease:"冠状动脉瘘"});
CREATE (:symptom {characteristic:"连续性杂音伴局部震颤",comment:"产生大量左向右分流",disease:"冠状动脉瘘"});
CREATE (:symptom {characteristic:"胸骨左缘4、5肋间舒张期杂音",comment:"右心室瘘",disease:"冠状动脉瘘"});
CREATE (:symptom {characteristic:"胸骨右缘第2肋间收缩期杂音",comment:"瘘入右房",disease:"冠状动脉瘘"});
CREATE (:symptom {characteristic:"胸骨左缘第2肋间杂音",comment:"肺动脉或左房瘘",disease:"冠状动脉瘘"});
MATCH (d:disease {name:"冠状动脉瘘"}),(s:symptom {disease:"冠状动脉瘘"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.7.11 法洛四联症
CREATE (:symptom {characteristic:"进行性青紫",disease:"法洛四联症"});
CREATE (:symptom {characteristic:"呼吸困难",disease:"法洛四联症"});
CREATE (:symptom {characteristic:"易疲乏",disease:"法洛四联症"});
CREATE (:symptom {characteristic:"劳累后常取蹲踞位休息",disease:"法洛四联症"});
CREATE (:symptom {characteristic:"严重缺氧时可引起晕厥",disease:"法洛四联症"});
CREATE (:symptom {characteristic:"长期右心压力增高",disease:"法洛四联症"});
CREATE (:symptom {characteristic:"缺氧可发生心功能不全",disease:"法洛四联症"});
CREATE (:symptom {characteristic:"杵状指（趾）",disease:"法洛四联症"});
CREATE (:symptom {characteristic:"心脏听诊肺动脉瓣第二心音减弱以至消失",disease:"法洛四联症"});
CREATE (:symptom {characteristic:"胸骨左缘常可闻及收缩期喷射性杂音",disease:"法洛四联症"});
CREATE (:symptom {characteristic:"胸骨左缘常可闻及收缩期喷射性杂音",disease:"法洛四联症"});
MATCH (d:disease {name:"法洛四联症"}),(s:symptom {disease:"法洛四联症"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//5.7.12 艾森门格综合征
CREATE (:symptom {characteristic:"轻至中度青紫，于劳累后加重",disease:"艾森门格综合征"});
CREATE (:symptom {characteristic:"杵状指（趾）",disease:"艾森门格综合征"});
CREATE (:symptom {characteristic:"气急",disease:"艾森门格综合征"});
CREATE (:symptom {characteristic:"乏力",disease:"艾森门格综合征"});
CREATE (:symptom {characteristic:"头晕",disease:"艾森门格综合征"});
CREATE (:symptom {characteristic:"右心衰竭",disease:"艾森门格综合征"});
CREATE (:symptom {characteristic:"心浊音界明显增大",disease:"艾森门格综合征"});
CREATE (:symptom {characteristic:"心前区胸骨左缘3~4肋间有明显搏动",disease:"艾森门格综合征"});
CREATE (:symptom {characteristic:"原有的左向右分流的杂音减弱或消失",disease:"艾森门格综合征"});
CREATE (:symptom {characteristic:"肺动脉瓣第二心音亢进、分裂",disease:"艾森门格综合征"});
CREATE (:symptom {characteristic:"舒张期杂音",disease:"艾森门格综合征"});
CREATE (:symptom {characteristic:"胸骨下段偏左部位可闻及收缩期反流性杂音",disease:"艾森门格综合征"});
MATCH (d:disease {name:"艾森门格综合征"}),(s:symptom {disease:"艾森门格综合征"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//六、辅助检查
//6.7.1 房间隔缺损
CREATE (:examination {name:"心电图",information:"电轴右偏/右室肥大/右束支传导阻滞",disease:"房间隔缺损"});
CREATE (:examination {name:"X线检查",information:"右房、右室增大/肺动脉段突出/肺血管影增加",disease:"房间隔缺损"});
CREATE (:examination {name:"超声心动图",information:"确诊房间隔缺损",disease:"房间隔缺损"});
CREATE (:examination {name:"心导管检查",information:"心房水平的分流量/肺循环阻力",disease:"房间隔缺损"});
MATCH (d:disease {name:"房间隔缺损"}),(rt:examination {disease:"房间隔缺损"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//6.7.2 室间隔缺损
CREATE (:examination {name:"心电图",information:"心电图正常/电轴左偏/左室或双室肥大",disease:"室间隔缺损"});
CREATE (:examination {name:"X线检查",information:"肺血增加，心影略向左增大/肺动脉及其主要分支明显扩张，但在肺野外1/3血管影突然减少，心影大小不一",disease:"室间隔缺损"});
CREATE (:examination {name:"超声心动图",information:"室间隔缺损的定位、大小以及分流情况",disease:"室间隔缺损"});
CREATE (:examination {name:"心导管检查",information:"心房水平的分流量/肺循环阻力",disease:"室间隔缺损"});
MATCH (d:disease {name:"室间隔缺损"}),(rt:examination {disease:"室间隔缺损"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//6.7.3 动脉导管未闭
CREATE (:examination {name:"心电图",information:"左室大、左房大/右房大、右室肥大",disease:"动脉导管未闭"});
CREATE (:examination {name:"X线检查",information:"肺门舞蹈征",disease:"动脉导管未闭"});
CREATE (:examination {name:"超声心动图",information:"未闭动脉导管",disease:"动脉导管未闭"});
CREATE (:examination {name:"心导管检查",information:"肺血管阻力分流情况/除外其他复杂畸形",disease:"动脉导管未闭"});
MATCH (d:disease {name:"动脉导管未闭"}),(rt:examination {disease:"动脉导管未闭"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//6.7.4 卵圆孔未闭
CREATE (:examination {name:"心电图",information:"无明显异常",disease:"卵圆孔未闭"});
CREATE (:examination {name:"X线检查",information:"无明显异常",disease:"卵圆孔未闭"});
CREATE (:examination {name:"超声心动图",information:"左向右分流/右向左分流",disease:"卵圆孔未闭"});
CREATE (:examination {name:"心导管检查",information:"证实卵圆孔未闭的存在",disease:"卵圆孔未闭"});
MATCH (d:disease {name:"卵圆孔未闭"}),(rt:examination {disease:"卵圆孔未闭"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//6.7.5 先天性肺动脉瓣狭窄
CREATE (:examination {name:"心电图",information:"电轴右偏/右室肥大/右房增大/右束支传导阻滞",disease:"先天性肺动脉瓣狭窄"});
CREATE (:examination {name:"X线检查",information:"肺动脉段突出、肺血管影细小、肺野异常清晰/心尖左移上翘，心影明显增大",disease:"先天性肺动脉瓣狭窄"});
CREATE (:examination {name:"超声心动图",information:"肺动脉瓣增厚/定量测定瓣口面积/跨瓣或狭窄上下压力阶差",disease:"先天性肺动脉瓣狭窄"});
CREATE (:examination {name:"右心导管检查",information:"确定狭窄的部位及类型/测定右心室和肺动脉的压力",disease:"先天性肺动脉瓣狭窄"});
CREATE (:examination {name:"右心室造影",information:"确定狭窄的部位及类型/测定右心室和肺动脉的压力",disease:"先天性肺动脉瓣狭窄"});
MATCH (d:disease {name:"先天性肺动脉瓣狭窄"}),(rt:examination {disease:"先天性肺动脉瓣狭窄"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//6.7.6 二叶主动脉瓣
CREATE (:examination {name:"心电图",indication:"伴发主动脉瓣狭窄后继发左心室肥厚，或伴发主动脉瓣关闭不全继发左心室扩大",disease:"二叶主动脉瓣"});
CREATE (:examination {name:"X线检查",indication:"伴发主动脉瓣狭窄后继发左心室肥厚，或伴发主动脉瓣关闭不全继发左心室扩大",disease:"二叶主动脉瓣"});
CREATE (:examination {name:"超声心动图",information:"诊断二叶主动脉瓣",disease:"二叶主动脉瓣"});
CREATE (:examination {name:"心导管检查",indication:"拟行介入或手术治疗",disease:"二叶主动脉瓣"});
MATCH (d:disease {name:"二叶主动脉瓣"}),(rt:examination {disease:"二叶主动脉瓣"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

//6.7.7 三尖瓣下移畸形
CREATE (:examination {name:"心电图",information:"一度房室传导阻滞/P波高尖右束支传导阻滞/预激综合征（右侧房室旁路图形）",disease:"三尖瓣下移畸形"});
CREATE (:examination {name:"X线检查",information:"球形巨大心影",disease:"三尖瓣下移畸形"});
CREATE (:examination {name:"超声心动图",information:"下移的瓣膜、巨大右房、房化右室及相对甚小的功能性右室、缺损的房间隔",disease:"三尖瓣下移畸形"});
CREATE (:examination {name:"心导管检查",indication:"拟行手术治疗者",disease:"三尖瓣下移畸形"});
MATCH (d:disease {name:"三尖瓣下移畸形"}),(rt:examination {disease:"三尖瓣下移畸形"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//6.7.8 先天性主动脉缩窄
CREATE (:examination {name:"心电图",information:"左室肥大/心肌劳损",disease:"先天性主动脉缩窄"});
CREATE (:examination {name:"X线检查",information:"左室增大/升主动脉增宽/缩窄上下血管扩张而使主动脉弓呈3字征",disease:"先天性主动脉缩窄"});
CREATE (:examination {name:"超声心动图",information:"测定缩窄上下压力阶差",disease:"先天性主动脉缩窄"});
CREATE (:examination {name:"磁共振检查",information:"整个主动脉的解剖构形及侧支循环情况",disease:"先天性主动脉缩窄"});
CREATE (:examination {name:"主动脉造影术",information:"压力测定，显示缩窄的部位、长度以及侧支循环的情况，是否存在动脉导管未闭",disease:"先天性主动脉缩窄"});
CREATE (:examination {name:"心导管检查",information:"压力测定，显示缩窄的部位、长度以及侧支循环的情况，是否存在动脉导管未闭",disease:"先天性主动脉缩窄"});
MATCH (d:disease {name:"先天性主动脉缩窄"}),(rt:examination {disease:"先天性主动脉缩窄"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//6.7.9 主动脉窦瘤
CREATE (:examination {name:"心电图",information:"左室增大/左、右室增大",disease:"主动脉窦瘤"});
CREATE (:examination {name:"X线检查",information:"肺淤血/左、右室增大",disease:"主动脉窦瘤"});
CREATE (:examination {name:"超声心动图",information:"窦体增大有囊状物膨出/瘤体破裂后裂口",disease:"主动脉窦瘤"});
CREATE (:examination {name:"超声多普勒",information:"经裂口的血液分流",disease:"主动脉窦瘤"});
CREATE (:examination {name:"磁共振检查",information:"窦瘤部位大小及与周围心血管腔室的关系",disease:"主动脉窦瘤"});
CREATE (:examination {name:"心导管检查",information:"破入的部位及分流量",disease:"主动脉窦瘤"});
MATCH (d:disease {name:"主动脉窦瘤"}),(rt:examination {disease:"主动脉窦瘤"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//6.7.10 冠状动脉瘘
CREATE (:examination {name:"心电图",information:"左室高电压/左室肥厚/双室肥厚/右心室肥大/心房颤动",disease:"冠状动脉瘘"});
CREATE (:examination {name:"X线检查",information:"肺血/心影轻度增大",disease:"冠状动脉瘘"});
CREATE (:examination {name:"超声心动图",information:"扩张的冠状动脉/冠状动脉的走向",disease:"冠状动脉瘘"});
CREATE (:examination {name:"彩色多普勒",information:"瘘口的所在部位",disease:"冠状动脉瘘"});
CREATE (:examination {name:"磁共振检查",information:"瘘的起源、走行、终点等形态学特点/瘘管内血流量、心功能以及心肌厚度",disease:"冠状动脉瘘"});
CREATE (:examination {name:"心导管检查",information:"显示CAF的起源、走行、分布、瘘口位置及大小、瘤样扩张及“窃血”现象",disease:"冠状动脉瘘"});
MATCH (d:disease {name:"冠状动脉瘘"}),(rt:examination {disease:"冠状动脉瘘"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//6.7.11 法洛四联症
CREATE (:laboratory_test {name:"血常规检查",information:"红细胞、血红蛋白及血细胞比容均显著增高",disease:"法洛四联症"});
MATCH (d:disease {name:"法洛四联症"}),(rt:laboratory_test {disease:"法洛四联症"}) CREATE (d)-[:disease_laboratory_test {reference:"内科学第九版"}]->(rt);
CREATE (:examination {name:"心电图",information:"电轴右偏/右心室肥厚",disease:"法洛四联症"});
CREATE (:examination {name:"X线检查",information:"右心室肥厚/肺动脉段凹陷/肺血管纹理减少",disease:"法洛四联症"});
CREATE (:examination {name:"超声心动图",information:"右心室肥厚室间隔缺损及主脉骑跨/右心室流出道狭窄及肺动脉瓣的情况",disease:"法洛四联症"});
CREATE (:examination {name:"磁共振检查",information:"解剖结构异常",disease:"法洛四联症"});
CREATE (:examination {name:"心导管检查",indication:"拟行手术治疗",disease:"法洛四联症"});
MATCH (d:disease {name:"法洛四联症"}),(rt:examination {disease:"法洛四联症"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//6.7.12 艾森门格综合征
CREATE (:examination {name:"心电图",information:"右心室肥大劳损/右心房肥大",disease:"艾森门格综合征"});
CREATE (:examination {name:"X线检查",information:"右心室、右心房增大/肺动脉干及左、右肺动脉均扩大/肺野轻度淤血或不淤血/血管纹理变细",disease:"艾森门格综合征"});
CREATE (:examination {name:"超声心动图",information:"原有畸形/肺动脉扩张及相对性肺动脉瓣及三尖瓣关闭不全",disease:"艾森门格综合征"});
CREATE (:examination {name:"心导管检查",information:"确定双向分流或右向左分流，肺动脉压力、肺血管阻力",disease:"艾森门格综合征"});
CREATE (:examination {name:"血管扩张试验",information:"血管反应性",disease:"艾森门格综合征"});
MATCH (d:disease {name:"艾森门格综合征"}),(rt:examination {disease:"艾森门格综合征"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

//8.7.11 法洛四联症
CREATE (d:complication {name:"脑血管意外",disease:"法洛四联症"});
CREATE (d:complication {name:"感染性心内膜炎",disease:"法洛四联症"});
CREATE (d:complication {name:"肺部感染",disease:"法洛四联症"});
MATCH (d1:disease {name:"法洛四联症"}),(d2:complication {disease:"法洛四联症"}) CREATE (d1)-[:disease_complication {reference:"内科学第九版"}]->(d2);

//九、鉴别诊断
//9.7.1 房间隔缺损
CREATE (:differential_diagnosis {name:"肺静脉畸形引流",disease:"房间隔缺损"});
CREATE (:differential_diagnosis {name:"肺动脉瓣狭窄",disease:"房间隔缺损"});
CREATE (:differential_diagnosis {name:"小型室间隔缺损",disease:"房间隔缺损"});
MATCH (d:disease {name:"房间隔缺损"}),(dd:differential_diagnosis {disease:"房间隔缺损"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.7.2 室间隔缺损
CREATE (:differential_diagnosis {name:"肺动脉瓣狭窄",disease:"室间隔缺损"});
CREATE (:differential_diagnosis {name:"肥厚型心肌病",disease:"室间隔缺损"});
CREATE (:differential_diagnosis {name:"原发性肺动脉高压",symptom:"合并肺动脉高压",disease:"室间隔缺损"});
CREATE (:differential_diagnosis {name:"艾森门格综合征",symptom:"合并肺动脉高压",disease:"室间隔缺损"});
MATCH (d:disease {name:"室间隔缺损"}),(dd:differential_diagnosis {disease:"室间隔缺损"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.7.3 动脉导管未闭
CREATE (:differential_diagnosis {name:"主动脉瓣关闭不全合并室间隔缺损",symptom:"双期或连续性杂音",disease:"动脉导管未闭"});
CREATE (:differential_diagnosis {name:"主动脉窦瘤（Valsalva窦瘤）破裂",symptom:"双期或连续性杂音",disease:"动脉导管未闭"});
MATCH (d:disease {name:"动脉导管未闭"}),(dd:differential_diagnosis {disease:"动脉导管未闭"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);

//9.7.4 卵圆孔未闭
CREATE (:differential_diagnosis {name:"小房间隔缺损",disease:"卵圆孔未闭"});
MATCH (d:disease {name:"卵圆孔未闭"}),(dd:differential_diagnosis {disease:"卵圆孔未闭"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.7.5 先天性肺动脉瓣狭窄
CREATE (:differential_diagnosis {name:"原发性肺动脉扩张",disease:"先天性肺动脉瓣狭窄"});
CREATE (:differential_diagnosis {name:"房、室间隔缺损",disease:"先天性肺动脉瓣狭窄"});
CREATE (:differential_diagnosis {name:"艾森门格综合征",disease:"先天性肺动脉瓣狭窄"});
CREATE (:differential_diagnosis {name:"Ebstein畸形",disease:"先天性肺动脉瓣狭窄"});
MATCH (d:disease {name:"先天性肺动脉瓣狭窄"}),(dd:differential_diagnosis {disease:"先天性肺动脉瓣狭窄"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.7.6 二叶主动脉瓣
CREATE (:differential_diagnosis {name:"风湿性瓣膜病",disease:"二叶主动脉瓣"});
CREATE (:differential_diagnosis {name:"梗阻性肥厚型心肌病",disease:"二叶主动脉瓣"});
MATCH (d:disease {name:"二叶主动脉瓣"}),(dd:differential_diagnosis {disease:"二叶主动脉瓣"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.7.7 三尖瓣下移畸形
CREATE (:differential_diagnosis {name:"青紫型先天性心脏病",symptom:"青紫",disease:"三尖瓣下移畸形"});
CREATE (:differential_diagnosis {name:"三尖瓣闭锁",symptom:"青紫",disease:"三尖瓣下移畸形"});
CREATE (:differential_diagnosis {name:"扩张型心肌病",symptom:"无青紫",disease:"三尖瓣下移畸形"});
CREATE (:differential_diagnosis {name:"心包积液",symptom:"无青紫",disease:"三尖瓣下移畸形"});
MATCH (d:disease {name:"三尖瓣下移畸形"}),(dd:differential_diagnosis {disease:"三尖瓣下移畸形"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.7.8 先天性主动脉缩窄
CREATE (:differential_diagnosis {name:"主动脉瓣狭窄",disease:"先天性主动脉缩窄"});
CREATE (:differential_diagnosis {name:"动脉导管未闭",disease:"先天性主动脉缩窄"});
CREATE (:differential_diagnosis {name:"多发性大动脉炎",disease:"先天性主动脉缩窄"});
MATCH (d:disease {name:"先天性主动脉缩窄"}),(dd:differential_diagnosis {disease:"先天性主动脉缩窄"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.7.9 主动脉窦瘤
CREATE (:differential_diagnosis {name:"急性心肌梗死",disease:"主动脉窦瘤"});
CREATE (:differential_diagnosis {name:"动脉导管未闭",disease:"主动脉窦瘤"});
CREATE (:differential_diagnosis {name:"室间隔缺损伴有主动脉瓣关闭不全",disease:"主动脉窦瘤"});
MATCH (d:disease {name:"主动脉窦瘤"}),(dd:differential_diagnosis {disease:"主动脉窦瘤"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.7.10 冠状动脉瘘
CREATE (:differential_diagnosis {name:"动脉导管未闭",disease:"冠状动脉瘘"});
CREATE (:differential_diagnosis {name:"主动脉窦瘤",disease:"冠状动脉瘘"});
CREATE (:differential_diagnosis {name:"主肺间隔缺损",disease:"冠状动脉瘘"});
CREATE (:differential_diagnosis {name:"室间隔缺损合并主动脉瓣关闭不全",disease:"冠状动脉瘘"});
MATCH (d:disease {name:"冠状动脉瘘"}),(dd:differential_diagnosis {disease:"冠状动脉瘘"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.7.12 艾森门格综合征
CREATE (:differential_diagnosis {name:"先天性青紫型心脏畸形",disease:"艾森门格综合征"});
MATCH (d:disease {name:"艾森门格综合征"}),(dd:differential_diagnosis {disease:"艾森门格综合征"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.7.11 法洛四联症
CREATE (:differential_diagnosis {name:"大动脉错位合并肺动脉瓣狭窄",disease:"法洛四联症"});
CREATE (:differential_diagnosis {name:"右心室双出口",disease:"法洛四联症"});
CREATE (:differential_diagnosis {name:"Eisenmenger综合征",disease:"法洛四联症"});
MATCH (d:disease {name:"法洛四联症"}),(dd:differential_diagnosis {disease:"法洛四联症"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);

//10.7.4 卵圆孔未闭
CREATE (:drug {name:"抗凝剂",disease:"卵圆孔未闭",indication:"PFO合并不明原因脑卒中、一过性脑缺血发作或偏头痛"});
CREATE (:drug {name:"抗血小板制剂",disease:"卵圆孔未闭",indication:"PFO合并不明原因脑卒中、一过性脑缺血发作或偏头痛"});
MATCH (ds:disease {name:"卵圆孔未闭"}),(dg:drug {disease:"卵圆孔未闭"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);


//11.7.1 房间隔缺损
CREATE (:treatment {name:"介入治疗",disease:"房间隔缺损"});
CREATE (:treatment {name:"手术治疗",disease:"房间隔缺损"});
MATCH (d:disease {name:"房间隔缺损"}),(t:treatment {disease:"房间隔缺损"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.7.2 室间隔缺损
CREATE (:treatment {name:"介入治疗",disease:"室间隔缺损"});
CREATE (:treatment {name:"室间隔缺损修补术",contraindication:"伴明显肺动脉压增高，肺血管阻力>7Wood单位者",disease:"室间隔缺损"});
MATCH (d:disease {name:"室间隔缺损"}),(t:treatment {disease:"室间隔缺损"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.7.3 动脉导管未闭
CREATE (:treatment {name:"介入治疗",disease:"动脉导管未闭"});
CREATE (:treatment {name:"结扎术",disease:"动脉导管未闭"});
CREATE (:treatment {name:"结扎切断缝合术",disease:"动脉导管未闭"});
MATCH (d:disease {name:"动脉导管未闭"}),(t:treatment {disease:"动脉导管未闭"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.7.4 卵圆孔未闭
CREATE (:treatment {name:"介入治疗",disease:"卵圆孔未闭"});
CREATE (:treatment {name:"经导管封堵PFO",indication:"PFO合并不明原因脑卒中、一过性脑缺血发作或偏头痛",disease:"卵圆孔未闭"});
CREATE (:treatment {name:"外科手术关闭PFO",indication:"PFO合并不明原因脑卒中、一过性脑缺血发作或偏头痛",disease:"卵圆孔未闭"});
MATCH (d:disease {name:"卵圆孔未闭"}),(t:treatment {disease:"卵圆孔未闭"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.7.5 先天性肺动脉瓣狭窄
CREATE (:treatment {name:"随访观察",indication:"症状轻微者",disease:"三尖瓣下移畸形"});
CREATE (:treatment {name:"手术治疗",indication:"球囊扩张不成功或不宜行球囊扩张者，如狭窄上下压力阶差>40mm",disease:"先天性肺动脉瓣狭窄"});
MATCH (d:disease {name:"先天性肺动脉瓣狭窄"}),(t:treatment {disease:"先天性肺动脉瓣狭窄"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.7.6 二叶主动脉瓣
CREATE (:treatment {name:"介入治疗",disease:"二叶主动脉瓣"});
CREATE (:treatment {name:"换瓣手术治疗",indication:"瓣膜关闭不全，心脏进行性增大",disease:"二叶主动脉瓣"});
CREATE (:treatment {name:"瓣膜成形或换瓣手术",indication:"有瓣膜狭窄且有相应症状，跨瓣压力阶差≥50mmHg",disease:"二叶主动脉瓣"});
MATCH (d:disease {name:"二叶主动脉瓣"}),(t:treatment {disease:"二叶主动脉瓣"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.7.7 三尖瓣下移畸形
CREATE (:treatment {name:"随访观察",indication:"症状轻微者",disease:"三尖瓣下移畸形"});
CREATE (:treatment {name:"手术治疗",indication:"心脏明显增大，症状较重",disease:"三尖瓣下移畸形"});
MATCH (d:disease {name:"三尖瓣下移畸形"}),(t:treatment {disease:"三尖瓣下移畸形"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.7.8 先天性主动脉缩窄
CREATE (:treatment {name:"介入治疗",disease:"先天性主动脉缩窄"});
CREATE (:treatment {name:"手术治疗",disease:"先天性主动脉缩窄"});
MATCH (d:disease {name:"先天性主动脉缩窄"}),(t:treatment {disease:"先天性主动脉缩窄"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.7.9 主动脉窦瘤
CREATE (:treatment {name:"介入治疗",disease:"主动脉窦瘤"});
CREATE (:treatment {name:"开胸外科修补",disease:"主动脉窦瘤"});
MATCH (d:disease {name:"主动脉窦瘤"}),(t:treatment {disease:"主动脉窦瘤"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.7.10 冠状动脉瘘
CREATE (:treatment {name:"介入治疗",disease:"冠状动脉瘘"});
CREATE (:treatment {name:"瘘管结扎",disease:"冠状动脉瘘"});
CREATE (:treatment {name:"经冠状动脉修补",disease:"冠状动脉瘘"});
CREATE (:treatment {name:"经心腔修补瘘口",disease:"冠状动脉瘘"});
MATCH (d:disease {name:"冠状动脉瘘"}),(t:treatment {disease:"冠状动脉瘘"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.7.11 法洛四联症
CREATE (:treatment {name:"手术纠正畸形",disease:"法洛四联症"});
CREATE (:treatment {name:"介入治疗",disease:"法洛四联症"});
MATCH (d:disease {name:"法洛四联症"}),(t:treatment {disease:"法洛四联症"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.7.12 艾森门格综合征
CREATE (:treatment {name:"心肺联合移植",disease:"艾森门格综合征"});
CREATE (:treatment {name:"肺移植的同时修补心脏缺损",disease:"艾森门格综合征"});
MATCH (d:disease {name:"艾森门格综合征"}),(t:treatment {disease:"艾森门格综合征"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
