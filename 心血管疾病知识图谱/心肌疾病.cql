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
//7.6.1 扩张型心肌病
CREATE (:examination {name:"胸部X线检查",information:"心影/肺淤血/肺水肿/肺动脉压力增高/胸腔积液",disease:"扩张型心肌病"});
CREATE (:examination {name:"心电图",information:"R波递增不良/室内传导阻滞/左束支传导阻滞",disease:"扩张型心肌病"});
CREATE (:examination {name:"超声心动图",information:"左心室扩大",disease:"扩张型心肌病"});
CREATE (:examination {name:"心脏磁共振",english_name:"CMR",information:"鉴别浸润性心肌病、致心律失常型右心室心肌病、心肌致密化不全、心肌炎、结节病等疾病",disease:"扩张型心肌病"});
CREATE (:examination {name:"运动或药物负荷心肌显像",information:"除外冠状动脉疾病引起的缺血性心肌病",disease:"扩张型心肌病"});
CREATE (:examination {name:"核素血池扫描",information:"舒张末期和收缩末期左心室容积增大，左心室射血分数降低",disease:"扩张型心肌病"});
CREATE (:examination {name:"冠状动脉CT检查",enlish_name:"CTA",information:"冠状动脉狭窄等病变",disease:"扩张型心肌病"});
CREATE (:examination {name:"冠状动脉造影",information:"除外冠状动脉性心脏病",disease:"扩张型心肌病"});
CREATE (:examination {name:"心导管检查",disease:"扩张型心肌病"});
CREATE (:examination {name:"心内膜心肌活检",english_name:"EMB",information:"爆发性淋巴细胞心肌炎/巨噬细胞心肌炎",disease:"扩张型心肌病"});
MATCH (d:disease {name:"扩张型心肌病"}),(rt:examination {disease:"扩张型心肌病"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

CREATE (:laboratory_test {name:"脑钠肽",english_name:"BNP",information:"脑钠肽升高",disease:"扩张型心肌病"});
CREATE (:laboratory_test {name:"N末端脑钠肽前体",english_name:"NT-proBNP",information:"脑钠肽升高",disease:"扩张型心肌病"});
CREATE (:laboratory_test {name:"心肌肌钙蛋白I",information:"心肌肌钙蛋白I轻度升高",disease:"扩张型心肌病"});
CREATE (:laboratory_test {name:"血常规",information:"贫血",disease:"扩张型心肌病"});
CREATE (:laboratory_test {name:"电解质",information:"电解质失衡",disease:"扩张型心肌病"});
CREATE (:laboratory_test {name:"肝肾功能",information:"肝硬化及肾功能不全",disease:"扩张型心肌病"});
MATCH (d:disease {name:"扩张型心肌病"}),(rt:laboratory_test {disease:"扩张型心肌病"}) CREATE (d)-[:disease_laboratory_test {reference:"内科学第九版"}]->(rt);

//7.6.2 肥厚型心肌病
CREATE (:examination {name:"胸部X线检查",information:"心影正常大小/左心室增大",disease:"肥厚型心肌病"});
CREATE (:examination {name:"心电图",information:"QRS波左心室高电压/导致T波/异常q波",disease:"肥厚型心肌病"});
CREATE (:examination {name:"超声心动图",information:"心室不对称肥厚而无心室腔增大",disease:"肥厚型心肌病"});
CREATE (:examination {name:"心脏磁共振",english_name:"CMR",information:"心室壁局限性或普遍性增厚",disease:"肥厚型心肌病"});
CREATE (:examination {name:"同位素轧延迟增强扫描",information:"心肌呈片状强化/梗阻性HCM可见左心室流出道狭窄/SAM征/二尖瓣关闭不全",disease:"肥厚型心肌病"});
CREATE (:examination {name:"心导管检查",information:"左心室舒张末期压力增高",disease:"肥厚型心肌病"});
CREATE (:examination {name:"冠状动脉造影",information:"除外疑似心绞痛症状和心动图ST-T改变的病人",disease:"肥厚型心肌病"});
CREATE (:examination {name:"心内膜心肌活检",information:"心肌细胞肥大、排列紊乱、局限性或弥散性间质纤维化",disease:"肥厚型心肌病"});
MATCH (d:disease {name:"肥厚型心肌病"}),(rt:examination {disease:"肥厚型心肌病"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

//7.6.3 限制型心肌病
CREATE (:laboratory_test {name:"尿本周蛋白",information:"淀粉样变性",disease:"限制型心肌病"});
CREATE (:laboratory_test {name:"脑钠肽",english_name:"BNP",information:"BNP明显增高",disease:"限制型心肌病"});
CREATE (:examination {name:"心电图",information:"低电压/QRS波异常/ST-T改变",disease:"限制型心肌病"});
CREATE (:examination {name:"超声心动图",information:"双心房扩大/心室肥厚/心肌磨玻璃样改变",disease:"限制型心肌病"});
CREATE (:examination {name:"X线胸片",information:"心包钙化",disease:"限制型心肌病"});
CREATE (:examination {name:"CTA",information:"冠状动脉狭窄",disease:"限制型心肌病"});
CREATE (:examination {name:"CMR",information:"心肌内呈颗粒样的轧延迟显像",disease:"限制型心肌病"});
CREATE (:examination {name:"心导管检查",information:"肺动脉压明显增高（常>50mmHg）/舒张压变化较大/右心室舒张压相对较低",disease:"限制型心肌病"});
CREATE (:examination {name:"心内膜心肌活检",information:"心肌淀粉样变性/高嗜酸性粒细胞综合征",disease:"限制型心肌病"});
MATCH (d:disease {name:"限制型心肌病"}),(rt:laboratory_test {disease:"限制型心肌病"}) CREATE (d)-[:disease_laboratory_test {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"限制型心肌病"}),(rt:examination {disease:"限制型心肌病"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

//7.6.4.1 病毒性心肌炎
CREATE (:examination {name:"胸部X线检查",information:"心影扩大/有心包积液烧瓶样改变",disease:"病毒性心肌炎"});
CREATE (:examination {name:"心电图",information:"ST-T改变",disease:"病毒性心肌炎"});
CREATE (:examination {name:"超声心动图",information:"左心室正常或增大/室壁运动减低/左心室收缩功能减低/附壁血栓/心包积液",disease:"病毒性心肌炎"});
CREATE (:examination {name:"心脏磁共振",information:"水肿/心肌充血/心外膜下或心肌中层片状强化",disease:"病毒性心肌炎"});
CREATE (:examination {name:"心内膜心肌活检",english_name:"EMB",disease:"病毒性心肌炎"});

CREATE (:laboratory_test {name:"心肌肌酸激酶",english_name:"CK-MB",information:"心肌损伤标志物",disease:"病毒性心肌炎"});
CREATE (:laboratory_test {name:"肌酐蛋白T或I",information:"心肌损伤标志物",disease:"病毒性心肌炎"});
CREATE (:laboratory_test {name:"非特异性炎症指标检测",information:"红细胞沉降率增快/C反应蛋白等非特异性炎症指标升高",disease:"病毒性心肌炎"});
CREATE (:laboratory_test {name:"病毒血清学检测",information:"心内膜、心肌或心包组织内病毒、病毒抗原、病毒基因片段或病毒蛋白",disease:"病毒性心肌炎"});
MATCH (d:disease {name:"病毒性心肌炎"}),(rt:laboratory_test {disease:"病毒性心肌炎"}) CREATE (d)-[:disease_laboratory_test {reference:"内科学第九版"}]->(rt);
MATCH (d:disease {name:"病毒性心肌炎"}),(rt:examination {disease:"病毒性心肌炎"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);

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
//9.6.3 限制型心肌病
CREATE (:differential_diagnosis {name:"缩窄性心包炎",symptom:"临床表现/血流动力学改变",disease:"限制型心肌病"});
MATCH (d:disease {name:"限制型心肌病"}),(dd:differential_diagnosis {disease:"限制型心肌病"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);

//9.6.4.1 病毒性心肌炎
CREATE (:differential_diagnosis {name:"甲状腺功能亢进",disease:"病毒性心肌炎"});
CREATE (:differential_diagnosis {name:"二尖瓣脱垂综合征",disease:"病毒性心肌炎"});
CREATE (:differential_diagnosis {name:"结缔组织病",disease:"病毒性心肌炎"});
CREATE (:differential_diagnosis {name:"血管炎",disease:"病毒性心肌炎"});
CREATE (:differential_diagnosis {name:"药物及毒物引起的心肌炎",disease:"病毒性心肌炎"});
MATCH (d:disease {name:"病毒性心肌炎"}),(dd:differential_diagnosis {disease:"病毒性心肌炎"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);

//十、药物
//10.6.1 扩张型心肌病
CREATE (:drug {name:"ACEI",disease:"扩张型心肌病",indication:"LVEF<40%的心力衰竭病人",aim:"治疗心力衰竭"});
CREATE (:drug {name:"ARB",disease:"扩张型心肌病",indication:"LVEF<40%的心力衰竭病人，ACEI不耐受",aim:"治疗心力衰竭"});
CREATE (:drug {name:"卡维地洛",disease:"扩张型心肌病",indication:"LVEF<40%的心力衰竭病人",aim:"治疗心力衰竭"});
CREATE (:drug {name:"琥珀酸美托洛尔",disease:"扩张型心肌病",indication:"LVEF<40%的心力衰竭病人",aim:"治疗心力衰竭"});
CREATE (:drug {name:"比索洛尔",disease:"扩张型心肌病",indication:"LVEF<40%的心力衰竭病人",aim:"治疗心力衰竭"});
CREATE (:drug {name:"依普利酮",disease:"扩张型心肌病",indication:" ACEI和β受体拈抗剂基础上仍有症状且无肾功能严重受损的病人",aim:"治疗心力衰竭"});
CREATE (:drug {name:"螺内酯",disease:"扩张型心肌病",indication:" ACEI和β受体拈抗剂基础上仍有症状且无肾功能严重受损的病人",aim:"治疗心力衰竭",side_effect:"引起少数男性病人乳房发育"});
CREATE (:drug {name:"肼屈嗪和二硝酸异山梨酯",disease:"扩张型心肌病",indication:"ACEI和ARB不能耐受病人",aim:"治疗心力衰竭"});
CREATE (:drug {name:"伊伐布雷定",disease:"扩张型心肌病",indication:"LVEF≤30%，窦性心率仍≥70次/分的病人，不能耐受β受体括抗剂或有使用禁忌",aim:"治疗心力衰竭"});
CREATE (:drug {name:"血管紧张素受体脑啡肤酶抑制剂",english_name:"ARNI",disease:"扩张型心肌病",indication:"射血分数减低的心衰病人经过ACEI、β受体拮抗剂和醛固酮拮抗剂充分治疗后病人仍有症状",aim:"治疗心力衰竭"});
CREATE (:drug {name:"呋塞米",dosage:"每日20mg",disease:"扩张型心肌病",aim:"治疗心力衰竭"});
CREATE (:drug {name:"氢氧噻嗪",dosage:"每日25mg",disease:"扩张型心肌病",aim:"治疗心力衰竭"});
CREATE (:drug {name:"洋地黄",dosage:"每日25mg",disease:"扩张型心肌病",indication:"ACE（ARB）受体桔抗剂、MRA治疗后仍有症状，或者不能耐受β受体拮抗剂的病人",aim:"治疗心力衰竭"});
CREATE (:drug {name:"洋地黄",dosage:"每日25mg",disease:"扩张型心肌病",indication:"ACE（ARB）受体桔抗剂、MRA治疗后仍有症状，或者不能耐受β受体拮抗剂的病人",aim:"治疗心力衰竭"});
CREATE (:drug {name:"华法林",disease:"扩张型心肌病",indication:"有房颤或已经有附壁血栓形成或有血栓栓塞病史的病人",aim:"抗凝治疗"});
CREATE (:drug {name:"新型口服抗凝药物",disease:"扩张型心肌病",indication:"有房颤或已经有附壁血栓形成或有血栓栓塞病史的病人",aim:"抗凝治疗"});
CREATE (:drug {name:"ACEI、ARB、MRA合用",prohibit_disease:"扩张型心肌病"});
CREATE (:drug {name:"噻唑烷二酮类",prohibit_disease:"扩张型心肌病",side_effect:"加重心力衰竭"});
CREATE (:drug {name:"格列酮类",prohibit_disease:"扩张型心肌病",side_effect:"加重心力衰竭"});
CREATE (:drug {name:"NSAIDs",prohibit_disease:"扩张型心肌病",side_effect:"水钠潴留"});
CREATE (:drug {name:"COX-2抑制剂",prohibit_disease:"扩张型心肌病",side_effect:"水钠潴留"});
CREATE (:drug {name:"地尔硫䓬",prohibit_disease:"扩张型心肌病",side_effect:"负性肌力"});
CREATE (:drug {name:"维拉帕米",prohibit_disease:"扩张型心肌病",side_effect:"负性肌力"});
MATCH (ds:disease {name:"扩张型心肌病"}),(dg:drug {disease:"扩张型心肌病"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
MATCH (ds:disease {name:"扩张型心肌病"}),(dg:drug {prohibit_disease:"扩张型心肌病"}) CREATE (ds)-[:disease_prohibit_drug {reference:"内科学第九版"}]->(dg);
//10.6.2 肥厚型心肌病
CREATE (:drug {name:"β受体拮抗剂",disease:"肥厚型心肌病",indication:"梗阻性HCM",aim:"减轻左心室流出道梗阻"});
CREATE (:drug {name:"非二氢吡啶类钙通道阻滞剂",disease:"肥厚型心肌病",indication:"梗阻性HCM，不能耐受β受体桔抗剂",aim:"减轻左心室流出道梗阻"});
CREATE (:drug {name:"丙吡胺",disease:"肥厚型心肌病",indication:"梗阻性HCM",side_effect:"口干、眼干、便秘等心脏外副作用",aim:"减轻左心室流出道梗阻"});
CREATE (:drug {name:"ACEI",disease:"肥厚型心肌病",indication:"左心室扩大/左心室收缩功能减低/慢性心功能不全",aim:"治疗心力衰竭"});
CREATE (:drug {name:"ARB",disease:"肥厚型心肌病",indication:"左心室扩大/左心室收缩功能减低/慢性心功能不全",aim:"治疗心力衰竭"});
CREATE (:drug {name:"β受体拮抗剂",disease:"肥厚型心肌病",indication:"左心室扩大/左心室收缩功能减低/慢性心功能不全",aim:"治疗心力衰竭"});
CREATE (:drug {name:"利尿剂",disease:"肥厚型心肌病",indication:"左心室扩大/左心室收缩功能减低/慢性心功能不全",aim:"治疗心力衰竭"});
CREATE (:drug {name:"螺内酯",disease:"肥厚型心肌病",indication:"左心室扩大/左心室收缩功能减低/慢性心功能不全",aim:"治疗心力衰竭"});
CREATE (:drug {name:"地高辛",disease:"肥厚型心肌病",indication:"左心室扩大/左心室收缩功能减低/慢性心功能不全",aim:"治疗心力衰竭"});
CREATE (:drug {name:"胺碘酮",disease:"肥厚型心肌病",indication:"阵发性房颤",aim:"能减少阵发性房颤发作"});
CREATE (:drug {name:"β受体拮抗剂",disease:"肥厚型心肌病",indication:"持续性房颤",aim:"控制心室率"});
CREATE (:drug {name:"抗凝药",disease:"肥厚型心肌病",indication:"房颤",aim:"房颤治疗"});
MATCH (ds:disease {name:"肥厚型心肌病"}),(dg:drug {disease:"肥厚型心肌病"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//10.6.4.1 病毒性心肌炎
CREATE (:drug {name:"利尿剂",disease:"病毒性心肌炎",indication:"出现心力衰竭"});
CREATE (:drug {name:"血管扩张剂",disease:"病毒性心肌炎",indication:"出现心力衰竭"});
CREATE (:drug {name:"ACEI",disease:"病毒性心肌炎",indication:"出现心力衰竭"});
CREATE (:drug {name:"抗心律失常药物",disease:"病毒性心肌炎",indication:"出现快速型心律失常"});
CREATE (:drug {name:"腺苷三磷酸",disease:"病毒性心肌炎",aim:"促进心肌代谢"});
CREATE (:drug {name:"辅酶A",disease:"病毒性心肌炎",aim:"促进心肌代谢"});
CREATE (:drug {name:"环腺苷酸",disease:"病毒性心肌炎",aim:"促进心肌代谢"});
MATCH (ds:disease {name:"病毒性心肌炎"}),(dg:drug {disease:"病毒性心肌炎"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);


//十一、鉴别诊断
//11.6.1 扩张型心肌病
CREATE (:treatment {name:"心力衰竭的心脏再同步化治疗",english_name:"CRT",indication:"心力衰竭病人",disease:"扩张型心肌病"});
CREATE (:treatment {name:"心脏移植",english_name:"CRT",indication:"严重心力衰竭内科治疗无效",disease:"扩张型心肌病"});
CREATE (:treatment {name:"左心机械辅助循环",indication:"心脏移植等待期",aim:"改善循环",disease:"扩张型心肌病"});
CREATE (:treatment {name:"左心室成形术",indication:"心脏移植等待期",aim:"减轻反流、改善心功能",disease:"扩张型心肌病"});
CREATE (:treatment {name:"植入型心律转复除颤器",english_name:"ICD",indication:"有持续性室速/有室速、室颤导致的心跳骤停史/LVEF≤35%，NYHA心功能评分Ⅱ~Ⅲ级，预期生存时间＞1年，且有一定生活质量",disease:"扩张型心肌病",aim:"预防心脏猝死"});
MATCH (d:disease {name:"扩张型心肌病"}),(t:treatment {disease:"扩张型心肌病"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.6.2 肥厚型心肌病
CREATE (:treatment {name:"室间隔切除术",indication:"药物治疗无效，心功能不全（NYHA Ⅲ~Ⅳ级）病人，存在严重流出道梗阻（静息或运动时流出道压力阶差大于50mmg） ",disease:"肥厚型心肌病"});
CREATE (:treatment {name:"酒精室间隔消融术",indication:"药物治疗无效，心功能不全（NYHA Ⅲ~Ⅳ级）病人，存在严重流出道梗阻（静息或运动时流出道压力阶差大于50mmg） ",aim:"改善心力衰竭",disease:"肥厚型心肌病"});
CREATE (:treatment {name:"右心室心尖起搏",indication:"其他病因有双腔起搏置入适应证的病人",aim:"减轻左心室流出道梗阻",disease:"肥厚型心肌病"});
CREATE (:treatment {name:"双腔起搏",indication:"药物治疗效果差而又不太适合手术或消融的病人",disease:"肥厚型心肌病"});
CREATE (:treatment {name:"猝死风险评估和ICD预防",indication:"青年和运动员",disease:"肥厚型心肌病"});
MATCH (d:disease {name:"肥厚型心肌病"}),(t:treatment {disease:"肥厚型心肌病"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.6.3 限制型心肌病
CREATE (:treatment {name:"避免劳累、呼吸道感染等心力衰竭的诱因",indication:"原发性RCM",disease:"限制型心肌病"});
CREATE (:treatment {name:"针对病因的特异性治疗",indication:"继发性RCM",disease:"限制型心肌病"});
MATCH (d:disease {name:"限制型心肌病"}),(t:treatment {disease:"限制型心肌病"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
//11.6.4.1 病毒性心肌炎
CREATE (:treatment {name:"避免劳累，适当休息",disease:"病毒性心肌炎"});
CREATE (:treatment {name:"临时心脏起搏器",indication:"高度房室传导阻滞或窦房结功能损害而出现晕厥或明显低血压",disease:"病毒性心肌炎"});
CREATE (:treatment {name:"特异性抗病毒治疗",disease:"病毒性心肌炎"});
MATCH (d:disease {name:"病毒性心肌炎"}),(t:treatment {disease:"病毒性心肌炎"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
