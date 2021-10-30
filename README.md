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

### 独自のAssertionを作成する場合
- 以下の例のように現在実行中の「lineとfile」を渡してください。
- そうしないと本来下記のメソッドで表示したいエラーの位置が呼び出し元になってしまいます。

```
空文字判定の独自Assert

func assertEmpty(_ string: String, file: StaticString = #file, line: UInt = #line) {
  XCTAssertTrue(string.isEmpty, "¥"¥(string)|" is not empty", file:file, line:line)
}

呼び出し時
func testAssertEmpty() {
  let string = "hello"
  seertEmpty(string)
}
```

### テスト結果の抽出
- XCode11以前はxccovを使って.xccovreportの中身を確認していたようです
- XCode11以降はxccresultというファイルの中身を確認します。[参考1](https://swet.dena.com/entry/2019/10/23/080000)、[参考2](https://engineering.mercari.com/blog/entry/20201218-61f7110851/)

```
$ xcrun xccov view --report ResultBundle.xcresult
```
