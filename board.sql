CREATE DATABASE ssafy_board DEFAULT CHARACTER SET utf8mb4;

USE ssafy_board;

CREATE TABLE board (
	id INT AUTO_INCREMENT,
    writer VARCHAR(30) NOT NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    view_cnt INT DEFAULT 0,
    reg_date TIMESTAMP DEFAULT now(),
    PRIMARY KEY (id)
);

INSERT INTO board (title, writer, content)
VALUES ('안녕하세요', '박태이', '반갑습니다.'),
('DB는 사실....', '송상훈', 'ez할지도?'),
('벌써 금요일?', '안성진', '워어어어얼화아아아수우우모옥금퇼');


SELECT * FROM board;