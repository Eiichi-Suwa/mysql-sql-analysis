# はじめに
MySQLを使ったSQLや実行計画を学習するためのリポジトリです。

## 利用上の注意
- `Github`の`Codespace`を利用します。`Codespace`は設定によってはコストがかかるものなので [Codespaceの利用上の注意](#Codespaceの利用上の注意) はよく確認してください。

## 使い方
※ ローカルで`docker-compose.yml`を起動する場合は`.env`ファイルのユーザーIDとパスワードを設定してから、起動してください。<br>ここでは`Codespaces`で起動する方法を記載しています。

1. このリポジトリをフォークするため、右上の`fork`をクリックする<br>
  ![fork](./assets/fork.png)
1. フォークが完了すると XXX になる
1. `.env.sample`の内容を設定するために、`Settings`タブ を開きます。<br>
  ![settings-tab](./assets/settings-tab.png)
1. 左のメニューから `Secrets and variables` ＞ `Codespaces` を開きます。<br>
  ![secrets-and-variables](./assets/secrets-and-variables.png)
1. `new repository Secrets`ボタンをクリックして、3つのシークレットを設定します。<br>
  ![new-secrets](./assets/new-secrets.png)
1. `Name`に`MYSQL_ROOT_PASSWORD`と入力して、`Secret`に適当なパスワードを入力します（後ほど使いますのでメモしてください）。<br>
  ![set-root-password](./assets/set-root-password.png)
1. `Name`に`MYSQL_PASSWORD`と入力して、`Secret`に適当なパスワードを入力します（後ほど使いますのでメモしてください）。<br>
  ![set-password](./assets/set-password.png)
1. `Name`に`MYSQL_USER`と入力して、`Secret`に適当なユーザーIDを入力します（後ほど使いますのでメモしてください）。<br>
  ![set-user](./assets/set-user.png)
1. シークレットの設定が完了したら以下の画像のようになります。
  ![success-setting](./assets/success-setting.png)
1. シークレット完了後、`Codespace`を起動するため、`Code`タブに移動し、右上にある緑色の`code`のプルダウンメニューを開き、`Codespace`タブを開き、`Create codespace on main`をクリックします。
  ![success-setting](./assets/start-code-space.png)
1. `Codespace`の生成にはしばらく時間がかかるため、しばらく待ちます。<br>
  ![create-now](./assets/create-now.png)
1. `VSCode`が起動しますが、画面右下が`リモートを開いています...`の間は待ちます。<br>
  ![vscode-setup-now](./assets/vscode-setup-now.png)
1. 画面右下が`Codespace`になった場合は、`VSCode`が起動しました。<br>
  ![vscode-setup-finish](./assets/vscode-setup-finish.png)
1. `MySQL`に接続するため、右側の筒状のアイコンをクリックして`Create connection`をクリックします。（もし、`Create connection`をクリックしても反応が無い場合は、Webブラウザをリロードしてみてください）<br>
  ![new-connection](./assets/new-connection.png)
1. 画面中央に接続設定が表示されるので`Name`に`mysql`、`Host`に`mysql`、`database`に`mydatabase`、`Username`に`root`と入力する。`Password`に`Secret`の`MYSQL_ROOT_PASSWORD`に設定した値を入力します。<br>
  ![connection-settings](./assets/connection-settings.png)
1. `connect`をクリックして`Success!`を確認します<br>
  ![connection-success](./assets/connection-success.png)
1. `Save`をクリックして接続情報を保存すると、左のパネルに先ほど`Name`で指定した名前で接続情報が保存されます。<br>
  ![connection-info](./assets/connection-info.png)
1. `Query`の`+`をクリックして適当な名前を付けてクエリの実行ファイルを生成します。<br>
  ![create-query](./assets/create-query.png)
1. 生成したクエリのファイルに適当なSQLを記述してSQLの上部に出てくる`Run`をクリックするとSQLを実行できます。<br>
  ![run-query](./assets/run-query.png)

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

## Codespaceの利用上の注意
- アカウントの種類が個人であり、クレジットカードを登録していない想定です。この条件であれば上限を超過すると使えなくなるだけ（のはず！）です。

### アカウントの確認
- `Github`には`個人アカウント`以外にも`Organization アカウント`と`Enterprise アカウント`があります。
- 画面右上の自分のアカウントをクリックして`Organizations`をクリックして組織が表示されず「Organizations You are not a member of any organizations.」という表示のみであれば個人アカウント<br>
  ![my-organizations](./assets/my-organizations.png)
- （追記中）

