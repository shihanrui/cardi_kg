MATCH (n) detach delete n;

//1.11 周围血管病
CREATE (:disease {name:"周围血管病"});
//1.11.2 闭塞性周围动脉粥样硬化
CREATE (:disease {name:"闭塞性周围动脉粥样硬化",definition:"PAD"});
MATCH (dc:disease {name:"周围血管病"}),(d:disease {name:"闭塞性周围动脉粥样硬化"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);
//1.11.3 静脉血栓症
CREATE (:disease {name:"静脉血栓症",english_name:"VTE"});
MATCH (dc:disease {name:"周围血管病"}),(d:disease {name:"静脉血栓症"}) CREATE (dc)-[:include_disease {reference:"内科学第九版"}]->(d);

//二、风险因子
CREATE (:risk_factor {name:"年齡>40",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:risk_factor {name:"男性",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:risk_factor {name:"血脂异常",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:risk_factor {name:"高血压",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:risk_factor {name:"高半胱氨酸血症",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:risk_factor {name:"肌纤维发育不良累计下肢动脉",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:risk_factor {name:"吸烟",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:risk_factor {name:"糖耐量异常",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:risk_factor {name:"肥胖",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:risk_factor {name:"家族史",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:risk_factor {name:"A型性格",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:risk_factor {name:"口服避孕药",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:risk_factor {name:"高热量饮食",disease:"闭塞性周围动脉粥样硬化"});
MATCH (d:disease {name:"闭塞性周围动脉粥样硬化"}),(r:risk_factor {disease:"闭塞性周围动脉粥样硬化"}) CREATE (d)-[:disease_risk_factor {reference:"内科学第九版"}]->(r);

//3.11.3 静脉血栓症
CREATE (:cause {name:"抗凝血酶缺乏",disease:"静脉血栓症"});
CREATE (:cause {name:"先天性异常纤维蛋白原血症",disease:"静脉血栓症"});
CREATE (:cause {name:"高同型半胱氨酸血症",disease:"静脉血栓症"});
CREATE (:cause {name:"S蛋白缺乏",disease:"静脉血栓症"});
CREATE (:cause {name:"C蛋白基因突变",disease:"静脉血栓症"});
CREATE (:cause {name:"V因子Leiden 突变",disease:"静脉血栓症"});
CREATE (:cause {name:"Ⅻ因子缺乏",disease:"静脉血栓症"});
CREATE (:cause {name:"凝血酶原基因突变",disease:"静脉血栓症"});
CREATE (:cause {name:"溶酶原缺乏",disease:"静脉血栓症"});
MATCH (d:disease {name:"静脉血栓症"}),(c:cause {disease:"静脉血栓症"}) CREATE (c)<-[:disease_cause {reference:"内科学第九版"}]-(d);

CREATE (:inducement {name:"肥胖",disease:"静脉血栓症"});
CREATE (:inducement {name:"吸烟",disease:"静脉血栓症"});
CREATE (:inducement {name:"创伤",disease:"静脉血栓症"});
CREATE (:inducement {name:"骨折",disease:"静脉血栓症"});
CREATE (:inducement {name:"手术",disease:"静脉血栓症"});
CREATE (:inducement {name:"制动",disease:"静脉血栓症"});
CREATE (:inducement {name:"口服避孕药",disease:"静脉血栓症"});
CREATE (:inducement {name:"妊娠",disease:"静脉血栓症"});
CREATE (:inducement {name:"产后",disease:"静脉血栓症"});
CREATE (:inducement {name:"肾病综合征",disease:"静脉血栓症"});
CREATE (:inducement {name:"糖尿病",disease:"静脉血栓症"});
CREATE (:inducement {name:"心力衰竭",disease:"静脉血栓症"});
CREATE (:inducement {name:"恶性肿瘤化疗",disease:"静脉血栓症"});
CREATE (:inducement {name:"中心静脉置管",disease:"静脉血栓症"});
CREATE (:inducement {name:"脑卒中",disease:"静脉血栓症"});
CREATE (:inducement {name:"脊髓损伤",disease:"静脉血栓症"});
CREATE (:inducement {name:"长途航空旅行",disease:"静脉血栓症"});
MATCH (d:disease {name:"静脉血栓症"}),(c:inducement {disease:"静脉血栓症"}) CREATE (c)<-[:disease_inducement {reference:"内科学第九版"}]-(d);



//5.11.2 闭塞性周围动脉粥样硬化
CREATE (:symptom {characteristic:"间歇性跛行",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:symptom {characteristic:"静息痛",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:symptom {characteristic:"肢体运动后引发局部疼痛、紧束、麻木或无力，停止运动后即缓解",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:symptom {characteristic:"疼痛部位常与病变血管相关",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:symptom {characteristic:"狭窄远端的动脉搏动减弱或消失",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:symptom {characteristic:"狭窄部位可闻及收缩期杂音",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:symptom {characteristic:"连续性杂音",comment:"远端侧支循环形成不良致舒张压很低",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:symptom {characteristic:"患肢温度较低及营养不良",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:symptom {characteristic:"皮肤薄亮",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:symptom {characteristic:"苍白",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:symptom {characteristic:"毛发稀疏",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:symptom {characteristic:"趾甲增厚",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:symptom {characteristic:"水肿",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:symptom {characteristic:"坏疽",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:symptom {characteristic:"肢体位置改变测试肢体自高位下垂到肤色转红时间>10秒和表浅静脉充盈时间>15秒",comment:"动脉有狭窄及侧支形成不良",disease:"闭塞性周围动脉粥样硬化"});
MATCH (d:disease {name:"闭塞性周围动脉粥样硬化"}),(s:symptom {disease:"闭塞性周围动脉粥样硬化"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);

//5.11.3 静脉血栓症
CREATE (:symptom {characteristic:"患肢肿胀",disease:"静脉血栓症"});
CREATE (:symptom {characteristic:"疼痛",disease:"静脉血栓症"});
CREATE (:symptom {characteristic:"血栓部位压痛",disease:"静脉血栓症"});
CREATE (:symptom {characteristic:"淤血",disease:"静脉血栓症"});
CREATE (:symptom {characteristic:"青紫",disease:"静脉血栓症"});
CREATE (:symptom {characteristic:"水肿",disease:"静脉血栓症"});
CREATE (:symptom {characteristic:"青紫",disease:"静脉血栓症"});
CREATE (:symptom {characteristic:"Homans征和Neuhof征阳性",disease:"静脉血栓症"});
CREATE (:symptom {characteristic:"发热",disease:"静脉血栓症"});
CREATE (:symptom {characteristic:"静脉功能不全浅静脉曲张",disease:"静脉血栓症"});
CREATE (:symptom {characteristic:"色素沉着",disease:"静脉血栓症"});
CREATE (:symptom {characteristic:"溃疡",disease:"静脉血栓症"});
CREATE (:symptom {characteristic:"肺栓塞",disease:"静脉血栓症"});
MATCH (d:disease {name:"静脉血栓症"}),(s:symptom {disease:"静脉血栓症"}) CREATE (d)-[:disease_symtom {reference:"内科学第九版"}]->(s);


//6.11.2 闭塞性周围动脉粥样硬化
CREATE (:examination {name:"踝肱指数",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:examination {name:"节段性血压测量",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:examination {name:"运动平板负荷试验",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:examination {name:"多普勒血流速度曲线分析",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:examination {name:"多普勒超声显像",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:examination {name:"磁共振血管造影",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:examination {name:"CT血管造影",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:examination {name:"动脉造影",disease:"闭塞性周围动脉粥样硬化"});
MATCH (d:disease {name:"闭塞性周围动脉粥样硬化"}),(rt:examination {disease:"闭塞性周围动脉粥样硬化"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);
//6.11.3 静脉血栓症
CREATE (:examination {name:"踝肱指数",disease:"静脉血栓症"});
CREATE (:examination {name:"超声检查",disease:"静脉血栓症"});
CREATE (:examination {name:"踝肱指数",disease:"静脉血栓症"});
CREATE (:examination {name:"放射性核素检查",disease:"静脉血栓症"});
CREATE (:examination {name:"阻抗容积描记法",disease:"静脉血栓症"});
CREATE (:examination {name:"静脉血流描记法",disease:"静脉血栓症"});
CREATE (:examination {name:"CT静脉造影",disease:"静脉血栓症"});
CREATE (:examination {name:"深静脉造影",disease:"静脉血栓症"});
CREATE (:examination {name:"血浆D二聚体测定",disease:"静脉血栓症"});
MATCH (d:disease {name:"静脉血栓症"}),(rt:examination {disease:"静脉血栓症"}) CREATE (d)-[:disease_examination {reference:"内科学第九版"}]->(rt);







//九、鉴别诊断
//9.11.2 闭塞性周围动脉粥样硬化
CREATE (:differential_diagnosis {name:"多发性大动脉炎",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:differential_diagnosis {name:"血栓栓塞性脉管炎",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:differential_diagnosis {name:"神经病变",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:differential_diagnosis {name:"下肢静脉曲张",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:differential_diagnosis {name:"椎管狭窄",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:differential_diagnosis {name:"关节炎",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:differential_diagnosis {name:"骨筋膜间隔综合征",disease:"闭塞性周围动脉粥样硬化"});
MATCH (d:disease {name:"闭塞性周围动脉粥样硬化"}),(dd:differential_diagnosis {disease:"闭塞性周围动脉粥样硬化"}) CREATE (d)-[:disease_differential_diagnosis {reference:"内科学第九版"}]->(dd);

//十、药物处理
CREATE (:drug {name:"阿司匹林",disease:"闭塞性周围动脉粥样硬化",aim:"抗血小板治疗"});
CREATE (:drug {name:"氯吡格雷",disease:"闭塞性周围动脉粥样硬化",aim:"抗血小板治疗"});
CREATE (:drug {name:"前列腺素",usage:"静脉滴注",disease:"闭塞性周围动脉粥样硬化",indication:"严重肢体缺血"});
MATCH (ds:disease {name:"闭塞性周围动脉粥样硬化"}),(dg:drug {disease:"闭塞性周围动脉粥样硬化"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);
//6.11.3 静脉血栓症
CREATE (:drug {name:"肝素",disease:"静脉血栓症",aim:"抗凝治疗"});
CREATE (:drug {name:"华法林",disease:"静脉血栓症",aim:"抗凝治疗"});
CREATE (:drug {name:"达比加群酯",disease:"静脉血栓症",aim:"抗凝治疗"});
CREATE (:drug {name:"利伐沙班",disease:"静脉血栓症",aim:"抗凝治疗"});
CREATE (:drug {name:"溶栓药物",disease:"静脉血栓症",indication:"血栓形成早期"});
MATCH (ds:disease {name:"静脉血栓症"}),(dg:drug {disease:"静脉血栓症"}) CREATE (ds)-[:disease_drug {reference:"内科学第九版"}]->(dg);

//十一、非药物处理
CREATE (:treatment {name:"经皮球囊扩张",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:treatment {name:"支架植入",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:treatment {name:"激光血管成形术",disease:"闭塞性周围动脉粥样硬化"});
CREATE (:treatment {name:"人造血管与自体血管旁路移植术",disease:"闭塞性周围动脉粥样硬化"});
MATCH (d:disease {name:"闭塞性周围动脉粥样硬化"}),(t:treatment {disease:"闭塞性周围动脉粥样硬化"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);
CREATE (:treatment {name:"经皮下腔静脉滤器放置术球囊扩张",indication:"因出血倾向不能使用抗凝治疗或深静脉血栓进展迅速已达膝关节以上",aim:"预防肺栓塞",disease:"静脉血栓症"});
MATCH (d:disease {name:"静脉血栓症"}),(t:treatment {disease:"静脉血栓症"}) CREATE (d)-[:disease_treatment {reference:"内科学第九版"}]->(t);










