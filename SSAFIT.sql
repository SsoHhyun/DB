DROP DATABASE ssafit;

create DATABASE ssafit;

use ssafit;

CREATE TABLE youtube (
   id VARCHAR(30) NOT NULL,
    title VARCHAR(200) NOT NULL,
    part VARCHAR(10) NOT NULL,
   channel_name VARCHAR(30) NOT NULL,
    url VARCHAR(200) NOT NULL,
    view_cnt INT,
    PRIMARY KEY (id)
);

CREATE TABLE review (
   id INT AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    content TEXT,
   writer_id VARCHAR(30) NOT NULL,
    reg_date TIMESTAMP DEFAULT now(),
    view_cnt INT DEFAULT 0,
    video_id VARCHAR(30),
    PRIMARY KEY (id)
);

INSERT INTO review (title, content, writer_id, video_id)
VALUES ("운동 시러용", "운동 시렁", "나렁이", "gMaB-fG4u4g"),
("운동 좋아용", "운동 조앙", "유잔디", "swRNeYw1JkY"),
("영상,, 좋네여", "보기만 해도 살빠집니다", "소혀니", "tzN6ypk6Sps"),
("운동 귀찮지만,, 해야지", "윤동,, 좋아~~", "저니정", "7TLk7pscICk");


SELECT *
FROM review;

INSERT INTO youtube (id, title, part, channel_name, url, view_cnt)
values ("gMaB-fG4u4g", "전신 다이어트 최고의 운동 [칼소폭 찐 핵핵매운맛]", "전신", "ThankyouBUBU",
            "https://www.youtube.com/embed/gMaB-fG4u4g", 123),
      ("swRNeYw1JkY", "하루 15분! 전신 칼로리 불태우는 다이어트 운동", "전신", "ThankyouBUBU",
            "https://www.youtube.com/embed/swRNeYw1JkY", 120),
      ("54tTYO-vU2E", "상체 다이어트 최고의 운동 BEST [팔뚝살/겨드랑이살/등살/가슴어깨라인]", "상체", "ThankyouBUBU",
            "https://www.youtube.com/embed/54tTYO-vU2E", 119),
      ("QqqZH3j_vH0", "상체비만 다이어트 최고의 운동 [상체 핵매운맛]", "상체", "ThankyouBUBU",
            "https://www.youtube.com/embed/QqqZH3j_vH0", 118),
      ("tzN6ypk6Sps", "하체운동이 중요한 이유? 이것만 보고 따라하자 ! [하체운동 교과서]", "하체", "김강민",
            "https://www.youtube.com/embed/tzN6ypk6Sps", 117),
      ("u5OgcZdNbMo", "저는 하체 식주의자 입니다", "하체", "GYM종국", "https://www.youtube.com/embed/u5OgcZdNbMo",
            116),
     ("PjGcOP-TQPE", "11자복근 복부 최고의 운동 [복근 핵매운맛]", "복부", "ThankyouBUBU",
            "https://www.youtube.com/embed/PjGcOP-TQPE", 115),
      ("7TLk7pscICk", "(Sub)누워서하는 5분 복부운동!! 효과보장! (매일 2주만 해보세요!)", "복부", "SomiFit",
            "https://www.youtube.com/embed/7TLk7pscICk", 114);


select *
from youtube;