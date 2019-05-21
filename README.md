# serverspecサンプル

### このserverspecでできること

- OS初期設定を実行後、想定通りに設定がされたかをテストします。

- 各テナントの踏み台・中継サーバにserverspecをインストールして実行してください

- OSはCentOS7またはDebian8とします。

### serverspecのインストール方法

- Debianの場合

```
apt-get install ruby
apt-get install gem
gem install rake
gem install serverspec
```


### 実行前の準備

```
git clone https://github.com/y-araki-git/serverspec.git/init.git
```

- serverspec実行ユーザの~/.ssh/configファイルに、下記サンプルのように実行対象ノードのsshログイン情報を書く

```
Host debian-test
    HostName ip
    User debian
    Port 22
    IdentityFile ~/SSHキー
    ServerAliveInterval 60
Host cent-test
    HostName ip
    User centos
    Port 22
    IdentityFile ~/SSHキー
    ServerAliveInterval 60
```

- 対象ノードのホスト名とロールをproperties.ymlに定義する (ロールはansible playbookと対応)

```
debian-test:
  :roles:
    - init
cent-test:
  :roles:
    - init
```

- dnsサーバなど共通してつかう設定をcommon_properties.yamlに定義する（ansibleのgroup_vars/all.ymlと対応）

- 対象ノードで初期設定Ansibleを流した後、OSリブートを再実行しておくこと


### 実行方法

- 実行コマンド確認

```
    $ rake --task
    rake serverspec:cent-test    # Run serverspec to cent-test
    rake serverspec:debian-test  # Run serverspec to debian-test
    rake spec                    # Run serverspec to all hosts
```

- 全ホストにテスト実行

```
    $ rake spec
```

- 特定のノードのテスト実行

```
    $ rake serverspec:cent-test
```


### 実行結果サンプル

- 実行結果が正常な場合 → 緑で表示される

```
    $ rake serverspec:cent-test
    .... 
    --- cloud_cfg ----------------------------
      File "/etc/cloud/cloud.cfg"
        content
          should match /manage_etc_hosts: false\n/  <------- この行が緑になる
    .... 

```
 
- 実行結果がエラーの場合 → 赤で表示されFAILEDと出力される

```
    $ rake serverspec:cent-test
    .... 
    --- ldap ----------------------------
      Service "nslcd"
        should be enabled
        should be running (FAILED - 1)  <------- この行が赤になる
    .... 

```
