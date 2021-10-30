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
