use `mtab`;
# 创建Card数据表

create table if not exists card
(
    id int auto_increment
        primary key
) character set utf8mb4
  collate utf8mb4_general_ci comment '卡片数据表';


alter table card
    add name varchar(200) null;

alter table card
    add name_en varchar(200) null;

alter table card
    add status int default 0 null;

alter table card
    add version int default 0 null;

alter table card
    add tips varchar(255) null comment '说明';

alter table card
    add create_time datetime null comment '添加时间';

alter table card
    add src text null comment 'logo';

alter table card
    add url varchar(255) null comment '卡片地址';

alter table card
    add `window` varchar(255) null comment '窗口地址';

alter table card
    add update_time datetime null;

alter table card
    add install_num int default 0 null;

alter table card
    add setting varchar(200) null comment '设置页面的url';

alter table card
    add dict_option longtext null comment '配置的参数';

alter table card
    add constraint card_pk
        unique (name_en);

create index card_name_en_index
    on card (name_en);

#创建config数据表

create table if not exists config
(
    user_id int null
) character set utf8mb4
  collate utf8mb4_general_ci comment '用户配置数据表';

create index config_user_id_index
    on config (user_id);

alter table config
    add config longtext null;

# 创建file数据表

create table if not exists file
(
    id bigint auto_increment
        primary key
) character set utf8mb4
  collate utf8mb4_general_ci comment '文件';

alter table file
    add path varchar(255) null;

alter table file
    add user_id int null;

alter table file
    add create_time datetime null;

alter table file
    add size double default 0 null comment '尺寸';

alter table file
    add mime_type varchar(100) null comment '文件类型';

alter table file
    add hash varchar(100) null comment '文件哈希';


#创建history数据表

create table if not exists history
(
    id bigint auto_increment
        primary key,

    constraint history_id_uindex
        unique (id)
) character set utf8mb4
  collate utf8mb4_general_ci comment 'link历史数据';

alter table history
    add user_id int null;

alter table history
    add link longtext null;

alter table history
    add create_time datetime null comment '创建时间';


#创建link数据表

create table if not exists link
(
    user_id int null
) character set utf8mb4
  collate utf8mb4_general_ci;

create index link_user_id_index
    on link (user_id);


alter table link
    add update_time datetime null comment '更新时间';

alter table link
    add link longtext null;


#创建link_folder数据表

create table if not exists link_folder
(
    id int auto_increment comment 'id'
        primary key
) character set utf8mb4
  collate utf8mb4_general_ci comment '标签链接分类';

alter table link_folder
    add name varchar(50) null comment '分类名称';

alter table link_folder
    add sort int default 0 null;

alter table link_folder
    add group_ids varchar(200) default '0' null comment '可见用户分组';

#创建link_store数据表

create table if not exists linkstore
(
    id int auto_increment
        primary key,
    constraint linkStore_id_uindex
        unique (id)
) character set utf8mb4
  collate utf8mb4_general_ci;

alter table linkstore
    add name varchar(255) null;

alter table linkstore
    add src varchar(255) null;

alter table linkstore
    add url text null;

alter table linkstore
    add type varchar(20) default 'icon' null;

alter table linkstore
    add size varchar(20) default '1x1' null;

alter table linkstore
    add create_time datetime null;

alter table linkstore
    add hot bigint default 0 null;

alter table linkstore
    add area varchar(20) default '' null comment '专区';

alter table linkstore
    add tips varchar(255) null comment '介绍';

alter table linkstore
    add domain varchar(255) null;

alter table linkstore
    add app int default 0 null comment '是否app';

alter table linkstore
    add install_num int default 0 null comment '安装量';

alter table linkstore
    add bgColor varchar(30) null comment '背景颜色';

alter table linkstore
    add vip int default 0 null comment '是否会员可见 0所有人 1=会员';

alter table linkstore
    add custom text null comment '自定义配置';

alter table linkstore
    add user_id int null comment '用户id';

alter table linkstore
    add status int default 1 null comment '状态 1=展示 0=待审核';

alter table linkstore
    add group_ids varchar(200) default '0' null comment '可见用户分组';


#创建note数据表

create table if not exists note
(
    id bigint auto_increment
        primary key,
    constraint note_id_uindex
        unique (id)
) character set utf8mb4
  collate utf8mb4_general_ci;

alter table note
    add user_id bigint null;

alter table note
    add title varchar(50) null;

alter table note
    add text text null;

alter table note
    add create_time datetime null;

alter table note
    add update_time datetime null;

alter table note
    add weight int default 0 null;

create index note_user_id_index
    on note (user_id);

#创建search_engine数据表

create table if not exists search_engine
(
    id int auto_increment
        primary key
) character set utf8mb4
  collate utf8mb4_general_ci comment '搜索引擎';

alter table search_engine
    add name varchar(50) null comment '名称';

alter table search_engine
    add icon varchar(255) null comment '图标 128x128';

alter table search_engine
    add url varchar(255) null comment '跳转url';

alter table search_engine
    add sort int default 0 null comment '排序';

alter table search_engine
    add create_time datetime null comment '添加时间';

alter table search_engine
    add status int default 0 null comment '状态 0=关闭 1=启用';

alter table search_engine
    add tips varchar(250) null comment '搜索引擎介绍';


#创建setting表

create table if not exists setting
(
    `keys` varchar(200) not null
        primary key
) character set utf8mb4
  collate utf8mb4_general_ci;

alter table setting
    add value text null;

#创建tabbar数据表

create table if not exists tabbar
(
    user_id int null
) character set utf8mb4
  collate utf8mb4_general_ci comment '用户页脚信息';

alter table tabbar
    add tabs longtext null;

alter table tabbar
    add update_time datetime null;

#创建token表

create table if not exists token
(
    id bigint auto_increment
        primary key,
    constraint token_id_uindex
        unique (id)
) character set utf8mb4
  collate utf8mb4_general_ci;

alter table token
    add user_id int null;

alter table token
    add token tinytext null;

alter table token
    add create_time int null;

alter table token
    add ip tinytext null;

alter table token
    add user_agent tinytext null;

alter table token
    add access_token varchar(200) null comment 'qq的令牌';


#创建user表

create table if not exists user
(
    id int auto_increment
        primary key,
    constraint user_id_uindex
        unique (id)
) character set utf8mb4
  collate utf8mb4_general_ci;

alter table user
    add avatar varchar(255) null comment '头像';

alter table user
    add mail varchar(50) null;

alter table user
    add password tinytext null;

alter table user
    add create_time datetime null;

alter table user
    add login_ip varchar(100) null comment '登录IP';

alter table user
    add register_ip varchar(100) null comment '注册IP';

alter table user
    add manager int default 0 null;

alter table user
    add login_fail_count int default 0 null;

alter table user
    add login_time datetime null comment '登录时间';

alter table user
    add qq_open_id varchar(200) null comment 'qq开放平台Id';

alter table user
    add nickname varchar(200) null comment '昵称';

alter table user
    add status int default 0 null comment '用户账号状态 0正常 1冻结';

alter table user
    add active date null comment '今日是否活跃';

alter table user
    add group_id bigint default 0 null;

alter table user
    add constraint user_pk
        unique (mail);

alter table user
    add constraint user_pk_2
        unique (qq_open_id);



#创建user_search_engine表

create table if not exists user_search_engine
(
    user_id int not null
        primary key,
    constraint user_search_engine_pk
        unique (user_id)
) character set utf8mb4
  collate utf8mb4_general_ci comment '用户搜索引擎同步表';

alter table user_search_engine
    add list longtext null;


#创建wallpaper表

create table if not exists wallpaper
(
    id int auto_increment
        primary key
) character set utf8mb4
  collate utf8mb4_general_ci;

alter table wallpaper
    add type int null comment '1=folder；0=assets';

alter table wallpaper
    add folder int null comment '0';

alter table wallpaper
    add mime int default 0 null comment '文件类型0=images，1=video';

alter table wallpaper
    add url text null comment '图片地址';

alter table wallpaper
    add cover text null comment '封面';

alter table wallpaper
    add create_time datetime null;

alter table wallpaper
    add name varchar(200) null comment '标题';

alter table wallpaper
    add sort int default 999 null;


create table user_group
(
    id bigint auto_increment comment '自增ID',
    constraint user_group_pk
        primary key (id)
)
    comment '用户分组';

alter table user_group
    add name varchar(50) not null comment '分组名称';

alter table user_group
    add create_time datetime null comment '创建时间';

alter table user_group
    add sort int default 0 null comment '排序';


##创建结束


##卡片组件安装部分

# 创建待办内容数据表

create table if not exists plugins_todo
(
    id int auto_increment
        primary key
) comment '待办事项';


alter table plugins_todo
    add status int default 0 null comment '状态1=完成，0=未完成';

alter table plugins_todo
    add user_id int null;

alter table plugins_todo
    add create_time datetime null;

alter table plugins_todo
    add expire_time datetime null;

alter table plugins_todo
    add todo text(1000) null;

alter table plugins_todo
    add weight int null comment '重要程度 1-6 颜色划分';

alter table plugins_todo
    add folder varchar(20) null comment 'today=今天；week=最近七天；其他正常';

create index plugins_todo_user_id_index
    on plugins_todo (user_id);

# 创建待办文件夹数据表

create table if not exists plugins_todo_folder
(
    id int auto_increment,
    primary key (id)
) comment 'todo分类';

alter table plugins_todo_folder
    add column user_id int null comment '用户';

alter table plugins_todo_folder
    add column name varchar(30) null;

alter table plugins_todo_folder
    add column create_time datetime null;

create index plugins_todo_folder_user_id_index
    on plugins_todo_folder (user_id);


INSERT INTO card (name, name_en, version, tips, src, url, `window`)
VALUES ('今天吃什么', 'food', 3, '吃什么是个很麻烦的事情', '/plugins/food/static/ico.png', '/plugins/food/card', '/plugins/food/window')
ON DUPLICATE KEY UPDATE name = VALUES(name), version = VALUES(version), tips = VALUES(tips), src = VALUES(src), url = VALUES(url), `window` = VALUES(`window`);

INSERT INTO card (name, name_en, version, tips, src, url, `window`)
VALUES ('天气', 'weather', 13, '获取您所在地的实时天气！', '/plugins/weather/static/ico.png', '/plugins/weather/card', '/plugins/weather/window')
ON DUPLICATE KEY UPDATE name = VALUES(name), version = VALUES(version), tips = VALUES(tips), src = VALUES(src), url = VALUES(url), `window` = VALUES(`window`);

INSERT INTO card (name, name_en, version, tips, src, url, `window`)
VALUES ('电子木鱼', 'muyu', 5, '木鱼一敲 烦恼丢掉', '/plugins/muyu/static/ico.png', '/plugins/muyu/card', '/plugins/muyu/window')
ON DUPLICATE KEY UPDATE name = VALUES(name), version = VALUES(version), tips = VALUES(tips), src = VALUES(src), url = VALUES(url), `window` = VALUES(`window`);

INSERT INTO card (name, name_en, version, tips, src, url, `window`)
VALUES ('热搜', 'topSearch', 15, '聚合百度，哔站，微博，知乎，头条等热搜！', '/plugins/topSearch/static/ico.png', '/plugins/topSearch/card', '/plugins/topSearch/window')
ON DUPLICATE KEY UPDATE name = VALUES(name), version = VALUES(version), tips = VALUES(tips), src = VALUES(src), url = VALUES(url), `window` = VALUES(`window`);

INSERT INTO card (name, name_en, version, tips, src, url, `window`)
VALUES ('记事本', 'noteApp', 15, '快捷记录您的灵感', '/plugins/noteApp/static/ico.png', '/plugins/noteApp/card', '/noteApp')
ON DUPLICATE KEY UPDATE name = VALUES(name), version = VALUES(version), tips = VALUES(tips), src = VALUES(src), url = VALUES(url), `window` = VALUES(`window`);

INSERT INTO card (name, name_en, version, tips, src, url, `window`)
VALUES ('每日诗词', 'poetry', 8, '精选每日诗词！', '/plugins/poetry/static/ico.png', '/plugins/poetry/card', '/plugins/poetry/window')
ON DUPLICATE KEY UPDATE name = VALUES(name), version = VALUES(version), tips = VALUES(tips), src = VALUES(src), url = VALUES(url), `window` = VALUES(`window`);

INSERT INTO card (name, name_en, version, tips, src, url, `window`)
VALUES ('日历', 'calendar', 1, '日历', '/plugins/calendar/static/ico.png', '/plugins/calendar/card', '/plugins/calendar/window')
ON DUPLICATE KEY UPDATE name = VALUES(name), version = VALUES(version), tips = VALUES(tips), src = VALUES(src), url = VALUES(url), `window` = VALUES(`window`);

INSERT INTO card (name, name_en, version, tips, src, url, `window`)
VALUES ('待办事项', 'todo', 8, '快捷添加待办事项', '/plugins/todo/static/ico.png', '/plugins/todo/card', '/plugins/todo/window')
ON DUPLICATE KEY UPDATE name = VALUES(name), version = VALUES(version), tips = VALUES(tips), src = VALUES(src), url = VALUES(url), `window` = VALUES(`window`);
