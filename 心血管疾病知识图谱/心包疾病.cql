MATCH (n) detach delete n;


//1.5 心包疾病
CREATE (:disease {name:"心包疾病",definition:"由感染、肿瘤、代谢性疾病、尿毒症、自身免疫病、外伤等引起的心包病理性改变。"});
//1.5.1 急性心包炎
CREATE (:disease {name:"急性心包炎",definition:"心包脏层和壁层的急性炎症性疾病。"});
MATCH (dc:disease {name:"心包疾病"}),(d:disease {name:"急性心包炎"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.5.1.1 特发性急性心包炎
CREATE (:disease {name:"特发性急性心包炎",synonym:"急性非特异性心包炎",definition:"无法明确病因的急性心包炎。"});
MATCH (dc:disease {name:"急性心包炎"}),(d:disease {name:"特发性急性心包炎"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.5.2 心包积液
CREATE (:disease {name:"心包积液",definition:"心包疾病或其他病因累及心包可造成心包渗出和心包积液。"});
MATCH (dc:disease {name:"心包疾病"}),(d:disease {name:"心包积液"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.5.3 心脏压塞
CREATE (:disease {name:"心脏压塞",definition:"心包积液量达到一定程度时，造成心输出量和回心血量明显下降而产生的临床症状。"});
MATCH (dc:disease {name:"心包疾病"}),(d:disease {name:"心脏压塞"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.5.4 窄缩性心包炎
CREATE (:disease {name:"窄缩性心包炎",definition:"是指心脏被致密增厚的纤维化或钙化心包所包围，使心室舒张期充盈受限而产生一系列循环障碍的疾病。"});
MATCH (dc:disease {name:"心包疾病"}),(d:disease {name:"窄缩性心包炎"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);


//3.5.1 急性心包炎
CREATE (:cause {name:"病毒感染",disease:"急性心包炎"});
CREATE (:cause {name:"细菌感染",disease:"急性心包炎"});
CREATE (:cause {name:"自身免疫病",disease:"急性心包炎"});
CREATE (:cause {name:"肿瘤",disease:"急性心包炎"});
CREATE (:cause {name:"尿毒症",disease:"急性心包炎"});
CREATE (:cause {name:"急性心肌梗死后心包炎",disease:"急性心包炎"});
CREATE (:cause {name:"主动脉夹层",disease:"急性心包炎"});
CREATE (:cause {name:"胸壁外伤",disease:"急性心包炎"});
CREATE (:cause {name:"心脏手术",disease:"急性心包炎"});
MATCH (d:disease {name:"急性心包炎"}),(c:cause {disease:"急性心包炎"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//3.5.2 心包积液
CREATE (:cause {name:"肿瘤",disease:"心包积液"});
CREATE (:cause {name:"特发性心包炎",disease:"心包积液"});
CREATE (:cause {name:"感染性心包炎",disease:"心包积液"});
CREATE (:cause {name:"结核性心包炎",disease:"心包积液"});
CREATE (:cause {name:"严重体循环瘀血",disease:"心包积液"});
CREATE (:cause {name:"穿刺伤",disease:"心包积液"});
CREATE (:cause {name:"心室破裂",disease:"心包积液"});
CREATE (:cause {name:"心胸外科手术",disease:"心包积液"});
CREATE (:cause {name:"介入操作造成的冠状动脉穿孔",disease:"心包积液"});
MATCH (d:disease {name:"心包积液"}),(c:cause {disease:"心包积液"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//3.5.3 心脏压塞
CREATE (:cause {name:"肿瘤",disease:"心脏压塞"});
CREATE (:cause {name:"特发性心包炎",disease:"心脏压塞"});
CREATE (:cause {name:"感染性心包炎",disease:"心脏压塞"});
CREATE (:cause {name:"结核性心包炎",disease:"心脏压塞"});
CREATE (:cause {name:"严重体循环瘀血",disease:"心脏压塞"});
CREATE (:cause {name:"穿刺伤",disease:"心脏压塞"});
CREATE (:cause {name:"心室破裂",disease:"心脏压塞"});
CREATE (:cause {name:"心胸外科手术",disease:"心脏压塞"});
CREATE (:cause {name:"介入操作造成的冠状动脉穿孔",disease:"心脏压塞"});
MATCH (d:disease {name:"心脏压塞"}),(c:cause {disease:"心脏压塞"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//3.5.4 窄缩性心包炎
CREATE (:cause {name:"结核性心包炎",disease:"窄缩性心包炎"});
CREATE (:cause {name:"非特异性心包炎",disease:"窄缩性心包炎"});
CREATE (:cause {name:"化脓性心包炎",disease:"窄缩性心包炎"});
CREATE (:cause {name:"创伤性心包炎",disease:"窄缩性心包炎"});
CREATE (:cause {name:"放射性心包炎",disease:"窄缩性心包炎"});
CREATE (:cause {name:"心脏直视手术",disease:"窄缩性心包炎"});
CREATE (:cause {name:"自身免疫性疾病",disease:"窄缩性心包炎"});
CREATE (:cause {name:"恶性肿瘤",disease:"窄缩性心包炎"});
CREATE (:cause {name:"尿毒症",disease:"窄缩性心包炎"});
CREATE (:cause {name:"药物",disease:"窄缩性心包炎"});
MATCH (d:disease {name:"窄缩性心包炎"}),(c:cause {disease:"窄缩性心包炎"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);


//5.5.1 急性心包炎
CREATE (:symptom {characteristic:"胸痛",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"胸骨后、心前区疼痛",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"颈部、左肩、左臂、上腹部放射痛",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"疼痛性质尖锐",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"呼吸困难",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"水肿",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"发热",comment:"感染性心包炎",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"乏力",comment:"感染性心包炎",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"白细胞计数增加",examination:"血清学检查",comment:"感染性心包炎",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"中性粒细胞增加",examination:"血清学检查",comment:"感染性心包炎",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"C反应蛋白增高",examination:"血清学检查",comment:"感染性心包炎",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"红细胞沉降率增快",examination:"血清学检查",comment:"感染性心包炎",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"免疫指标阳性",examination:"血清学检查",comment:"自身免疫病引起心包炎",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"肌酐明显升高",examination:"血清学检查",comment:"尿毒症病人",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"心包摩擦音，呈抓刮样粗糙的高频音",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"三相摩擦音",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"心电图异常",examination:"心电图",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"除aVR及V1导联以外ST段呈弓背向下型抬高",examination:"心电图",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"心电图异常",examination:"心电图",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"aVR及V1导联ST段压低",examination:"心电图",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"窦性心动过速",examination:"心电图",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"QRS电交替",examination:"心电图",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"心影增大",examination:"胸部X线",comment:"心包积液较多",disease:"急性心包炎"});
CREATE (:symptom {characteristic:"心包渗出后心包积液",examination:"胸部X线/超声心动图",disease:"急性心包炎"});
MATCH (d:disease {name:"急性心包炎"}),(s:symptom {disease:"急性心包炎"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//5.5.2 心包积液
CREATE (:symptom {characteristic:"呼吸困难",disease:"心包积液"});
CREATE (:symptom {characteristic:"端坐呼吸",disease:"心包积液"});
CREATE (:symptom {characteristic:"身体前倾",disease:"心包积液"});
CREATE (:symptom {characteristic:"面色苍白",disease:"心包积液"});
CREATE (:symptom {characteristic:"发绀",disease:"心包积液"});
CREATE (:symptom {characteristic:"干咳",disease:"心包积液"});
CREATE (:symptom {characteristic:"声音嘶哑",disease:"心包积液"});
CREATE (:symptom {characteristic:"吞咽困难",disease:"心包积液"});
CREATE (:symptom {characteristic:"上腹部疼痛",disease:"心包积液"});
CREATE (:symptom {characteristic:"肝大",disease:"心包积液"});
CREATE (:symptom {characteristic:"全身水肿",disease:"心包积液"});
CREATE (:symptom {characteristic:"胸腔积液",disease:"心包积液"});
CREATE (:symptom {characteristic:"腹腔积液",disease:"心包积液"});
CREATE (:symptom {characteristic:"休克",disease:"心包积液"});
CREATE (:symptom {characteristic:"心尖搏动减弱",disease:"心包积液"});
CREATE (:symptom {characteristic:"心脏浊音界向两侧增大",disease:"心包积液"});
CREATE (:symptom {characteristic:"心音低而遥远",disease:"心包积液"});
CREATE (:symptom {characteristic:"左肩胛骨下出现叩浊音",disease:"心包积液"});
CREATE (:symptom {characteristic:"支气管呼吸音",disease:"心包积液"});
CREATE (:symptom {characteristic:"心包积液征（Ewart征）",disease:"心包积液"});
CREATE (:symptom {characteristic:"胸骨左缘第3、4肋间闻及心包叩击音",disease:"心包积液"});
CREATE (:symptom {characteristic:"奇脉",disease:"心包积液"});
CREATE (:symptom {characteristic:"体循环瘀血",disease:"心包积液"});
CREATE (:symptom {characteristic:"颈静脉怒张",disease:"心包积液"});
CREATE (:symptom {characteristic:"肝颈静脉回流征",disease:"心包积液"});
CREATE (:symptom {characteristic:"下肢水肿",disease:"心包积液"});
CREATE (:symptom {characteristic:"肢体导联QRS低电压",examination:"心电图",disease:"心包积液"});
CREATE (:symptom {characteristic:"P波",examination:"心电图",disease:"心包积液"});
CREATE (:symptom {characteristic:"QRS波",examination:"心电图",disease:"心包积液"});
CREATE (:symptom {characteristic:"T波电交替",examination:"心电图",disease:"心包积液"});
CREATE (:symptom {characteristic:"窦性心动过速",examination:"心电图",disease:"心包积液"});
CREATE (:symptom {characteristic:"肺野清晰",examination:"X线检查",disease:"心包积液"});
CREATE (:symptom {characteristic:"心影显著增大",examination:"X线检查",disease:"心包积液"});
CREATE (:symptom {characteristic:"整个心动周期可见脏层心包与壁层心包之间存在积液",examination:"超声心动图",disease:"心包积液"});
CREATE (:symptom {characteristic:"游泳心",examination:"超声心动图",disease:"心包积液"});
CREATE (:symptom {characteristic:"舒张末期右心房塌陷",examination:"超声心动图",disease:"心包积液"});
CREATE (:symptom {characteristic:"舒张早期右心室游离壁塌陷",examination:"超声心动图",disease:"心包积液"});
CREATE (:symptom {characteristic:"吸气时右心室内径增大",examination:"超声心动图",disease:"心包积液"});
CREATE (:symptom {characteristic:"吸气时左心室内径减小",examination:"超声心动图",disease:"心包积液"});
CREATE (:symptom {characteristic:"吸气时室间隔左移",examination:"超声心动图",disease:"心包积液"});
MATCH (d:disease {name:"心包积液"}),(s:symptom {disease:"心包积液"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//5.5.3 心脏压塞
CREATE (:symptom {characteristic:"呼吸困难",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"端坐呼吸",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"身体前倾",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"面色苍白",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"发绀",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"干咳",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"声音嘶哑",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"吞咽困难",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"上腹部疼痛",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"肝大",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"全身水肿",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"胸腔积液",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"腹腔积液",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"休克",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"心尖搏动减弱",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"心脏浊音界向两侧增大",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"心音低而遥远",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"左肩胛骨下出现叩浊音",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"支气管呼吸音",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"心包积液征（Ewart征）",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"胸骨左缘第3、4肋间闻及心包叩击音",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"奇脉",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"体循环瘀血",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"颈静脉怒张",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"肝颈静脉回流征",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"下肢水肿",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"窦性心动过速",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"血压下降",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"脉压变小",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"静脉压明显升高",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"急性循环衰竭",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"休克",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"Kussmaul征",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"为挠动脉搏动呈吸气性显著减弱或消失",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"肢体导联QRS低电压",examination:"心电图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"P波",examination:"心电图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"QRS波",examination:"心电图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"T波电交替",examination:"心电图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"窦性心动过速",examination:"心电图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"肺野清晰",examination:"X线检查",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"心影显著增大",examination:"X线检查",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"整个心动周期可见脏层心包与壁层心包之间存在积液",examination:"超声心动图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"游泳心",examination:"超声心动图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"舒张末期右心房塌陷",examination:"超声心动图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"舒张早期右心室游离壁塌陷",examination:"超声心动图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"吸气时右心室内径增大",examination:"超声心动图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"吸气时左心室内径减小",examination:"超声心动图",disease:"心脏压塞"});
CREATE (:symptom {characteristic:"吸气时室间隔左移",examination:"超声心动图",disease:"心脏压塞"});
MATCH (d:disease {name:"心脏压塞"}),(s:symptom {disease:"心脏压塞"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//5.5.4 窄缩性心包炎
CREATE (:symptom {characteristic:"心包炎/心包积液/恶性肿瘤/胸部放射性治疗/胸心外科手术病史",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心悸",comment:"体循环瘀血",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"劳力性呼吸困难",comment:"体循环瘀血",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"活动耐量下降",comment:"体循环瘀血",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"疲乏",comment:"体循环瘀血",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"肝大",comment:"体循环瘀血",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"腹腔积液",comment:"体循环瘀血",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"胸腔积液",comment:"体循环瘀血",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"下肢水肿",comment:"体循环瘀血",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"颈静脉压升高",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"脉压变小",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心尖搏动减弱或消失",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"收缩期心尖呈负性搏动",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心浊音界正常或稍增大",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心音轻而远",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"无心脏杂音",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心浊音界正常或稍增大",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"胸骨左缘第3~4肋间可闻及心包叩击音",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心率较快",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"窦性/房性/室性心律",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"期前收缩",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"Kussmaul征",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"肌肉萎缩",comment:"晚期",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"恶病质",comment:"晚期",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"严重水肿",comment:"晚期",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心影轻度增大",examination:"X线检查",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心包钙化",examination:"X线检查",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心动过速",examination:"心电图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"QRS低电压",examination:"心电图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"T波低平或倒置",examination:"心电图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"P波增宽有切迹",examination:"心电图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心房颤动",comment:"病程长/高龄病人",examination:"心电图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"肺毛细血管压力/肺动脉舒张压力/右心室舒张末期压力/右心房压力/腔静脉压力均显著升高且趋于同一水平",comment:"病程长/高龄病人",examination:"右心导管检查",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"右心房压力曲线呈M或W波形",comment:"病程长/高龄病人",examination:"右心导管检查",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"右心室收缩压轻度升高，呈舒张早期下陷及高原形曲线",comment:"病程长/高龄病人",examination:"右心导管检查",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"呼吸时左、 压力曲线变化呈矛盾性",comment:"病程长/高龄病人",examination:"右心导管检查",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心包增厚、粘连",examination:"超声心动图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"心脏变形",examination:"超声心动图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"室壁活动减弱",examination:"超声心动图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"室间隔舒张期矛盾运动（室间隔抖动症）",examination:"超声心动图",disease:"窄缩性心包炎"});
CREATE (:symptom {characteristic:"下腔静脉增宽且不随呼吸变化",examination:"超声心动图",disease:"窄缩性心包炎"});
MATCH (d:disease {name:"窄缩性心包炎"}),(s:symptom {disease:"窄缩性心包炎"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);


//7.5.1 急性心包炎
CREATE (:examination {name:"血清学检查",information:"白细胞计数/中性粒细胞/C反应蛋白/红细胞/免疫指标/肌酐",disease:"急性心包炎"});
CREATE (:examination {name:"心电图",information:"心电图改变",disease:"急性心包炎"});
CREATE (:examination {name:"胸部X线",information:"心包积液情况",disease:"急性心包炎"});
CREATE (:examination {name:"超声心动图",information:"靴型心/肺淤血/肺水肿",disease:"急性心包炎"});
CREATE (:examination {name:"心脏磁共振成像",english_name:"MRI",information:"心包积液的容量和分布情况/心包厚度",disease:"急性心包炎"});
CREATE (:examination {name:"心包穿刺",information:"心脏压塞",disease:"急性心包炎"});
MATCH (d:disease {name:"急性心包炎"}),(rt:examination {disease:"急性心包炎"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

//7.5.2 心包积液
CREATE (:examination {name:"X线检查",information:"心影增大",disease:"心包积液"});
CREATE (:examination {name:"心电图",information:"QRS波/P波/T波/窦性心动过速",disease:"心包积液"});
CREATE (:examination {name:"超声心电图",information:"心包积液定量、定位",disease:"心包积液"});
CREATE (:examination {name:"心脏磁共振成像",information:"心包积液的位置、范围和容量/心包积液的性质/心包膜的增厚/心包腔内肿瘤",disease:"心包积液"});
CREATE (:examination {name:"心包穿刺",information:"心包积液的性质",disease:"心包积液"});
MATCH (d:disease {name:"心包积液"}),(rt:examination {disease:"心包积液"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

//7.5.3 心脏压塞
CREATE (:examination {name:"X线检查",information:"心影增大",disease:"心脏压塞"});
CREATE (:examination {name:"心电图",information:"QRS波/P波/T波/窦性心动过速",disease:"心脏压塞"});
CREATE (:examination {name:"超声心电图",information:"心包积液定量、定位",disease:"心脏压塞"});
CREATE (:examination {name:"心脏磁共振成像",information:"心包积液的位置、范围和容量/心包积液的性质/心包膜的增厚/心包腔内肿瘤",disease:"心脏压塞"});
CREATE (:examination {name:"心包穿刺",information:"心包积液的性质",disease:"心脏压塞"});
MATCH (d:disease {name:"心脏压塞"}),(rt:examination {disease:"心脏压塞"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

//7.5.4 窄缩性心包炎
CREATE (:examination {name:"X线检查",information:"心影增大/心包钙化",disease:"窄缩性心包炎"});
CREATE (:examination {name:"心电图",information:"心动过速/QRS低电压/T波低平或倒置/P波增宽有切迹/心房颤动",disease:"窄缩性心包炎"});
CREATE (:examination {name:"超声心电图",information:"心包增厚粘连/心脏变形/室壁活动减弱减弱/室间隔抖动症/下腔静脉增宽",disease:"窄缩性心包炎"});
CREATE (:examination {name:"心脏CT",information:"心包的受累范围和程度/心包钙化/心包厚度",disease:"窄缩性心包炎"});
CREATE (:examination {name:"心脏MRI",information:"心包的受累范围和程度/心包钙化/心包厚度/心包渗出/心包粘连/心包炎症",disease:"窄缩性心包炎"});
CREATE (:examination {name:"右心导管检查",information:"肺毛细血管压力、肺动脉舒张压力、右心室舒张末期压力、右心房压力和腔静脉压均显著升高且趋于同一水平/右心房压力曲线呈M或W波形/右心室收缩压轻度升高，呈舒张早期下陷及高原形曲线/呼吸时左、右压力曲线变化呈矛盾性//",disease:"窄缩性心包炎"});
CREATE (:examination {name:"心包腔纤维内镜",information:"病因",disease:"窄缩性心包炎"});
MATCH (d:disease {name:"窄缩性心包炎"}),(rt:examination {disease:"窄缩性心包炎"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

//9.5.1 急性心包炎
CREATE (:differential_diagnosis {name:"急性心肌梗死",symptom:"胸痛伴心电图ST段抬高",disease:"急性心包炎"});
CREATE (:differential_diagnosis {name:"主动脉夹层动脉瘤破裂",symptom:"高血压史、胸痛",disease:"急性心包炎"});
CREATE (:differential_diagnosis {name:"肺栓塞",symptom:"胸痛/胸闷/晕厥",disease:"急性心包炎"});
MATCH (d:disease {name:"急性心包炎"}),(dd:differential_diagnosis {disease:"急性心包炎"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.5.2 心包积液
CREATE (:differential_diagnosis {name:"心力衰竭",symptom:"呼吸困难",disease:"心包积液"});
CREATE (:differential_diagnosis {name:"冠心病",symptom:"呼吸困难",disease:"心包积液"});
CREATE (:differential_diagnosis {name:"高血压",symptom:"呼吸困难",disease:"心包积液"});
CREATE (:differential_diagnosis {name:"瓣膜病",symptom:"呼吸困难",disease:"心包积液"});
CREATE (:differential_diagnosis {name:"先天性心脏病",symptom:"呼吸困难",disease:"心包积液"});
CREATE (:differential_diagnosis {name:"心肌病",symptom:"呼吸困难",disease:"心包积液"});
MATCH (d:disease {name:"心包积液"}),(dd:differential_diagnosis {disease:"心包积液"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);
//9.5.3 心脏压塞
CREATE (:differential_diagnosis {name:"心力衰竭",symptom:"呼吸困难",disease:"心脏压塞"});
CREATE (:differential_diagnosis {name:"冠心病",symptom:"呼吸困难",disease:"心脏压塞"});
CREATE (:differential_diagnosis {name:"高血压",symptom:"呼吸困难",disease:"心脏压塞"});
CREATE (:differential_diagnosis {name:"瓣膜病",symptom:"呼吸困难",disease:"心脏压塞"});
CREATE (:differential_diagnosis {name:"先天性心脏病",symptom:"呼吸困难",disease:"心脏压塞"});
CREATE (:differential_diagnosis {name:"心肌病",symptom:"呼吸困难",disease:"心脏压塞"});
MATCH (d:disease {name:"心脏压塞"}),(dd:differential_diagnosis {disease:"心脏压塞"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);

//9.5.4 窄缩性心包炎
CREATE (:differential_diagnosis {name:"限制型心肌病",symptom:"心脏增大/心力衰竭",disease:"窄缩性心包炎"});
CREATE (:differential_diagnosis {name:"心肌炎",symptom:"心脏增大/心力衰竭",disease:"窄缩性心包炎"});
CREATE (:differential_diagnosis {name:"高血压性心脏病",symptom:"心脏增大/心力衰竭",disease:"窄缩性心包炎"});
CREATE (:differential_diagnosis {name:"内分泌病性心脏病",symptom:"心脏增大/心力衰竭",disease:"窄缩性心包炎"});
CREATE (:differential_diagnosis {name:"肝硬化",symptom:"腹腔积液",disease:"窄缩性心包炎"});
CREATE (:differential_diagnosis {name:"结核性腹膜炎",symptom:"腹腔积液",disease:"窄缩性心包炎"});
MATCH (d:disease {name:"窄缩性心包炎"}),(dd:differential_diagnosis {disease:"窄缩性心包炎"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);


//11.5.1 急性心包炎
CREATE (:drug {name:"阿司匹林",dosage:"2~4g/d",indication:"疼痛",aim:"缓解疼痛",disease:"急性心包炎"});
CREATE (:drug {name:"布洛芬",dosage:"400~600mg",frequency:"一日3次",indication:"疼痛、阿司匹林效果不佳",aim:"缓解疼痛",disease:"急性心包炎"});
CREATE (:drug {name:"吲哚美辛",dosage:"20~50mg",frequency:"一日3次",indication:"疼痛、阿司匹林效果不佳",aim:"缓解疼痛",disease:"急性心包炎"});
CREATE (:drug {name:"秋水仙",dosage:"0.6mg",frequency:"一日2次",indication:"疼痛、阿司匹林效果不佳",aim:"缓解疼痛",disease:"急性心包炎"});
CREATE (:drug {name:"吗啡",disease:"急性心包炎"});
CREATE (:drug {name:"泼尼松",dosage:"40~80mg/d",disease:"急性心包炎"});
MATCH (ds:disease {name:"急性心包炎"}),(dg:drug {disease:"急性心包炎"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);

//11.5.1 急性心包炎
CREATE (:treatment {name:"卧床休息",disease:"急性心包炎"});
CREATE (:treatment {name:"心包穿刺引流",indication:"心包积液多引起急性心脏压塞",disease:"急性心包炎"});
CREATE (:treatment {name:"外科心包切除术",indication:"顽固性复发性心包炎病程超过2年/心包积液反复穿刺引流无法缓解/激素无法控制/伴严重胸痛",disease:"急性心包炎"});
MATCH (d:disease {name:"急性心包炎"}),(t:treatment {disease:"急性心包炎"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);

//11.5.2 心包积液
CREATE (:treatment {name:"心包穿刺引流",disease:"心包积液"});
CREATE (:treatment {name:"扩容、升压治疗",indication:"伴休克",disease:"心包积液"});
MATCH (d:disease {name:"心包积液"}),(t:treatment {disease:"心包积液"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);

//11.5.2 心脏压塞
CREATE (:treatment {name:"心包穿刺引流",disease:"心脏压塞"});
CREATE (:treatment {name:"扩容、升压治疗",indication:"伴休克",disease:"心脏压塞"});
MATCH (d:disease {name:"心脏压塞"}),(t:treatment {disease:"心脏压塞"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);

//11.5.3 窄缩性心包炎
CREATE (:treatment {name:"心包切除术",indication:"发展为慢性窄缩性心包炎",disease:"窄缩性心包炎"});
CREATE (:treatment {name:"抗炎治疗",indication:"近期诊断且病情稳定的病人，无心源性恶病质、心源性肝硬化、心肌萎缩等并发症",disease:"窄缩性心包炎"});
CREATE (:treatment {name:"抗结核治疗",indication:"结核性心包炎",disease:"窄缩性心包炎"});
MATCH (d:disease {name:"窄缩性心包炎"}),(t:treatment {disease:"窄缩性心包炎"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
