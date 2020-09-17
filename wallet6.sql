/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : wallet

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 17/09/2020 11:40:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_logs
-- ----------------------------
DROP TABLE IF EXISTS `admin_logs`;
CREATE TABLE `admin_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `before_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `after_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_logs
-- ----------------------------
INSERT INTO `admin_logs` VALUES (33, '编辑角色', '{\"id\":5,\"role_name\":\"测试角色2\",\"introduce\":\"哇哈哈啊哈\",\"create_time\":1598943191,\"delete_time\":null,\"is_default\":0}', '{\"role_name\":\"测试角色2\",\"introduce\":\"哇哈哈啊哈123\"}', 1598945585, 1);
INSERT INTO `admin_logs` VALUES (34, '登录系统', '[]', '[]', 1598950262, 1);
INSERT INTO `admin_logs` VALUES (35, '角色授权', '[9,8,7,5,4,3,2,1]', '[1,2,5,6,7,8,9,10]', 1598952042, 1);
INSERT INTO `admin_logs` VALUES (36, '删除角色', '{\"id\":5,\"role_name\":\"测试角色2\",\"introduce\":\"哇哈哈啊哈123\",\"create_time\":1598943191,\"delete_time\":1598953009,\"is_default\":0}', '[]', 1598953009, 1);
INSERT INTO `admin_logs` VALUES (37, '新增管理员', '[]', '{\"username\":\"xiaoziyan\",\"password\":\"hs46bCan6jdJF8+9aiCiwbvWzfpI+\\/hRBQPu37kms3a2vJJwUO9VLzXa2qXMXMcb9D7gEer6yDB\\/76nxmuSXR9RFR2xWxSXtyM0fNqxq0g+ZOU0MEY4EFxrzjuAvDpnAHxVScqb1WCCM87QdbJBGNee++8IWFHvachC3z+P8Pa8=\",\"nickname\":\"华尚科技\",\"telephone\":\"13433323221\",\"email\":\"\",\"role_id\":\"4\",\"create_time\":\"2020-09-01 17:48\",\"id\":\"2\"}', 1598953717, 1);
INSERT INTO `admin_logs` VALUES (38, '登录系统', '[]', '[]', 1599209612, 1);
INSERT INTO `admin_logs` VALUES (32, '新增角色', '[]', '{\"role_name\":\"测试角色2\",\"introduce\":\"哇哈哈啊哈\",\"is_default\":0,\"create_time\":\"2020-09-01 14:53\",\"id\":\"5\"}', 1598943191, 1);
INSERT INTO `admin_logs` VALUES (39, '登录系统', '[]', '[]', 1599446258, 1);
INSERT INTO `admin_logs` VALUES (40, '登录系统', '[]', '[]', 1599446297, 1);
INSERT INTO `admin_logs` VALUES (41, '角色授权', '[10,9,8,7,6,5,2,1]', '[1,2,5,6,7,8,9,10]', 1599446346, 1);
INSERT INTO `admin_logs` VALUES (42, '角色授权', '[10,9,8,7,6,5,2,1]', '[1,2,5,6,7,8,9,10]', 1599446353, 1);
INSERT INTO `admin_logs` VALUES (43, '登录系统', '[]', '[]', 1599529940, 2);
INSERT INTO `admin_logs` VALUES (44, '登录系统', '[]', '[]', 1599529959, 2);
INSERT INTO `admin_logs` VALUES (45, '登录系统', '[]', '[]', 1599531305, 2);
INSERT INTO `admin_logs` VALUES (46, '登录系统', '[]', '[]', 1599531316, 2);
INSERT INTO `admin_logs` VALUES (47, '登录系统', '[]', '[]', 1599531393, 2);
INSERT INTO `admin_logs` VALUES (48, '登录系统', '[]', '[]', 1599533594, 2);
INSERT INTO `admin_logs` VALUES (49, '登录系统', '[]', '[]', 1599551504, 2);
INSERT INTO `admin_logs` VALUES (50, '退出系统', '[]', '[]', 1599552066, 2);
INSERT INTO `admin_logs` VALUES (51, '登录系统', '[]', '[]', 1599552083, 1);
INSERT INTO `admin_logs` VALUES (52, '编辑管理员', '{\"id\":2,\"username\":\"xiaoziyan\",\"password\":\"hs46bCan6jdJF8+9aiCiwbvWzfpI+\\/hRBQPu37kms3a2vJJwUO9VLzXa2qXMXMcb9D7gEer6yDB\\/76nxmuSXR9RFR2xWxSXtyM0fNqxq0g+ZOU0MEY4EFxrzjuAvDpnAHxVScqb1WCCM87QdbJBGNee++8IWFHvachC3z+P8Pa8=\",\"nickname\":\"华尚科技\",\"telephone\":\"13433323221\",\"email\":\"\",\"status\":0,\"create_time\":1598953717,\"delete_time\":null,\"is_default\":0,\"role_id\":4}', '{\"id\":\"2\",\"username\":\"xiaoziyan\",\"nickname\":\"华尚科技\",\"role_id\":\"4\",\"telephone\":\"13433323225\",\"email\":\"\",\"token\":\"5445BD4C1EE741A012728F17317EC3A9\",\"sign\":\"jEW7OXg9zUVTVFoStkgS96blzTuATQcF8VoGwvMASwrT2wvjDY0LOVp2OMSsg5abR+mNk88k3aKjmlDDQC0uSP7qgAtTecnGFlX9p4bF2pF0e\\/sTEQOxOYqhFaN5zQtcN2ZBpqOYkMRNnzi\\/Q4QlqS\\/lVV4ZISqjJ\\/sn+ecYo9w=\"}', 1599553896, 1);
INSERT INTO `admin_logs` VALUES (53, '编辑管理员', '{\"id\":2,\"username\":\"xiaoziyan\",\"password\":\"hs46bCan6jdJF8+9aiCiwbvWzfpI+\\/hRBQPu37kms3a2vJJwUO9VLzXa2qXMXMcb9D7gEer6yDB\\/76nxmuSXR9RFR2xWxSXtyM0fNqxq0g+ZOU0MEY4EFxrzjuAvDpnAHxVScqb1WCCM87QdbJBGNee++8IWFHvachC3z+P8Pa8=\",\"nickname\":\"华尚科技\",\"telephone\":\"13433323225\",\"email\":\"\",\"status\":0,\"create_time\":1598953717,\"delete_time\":null,\"is_default\":0,\"role_id\":4}', '{\"id\":\"2\",\"username\":\"xiaoziyan\",\"nickname\":\"华尚科技\",\"role_id\":\"4\",\"telephone\":\"13433323221\",\"email\":\"\",\"token\":\"5445BD4C1EE741A012728F17317EC3A9\",\"sign\":\"Bm4B6epVsirqc1nCmJz+sR3Xu5gqPZsdL9u92kpcH2JyqyP7BUGYwHNzZcL6YbjZbpY+pM1yR4DFd3b4RGwG03FI5R8mmfrDgf18E2ROjB8ykKOMUlMouz0fzldjyDdQ+WkYXOHS9UuFK7aLbvk65HujjeNmCDR4j62k+IwqVmA=\"}', 1599555750, 1);
INSERT INTO `admin_logs` VALUES (54, '角色授权', '[10,9,8,7,6,5,2,1]', '[1,2,5,6,7,8,9,10]', 1599558218, 1);
INSERT INTO `admin_logs` VALUES (55, '角色授权', '[10,9,8,7,6,5,2,1]', '[1,2,5,6,7,8,9,10]', 1599558225, 1);
INSERT INTO `admin_logs` VALUES (56, '角色授权', '[10,9,8,7,6,5,2,1]', '[10]', 1599558241, 1);
INSERT INTO `admin_logs` VALUES (57, '角色授权', '[10]', '[10]', 1599558249, 1);
INSERT INTO `admin_logs` VALUES (58, '角色授权', '[10]', '[10]', 1599559625, 1);
INSERT INTO `admin_logs` VALUES (59, '角色授权', '[10]', '[10]', 1599559638, 1);
INSERT INTO `admin_logs` VALUES (60, '角色授权', '[10]', '[10]', 1599560026, 1);
INSERT INTO `admin_logs` VALUES (61, '角色授权', '[10]', '[10]', 1599560077, 1);
INSERT INTO `admin_logs` VALUES (62, '角色授权', '[10]', '[1,2,3,4,5,6,7,8,9,10]', 1599560109, 1);
INSERT INTO `admin_logs` VALUES (63, '登录系统', '[]', '[]', 1599613497, 1);
INSERT INTO `admin_logs` VALUES (64, '登录系统', '[]', '[]', 1599615846, 1);
INSERT INTO `admin_logs` VALUES (65, '编辑用户', '{\"id\":1,\"username\":\"admin\",\"password\":\"L\\/v1WQD0dlHmFh78DyotVfu2POao400AevjG2G7uFLQej5pSIHuFRdOAu3eVc+DqrXBba88u1xaOb4JTZdcIjv96nhouUmK0uRns+lTeLgEgGZDtqulZyMUtI5XizaLYvxzIiyzhf5yiZE90PyieR53zpY70b+2Uql6qdNAVyFo=\",\"nickname\":\"小明\",\"telephone\":\"1591355123\",\"email\":\"fripside@126.com\",\"img\":null,\"status\":0,\"create_time\":1598926248,\"delete_time\":null}', '{\"status\":1}', 1599618909, 1);
INSERT INTO `admin_logs` VALUES (66, '编辑用户', '{\"id\":1,\"username\":\"admin\",\"password\":\"L\\/v1WQD0dlHmFh78DyotVfu2POao400AevjG2G7uFLQej5pSIHuFRdOAu3eVc+DqrXBba88u1xaOb4JTZdcIjv96nhouUmK0uRns+lTeLgEgGZDtqulZyMUtI5XizaLYvxzIiyzhf5yiZE90PyieR53zpY70b+2Uql6qdNAVyFo=\",\"nickname\":\"小明\",\"telephone\":\"1591355123\",\"email\":\"fripside@126.com\",\"img\":null,\"status\":1,\"create_time\":1598926248,\"delete_time\":null}', '{\"status\":0}', 1599619181, 1);
INSERT INTO `admin_logs` VALUES (67, '编辑用户', '{\"id\":1,\"username\":\"admin\",\"password\":\"L\\/v1WQD0dlHmFh78DyotVfu2POao400AevjG2G7uFLQej5pSIHuFRdOAu3eVc+DqrXBba88u1xaOb4JTZdcIjv96nhouUmK0uRns+lTeLgEgGZDtqulZyMUtI5XizaLYvxzIiyzhf5yiZE90PyieR53zpY70b+2Uql6qdNAVyFo=\",\"nickname\":\"小明\",\"telephone\":\"1591355123\",\"email\":\"fripside@126.com\",\"img\":null,\"status\":0,\"create_time\":1598926248,\"delete_time\":null}', '{\"status\":1}', 1599619185, 1);
INSERT INTO `admin_logs` VALUES (68, '退出系统', '[]', '[]', 1599623908, 1);
INSERT INTO `admin_logs` VALUES (69, '登录系统', '[]', '[]', 1599623920, 1);
INSERT INTO `admin_logs` VALUES (70, '登录系统', '[]', '[]', 1599629921, 1);
INSERT INTO `admin_logs` VALUES (71, '登录系统', '[]', '[]', 1599629958, 1);
INSERT INTO `admin_logs` VALUES (72, '编辑用户', '{\"id\":1,\"username\":\"admin\",\"password\":\"L\\/v1WQD0dlHmFh78DyotVfu2POao400AevjG2G7uFLQej5pSIHuFRdOAu3eVc+DqrXBba88u1xaOb4JTZdcIjv96nhouUmK0uRns+lTeLgEgGZDtqulZyMUtI5XizaLYvxzIiyzhf5yiZE90PyieR53zpY70b+2Uql6qdNAVyFo=\",\"nickname\":\"小明\",\"telephone\":\"1591355123\",\"email\":\"fripside@126.com\",\"img\":null,\"status\":1,\"create_time\":1598926248,\"delete_time\":null}', '{\"status\":0}', 1599630048, 1);
INSERT INTO `admin_logs` VALUES (73, '编辑用户', '{\"id\":2,\"username\":\"xiaoziyan\",\"password\":\"hs46bCan6jdJF8+9aiCiwbvWzfpI+\\/hRBQPu37kms3a2vJJwUO9VLzXa2qXMXMcb9D7gEer6yDB\\/76nxmuSXR9RFR2xWxSXtyM0fNqxq0g+ZOU0MEY4EFxrzjuAvDpnAHxVScqb1WCCM87QdbJBGNee++8IWFHvachC3z+P8Pa8=\",\"nickname\":\"小海\",\"telephone\":\"13433323221\",\"email\":\"\",\"img\":null,\"status\":0,\"create_time\":1598953717,\"delete_time\":null}', '{\"id\":\"2\",\"username\":\"xiaoziyan\",\"nickname\":\"小海\",\"telephone\":\"13433323221\",\"email\":\"\",\"file\":\"\",\"img\":\"\\/storage\\/img\\/20200909\\/8ccb8601ff480bdc0a5e98a77d7129ac.jpg\",\"token\":\"D69744C8D403B2F85926050D13D1692C\",\"sign\":\"zYx9BY58gsLlawtSx0IMDMVQWZuH+ifTH7QeGUvgSTngzErhmi1bIDKcrldhav\\/BIDgGQ3QqlEU5V6QtV5r3rswhmQUvWVRpZKfiylia7FfbB9kjExnnnf+zdsrQISnbV9JivbbUhjDTnG0+MiI51N0npi+Cp\\/BrgYegE4EGdDQ=\"}', 1599639465, 1);
INSERT INTO `admin_logs` VALUES (74, '新增用户', '[]', '{\"username\":\"root\",\"password\":\"wZuS1+IF6dQO7X63IzATi+\\/mP\\/fysZuwlwAs7xWeC36CYXimxyadloCBOws8wFrJRYUve8wBm80SQxJkAXDbtpR+igtp3aglulHIBnGi26MqTHPJFszABAJ+7pMRATErnQUPGV\\/CslszzihZb+7fvNNd2EXZ5fwMM+K6EC4VhlI=\",\"nickname\":\"测试\",\"telephone\":\"\",\"email\":\"\",\"img\":\"\\/storage\\/img\\/20200909\\/b8f900727501753321a7b1dde7eb78a8.jpg\",\"create_time\":\"2020-09-09 17:03\",\"id\":\"3\"}', 1599642202, 1);
INSERT INTO `admin_logs` VALUES (75, '编辑用户', '{\"id\":1,\"username\":\"admin\",\"password\":\"L\\/v1WQD0dlHmFh78DyotVfu2POao400AevjG2G7uFLQej5pSIHuFRdOAu3eVc+DqrXBba88u1xaOb4JTZdcIjv96nhouUmK0uRns+lTeLgEgGZDtqulZyMUtI5XizaLYvxzIiyzhf5yiZE90PyieR53zpY70b+2Uql6qdNAVyFo=\",\"nickname\":\"小明\",\"telephone\":\"1591355123\",\"email\":\"fripside@126.com\",\"img\":null,\"status\":0,\"create_time\":1598926248,\"delete_time\":null}', '{\"status\":1}', 1599643261, 1);
INSERT INTO `admin_logs` VALUES (76, '编辑用户', '{\"id\":2,\"username\":\"xiaoziyan\",\"password\":\"hs46bCan6jdJF8+9aiCiwbvWzfpI+\\/hRBQPu37kms3a2vJJwUO9VLzXa2qXMXMcb9D7gEer6yDB\\/76nxmuSXR9RFR2xWxSXtyM0fNqxq0g+ZOU0MEY4EFxrzjuAvDpnAHxVScqb1WCCM87QdbJBGNee++8IWFHvachC3z+P8Pa8=\",\"nickname\":\"小海\",\"telephone\":\"13433323221\",\"email\":\"\",\"img\":\"\\/storage\\/img\\/20200909\\/8ccb8601ff480bdc0a5e98a77d7129ac.jpg\",\"status\":0,\"create_time\":1598953717,\"delete_time\":null}', '{\"id\":\"2\",\"username\":\"xiaoziyan\",\"nickname\":\"小海\",\"telephone\":\"13433323221\",\"email\":\"\",\"file\":\"\",\"img\":\"\\/storage\\/img\\/20200909\\/7555054d1f3971abd2182a9b80eb0f2a.jpg\",\"token\":\"D69744C8D403B2F85926050D13D1692C\",\"sign\":\"Q6hHiC3VWlc8mDBUoYjqaaDGKWqpJxgecVL1ZorDDrx1pVtq50QyyQQX6gXgrCG1j7RrABWx0Pzfin46KDhys98SR8xHe+EDM19H9OPttBtLrjEs0I6cSDJYwEHkbAk4cZfp0pDDnLcXFz8RfC1NIAH0r0tY5q6iy9qbpF55egI=\"}', 1599643518, 1);
INSERT INTO `admin_logs` VALUES (77, '删除用户', '{\"id\":3,\"username\":\"root\",\"password\":\"wZuS1+IF6dQO7X63IzATi+\\/mP\\/fysZuwlwAs7xWeC36CYXimxyadloCBOws8wFrJRYUve8wBm80SQxJkAXDbtpR+igtp3aglulHIBnGi26MqTHPJFszABAJ+7pMRATErnQUPGV\\/CslszzihZb+7fvNNd2EXZ5fwMM+K6EC4VhlI=\",\"nickname\":\"测试\",\"telephone\":\"\",\"email\":\"\",\"img\":\"\\/storage\\/img\\/20200909\\/b8f900727501753321a7b1dde7eb78a8.jpg\",\"status\":0,\"create_time\":1599642202,\"delete_time\":1599644117}', '[]', 1599644117, 1);
INSERT INTO `admin_logs` VALUES (78, '删除用户', '{\"id\":3,\"username\":\"root\",\"password\":\"wZuS1+IF6dQO7X63IzATi+\\/mP\\/fysZuwlwAs7xWeC36CYXimxyadloCBOws8wFrJRYUve8wBm80SQxJkAXDbtpR+igtp3aglulHIBnGi26MqTHPJFszABAJ+7pMRATErnQUPGV\\/CslszzihZb+7fvNNd2EXZ5fwMM+K6EC4VhlI=\",\"nickname\":\"测试\",\"telephone\":\"\",\"email\":\"\",\"img\":\"\\/storage\\/img\\/20200909\\/b8f900727501753321a7b1dde7eb78a8.jpg\",\"status\":0,\"create_time\":1599642202,\"delete_time\":1599644165}', '[]', 1599644165, 1);
INSERT INTO `admin_logs` VALUES (79, '新增用户', '[]', '{\"username\":\"test\",\"password\":\"SoMeN9tsDQlBoVwO\\/yGUedfnLNZz+BVgCy5dB3P2+TNb+hJALflJTKn+QmvTA0c8D7z1pOCNONcZGLtq6jEJeCbQfxUOT1TzOpAfk9b7FtpQ7qPQOOSAX1ymxS2VhEu5WOhBBsejXIzlDg0ruXQwMIpmFIBzAaFUYfLuh1dRLOo=\",\"nickname\":\"测试角色\",\"telephone\":\"\",\"email\":\"\",\"img\":\"\\/storage\\/img\\/20200909\\/9ccf531d3945ed96380886566a6f8fe3.jpg\",\"create_time\":\"2020-09-09 18:26\",\"id\":\"4\"}', 1599647177, 1);
INSERT INTO `admin_logs` VALUES (80, '登录系统', '[]', '[]', 1599699296, 1);
INSERT INTO `admin_logs` VALUES (81, '登录系统', '[]', '[]', 1599705247, 1);
INSERT INTO `admin_logs` VALUES (82, '登录系统', '[]', '[]', 1599705662, 1);
INSERT INTO `admin_logs` VALUES (83, '新增用户', '[]', '{\"username\":\"123\",\"password\":\"gNJvJUjDJFJQ59FgB4X4quHLS8Cu2VzFnFi\\/A8zOD88kWZo0+GWoWXEw2TLZ1DeUYUAGvm0sLxQd\\/YeclUvQI7JxZ09LZPGPprmLeFI+3elJ1jsaqYY1qITRDJeaFzJBYT9aoDYmdQ9n+SKRT2z0n3RK01y1LjvppucPQBlj\\/cE=\",\"nickname\":\"asd\",\"telephone\":\"\",\"email\":\"\",\"img\":\"\",\"create_time\":\"2020-09-10 10:43\",\"id\":\"5\"}', 1599705788, 1);
INSERT INTO `admin_logs` VALUES (84, '删除用户', '{\"id\":5,\"username\":\"123\",\"password\":\"gNJvJUjDJFJQ59FgB4X4quHLS8Cu2VzFnFi\\/A8zOD88kWZo0+GWoWXEw2TLZ1DeUYUAGvm0sLxQd\\/YeclUvQI7JxZ09LZPGPprmLeFI+3elJ1jsaqYY1qITRDJeaFzJBYT9aoDYmdQ9n+SKRT2z0n3RK01y1LjvppucPQBlj\\/cE=\",\"nickname\":\"asd\",\"telephone\":\"\",\"email\":\"\",\"img\":\"\",\"status\":0,\"create_time\":1599705788,\"delete_time\":1599705857}', '[]', 1599705857, 1);
INSERT INTO `admin_logs` VALUES (85, '登录系统', '[]', '[]', 1599728399, 1);
INSERT INTO `admin_logs` VALUES (86, '登录系统', '[]', '[]', 1600045493, 1);
INSERT INTO `admin_logs` VALUES (87, '登录系统', '[]', '[]', 1600047279, 1);
INSERT INTO `admin_logs` VALUES (88, '编辑收益设置表', '{\"id\":6,\"price\":\"20000.00\",\"cycle\":30,\"profit\":\"12.00\",\"create_time\":1599983080,\"del_time\":null,\"edit_time\":null,\"status\":0}', '{\"price\":\"20000.00\",\"cycle\":\"15\",\"profit\":\"12.00\"}', 1600050579, 1);
INSERT INTO `admin_logs` VALUES (89, '新增收益设置表', '[]', '{\"price\":\"999999.00\",\"cycle\":\"12\",\"profit\":\"15.00\",\"create_time\":\"2020-09-14 10:44\",\"id\":\"7\"}', 1600051456, 1);
INSERT INTO `admin_logs` VALUES (90, '删除收益设置表', '{\"id\":7,\"price\":\"999999.00\",\"cycle\":12,\"profit\":\"15.00\",\"create_time\":1600051456,\"del_time\":1600051519,\"edit_time\":null,\"status\":0}', '[]', 1600051519, 1);
INSERT INTO `admin_logs` VALUES (91, '编辑动态收益设置表', '{\"id\":7,\"edition\":11,\"branch\":6,\"profit\":\"99.00\",\"create_time\":1599990832,\"del_time\":null,\"status\":0}', '{\"edition\":\"999\",\"branch\":\"6\",\"profit\":\"99.00\"}', 1600052486, 1);
INSERT INTO `admin_logs` VALUES (92, '删除动态收益设置表', '{\"id\":7,\"edition\":999,\"branch\":6,\"profit\":\"99.00\",\"create_time\":1599990832,\"del_time\":1600052567,\"status\":0}', '[]', 1600052567, 1);
INSERT INTO `admin_logs` VALUES (93, '新增动态收益设置表', '[]', '{\"edition\":\"66\",\"branch\":\"6\",\"profit\":\"12.00\",\"create_time\":\"2020-09-14 11:04\",\"id\":\"8\"}', 1600052642, 1);
INSERT INTO `admin_logs` VALUES (94, '删除动态收益设置表', '{\"id\":8,\"edition\":66,\"branch\":6,\"profit\":\"12.00\",\"create_time\":1600052642,\"del_time\":1600052647,\"status\":0}', '[]', 1600052647, 1);
INSERT INTO `admin_logs` VALUES (95, '登录系统', '[]', '[]', 1600062796, 1);
INSERT INTO `admin_logs` VALUES (96, '登录系统', '[]', '[]', 1600068851, 1);
INSERT INTO `admin_logs` VALUES (97, '编辑收益设置表', '{\"id\":1,\"price\":\"100.00\",\"cycle\":12,\"profit\":\"3.60\",\"create_time\":1599981664,\"del_time\":null,\"edit_time\":null,\"status\":0}', '{\"price\":\"100.00\",\"cycle\":\"1\",\"profit\":\"3.60\"}', 1600068897, 1);
INSERT INTO `admin_logs` VALUES (98, '编辑收益设置表', '{\"id\":2,\"price\":\"500.00\",\"cycle\":12,\"profit\":\"5.60\",\"create_time\":1599981948,\"del_time\":null,\"edit_time\":null,\"status\":0}', '{\"price\":\"500.00\",\"cycle\":\"1\",\"profit\":\"5.60\"}', 1600068903, 1);
INSERT INTO `admin_logs` VALUES (99, '编辑收益设置表', '{\"id\":3,\"price\":\"1000.00\",\"cycle\":12,\"profit\":\"7.60\",\"create_time\":1599981960,\"del_time\":null,\"edit_time\":null,\"status\":0}', '{\"price\":\"1000.00\",\"cycle\":\"1\",\"profit\":\"7.60\"}', 1600068908, 1);
INSERT INTO `admin_logs` VALUES (100, '编辑收益设置表', '{\"id\":4,\"price\":\"5000.00\",\"cycle\":12,\"profit\":\"9.60\",\"create_time\":1599981973,\"del_time\":null,\"edit_time\":null,\"status\":0}', '{\"price\":\"5000.00\",\"cycle\":\"1\",\"profit\":\"9.60\"}', 1600068913, 1);
INSERT INTO `admin_logs` VALUES (101, '编辑收益设置表', '{\"id\":5,\"price\":\"10000.00\",\"cycle\":12,\"profit\":\"11.60\",\"create_time\":1599981983,\"del_time\":null,\"edit_time\":null,\"status\":0}', '{\"price\":\"10000.00\",\"cycle\":\"1\",\"profit\":\"11.60\"}', 1600068918, 1);
INSERT INTO `admin_logs` VALUES (102, '登录系统', '[]', '[]', 1600132110, 1);
INSERT INTO `admin_logs` VALUES (103, '登录系统', '[]', '[]', 1600134782, 1);
INSERT INTO `admin_logs` VALUES (104, '登录系统', '[]', '[]', 1600221547, 1);
INSERT INTO `admin_logs` VALUES (105, '删除合约记录表', '{\"id\":1,\"user_id\":11,\"price\":\"1000.00\",\"cycle\":1,\"profit\":\"7.60\",\"interest\":\"76.00\",\"create_time\":1600128000,\"end_time\":1600307127,\"del_time\":1600311782}', '[]', 1600311782, 1);
INSERT INTO `admin_logs` VALUES (106, '删除收益发放记录表', '{\"id\":12,\"type\":2,\"status\":0,\"price\":\"7.60\",\"contract_id\":2,\"user_id\":2,\"create_time\":1600307127,\"fulfil_time\":null,\"del_time\":1600313637,\"update_time\":1600313637}', '[]', 1600313637, 1);

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系邮箱',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `delete_time` int(11) NULL DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT 0,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (1, 'admin', 'L/v1WQD0dlHmFh78DyotVfu2POao400AevjG2G7uFLQej5pSIHuFRdOAu3eVc+DqrXBba88u1xaOb4JTZdcIjv96nhouUmK0uRns+lTeLgEgGZDtqulZyMUtI5XizaLYvxzIiyzhf5yiZE90PyieR53zpY70b+2Uql6qdNAVyFo=', '梓潼', '1591355123', 'fripside@126.com', 0, 1598926248, NULL, 1, 1);
INSERT INTO `admins` VALUES (2, 'xiaoziyan', 'hs46bCan6jdJF8+9aiCiwbvWzfpI+/hRBQPu37kms3a2vJJwUO9VLzXa2qXMXMcb9D7gEer6yDB/76nxmuSXR9RFR2xWxSXtyM0fNqxq0g+ZOU0MEY4EFxrzjuAvDpnAHxVScqb1WCCM87QdbJBGNee++8IWFHvachC3z+P8Pa8=', '华尚科技', '13433323221', '', 0, 1598953717, NULL, 0, 4);

-- ----------------------------
-- Table structure for capital
-- ----------------------------
DROP TABLE IF EXISTS `capital`;
CREATE TABLE `capital`  (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `balance` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `fund` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '个人业绩',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of capital
-- ----------------------------
INSERT INTO `capital` VALUES (1, 0.00, 0.00);
INSERT INTO `capital` VALUES (2, 0.00, 0.00);
INSERT INTO `capital` VALUES (3, 0.00, 0.00);
INSERT INTO `capital` VALUES (4, 0.00, 0.00);
INSERT INTO `capital` VALUES (5, 0.00, 0.00);
INSERT INTO `capital` VALUES (6, 0.00, 0.00);
INSERT INTO `capital` VALUES (7, 0.00, 0.00);
INSERT INTO `capital` VALUES (8, 0.00, 0.00);
INSERT INTO `capital` VALUES (9, 0.00, 0.00);
INSERT INTO `capital` VALUES (10, 0.00, 0.00);
INSERT INTO `capital` VALUES (11, 1000.00, 0.00);
INSERT INTO `capital` VALUES (12, 0.00, 0.00);
INSERT INTO `capital` VALUES (13, 0.00, 0.00);
INSERT INTO `capital` VALUES (14, 0.00, 0.00);
INSERT INTO `capital` VALUES (15, 0.00, 0.00);
INSERT INTO `capital` VALUES (16, 0.00, 0.00);
INSERT INTO `capital` VALUES (17, 0.00, 0.00);
INSERT INTO `capital` VALUES (18, 0.00, 0.00);
INSERT INTO `capital` VALUES (19, 0.00, 0.00);
INSERT INTO `capital` VALUES (20, 0.00, 0.00);
INSERT INTO `capital` VALUES (21, 0.00, 0.00);
INSERT INTO `capital` VALUES (22, 0.00, 0.00);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `k` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v_us` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `price` decimal(10, 2) NOT NULL COMMENT '投资金额',
  `cycle` int(11) NOT NULL COMMENT '合约周期天数',
  `profit` decimal(4, 2) NOT NULL COMMENT '收益率',
  `interest` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '收益',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  `del_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '合约记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dynamic
-- ----------------------------
DROP TABLE IF EXISTS `dynamic`;
CREATE TABLE `dynamic`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `edition` int(10) NOT NULL COMMENT '代数',
  `branch` int(10) NOT NULL COMMENT '直推人数',
  `profit` decimal(10, 2) NOT NULL COMMENT '收益率',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `del_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '动态收益设置表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of dynamic
-- ----------------------------
INSERT INTO `dynamic` VALUES (1, 1, 1, 50.00, 1599990645, NULL, 0);
INSERT INTO `dynamic` VALUES (2, 3, 2, 20.00, 1599990706, NULL, 0);
INSERT INTO `dynamic` VALUES (3, 5, 3, 10.00, 1599990722, NULL, 0);
INSERT INTO `dynamic` VALUES (4, 7, 4, 10.00, 1599990739, NULL, 0);
INSERT INTO `dynamic` VALUES (5, 9, 5, 10.00, 1599990746, NULL, 0);
INSERT INTO `dynamic` VALUES (6, 11, 6, 5.00, 1599990764, NULL, 0);
INSERT INTO `dynamic` VALUES (7, 999, 6, 99.00, 1599990832, 1, 0);
INSERT INTO `dynamic` VALUES (8, 66, 6, 12.00, 1600052642, 1, 0);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `is_show` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '系统设置', NULL, 1, NULL, 0, 0, 1);
INSERT INTO `menu` VALUES (2, '权限管理', NULL, 1, NULL, 0, 6, 1);
INSERT INTO `menu` VALUES (3, '基本设置', NULL, 2, 'config/config', 1, 0, 1);
INSERT INTO `menu` VALUES (4, '管理员管理', NULL, 2, 'admin/lists', 2, 0, 1);
INSERT INTO `menu` VALUES (5, '角色管理', NULL, 2, 'role/lists', 2, 1, 1);
INSERT INTO `menu` VALUES (6, '操作日志', NULL, 2, 'log/admin', 2, 2, 1);
INSERT INTO `menu` VALUES (7, '收益设置', NULL, 1, NULL, 0, 0, 1);
INSERT INTO `menu` VALUES (8, '合约配置', NULL, 2, 'profit/lists', 7, 0, 1);
INSERT INTO `menu` VALUES (11, '动态收益', NULL, 2, 'dynamic/lists', 7, 1, 1);
INSERT INTO `menu` VALUES (12, '团队收益', NULL, 2, 'team/lists', 7, 2, 1);
INSERT INTO `menu` VALUES (13, '合约记录', NULL, 1, '', 0, 0, 1);
INSERT INTO `menu` VALUES (14, '合约记录', NULL, 2, 'contract/lists', 13, 0, 1);
INSERT INTO `menu` VALUES (15, '收益发放记录', NULL, 1, NULL, 0, 0, 1);
INSERT INTO `menu` VALUES (16, '收益发放记录', NULL, 1, 'transaction/lists', 15, 0, 1);

-- ----------------------------
-- Table structure for powers
-- ----------------------------
DROP TABLE IF EXISTS `powers`;
CREATE TABLE `powers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '控制器',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '关联菜单',
  `is_default` int(11) NULL DEFAULT 1 COMMENT '新增角色的默认权限',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限码（菜单ID+操作码）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of powers
-- ----------------------------
INSERT INTO `powers` VALUES (1, '查看管理员', 'Admins', 'lists', 'get', 4, 1, '0400');
INSERT INTO `powers` VALUES (2, '添加管理员', 'Admins', 'add', 'post', 4, 1, '0401');
INSERT INTO `powers` VALUES (3, '编辑管理员', 'Admins', 'modify', 'post', 4, 1, '0402');
INSERT INTO `powers` VALUES (4, '删除管理员', 'Admins', 'del', 'post', 4, 1, '0403');
INSERT INTO `powers` VALUES (5, '查看角色', 'Roles', 'lists', 'get', 5, 1, '0500');
INSERT INTO `powers` VALUES (6, '添加角色', 'Roles', 'add', 'post', 5, 1, '0501');
INSERT INTO `powers` VALUES (7, '编辑角色', 'Roles', 'modify', 'post', 5, 1, '0502');
INSERT INTO `powers` VALUES (8, '删除角色', 'Roles', 'del', 'post', 5, 1, '0503');
INSERT INTO `powers` VALUES (9, '角色授权', 'Roles', 'authorization', 'post', 5, 1, '0504');
INSERT INTO `powers` VALUES (10, '查看操作日志', 'Logs', 'admins', 'get', 6, 1, '0600');
INSERT INTO `powers` VALUES (61, '合约配置', 'Profit', 'lists', 'get', 8, 1, '0800');
INSERT INTO `powers` VALUES (62, '合约配置状态', 'Profit', 'status', 'post', 8, 1, '0801');
INSERT INTO `powers` VALUES (64, '编辑合约配置', 'Profit', 'modify', 'post', 8, 1, '0803');
INSERT INTO `powers` VALUES (65, '添加合约配置', 'Profit', 'add', 'post', 8, 1, '0804');
INSERT INTO `powers` VALUES (66, '删除合约配置', 'Profit', 'del', 'post', 8, 1, '0805');
INSERT INTO `powers` VALUES (67, '动态收益', 'Dynamic', 'lists', 'get', 11, 1, '1101');
INSERT INTO `powers` VALUES (68, '动态收益状态', 'Dynamic', 'status', 'post', 11, 1, '1102');
INSERT INTO `powers` VALUES (69, '编辑动态收益', 'Dynamic', 'modify', 'post', 11, 1, '1103');
INSERT INTO `powers` VALUES (70, '添加动态收益', 'Dynamic', 'add', 'post', 11, 1, '1104');
INSERT INTO `powers` VALUES (71, '删除动态收益', 'Dynamic', 'del', 'post', 11, 1, '1105');
INSERT INTO `powers` VALUES (72, '团队收益', 'Team', 'lists', 'get', 12, 1, '1201');
INSERT INTO `powers` VALUES (73, '团队收益状态', 'Team', 'status', 'post', 12, 1, '1202');
INSERT INTO `powers` VALUES (74, '编辑团队收益', 'Team', 'modify', 'post', 12, 1, '1203');
INSERT INTO `powers` VALUES (75, '添加团队收益', 'Team', 'add', 'post', 12, 1, '1204');
INSERT INTO `powers` VALUES (76, '删除团队收益', 'Team', 'del', 'post', 12, 1, '1205');
INSERT INTO `powers` VALUES (77, '合约记录', 'Contract', 'lists', 'get', 14, 1, '1401');
INSERT INTO `powers` VALUES (78, '删除合约记录', 'Contract', 'del', 'post', 14, 1, '1402');
INSERT INTO `powers` VALUES (79, '收益发放记录', 'Transaction', 'lists', 'get', 16, 1, '1601');
INSERT INTO `powers` VALUES (80, '删除收益发放记录', 'Transaction', 'del', 'post', 16, 1, '1602');

-- ----------------------------
-- Table structure for profit
-- ----------------------------
DROP TABLE IF EXISTS `profit`;
CREATE TABLE `profit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10, 2) NOT NULL COMMENT '金额',
  `cycle` int(10) NOT NULL COMMENT '周期天数',
  `profit` decimal(10, 2) NOT NULL COMMENT '收益率',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `del_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `edit_time` int(11) NULL DEFAULT NULL COMMENT '编辑时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收益设置表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of profit
-- ----------------------------
INSERT INTO `profit` VALUES (1, 100.00, 1, 3.60, 1599981664, NULL, NULL, 0);
INSERT INTO `profit` VALUES (2, 500.00, 1, 5.60, 1599981948, NULL, NULL, 0);
INSERT INTO `profit` VALUES (3, 1000.00, 1, 7.60, 1599981960, NULL, NULL, 0);
INSERT INTO `profit` VALUES (4, 5000.00, 1, 9.60, 1599981973, NULL, NULL, 0);
INSERT INTO `profit` VALUES (5, 10000.00, 1, 11.60, 1599981983, NULL, NULL, 0);
INSERT INTO `profit` VALUES (6, 20000.00, 15, 12.00, 1599983080, NULL, NULL, 0);
INSERT INTO `profit` VALUES (7, 999999.00, 12, 15.00, 1600051456, 1600051519, NULL, 0);

-- ----------------------------
-- Table structure for relationship
-- ----------------------------
DROP TABLE IF EXISTS `relationship`;
CREATE TABLE `relationship`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `sp_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关系格式：,A_id,B_id,C_id,(上级所有ID)',
  `stratum` int(11) NOT NULL COMMENT '层级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of relationship
-- ----------------------------
INSERT INTO `relationship` VALUES (1, 1, 0, '', 0);
INSERT INTO `relationship` VALUES (2, 2, 1, ',1,', 1);
INSERT INTO `relationship` VALUES (3, 3, 2, ',1,2,', 2);
INSERT INTO `relationship` VALUES (4, 4, 3, ',1,2,3,', 3);
INSERT INTO `relationship` VALUES (5, 5, 4, ',1,2,3,4,', 4);
INSERT INTO `relationship` VALUES (6, 6, 5, ',1,2,3,4,5,', 5);
INSERT INTO `relationship` VALUES (7, 7, 6, ',1,2,3,4,5,6,', 6);
INSERT INTO `relationship` VALUES (8, 8, 7, ',1,2,3,4,5,6,7,', 7);
INSERT INTO `relationship` VALUES (9, 9, 8, ',1,2,3,4,5,6,7,8,', 8);
INSERT INTO `relationship` VALUES (10, 10, 9, ',1,2,3,4,5,6,7,8,9,', 9);
INSERT INTO `relationship` VALUES (11, 11, 10, ',1,2,3,4,5,6,7,8,9,10,', 10);
INSERT INTO `relationship` VALUES (12, 12, 8, ',1,2,3,4,5,6,7,8,', 8);
INSERT INTO `relationship` VALUES (13, 13, 6, ',1,2,3,4,5,6,', 6);
INSERT INTO `relationship` VALUES (14, 14, 6, ',1,2,3,4,5,6,', 6);
INSERT INTO `relationship` VALUES (15, 15, 4, ',1,2,3,4,', 4);
INSERT INTO `relationship` VALUES (16, 16, 4, ',1,2,3,4,', 4);
INSERT INTO `relationship` VALUES (17, 17, 4, ',1,2,3,4,', 4);
INSERT INTO `relationship` VALUES (18, 18, 2, ',1,2,', 2);
INSERT INTO `relationship` VALUES (19, 19, 2, ',1,2,', 2);
INSERT INTO `relationship` VALUES (20, 20, 2, ',1,2,', 2);
INSERT INTO `relationship` VALUES (21, 21, 2, ',1,2,', 2);
INSERT INTO `relationship` VALUES (22, 22, 2, ',1,2,', 2);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `introduce` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` int(11) NOT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '超级管理员', '最高管理员', 1598926865, NULL, 1);
INSERT INTO `roles` VALUES (4, '测试角色', '123456', 1598942979, NULL, 0);
INSERT INTO `roles` VALUES (5, '测试角色2', '哇哈哈啊哈123', 1598943191, NULL, 0);

-- ----------------------------
-- Table structure for roles_power
-- ----------------------------
DROP TABLE IF EXISTS `roles_power`;
CREATE TABLE `roles_power`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `power_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限分配' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of roles_power
-- ----------------------------
INSERT INTO `roles_power` VALUES (88, 4, 8);
INSERT INTO `roles_power` VALUES (87, 4, 7);
INSERT INTO `roles_power` VALUES (86, 4, 6);
INSERT INTO `roles_power` VALUES (85, 4, 5);
INSERT INTO `roles_power` VALUES (84, 4, 4);
INSERT INTO `roles_power` VALUES (83, 4, 3);
INSERT INTO `roles_power` VALUES (82, 4, 2);
INSERT INTO `roles_power` VALUES (81, 4, 1);
INSERT INTO `roles_power` VALUES (11, 5, 1);
INSERT INTO `roles_power` VALUES (12, 5, 2);
INSERT INTO `roles_power` VALUES (13, 5, 3);
INSERT INTO `roles_power` VALUES (14, 5, 4);
INSERT INTO `roles_power` VALUES (15, 5, 5);
INSERT INTO `roles_power` VALUES (16, 5, 6);
INSERT INTO `roles_power` VALUES (17, 5, 7);
INSERT INTO `roles_power` VALUES (18, 5, 8);
INSERT INTO `roles_power` VALUES (19, 5, 9);
INSERT INTO `roles_power` VALUES (20, 5, 10);
INSERT INTO `roles_power` VALUES (89, 4, 9);
INSERT INTO `roles_power` VALUES (90, 4, 10);

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未执行',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1:计算收益2:发放收益',
  `contract_id` int(11) NOT NULL COMMENT '合约ID',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '完成时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, 1, 1, 1, 1600307060, 1600307087);
INSERT INTO `task` VALUES (2, 1, 2, 1, 1600307124, 1600307127);
INSERT INTO `task` VALUES (3, 1, 1, 2, 1600307124, 1600307127);

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL COMMENT '团队等级',
  `price` decimal(10, 2) NOT NULL COMMENT '团队业绩总金额',
  `branch` int(11) NOT NULL COMMENT '直推人数',
  `upper` int(11) NOT NULL COMMENT '上一团队等级个数',
  `profit` decimal(10, 2) NOT NULL COMMENT '收益率',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `del_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `level`(`level`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '团队收益设置表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES (1, 1, 50000.00, 6, 0, 10.00, 0, 1599994953, NULL);
INSERT INTO `team` VALUES (2, 2, 100000.00, 6, 2, 20.00, 0, 1599995196, NULL);
INSERT INTO `team` VALUES (3, 3, 300000.00, 6, 2, 30.00, 0, 1599995274, NULL);
INSERT INTO `team` VALUES (4, 4, 1000000.00, 6, 2, 40.00, 0, 1599995280, NULL);
INSERT INTO `team` VALUES (5, 5, 3000000.00, 6, 2, 45.00, 0, 1599995287, NULL);

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) NOT NULL COMMENT '1静态收益,2动态收益,3团队收益',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未发放,1已发放',
  `price` decimal(10, 2) NOT NULL COMMENT '发放金额',
  `contract_id` int(11) NOT NULL COMMENT '合约id',
  `user_id` int(11) NOT NULL COMMENT '结算给谁',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `fulfil_time` int(11) NULL DEFAULT NULL COMMENT '发放时间',
  `del_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收益发放记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱即登录账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `pid` int(11) UNSIGNED NOT NULL COMMENT '上级id',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `del_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  `transaction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易密码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `登录账号`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '773900001@qq.com', 'UrRndBzZpMRHocAIn7FnNO7VYT23MtcRCWaIwcF4aJHnDGjrpmBp2tpfQ+xKOgNa6AOsDUVQtcu1Oh4bWE4PCp+rw2l3pPiYm5afigCJwNE3o9dHKSfT1EM0oRdurnaB5dQPEMKIGaETGyozuCiutlWDwjcImBpHHCLmy64OS4A=', 0, 1600067547, NULL, 0, NULL);
INSERT INTO `users` VALUES (2, '773900102@qq.com', 'xLcOm+4u2V9z0rlgN232YpJYpOLqZkY0fUc4AX+N0778JN4tHm7c9LWzzX7T3oN7olYvODawCgZ2bC+fzLnPRbMVTJLlo4VUGtknksZCVVT6KWl9laInJs52zsvSQuZ9AL9UqZ4cpx9nx9HutHIQok8Z+aEajWA1PbBvJ+0VDeg=', 1, 1600067554, NULL, 0, NULL);
INSERT INTO `users` VALUES (3, '773900203@qq.com', 'nUIPqTn2AdteBTe6SBrJiMP7gxVFWr5uH7qSmkhXpqLssuIevdbByFcmxkCstB41BBlgOueum9Owvyw5p90Gj0Q/TaMxd1sli6S1R5Dr6SHQ7VGpaiCzewDu2liyQpAOIn3vaR4LaC4IjO5BxzJOyjuj5dbUHf9WysrEWK0jkYw=', 2, 1600067554, NULL, 0, NULL);
INSERT INTO `users` VALUES (4, '773900304@qq.com', 'VFuwrDNRrcKFAj6Yp+Hzb2zht87k4BBOkyRVhzlsQrn2Pz9iXWuyf+Lsv0FFvL/O6VIpGpYqOrZjhXIZfsgd2utQqDNLuYXq4RF8AyZpTjP6bBUMV4apLXQ5/ZKcrbC9maD/NCQYZQvC99uemNpJUccj+NJfH/omt35yhHwBAng=', 3, 1600067554, NULL, 0, NULL);
INSERT INTO `users` VALUES (5, '773900405@qq.com', 'H22ky5LZDKZ7EFROUa6vkkZZ1W8eeCOY5GuoKZ3IbM7hiMhyrEIDt2Qdundd08YTALILjfRZ3feq5OTkYMU7tiurvMllMNQ5UITMZzOr3si2eMTIhOQrowwnF91qlE5j2TkZLdtukETUU3SZmJmEixkhLxmECdUUXPaoFMa9jNk=', 4, 1600067554, NULL, 0, NULL);
INSERT INTO `users` VALUES (6, '773900506@qq.com', 'Yw+PHC//RLl4wVRGovwAE9wQ4la4smQ5smhIEeU3r/HjgqHzmQ5DamoNC+ewo1JAVXxRqprtdecBfzy/pLLiZ5T0KXWYWcfMVhHwJh4BmaE6+uJ0vejrwj4EK/xhdDRHt00YmkvHjOiF4UovfuWRS3J3W8oR1/ewmaBcHZGkKSc=', 5, 1600067554, NULL, 0, NULL);
INSERT INTO `users` VALUES (7, '773900607@qq.com', 'bj9yakubPgvbNI4ywVL7dfH99yELxk8PpMOA6da4AWXNg+1ZIogqibcNiYY4XC6OWJhSn8p0L8wgh3loLSf+BIIwLuYQu6/n9fkOljW7csBGzs0Pg2+C7R1XQWxODGO+jGoPo/QkBF3lSl/VDJ6HOEL4zjF/guGPdGDBCg/6LIc=', 6, 1600067554, NULL, 0, NULL);
INSERT INTO `users` VALUES (8, '773900708@qq.com', 'X/YVjeeMLI6f5XFPAOc3tcteEQAN/+DUTGdJSnbzDBP3Yg/aM15ktuDywsEgkvNxI7pT/6Iw34FG36WYV+otnpr85YVU3ejFRsXpGwoiJmGuqP/rqcJIdrrEe6klV86ln8gptcbdysQ6B6kIBiBOT80fsjcdaCuyeoMBxPPehTw=', 7, 1600067555, NULL, 0, NULL);
INSERT INTO `users` VALUES (9, '773900809@qq.com', 'NdvdgPqfIa/8t4ID4HJF2cid7WqqkDgFyJ5lX1LjjJyoa48LduLzL8BhSu0EKNfSz6fUdmKd9BYS+ATNEQMwJO4cncjHHI3Dl7fszLrkRKZCVxYC2Wrcf6aEtI2PSucNC2mu1kGaXbdTyZi77uDihpMcki2pVoJprOe7XnSJzUg=', 8, 1600067555, NULL, 0, NULL);
INSERT INTO `users` VALUES (10, '773900910@qq.com', 'wime+c+ik/dsAZUyhwvIQgTEa4agtiKdiAGgkkFKxFIPvt0gJmcSFDtFAskPxewSDiD3ettIOxU6QwNYObpwWKgCkZcFWZFKcXbKPakCAY+/Ug2ieh5dhhR9revvLuMbucoqeaJBJ+ViGd5DRmpaiyVM8yACwRDdFUV5JGG81Iw=', 9, 1600067555, NULL, 0, NULL);
INSERT INTO `users` VALUES (11, '773901011@qq.com', 'l0cYiZs0KYIhd8/1NykF+5ADlSTzM1M+rZhpS3PonGFkqT35q0HFuYHFaAdJ1E8AjqdaRdDXMHZe3rgnc1zoliCBsLf4pPL9CWLk0P/HySv0G03x+2zm+KvTGx0Q1Wu8nPYkJ6hHnJsDTqIW7FWy89Q/q4OOq0xagBjyOA+x7zs=', 10, 1600067555, NULL, 0, NULL);
INSERT INTO `users` VALUES (12, '773900812@qq.com', 'OX/ckbvYwCavaQPhxUF8b4HwgYo3lCsZMSTBY+yj6T9jxpXDJaXOpy4uN3P9QlakzUSHHkrJ5cLN4sE5zSI8GsNxgrEoFu6vcNAZxaKZMLGPoysgjFCiPquH8nhujMYYpESi/L9wFM4wa1FUN6I1qsusR9eTnCHQA3HOOpX+W5g=', 8, 1600135435, NULL, 0, NULL);
INSERT INTO `users` VALUES (13, '773900613@qq.com', 't6urRDRur+zJp9sNuRLEiXRl4qFPIipFSaY8aEPBd/uv5OrTscZwno6DgvyHx4s+8/SxmZ22F/h+/lQUBMxT9PqzUgwKmH5TkSAr7nULK0lgGpFvfYzuvODpWF8ceMYy9cq052YqY+SR4eoYrkeEwV2pw35X9TLBtfklMd+qB2k=', 6, 1600135459, NULL, 0, NULL);
INSERT INTO `users` VALUES (14, '773900614@qq.com', 'f/09h1RXTAaLvqZjhVDV4a57UGZZBNawoHH/uJIVOx4Cxclu5Uh8h8oZzxtV8Y/D5xB8lTL+iPoZ3RMHSZRhLe+xoFPwij8imzfDCRHSVtbG2r8cjePTxocuL4H5PsKuhI8gCbt0zkj+PuzJ7dI6PUyUm3BJZ12iRbKQol5eYw0=', 6, 1600135466, NULL, 0, NULL);
INSERT INTO `users` VALUES (15, '773900415@qq.com', 'iI04DlLXlPJRjiHHBU3f3rLaxyV8eKo1v4W+ju0H17bKkBJKSL+C7DsJjm+nMd7uwPO9dDQJlu6uxGlljlCQXl4bYhmBP71v63gbBNR84689JLmPGzcUd93HiWDd0XMNijccxaT9jFBryUTxlKilXcHvV9gA3Wfg0NfTAUjlmeg=', 4, 1600135490, NULL, 0, NULL);
INSERT INTO `users` VALUES (16, '773900416@qq.com', 'h2nKztMBArOymkVrN5wK9pBoO1rFXdkzzoVJynw6Ov5JX5TJbnukHm8Z9wpywVATnfK67v6mHnT1wYvOgUcUHQ6ZUiEzJW0lahmLNdayinnF/HLLuJhO5mKG/KbZZ058Uu3W3AGVHSocJ/hqOuItKzIOvIG3YXyaXz2mPjPddfs=', 4, 1600135505, NULL, 0, NULL);
INSERT INTO `users` VALUES (17, '773900417@qq.com', 'ElucBC80/tkYAda73Ru8RHcFnEB9jNvg8NOwZIxwE9AmW6hKy+K+DsU15wJD+10wkkMBKdTgWtJBeQ5oERyXL1aa16NCtGlQXJ6MPSCNcYwv16nmSgq+Czv6SN7+Nd/uJjM4ld0mpsEPBTEg+2v834+XrzWqWn6fe99BLnkObNw=', 4, 1600135513, NULL, 0, NULL);
INSERT INTO `users` VALUES (18, '773900218@qq.com', 'JLpAewjzlxDy7BteHgziA6/mqlxwjf1Q40JTTRW659DuwQPE0jDQLL+62M72PG6SEUnp2dIOy/RcpHhVjfd6w4P0y0m/9S8jZGi0fKsjiwX0mssZaKHbFSp0iuPGkR+hJB0nO/ZC3c/Ss2bSaBDQ8VfDXAtuZZ5n4r/Z6iWjIak=', 2, 1600135537, NULL, 0, NULL);
INSERT INTO `users` VALUES (19, '773900219@qq.com', 'kKOjQNJI+JBk2hcYHheKDNA0s9pJN6J+az94vP0oF+2/xCMUXHDtXkP94iH9xkT51ZUyYizvEdc6BYlUQyP70R6OQtIE+RUgu1BT+6apIGaK3lGt9/SyOom++E6glhKZNmK4nVd89j5BQxdNUC3GfRRCqkMByYzIQ0eN7E4AmRw=', 2, 1600135546, NULL, 0, NULL);
INSERT INTO `users` VALUES (20, '773900220@qq.com', 'GeFMefLC59TBN6ritMmuyeG5ah6Q3F2KDJWjtn3VQoENnpE4U0mG/6eXYheo7ryxB2Og+nAQFPWRPKlCepLvwLt2iaY2M7s5FToydF2kuQr+goYP/p1RyjE6Xw0kUEkPWyxxM2dcf7Pu+mJeci245Lp9NGcWrxCEvLU3HuN642c=', 2, 1600135554, NULL, 0, NULL);
INSERT INTO `users` VALUES (21, '773900221@qq.com', 'QV0M9tRjS8iBRS/+RPM9XzjpifJx03NitrvC6Tw1F37QzPUqicWGG7LwjM/LHsOkmcvg68Ybpd1HtzD4mXtUYPy9FS6QlTDOKyLda7x4+adZ4PVdNpQa48ReeVjpCz6ypizk2NHnc7hr2IuXws0GPqCi2AboK6ybwyf+HJdscC0=', 2, 1600135562, NULL, 0, NULL);
INSERT INTO `users` VALUES (22, '773900222@qq.com', 'qVhY0YPuZl5869vsBT+yrjj24eMgMDulenULrUfonOWhmWWBsxKkF2U6u061Zj1/CGHwE/Ra804kHgtCOoR693K1ie/g/q+U+y9qnX0mD5+/7E31JsnATYm5DZ6dP/g/RjonjxWjBK2Ox7aNmb64sDTBqmgiGGRIHlPX3YB1ifg=', 2, 1600135567, NULL, 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
