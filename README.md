# github_actions

## Bundlerの導入
- fastlaneやiOSパッケージマネージャであるCocoaPodsはRubyのライブラリ
- 開発チームで使用するバージョンを揃えるためにBundlerを導入する

### bundlerのインストール
```
gem install bundler
```

### Gemfileを生成(生成済)
```
gem install bundler
```

### Gemfileにライブラリを追加して、gem install
```
bundle install
bundle info XXXX --> DLしたライブラリのバージョン確認
```


## UnitTestの導入
- XXXXTest.swiftという形でUnitTestのファイルを追加する
- @testableでモジュールインポートを忘れずに！！
- testYYYYと「test」でメソッドを始めること
- command shift U でテストを実行する

### 強制unwrapはNG
- 失敗された位置が記録されない
- 強制アンラップ以降のコードが実行されない
- XCode上の操作ではテストの実行が停止してしまう
