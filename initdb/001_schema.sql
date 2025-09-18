-- initdb/001_schema.sql
CREATE DATABASE IF NOT EXISTS mydatabase DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

USE mydatabase;

-- 依存順に削除
DROP TABLE IF EXISTS scores;

DROP TABLE IF EXISTS clubs;

DROP TABLE IF EXISTS students;

DROP TABLE IF EXISTS schools ;

-- 文字化け防止（セッション）
SET NAMES utf8mb4;

-- 学校
CREATE TABLE schools  (
    school_id VARCHAR(10) NOT NULL COMMENT '学校ID',
    school_location VARCHAR(50) NOT NULL COMMENT '学校所在地',
    district VARCHAR(50) NOT NULL COMMENT '地区',
    school_name VARCHAR(100) NOT NULL COMMENT '学校名',
    PRIMARY KEY (school_id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 生徒
-- 学年: 0=入学前, 1..3=在学, 9=卒業
CREATE TABLE students (
    student_Id VARCHAR(20) NOT NULL COMMENT '学籍番号',
    name VARCHAR(100) NOT NULL COMMENT '名前',
    gender ENUM('男', '女') NOT NULL COMMENT '性別',
    address VARCHAR(100) NOT NULL COMMENT '住所',
    grade TINYINT NOT NULL COMMENT '学年(0=入学前,1..3=在学,9=卒業)',
    class VARCHAR(5) NOT NULL COMMENT 'クラス',
    teacher VARCHAR(50) NOT NULL COMMENT '担任',
    enrollment_date DATE NOT NULL COMMENT '入学年月日',
    graduation_date DATE NULL COMMENT '卒業年月日(卒業生のみ)',
    school_id VARCHAR(10) NOT NULL COMMENT '学校ID',
    PRIMARY KEY (student_Id),
    CONSTRAINT FK_students_school_id FOREIGN KEY (school_id) REFERENCES schools  (school_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 部活（学習用に索引は最小限）
CREATE TABLE clubs (
    ID VARCHAR(20) NOT NULL COMMENT 'ID',
    student_Id VARCHAR(20) NOT NULL COMMENT '学籍番号',
    club_name VARCHAR(100) NOT NULL COMMENT '部活',
    PRIMARY KEY (ID),
    CONSTRAINT FK_clubs_student_id FOREIGN KEY (student_Id) REFERENCES students (student_Id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 成績（在学・卒業生のみ）
CREATE TABLE scores (
    student_Id VARCHAR(20) NOT NULL COMMENT '学籍番号',
    subject VARCHAR(20) NOT NULL COMMENT '科目',
    score INT NOT NULL COMMENT '点数',
    PRIMARY KEY (student_Id, subject),
    CONSTRAINT FK_scores_student_id FOREIGN KEY (student_Id) REFERENCES students (student_Id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ★インデックスは最小限（PK/FK）のみ