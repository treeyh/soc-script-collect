CREATE TABLE memos (
  id integer,
  content text
);

CREATE EXTENSION IF NOT EXISTS pgroonga;
CREATE INDEX pgroonga_content_index ON memos USING pgroonga (content);

INSERT INTO memos VALUES (1, 'PostgreSQL is a relational database management system.');
INSERT INTO memos VALUES (2, 'Groonga is a fast full text search engine that supports all languages.');
INSERT INTO memos VALUES (3, 'PGroonga is a PostgreSQL extension that uses Groonga as index.');
INSERT INTO memos VALUES (4, 'There is groonga command.');

INSERT INTO memos VALUES (5, '海天是中国调味品行业的优秀企业，专业的调味品生产和营销企业，历史悠久，是中华人民共和国商务部公布的首批“中华老字号”企业之一。');
INSERT INTO memos VALUES (6, '国家新闻出版署公布了2024年第二批进口网络游戏审批信息，共有46款游戏过审获得批号。');
INSERT INTO memos VALUES (7, '此款氮化镓充电器采用第三代GaN氮化镓技术，高速闪充不发烫。外观小巧优雅，手感细腻，富有质感。高颜值更有硬实力。小至28cc容量，轻至40g重量');
INSERT INTO memos VALUES (8, '购买初衷对于使用正版游戏的用户Switch来说，数字账户购买的游戏虽然方便');
INSERT INTO memos VALUES (9, '上学一次性交多少钱');