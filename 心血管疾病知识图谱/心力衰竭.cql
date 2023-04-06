MATCH (n) detach delete n;

//1.2 心力衰竭
CREATE (:disease {name:"心力衰竭",abbreviation:"心衰",definition:"是各种心脏结构或功能性疾病导致心室充盈和（或）射血功能受损，心排血量不能满足机体组织代谢需要，以肺循环和（或）体循环淤血，器官、组织血液灌注不足为临床表现的一组综合征"});
//1.2.1 急性心力衰竭
CREATE (:disease {name:"急性心力衰竭",english_name:"AHF",definition:"心力衰竭急性发作和（或）加重的一种临床综合征"});
MATCH (dc:disease {name:"心力衰竭"}),(d:disease {name:"急性心力衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.1.1 急性左心衰竭
CREATE (:disease {name:"急性左心衰竭"});
MATCH (dc:disease {name:"急性心力衰竭"}),(d:disease {name:"急性左心衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.1.2 急性右心衰竭
CREATE (:disease {name:"急性右心衰竭"});
MATCH (dc:disease {name:"急性心力衰竭"}),(d:disease {name:"急性右心衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.2 慢性心力衰竭
CREATE (:disease {name:"慢性心力衰竭",english_name:"CHF"});
MATCH (dc:disease {name:"心力衰竭"}),(d:disease {name:"慢性心力衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.2.1 （慢性）左心衰竭
CREATE (:disease {name:"左心衰竭"});
MATCH (dc:disease {name:"慢性心力衰竭"}),(d:disease {name:"左心衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.2.2 （慢性）右心衰竭
CREATE (:disease {name:"右心衰竭"});
MATCH (dc:disease {name:"慢性心力衰竭"}),(d:disease {name:"右心衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.2.3 （慢性）全心衰竭
CREATE (:disease {name:"全心衰竭"});
MATCH (dc:disease {name:"慢性心力衰竭"}),(d:disease {name:"全心衰竭"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.3 射血分数降低性心衰
CREATE (:disease {name:"射血分数降低性心衰",enlish_name:"HFrEF",synonym:"收缩性心衰",definition:"LVEF<40%的心衰"});
MATCH (dc:disease {name:"心力衰竭"}),(d:disease {name:"射血分数降低性心衰"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.4 射血分数保留性心衰
CREATE (:disease {name:"射血分数保留性心衰",enlish_name:"HFpEF",synonym:"舒张性心衰",definition:"LVEF≥50%的心衰"});
MATCH (dc:disease {name:"心力衰竭"}),(d:disease {name:"射血分数保留性心衰"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.2.5 中间范围射血分数心衰
CREATE (:disease {name:"中间范围射血分数心衰",enlish_name:"HFmrEF",definition:"40%≤LVEF<50%的心衰"});
MATCH (dc:disease {name:"心力衰竭"}),(d:disease {name:"中间范围射血分数心衰"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);


//2.2  心力衰竭
CREATE (:risk_factor {name:"年齡>70",disease:"心力衰竭"});
CREATE (:risk_factor {name:"高血压",disease:"心力衰竭"});
CREATE (:risk_factor {name:"冠心病",disease:"心力衰竭"});
CREATE (:risk_factor {name:"代谢综合征",disease:"心力衰竭"});
CREATE (:risk_factor {name:"糖尿病",disease:"心力衰竭"});
CREATE (:risk_factor {name:"应用心脏毒性药物史",disease:"心力衰竭"});
CREATE (:risk_factor {name:"酗酒史",disease:"心力衰竭"});
CREATE (:risk_factor {name:"风湿热史",disease:"心力衰竭"});
CREATE (:risk_factor {name:"既往心肌梗死史",disease:"心力衰竭"});
MATCH (d:disease {name:"心力衰竭"}),(r:risk_factor {disease:"心力衰竭"}) CREATE (d)-[:disease_risk_factor {reference:"内科学第九版"}]->(r);


//三、病因
//3.2 心力衰竭
CREATE (:cause {name:"心肌梗死",disease:"心力衰竭"});
CREATE (:cause {name:"慢性心肌缺血",disease:"心力衰竭"});
CREATE (:cause {name:"心肌炎",disease:"心力衰竭"});
CREATE (:cause {name:"扩张型心肌病",disease:"心力衰竭"});
CREATE (:cause {name:"家族性扩张型心肌病",disease:"心力衰竭"});
CREATE (:cause {name:"肥厚型心肌病",disease:"心力衰竭"});
CREATE (:cause {name:"右室心肌病",disease:"心力衰竭"});
CREATE (:cause {name:"心肌致密化不全",disease:"心力衰竭"});
CREATE (:cause {name:"线粒体肌病",disease:"心力衰竭"});
CREATE (:cause {name:"糖尿病",disease:"心力衰竭"});
CREATE (:cause {name:"甲状腺疾病",disease:"心力衰竭"});
CREATE (:cause {name:"心肌淀粉样变性",disease:"心力衰竭"});
CREATE (:cause {name:"结缔组织病",disease:"心力衰竭"});
CREATE (:cause {name:"心脏毒性药物",disease:"心力衰竭"});
CREATE (:cause {name:"高血压",disease:"心力衰竭"});
CREATE (:cause {name:"主动脉瓣狭窄",disease:"心力衰竭"});
CREATE (:cause {name:"肺动脉高压",disease:"心力衰竭"});
CREATE (:cause {name:"肺动脉瓣狭窄",disease:"心力衰竭"});
CREATE (:cause {name:"心脏瓣膜关闭不全",disease:"心力衰竭"});
CREATE (:cause {name:"先天性心血管病",disease:"心力衰竭"});
CREATE (:cause {name:"慢性贫血",disease:"心力衰竭"});
CREATE (:cause {name:"甲状腺功能亢进症",disease:"心力衰竭"});
CREATE (:cause {name:"围生期心肌病",disease:"心力衰竭"});
CREATE (:cause {name:"体循环动静脉瘘",disease:"心力衰竭"});
CREATE (:cause {name:"二尖瓣狭窄",disease:"心力衰竭"});
CREATE (:cause {name:"心脏压塞",disease:"心力衰竭"});
CREATE (:cause {name:"限制性心肌病",disease:"心力衰竭"});
CREATE (:cause {name:"窄缩性心包炎",disease:"心力衰竭"});
MATCH (d:disease {name:"心力衰竭"}),(c:cause {disease:"心力衰竭"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.2.1.1 急性左心衰竭
CREATE (:cause {name:"慢性心衰急性失代偿",disease:"急性左心衰竭"});
CREATE (:cause {name:"急性冠脉综合征",disease:"急性左心衰竭"});
CREATE (:cause {name:"高血压急症",disease:"急性左心衰竭"});
CREATE (:cause {name:"急性心瓣膜功能障碍",disease:"急性左心衰竭"});
CREATE (:cause {name:"急性重症心肌炎",disease:"急性左心衰竭"});
CREATE (:cause {name:"严重心律失常",disease:"急性左心衰竭"});
MATCH (d:disease {name:"急性左心衰竭"}),(c:cause {disease:"急性左心衰竭"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.2.1.1 急性右心衰竭
CREATE (:cause {name:"右心室梗死",disease:"急性右心衰竭"});
CREATE (:cause {name:"急性大面积肺栓塞",disease:"急性右心衰竭"});
CREATE (:cause {name:"右心瓣膜病",disease:"急性右心衰竭"});
MATCH (d:disease {name:"急性右心衰竭"}),(c:cause {disease:"急性右心衰竭"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);
//3.2.2 慢性心力衰竭
CREATE (:cause {name:"冠心病",disease:"慢性心力衰竭",comment:"主要病因"});
CREATE (:cause {name:"高血压",disease:"慢性心力衰竭",comment:"主要病因"});
CREATE (:cause {name:"风湿性心脏病",disease:"慢性心力衰竭"});
CREATE (:cause {name:"瓣膜性心脏病",disease:"慢性心力衰竭"});
CREATE (:cause {name:"慢性肺心病",disease:"慢性心力衰竭"});
CREATE (:cause {name:"高原性心脏病",disease:"慢性心力衰竭"});
MATCH (d:disease {name:"慢性心力衰竭"}),(c:cause {disease:"慢性心力衰竭"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//4.2 心力衰竭
CREATE (:inducement {name:"呼吸道感染",comment:"常见诱因",disease:"心力衰竭"});
CREATE (:inducement {name:"感染性心内膜炎",disease:"心力衰竭"});
CREATE (:inducement {name:"心房颤动",disease:"心力衰竭"});
CREATE (:inducement {name:"快速型心律失常",disease:"心力衰竭"});
CREATE (:inducement {name:"严重缓慢型心律失常",disease:"心力衰竭"});
CREATE (:inducement {name:"钠盐摄入过多",disease:"心力衰竭"});
CREATE (:inducement {name:"静脉输液过多过快",disease:"心力衰竭"});
CREATE (:inducement {name:"妊娠后期",disease:"心力衰竭"});
CREATE (:inducement {name:"分娩过程",disease:"心力衰竭"});
CREATE (:inducement {name:"暴怒",disease:"心力衰竭"});
CREATE (:inducement {name:"不恰当使用利尿药物",disease:"心力衰竭"});
CREATE (:inducement {name:"不恰当使用降血压药",disease:"心力衰竭"});
CREATE (:inducement {name:"冠心病发生心肌梗死",disease:"心力衰竭"});
CREATE (:inducement {name:"风湿性心瓣膜病出现风湿活动",disease:"心力衰竭"});
CREATE (:inducement {name:"原有心脏病合并甲状腺功能亢进",disease:"心力衰竭"});
CREATE (:inducement {name:"原有心脏病合并贫血",disease:"心力衰竭"});
MATCH (d:disease {name:"心力衰竭"}),(c:inducement {disease:"心力衰竭"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);


//5.2.1 急性心力衰竭
CREATE (:symptom {characteristic:"突发严重呼吸困难",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"呼吸频率30~50次/分",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"强迫坐位",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"面色灰白",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"发绀",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"大汗",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"烦躁",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"频繁咳嗽",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"咳粉红色泡沫痰",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"神志模糊",stage:"极重症",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"一过性血压升高",stage:"发病伊始",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"血压下降至休克",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"神志模糊",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"两肺布满湿性啰音和哮鸣音",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"心尖部第一心音减弱、率快",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"舒张早期第三心音奔马律",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"肺动脉瓣第二心音亢进",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"心源性休克",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"持续性低血压",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"收缩压降至90mmHg以下持续30分钟以上",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"PCWP≥18mmHg",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"CI≤2.2L/(min·m2)",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"组织低灌注状态",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"皮肤湿冷",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"苍白",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"发绀",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"尿量显著减少",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"意识障碍",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"代谢性酸中毒",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"上肺静脉充盈",examination:"胸部X线",stage:"早期间质水肿",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"肺门血管影模糊",stage:"早期间质水肿",examination:"胸部X线",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"小叶间隔增厚",stage:"早期间质水肿",examination:"胸部X线",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"蝶形肺门",stage:"肺水肿",examination:"胸部X线",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"弥漫满肺的大片阴影",stage:"严重肺水肿",examination:"胸部X线",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"肺毛细血管楔压随病情加重而增高",stage:"重症",examination:"漂浮导管行床旁血流动力学监测",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"心脏指数随病情加重而降低",stage:"重症",examination:"漂浮导管行床旁血流动力学监测",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"上肺静脉充盈",comment:"早期间质水肿",examination:"X线胸片",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"肺门血管影模糊",comment:"早期间质水肿",examination:"X线胸片",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"小叶间隔增厚",comment:"早期间质水肿",examination:"X线胸片",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"蝶形肺门",comment:"肺水肿",examination:"X线胸片",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"弥漫满肺的大片阴影",comment:"严重肺水肿",examination:"X线胸片",disease:"急性心力衰竭"});
CREATE (:symptom {characteristic:"心电图无特异性表现",examination:"心电图",disease:"急性心力衰竭"});
MATCH (d:disease {name:"急性心力衰竭"}),(s:symptom {disease:"急性心力衰竭"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.2.2.1 （慢性）左心衰竭
CREATE (:symptom {characteristic:"肺循环瘀血",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"心排血量降低",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"劳力性呼吸困难",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"端坐呼吸",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"夜间阵发性呼吸困难",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"急性肺水肿",stage:"重症",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"心源性哮鸣音",stage:"重症",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"咳嗽",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"咳痰",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"白色浆液性泡沫痰",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"痰中带血丝",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"乏力",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"疲倦",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"运动耐量减低",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"头晕",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"心慌",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"少尿",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"血尿素氮",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"肌酐升高",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"肾功能不全",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"湿性啰音",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"心脏扩大",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"相对性二尖瓣关闭不全的反流性杂音",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"肺动脉瓣区第二心音亢进",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"第三心音奔马律",disease:"左心衰竭"});
CREATE (:symptom {characteristic:"第四心音奔马律",disease:"左心衰竭"});
MATCH (d:disease {name:"左心衰竭"}),(s:symptom {disease:"左心衰竭"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.2.2.2 （慢性）右心衰竭
CREATE (:symptom {characteristic:"体循环瘀血",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"腹胀",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"食欲缺乏",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"呕吐",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"恶心",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"劳力性呼吸困难",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"水肿",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"胸腔积液",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"颈静脉搏动增强、充盈、怒张",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"肝淤血肿大伴压痛",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"肝淤血肿大伴压痛",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"心源性肝硬化",disease:"右心衰竭"});
CREATE (:symptom {characteristic:"三尖瓣关闭不全的反流性杂音",disease:"右心衰竭"});
MATCH (d:disease {name:"右心衰竭"}),(s:symptom {disease:"右心衰竭"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);
//5.2.2.3 （慢性）全心衰竭
CREATE (:symptom {characteristic:"肺瘀血症状减轻",disease:"全心衰竭"});
CREATE (:symptom {characteristic:"心排血量减少",disease:"全心衰竭"});
MATCH (d:disease {name:"全心衰竭"}),(s:symptom {disease:"全心衰竭"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);


//6.2.1 急性心力衰竭分级
CREATE (:degree {name:"Ⅰ级", criterion:"尚无明显心力衰竭",reference:"Killip分级",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅱ级", criterion:"有左心衰竭，肺部啰音<50%肺野",reference:"Killip分级",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅲ级", criterion:"有急性肺水肿，全肺大、小、干、湿啰音",reference:"Killip分级",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅳ级", criterion:"有心源性休克等不同程度或阶段的血流动力学变化",reference:"Killip分级",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅰ类", criterion:"无肺淤血和周围灌注不足；肺毛细血管楔压（PCWP）和心排血指数（CI）正常",reference:"Forrester分类",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅱ类", criterion:"单有肺淤血；PCWP（>18mmHg），CI正常[>2.2L/ (min·m2)]",reference:"Forrester分类",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅲ类", criterion:"单有周围灌注不足；PCWP正常（<18mmHg），CI降低[<2.2L/ (min·m2)]，主要与血容量不足或心动过缓有关",reference:"Forrester分类",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅳ类", criterion:"合并有肺淤血和周围灌注不足；PCWP增高（>18mmHg），CI降低[<2.2L/ (min·m2)]",reference:"Forrester分类",disease:"慢性心力衰竭"});
MATCH (d:disease {english_name:"慢性心力衰竭"}),(g:degree {disease:"慢性心力衰竭"}) CREATE (d)-[:disease_degree {reference:"内科学第九版"}]->(g);

//6.2.2 慢性心力衰竭分期
CREATE (:stage {name:"前心衰阶段", criterion:"病人存在心衰高危因素，但目前尚无心脏结构或功能异常，也无心衰的症状和（或）体征",disease:"慢性心力衰竭"});
CREATE (:stage {name:"前临床心衰阶段", criterion:"病入无心衰的症状和（或）体征，但已出现心脏结构改变，如左心室肥厚、无症状瓣膜性心脏病、既往心肌梗死史等",disease:"慢性心力衰竭"});
CREATE (:stage {name:"临床心衰阶段", criterion:"病人已有心脏结构改变，既往或目前有心衰的症状和（或）体征",disease:"慢性心力衰竭"});
CREATE (:stage {name:"难治性终末期心衰阶段", criterion:" 病人虽经严格优化内科治疗，但休息时仍有症状，常伴 源性恶病质，须反复长期住院",disease:"慢性心力衰竭"});
MATCH (d:disease {name:"慢性心力衰竭"}),(g:stage {disease:"慢性心力衰竭"}) CREATE (d)-[:disease_stage {reference:"内科学第九版"}]->(g);
//6.2.2 慢性心力衰竭分级
CREATE (:degree {name:"Ⅰ级", criterion:"心脏病病人日常活动量不受限制，一般活动不引起乏力、呼吸困难等心衰症状",reference:"NYHA心功能分级",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅱ级", criterion:"心脏病病人体力活动轻度受限，休息时无自觉症状，一般活动下可出现心衰症状",reference:"NYHA心功能分级",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅲ级", criterion:"心脏病病人体力活动明显受限，低于平时一般活动即引起心衰症状",reference:"NYHA心功能分级",disease:"慢性心力衰竭"});
CREATE (:degree {name:"Ⅳ级", criterion:"心脏病病人不能从事任何体力活动，休息状态下也存在心衰症状，活动后加重",reference:"NYHA心功能分级",disease:"慢性心力衰竭"});
CREATE (:degree {name:"轻度心衰", criterion:"6分钟步行试验>450m",reference:"US Carvedilol",disease:"慢性心力衰竭"});
CREATE (:degree {name:"中度心衰", criterion:"6分钟步行试验150~450n",reference:"US Carvedilol",disease:"慢性心力衰竭"});
CREATE (:degree {name:"重度心衰", criterion:"6分钟步行试验<150m",reference:"US Carvedilol",disease:"慢性心力衰竭"});
MATCH (d:disease {name:"慢性心力衰竭"}),(g:degree {disease:"慢性心力衰竭"}) CREATE (d)-[:disease_degree {reference:"内科学第九版"}]->(g);

//7.2.1 急性心力衰竭
CREATE (:laboratory_test {name:"利钠肽",english_name:"BNP/NT-proBNP",information:"水平正常可基本排除心衰诊断",disease:"急性心力衰竭"});
CREATE (:laboratory_test {name:"血压",disease:"急性心力衰竭"});
MATCH (d:disease {name:"急性心力衰竭"}),(rt:laboratory_test {disease:"急性心力衰竭"}) CREATE (d)-[:disease_laboratory_test {reference:"内科学第九版"}]->(rt);
CREATE (:examination {name:"心电图",information:"帮助判断心肌缺血、既往肌梗死、传导阻滞及心律失常",disease:"急性心力衰竭"});
CREATE (:examination {name:"X线检查",information:"心影形态大小/肺瘀血",disease:"急性心力衰竭"});
CREATE (:examination {name:"床旁右心漂浮导管（Swan-Ganz导管）检查",indication:"急性重衰病人",information:"各部位的压力/血液含氧量/心脏指数（CI）/肺毛细血管樑压（PCWP）",disease:"急性心力衰竭"});
MATCH (d:disease {name:"急性心力衰竭"}),(rt:examination {disease:"急性心力衰竭"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//7.2.2 慢性心力衰竭
CREATE (:laboratory_test {name:"利钠肽",english_name:"BNP/NT-proBNP",information:"水平正常可基本排除心衰诊断",disease:"慢性心力衰竭"});
CREATE (:laboratory_test {name:"肌钙蛋白",information:"明确是否存在急性冠状动脉综合征/心衰预后",disease:"慢性心力衰竭"});
CREATE (:laboratory_test {name:"血常规",disease:"慢性心力衰竭"});
CREATE (:laboratory_test {name:"尿常规",disease:"慢性心力衰竭"});
CREATE (:laboratory_test {name:"肝肾功能",disease:"慢性心力衰竭"});
CREATE (:laboratory_test {name:"血糖",disease:"慢性心力衰竭"});
CREATE (:laboratory_test {name:"血脂",disease:"慢性心力衰竭"});
CREATE (:laboratory_test {name:"电解质",disease:"慢性心力衰竭"});
CREATE (:laboratory_test {name:"甲状腺功能",disease:"慢性心力衰竭"});
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:laboratory_test {disease:"慢性心力衰竭"}) CREATE (d)-[:disease_laboratory_test {reference:"内科学第九版"}]->(rt);
CREATE (:examination {name:"心电图",information:"帮助判断心肌缺血、既往肌梗死、传导阻滞及心律失常",disease:"慢性心力衰竭"});
CREATE (:examination {name:"超声心动图",information:"各心腔大小变化及瓣膜结构和功能",disease:"慢性心力衰竭"});
CREATE (:examination {name:"X线检查",information:"心影形态大小/肺瘀血",disease:"慢性心力衰竭"});
CREATE (:examination {name:"心脏磁共振",english_name:"CMR",information:"左右心室容积、心功能、节段性室壁运动、心肌厚度、心脏肿瘤、瓣膜、先天性畸形及心包疾病等",disease:"慢性心力衰竭"});
CREATE (:examination {name:"冠状动脉造影",english_name:"CAG",information:"病因诊断",disease:"慢性心力衰竭"});
CREATE (:examination {name:"放射性核素心血池显影",information:"心脏大小和LVEF/心脏舒张功能",disease:"慢性心力衰竭"});
CREATE (:examination {name:"心肌灌注显像",information:"评价存活或缺血心肌",disease:"慢性心力衰竭"});
CREATE (:examination {name:"床旁右心漂浮导管（Swan-Ganz导管）检查",indication:"急性重症心衰病人",information:"各部位的压力/血液含氧量/心脏指数（CI）/肺毛细血管樑压（PCWP）",disease:"慢性心力衰竭"});
CREATE (:examination {name:"脉搏指示剂连续心排血量监测",english_name:"PiCCO",indication:"危重病人",information:"估测血容量/外周血管阻力/全心排血量",disease:"慢性心力衰竭"});
CREATE (:examination {name:"心肺运动试验",information:"最大耗氧量/无氧阈值",disease:"慢性心力衰竭"});
MATCH (d:disease {name:"慢性心力衰竭"}),(rt:examination {disease:"慢性心力衰竭"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

//9.2.1 慢性心力衰竭
CREATE (:differential_diagnosis {name:"支气管哮喘",symptom:"心源性哮鸣音",disease:"慢性心力衰竭"});
CREATE (:differential_diagnosis {name:"心包积液",symptom:"颈静脉怒张、肝大、下肢水肿",disease:"慢性心力衰竭"});
CREATE (:differential_diagnosis {name:"窄缩性心包炎",symptom:"心尖部舒张期隆隆样杂音",disease:"慢性心力衰竭"});
CREATE (:differential_diagnosis {name:"肝硬化腹腔积液伴下肢水肿",symptom:"肝硬化腹腔积液伴下肢水肿",disease:"慢性心力衰竭"});
MATCH (d:disease {name:"慢性心力衰竭"}),(dd:differential_diagnosis {disease:"慢性心力衰竭"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);


//10.2.1 急性心力衰竭
CREATE (:drug {name:"吗啡",dosage:"3~5mg",usage:"静脉注射",disease:"急性心力衰竭",aim:"镇静"});
CREATE (:drug {name:"呋塞米",dosage:"20~40mg",usage:"静脉注射",disease:"急性心力衰竭",aim:"快速利尿"});
CREATE (:drug {name:"氨茶碱",disease:"急性心力衰竭",aim:"解除支气管痉挛"});
CREATE (:drug {name:"毛花苷丙",dosage:"0.4~0.8mg",usage:"静脉注射",disease:"急性心力衰竭",indication:"有快速心室率的心房颤动并心室扩大伴左心室收缩功能不全者"});
CREATE (:drug {name:"硝普钠",dosage:"0.3µg/（kg·min）",usage:"静脉注射",disease:"急性心力衰竭",aim:"血管扩张剂"});
CREATE (:drug {name:"硝酸甘油 ",dosage:"0.3µg/（kg·min）",usage:"静脉注射",disease:"急性心力衰竭",aim:"血管扩张剂"});
CREATE (:drug {name:"双硝酸异山梨醇酯",disease:"急性心力衰竭",aim:"血管扩张剂"});
CREATE (:drug {name:"乌拉地尔",disease:"急性心力衰竭",aim:"血管扩张剂"});
CREATE (:drug {name:"奈西立肽",disease:"急性心力衰竭",aim:"血管扩张剂",indication:"急性失代偿性心衰"});
CREATE (:drug {name:"多巴胺",disease:"急性心力衰竭",aim:"正性肌力药物"});
CREATE (:drug {name:"多巴酚丁胺",disease:"急性心力衰竭",aim:"正性肌力药物",side_effect:"致心律失常"});
CREATE (:drug {name:"米力农",disease:"急性心力衰竭",aim:"正性肌力药物",side_effect:"致心律失常"});
CREATE (:drug {name:"左西孟旦",disease:"急性心力衰竭",aim:"正性肌力药物",indication:"无显著低血压或低血压倾向的急性左心衰病人"});
CREATE (:drug {name:"去甲肾上腺素",disease:"急性心力衰竭",aim:"血管收缩剂",indication:"正性肌力药无明显改善的心源性休克"});
CREATE (:drug {name:"肾上腺索",disease:"急性心力衰竭",aim:"血管收缩剂",indication:"正性肌力药无明显改善的心源性休克"});
MATCH (ds:disease {name:"急性心力衰竭"}),(dg:drug {disease:"急性心力衰竭"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.2.2 慢性心力衰竭
CREATE (:drug {name:"呋塞米",dosage:"20mg",usage:"口服",frequency:"每日1次",disease:"慢性心力衰竭",side_effect:"低血钾",aim:"快速利尿"});
CREATE (:drug {name:"氢氯噻嗪",dosage:"12~25mg",frequency:"每日1次",indication:"轻度心力衰竭",disease:"慢性心力衰竭",side_effect:"高尿酸血症/影响糖、脂代谢",aim:"利尿剂"});
CREATE (:drug {name:"螺内酯（安体舒通）",disease:"慢性心力衰竭",aim:"利尿剂",side_effect:"电解质紊乱"});
CREATE (:drug {name:"氨苯蝶啶",disease:"慢性心力衰竭",aim:"利尿剂",side_effect:"电解质紊乱"});
CREATE (:drug {name:"阿米洛利",disease:"慢性心力衰竭",aim:"利尿剂",side_effect:"电解质紊乱"});
CREATE (:drug {name:"托伐普坦",disease:"慢性心力衰竭",aim:"利尿剂",indication:"伴有低血钠症的心力衰竭"});
CREATE (:drug {name:"血管紧张素酶抑制剂",english_name:"ACEI",prohibit_drug:"非甾体类消炎药（NSAIDS）",aim:"RAAS抑制剂",disease:"慢性心力衰竭",side_effect:"低血压/肾功能一过性恶化/高血钾/干咳/血管性水肿",contraindication:"有威胁生命的不良反应（血管性水肿和无尿性肾衰竭）者/妊娠期妇女/ACEI过敏者",use_with_caution:"低血压/双侧肾动脉狭窄/血肌酐明显升高（>265μmol/L）/高血钾（>5.5mmol/L）"});
CREATE (:drug {name:"血管紧张素酶受体拮抗剂",english_name:"ARB",prohibit_drug:"血管紧张素酶抑制剂（ACEI）",aim:"RAAS抑制剂",disease:"慢性心力衰竭",indication:"ACEI引起干咳、血管性水肿/ACEI不耐受"});
CREATE (:drug {name:"血管紧张素酶受体脑啡肽酶抑制剂",english_name:"ARNI",aim:"RAAS抑制剂",disease:"慢性心力衰竭",indication:"HFrEF病人"});
CREATE (:drug {name:"依普利酮",aim:"RAAS抑制剂",disease:"慢性心力衰竭",indication:"老龄/糖尿病/肾功能不全病人"});
CREATE (:drug {name:"螺内酯",aim:"RAAS抑制剂",disease:"慢性心力衰竭",contraindication:"近期有肾功能不全/血肌酐升高/高钾血症病人"});
CREATE (:drug {name:"阿利吉仑",aim:"RAAS抑制剂",disease:"慢性心力衰竭",comment:"目前不推荐使用"});
CREATE (:drug {name:"美托洛尔",aim:"RAAS抑制剂",disease:"慢性心力衰竭",contraindication:"支气管痉挛性疾病/严重心动过缓/二度及二度以上房室阻滞/严重周围血管疾病/重度急性心衰"});
CREATE (:drug {name:"比索洛尔",aim:"RAAS抑制剂",disease:"慢性心力衰竭",contraindication:"支气管痉挛性疾病/严重心动过缓/二度及二度以上房室阻滞/严重周围血管疾病/重度急性心衰"});
CREATE (:drug {name:"卡维地洛",aim:"RAAS抑制剂",disease:"慢性心力衰竭",contraindication:"支气管痉挛性疾病/严重心动过缓/二度及二度以上房室阻滞/严重周围血管疾病/重度急性心衰"});
CREATE (:drug {name:"地高辛",aim:"正性肌力药",disease:"慢性心力衰竭",dosage:"0.125mg",frequency:"每日",side_effect:"洋地黄中毒"});
CREATE (:drug {name:"毛花苷丙",aim:"正性肌力药",disease:"慢性心力衰竭",usage:"静脉注射",indication:"急性心力衰竭/慢性心衰加重",side_effect:"洋地黄中毒"});
CREATE (:drug {name:"毒毛花苷K",aim:"正性肌力药",disease:"慢性心力衰竭",usage:"静脉注射",indication:"急性心力衰竭/慢性心衰加重",side_effect:"洋地黄中毒"});
CREATE (:drug {name:"多巴胺",aim:"正性肌力药",disease:"慢性心力衰竭",usage:"静脉注射",indication:"短期静脉应用"});
CREATE (:drug {name:"多巴酚丁胺",aim:"正性肌力药",disease:"慢性心力衰竭",usage:"静脉注射",indication:"短期静脉应用"});
CREATE (:drug {name:"米力农",aim:"正性肌力药",disease:"慢性心力衰竭",side_effect:"长期使用死亡率增加",indication:"对心脏术后急性收缩性心力衰竭/难治性心力衰竭/心脏移植前的终末期心力衰竭短期应用"});
CREATE (:drug {name:"伊伐布雷定",disease:"慢性心力衰竭",aim:"正性肌力药"});
CREATE (:drug {name:"扩血管药物",disease:"慢性心力衰竭",indication:"伴有心绞痛或高血压的病人",contraindication:"存在心脏流出道或瓣膜狭窄的病人"});
MATCH (ds:disease {name:"慢性心力衰竭"}),(dg:drug {disease:"慢性心力衰竭"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.2.4 射血分数保留性心衰
CREATE (:drug {name:"利尿剂",disease:"射血分数保留性心衰",aim:"降低肺静脉压"});
CREATE (:drug {name:"静脉扩张剂（硝酸盐制剂）",disease:"射血分数保留性心衰",aim:"降低肺静脉压",side_effect:"过量致左心室充盈量和心排血量明显下降"});
CREATE (:drug {name:"β受体阻滞剂",disease:"射血分数保留性心衰",aim:"维持基础心律50~60次/分"});
CREATE (:drug {name:"维拉帕米",disease:"射血分数保留性心衰",aim:"改善舒张功能",indication:"肥厚型心肌病",side_effect:"负性肌力作用"});
CREATE (:drug {name:"地尔硫䓬",disease:"射血分数保留性心衰",aim:"改善舒张功能",indication:"肥厚型心肌病",side_effect:"负性肌力作用"});
CREATE (:drug {name:"ACEI",disease:"射血分数保留性心衰",aim:"改善舒张功能",indication:"高血压性心脏病/冠心病"});
CREATE (:drug {name:"ARB",disease:"射血分数保留性心衰",aim:"改善舒张功能",indication:"高血压性心脏病/冠心病"});
MATCH (ds:disease {name:"射血分数保留性心衰"}),(dg:drug {disease:"射血分数保留性心衰"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
CREATE (:drug {name:"正性肌力药物",prohibit_disease:"射血分数保留性心衰",indication:"无收缩障碍"});
MATCH (ds:disease {name:"射血分数保留性心衰"}),(dg:drug {prohibit_disease:"射血分数保留性心衰"}) CREATE (ds)-[:disease_prohibit_drug {reference:"内科学第九版"}]->(dg);


//11.2.1 急性心力衰竭
CREATE (:treatment {name:"半卧位或端坐位，双腿下垂",disease:"急性心力衰竭"});
CREATE (:treatment {name:"吸氧",disease:"急性心力衰竭"});
CREATE (:treatment {name:"救治准备",disease:"急性心力衰竭"});
CREATE (:treatment {name:"出入量管理",disease:"急性心力衰竭"});
CREATE (:treatment {name:"机械通气",indication:"合并严重呼吸衰竭经常规治疗不能改善者及心肺复苏病人",disease:"急性心力衰竭"});
CREATE (:treatment {name:"连续性肾脏替代治疗",english_name:"CRRT",indication:"高容量负荷且对利尿剂抵抗、低钠血症且出现相应临床症状、肾功能严重受损且药物不能控制时",disease:"急性心力衰竭"});
CREATE (:treatment {name:"主动脉内球囊反搏",english_name:"IABP",indication:"冠心病急性左心衰病人",disease:"急性心力衰竭"});
CREATE (:treatment {name:"体外膜式氧合",english_name:"ECMO",indication:"心脏不能维持全身灌注/肺不能进行充分气体交换",disease:"急性心力衰竭"});
CREATE (:treatment {name:"可植入式电动左心室辅助泵Impella",indication:"高危险冠心病人/急性心肌梗死病人",disease:"急性心力衰竭"});
MATCH (d:disease {name:"急性心力衰竭"}),(t:treatment {disease:"急性心力衰竭"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.2.2 慢性心力衰竭
CREATE (:treatment {name:"病人教育",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"体重管理",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"饮食管理",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"休息与活动",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"病因治疗",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"消除诱因",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"心脏再同步化治疗",english_name:"CRT",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"植入型心律转复除颤器",english_name:"ICD",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"左室辅助装置",english_name:"LVAD",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"经导管二尖瓣修复术",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"经皮左心室室壁瘤减容术",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"心血管再生治疗",disease:"慢性心力衰竭"});
CREATE (:treatment {name:"基因治疗",disease:"慢性心力衰竭"});
MATCH (d:disease {name:"慢性心力衰竭"}),(t:treatment {disease:"慢性心力衰竭"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.2.4 射血分数保留性心衰
CREATE (:treatment {name:"积极寻找并治疗基础病因",disease:"射血分数保留性心衰"});
CREATE (:treatment {name:"限制钠盐摄入",disease:"射血分数保留性心衰"});
CREATE (:treatment {name:"尽量维持窦性心律",disease:"射血分数保留性心衰"});
CREATE (:treatment {name:"保持房室顺序传导",disease:"射血分数保留性心衰"});
CREATE (:treatment {name:"保证心室舒张期充分的容量",disease:"射血分数保留性心衰"});
MATCH (d:disease {name:"射血分数保留性心衰"}),(t:treatment {disease:"射血分数保留性心衰"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
