MATCH (n) detach delete n;
//一、疾病分类
//1.6 心肌疾病
CREATE (:disease {name:"心肌疾病",definition:"有不同病因（遗传性病因较多见）引起的心肌病变导致心肌机械和（或）心电功能障碍"});
//1.6.1 扩张型心肌病
CREATE (:disease {name:"扩张型心肌病",english_name:"DCM",definition:"以左心室或双心室扩大伴收缩功能障碍为特征的心肌病"});
MATCH (dc:disease {name:"心肌疾病"}),(d:disease {name:"扩张型心肌病"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.6.2 肥厚型心肌病
CREATE (:disease {name:"扩张型心肌病",english_name:"HCM",definition:"以心室非对称性肥厚为特点的遗传性的心肌病"});
MATCH (dc:disease {name:"心肌疾病"}),(d:disease {name:"肥厚型心肌病"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.6.3 限制型心肌病
CREATE (:disease {name:"扩张型心肌病",english_name:"RCM",definition:"以心室壁僵硬度增加、舒张功能降低、充盈受限而产生临床右心衰症状为特征的一类心肌病"});
MATCH (dc:disease {name:"心肌疾病"}),(d:disease {name:"限制型心肌病"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.6.4 心肌炎
CREATE (:disease {name:"心肌炎",definition:"心肌的炎症性疾病"});
MATCH (dc:disease {name:"心肌疾病"}),(d:disease {name:"心肌炎"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.6.4.1 病毒性心肌炎
CREATE (:disease {name:"病毒性心肌炎"});
MATCH (dc:disease {name:"心肌炎"}),(d:disease {name:"病毒性心肌炎"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);



//三、病因
//3.6.1 扩张型心肌病
CREATE (:cause {name:"柯萨奇病毒B",disease:"扩张型心肌病"});
CREATE (:cause {name:"ECHO病毒",disease:"扩张型心肌病"});
CREATE (:cause {name:"细小病毒B-19",disease:"扩张型心肌病"});
CREATE (:cause {name:"人疱疹病毒6型",disease:"扩张型心肌病"});
CREATE (:cause {name:"脊髓灰质炎病毒",disease:"扩张型心肌病"});
CREATE (:cause {name:"流感病毒",disease:"扩张型心肌病"});
CREATE (:cause {name:"腺病毒",disease:"扩张型心肌病"});
CREATE (:cause {name:"巨细胞病毒",disease:"扩张型心肌病"});
CREATE (:cause {name:"单纯疱疹病毒",disease:"扩张型心肌病"});
CREATE (:cause {name:"EB病毒",disease:"扩张型心肌病"});
CREATE (:cause {name:"人免疫缺陷病毒",disease:"扩张型心肌病"});
CREATE (:cause {name:"结节病",disease:"扩张型心肌病"});
CREATE (:cause {name:"巨细胞性",disease:"扩张型心肌病"});
CREATE (:cause {name:"过敏",disease:"扩张型心肌病"});
CREATE (:cause {name:"多发性肌炎",disease:"扩张型心肌病"});
CREATE (:cause {name:"皮炎",disease:"扩张型心肌病"});
CREATE (:cause {name:"系统性血管炎",disease:"扩张型心肌病"});
CREATE (:cause {name:"系统性红斑狼疮",disease:"扩张型心肌病"});
CREATE (:cause {name:"嗜酒",disease:"扩张型心肌病"});
CREATE (:cause {name:"蔥环类抗癌药物",disease:"扩张型心肌病"});
CREATE (:cause {name:"锂制剂",disease:"扩张型心肌病"});
CREATE (:cause {name:"依米丁",disease:"扩张型心肌病"});
CREATE (:cause {name:"克山病",disease:"扩张型心肌病"});
CREATE (:cause {name:"嗜铬细胞瘤",disease:"扩张型心肌病"});
CREATE (:cause {name:"甲状腺疾病",disease:"扩张型心肌病"});
CREATE (:cause {name:"遗传",disease:"扩张型心肌病"});
CREATE (:cause {name:"围生期",disease:"扩张型心肌病"});
CREATE (:cause {name:"Duchenne型肌营养不良",disease:"扩张型心肌病"});
CREATE (:cause {name:"Backer型肌营养不良",disease:"扩张型心肌病"});

MATCH (d:disease {name:"扩张型心肌病"}),(c:cause {disease:"扩张型心肌病"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//3.6.3 限制型心肌病
CREATE (:cause {name:"淀粉样变性",disease:"限制型心肌病"});
CREATE (:cause {name:"结节病",disease:"限制型心肌病"});
CREATE (:cause {name:"血色病",disease:"限制型心肌病"});
CREATE (:cause {name:"糖原贮积症",disease:"限制型心肌病"});
CREATE (:cause {name:"戈谢病",disease:"限制型心肌病"});
CREATE (:cause {name:"Fabry病",disease:"限制型心肌病"});
CREATE (:cause {name:"硬皮病",disease:"限制型心肌病"});
CREATE (:cause {name:"糖尿病心肌病",disease:"限制型心肌病"});
CREATE (:cause {name:"心内膜弹力纤维增生症",disease:"限制型心肌病"});
CREATE (:cause {name:"高嗜酸性粒细胞综合征",disease:"限制型心肌病"});
CREATE (:cause {name:"放射",disease:"限制型心肌病"});
CREATE (:cause {name:"蔥环类抗生素",disease:"限制型心肌病"});
CREATE (:cause {name:"癌样心脏病",disease:"限制型心肌病"});
CREATE (:cause {name:"转移性癌",disease:"限制型心肌病"});
MATCH (d:disease {name:"限制型心肌病"}),(c:cause {disease:"限制型心肌病"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//3.6.4 心肌炎
CREATE (:cause {name:"病毒感染",disease:"心肌炎"});
CREATE (:cause {name:"真菌感染",disease:"心肌炎"});
CREATE (:cause {name:"螺旋体感染",disease:"心肌炎"});
CREATE (:cause {name:"立克次氏体感染",disease:"心肌炎"});
CREATE (:cause {name:"原虫感染",disease:"心肌炎"});
CREATE (:cause {name:"蠕虫感染",disease:"心肌炎"});
CREATE (:cause {name:"药物",disease:"心肌炎"});
CREATE (:cause {name:"毒物",disease:"心肌炎"});
CREATE (:cause {name:"放射",disease:"心肌炎"});
CREATE (:cause {name:"结缔组织病",disease:"心肌炎"});
CREATE (:cause {name:"血管炎",disease:"心肌炎"});
CREATE (:cause {name:"巨细胞心肌炎",disease:"心肌炎"});
CREATE (:cause {name:"结节病",disease:"心肌炎"});
MATCH (d:disease {name:"心肌炎"}),(c:cause {disease:"心肌炎"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

//3.6.4.1 病毒性心肌炎
CREATE (:cause {name:"柯萨奇B组病毒",disease:"病毒性心肌炎"});
CREATE (:cause {name:"细小病毒B-19",disease:"病毒性心肌炎"});
CREATE (:cause {name:"孤儿（Echo）病毒",disease:"病毒性心肌炎"});
CREATE (:cause {name:"脊髓灰质炎病毒",disease:"病毒性心肌炎"});
CREATE (:cause {name:"人类腺病毒",disease:"病毒性心肌炎"});
CREATE (:cause {name:"流感",disease:"病毒性心肌炎"});
CREATE (:cause {name:"风疹",disease:"病毒性心肌炎"});
CREATE (:cause {name:"单纯疱疹",disease:"病毒性心肌炎"});
CREATE (:cause {name:"脑炎",disease:"病毒性心肌炎"});
CREATE (:cause {name:"肝炎（A、B、C型）病毒",disease:"病毒性心肌炎"});
CREATE (:cause {name:"EB病毒",disease:"病毒性心肌炎"});
CREATE (:cause {name:"巨细胞病毒",disease:"病毒性心肌炎"});
CREATE (:cause {name:"人类免疫缺陷（HIV）病毒",disease:"病毒性心肌炎"});
MATCH (d:disease {name:"病毒性心肌炎"}),(c:cause {disease:"病毒性心肌炎"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);


//五、临床表现
//5.6.1 扩张型心肌病
CREATE (:symptom {characteristic:"呼吸困难",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"活动耐量下降",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"夜间阵发性呼吸困难",comment:"左心功能不全",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"端坐呼吸",comment:"左心功能不全",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"食欲下降",comment:"右心功能不全",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"腹胀",comment:"右心功能不全",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"下肢水肿",comment:"右心功能不全",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"心悸",comment:"合并心律失常",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"头晕",comment:"合并心律失常",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"黑矇",comment:"合并心律失常",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"猝死",comment:"合并心律失常",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"持续顽固低血压",comment:"DCM终末期",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"栓塞",comment:"相应脏器受累",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"心界扩大",,disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"心音减弱",,disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"第三心音",,disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"第四心音",,disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"心率快时呈奔马律",,disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"心尖部闻及收缩期杂音",,disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"肺部湿啰音",,disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"哮鸣音",comment:"心衰加重/急性左心衰竭",,disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"颈静脉怒张",comment:"右心衰竭",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"肝大",comment:"右心衰竭",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"外周水肿",comment:"右心衰竭",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"肝硬化",comment:"长期肝瘀血",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"胆汁淤积",comment:"长期肝瘀血",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"黄疸",comment:"长期肝瘀血",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"皮肤湿冷",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"心影增大",examination:"胸部X线检查",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"心胸比>50%",examination:"胸部X线检查",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"肺瘀血",examination:"胸部X线检查",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"肺水肿",examination:"胸部X线检查",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"肺动脉压力增高",examination:"胸部X线检查",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"胸腔积液",examination:"胸部X线检查",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"R波递增不良",examination:"心电图",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"室内传导阻滞",examination:"心电图",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"左束支传导阻滞",examination:"心电图",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"QRS波增宽",comment:"预后不良",examination:"心电图",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"病理性Q波",comment:"严重的左心室纤维化",examination:"心电图",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"ST段压低",examination:"心电图",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"T波倒置",examination:"心电图",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"期前收缩",examination:"心电图",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"非持续性室速",examination:"心电图",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"房颤",examination:"心电图",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"心律失常",examination:"心电图",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"左心室扩大",examination:"超声心动图",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"各心腔均扩大",examination:"超声心动图",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"室壁运动减弱",examination:"超声心动图",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"心肌收缩功能下降",examination:"超声心动图",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"左心室射血分数显著降低 ",examination:"超声心动图",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"瓣膜关闭不全",examination:"超声心动图",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"舒张末期和收缩末期左心室容积增大",examination:"核素血池扫描",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"左心室射血分数降低",examination:"核素血池扫描",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"冠状动脉狭窄病变",examination:"CTA",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"脑钠肽（BNP）升高",examination:"血液和血清学检查",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"N末端脑钠肽前体升高（NT-proBNP）",examination:"血液和血清学检查",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"心肌肌钙蛋白I轻度升高",examination:"血液和血清学检查",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"左、右舒张末期压增高",examination:"心导管检查",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"左心房压增高",examination:"心导管检查",disease:"扩张型心肌病"});
CREATE (:symptom {characteristic:"肺毛细血管楔压增高",examination:"心导管检查",disease:"扩张型心肌病"});
MATCH (d:disease {name:"扩张型心肌病"}),(s:symptom {disease:"扩张型心肌病"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//5.6.2 肥厚型心肌病
CREATE (:symptom {characteristic:"劳力性呼吸困难",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"乏力",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"夜间阵发性呼吸困难",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"劳力性胸痛",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"房颤",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"晕厥",comment:"室性快速型心动过速",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"心脏轻度增大",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"第四心音",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"心脏轻度增大",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"胸骨左缘第3~4肋间闻及较粗糙的喷射性收缩期杂音",comment:"流出道梗阻",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"收缩期杂音",comment:"二尖瓣关闭不全",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"心影正常或左心室增大",examination:"胸部X线检查",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"QRS波左心室高电压",examination:"心电图",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"倒置T波",examination:"心电图",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"异常q波",examination:"心电图",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"QRS波左心室高电压",examination:"心电图",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"宽而不深的病理性Q波",examination:"心电图",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"室内传导阻滞",examination:"心电图",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"心律失常",examination:"心电图",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"心室不对称肥厚",examination:"超声心动图",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"无心室腔增大",examination:"超声心动图",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"室间隔流出道部分向左心室内突出",comment:"伴有流出道梗阻",examination:"超声心动图",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"二尖瓣前叶在收缩期前移",comment:"伴有流出道梗阻",examination:"超声心动图",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"左心室舒张功能障碍",comment:"伴有流出道梗阻",examination:"超声心动图",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"心室壁局限性或普遍性增厚",examination:"心脏磁共振",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"心肌呈片状强化",examination:"同位素轧延迟增强扫描",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"左心室流出道狭窄",comment:"梗阻性HCM",examination:"心脏磁共振",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"SAM征",comment:"梗阻性HCM",examination:"心脏磁共振",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"二尖瓣关闭不全",comment:"梗阻性HCM",examination:"心脏磁共振",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"左心室舒张末期压力增高",examination:"心导管检查",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"心室腔与流出道之间存在收缩期压力阶差",comment:"左心室流出道狭窄",examination:"心导管检查",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"左心室变形",examination:"心室造影",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"冠状动脉造影无异常",comment:"冠状动脉造影",examination:"心导管检查",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"心肌细胞肥大",examination:"心内膜心肌活检",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"心肌细胞排列紊乱",examination:"心内膜心肌活检",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"心肌细胞局限性",examination:"心内膜心肌活检",disease:"肥厚型心肌病"});
CREATE (:symptom {characteristic:"心肌细胞弥散性间质纤维化",examination:"心内膜心肌活检",disease:"肥厚型心肌病"});

//5.6.3 限制型心肌病
CREATE (:symptom {characteristic:"活动耐力下降",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"乏力",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"呼吸困难",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"肝大",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"腹腔积液",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"全身水肿",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"右心衰较重",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"颈静脉怒张",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"奔马律",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"血压低",comment:"预后不良",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"肝大",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"移动性浊音浑浊",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"下肢凹陷性水肿",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"尿本周蛋白",comment:"淀粉样变性",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"BNP升高",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"低电压",comment:"心肌淀粉样变",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"QRS波异常",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"ST-T改变",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"双心房扩大",examination:"超声心动图",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"心室肥厚",examination:"超声心动图",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"心肌呈磨玻璃样改变",comment:"心肌淀粉样变",examination:"超声心动图",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"ST-T改变",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"心包钙化",examination:"X线胸片",disease:"限制型心肌病"});
CREATE (:symptom {characteristic:"心包钙化",examination:"X线胸片",disease:"限制型心肌病"});


//5.6.4.1 病毒性心肌炎
CREATE (:symptom {characteristic:"猝死",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"发热",comment:"前驱症状",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"全身倦怠感",comment:"前驱症状",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"肌肉酸痛",comment:"前驱症状",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"恶心",comment:"前驱症状",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"呕吐",comment:"前驱症状",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"心悸",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"胸痛",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"呼吸困难",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"水肿",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"晕厥",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"心律失常",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"阿斯综合征",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"房性期前收缩",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"室性期前收缩",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"房室传导阻滞",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"心律增快，与体温不相称",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"第三心音",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"第四心音",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"奔马律",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"心尖部闻及收缩期吹风样杂音",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"颈静脉怒张",comment:"心衰",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"肺部湿啰音",comment:"心衰",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"肝大",comment:"心衰",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"血压降低",comment:"重症",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"四肢湿冷",comment:"重症",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"心源性休克",comment:"重症",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"心影增大",examination:"胸部X线检查",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"烧瓶样改变",comment:"有心包积液",examination:"胸部X线检查",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"ST-T改变",examination:"心电图",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"ST轻度移位",examination:"心电图",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"T波倒置",examination:"心电图",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"aVR导联以外的ST段广泛抬高",examination:"心电图",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"病理性Q波",examination:"心电图",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"室性心律失常",examination:"心电图",disease:"病毒性心肌炎"});
CREATE (:symptom {characteristic:"房室传导阻滞",examination:"心电图",disease:"病毒性心肌炎"});

//七、辅助检查

//八、合并症
//九、鉴别诊断
//9.6.1 扩张型心肌病
CREATE (:differential_diagnosis {name:"心脏瓣膜病",symptom:"心脏扩大/收缩功能减低",disease:"扩张型心肌病"});
CREATE (:differential_diagnosis {name:"高血压性心脏病",symptom:"心脏扩大/收缩功能减低",disease:"扩张型心肌病"});
CREATE (:differential_diagnosis {name:"冠心病",symptom:"心脏扩大/收缩功能减低",disease:"扩张型心肌病"});
CREATE (:differential_diagnosis {name:"先天性心脏病",symptom:"心脏扩大/收缩功能减低",disease:"扩张型心肌病"});
MATCH (d:disease {name:"扩张型心肌病"}),(dd:differential_diagnosis {disease:"扩张型心肌病"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);

//9.6.2 肥厚型心肌病
CREATE (:differential_diagnosis {name:"高血压性心脏病",symptom:"心室肥厚",disease:"肥厚型心肌病"});
CREATE (:differential_diagnosis {name:"主动脉瓣狭窄",symptom:"心室肥厚",disease:"肥厚型心肌病"});
CREATE (:differential_diagnosis {name:"先天性心脏病",symptom:"心室肥厚",disease:"肥厚型心肌病"});
CREATE (:differential_diagnosis {name:"淀粉样变",symptom:"心肌肥厚",disease:"肥厚型心肌病"});
CREATE (:differential_diagnosis {name:"糖原贮积症",symptom:"心肌肥厚",disease:"肥厚型心肌病"});
CREATE (:differential_diagnosis {name:"嗜铬细胞瘤",symptom:"心肌肥厚",disease:"肥厚型心肌病"});
CREATE (:differential_diagnosis {name:"Fabry病",symptom:"心肌肥厚",disease:"肥厚型心肌病"});
CREATE (:differential_diagnosis {name:"血色病",symptom:"心肌肥厚",disease:"肥厚型心肌病"});
CREATE (:differential_diagnosis {name:"心面综合征",symptom:"心肌肥厚",disease:"肥厚型心肌病"});
CREATE (:differential_diagnosis {name:"线粒体肌病",symptom:"心肌肥厚",disease:"肥厚型心肌病"});
CREATE (:differential_diagnosis {name:"Danon病",symptom:"心肌肥厚",disease:"肥厚型心肌病"});
CREATE (:differential_diagnosis {name:"遗传性共济失调",symptom:"心肌肥厚",disease:"肥厚型心肌病"});
CREATE (:differential_diagnosis {name:"遗传性代谢性疾病",symptom:"心肌肥厚",disease:"肥厚型心肌病"});
MATCH (d:disease {name:"肥厚型心肌病"}),(dd:differential_diagnosis {disease:"肥厚型心肌病"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);

//9.6.4.1 病毒性心肌炎
CREATE (:differential_diagnosis {name:"甲状腺功能亢进",disease:"病毒性心肌炎"});
CREATE (:differential_diagnosis {name:"二尖瓣脱垂综合征",disease:"病毒性心肌炎"});
CREATE (:differential_diagnosis {name:"结缔组织病",disease:"病毒性心肌炎"});
CREATE (:differential_diagnosis {name:"血管炎",disease:"病毒性心肌炎"});
CREATE (:differential_diagnosis {name:"药物及毒物引起的心肌炎",disease:"病毒性心肌炎"});
MATCH (d:disease {name:"病毒性心肌炎"}),(dd:differential_diagnosis {disease:"病毒性心肌炎"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);

//十、药物

//十一、鉴别诊断