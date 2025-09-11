# はじめに
MySQLを使ったSQLや実行計画を学習するためのリポジトリです。

## 使い方
- ローカルで`docker-compose.yml`を起動する場合は`.env`ファイルのユーザーIDとパスワードを設定してから、起動してください。
- GitHubの`Codespaces`で起動する場合は `Settings`タブ ＞ `Secrets and variables` ＞ `Codespaces` で`.env.sample`の内容を設定してください。

## ER図
```mermaid
erDiagram
  SCHOOL ||--o{ STUDENT : "has"
  STUDENT ||--o{ SCORE : "has"
  STUDENT ||--o{ CLUB : "joins"

  SCHOOL {
    string 学校ID PK
    string 学校所在地
    string 地区
    string 学校名
  }
  STUDENT {
    string 学籍番号 PK
    string 名前
    string 性別
    string 住所
    int    学年
    string クラス
    string 担任
    date   入学年月日
    string 学校ID FK
  }
  SCORE {
    string 学籍番号 PK,FK
    string 科目   PK
    int    点数
  }
  CLUB {
    string ID        PK
    string 学籍番号 FK
    string 部活
  }
```