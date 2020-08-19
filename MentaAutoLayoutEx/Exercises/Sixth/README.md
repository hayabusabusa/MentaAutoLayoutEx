## 練習課題6 StackViewを使用した複数部品の固定

練習課題5では複数の部品を使用し、カスタムのセルを作成しました。  
しかし、以下のような要望がでた場合どうなるでしょうか。

- アバター画像とフォローボタンの位置を入れ替えたい
- 新たにラベルを一つ真ん中に追加したい

現在のままでは、上記を実現するためには一度 Auto Layout の制約を外し、  
部品の位置を変更、追加した上でもう一度 Auto Layout の制約を付け直す必要があります。  

この問題を解決するために **UIStackView** という部品を使用します。  
**UIStackView** は Auto Layout のラッパークラスで、複数の View を包むように使用します。  
今回は練習課題5と同じものを **UIStackView** を使って実装します。

**UIStackView** は少し癖があり、慣れるまでは難しいので  
実際に使ったことがない場合は、以下の**実装のヒントを参考に手を動かして実装してください**。  
今回は **UIStackView** の利用方法や効果を知ってもらうことが目的の課題となっているため、一から実装ができる必要はありません。

| 期待する画面 | 制約の詳細 |
| :--------: | :------: |
| ![Simulator Screen Shot - iPhone 11 - 2020-08-19 at 15 19 55](https://user-images.githubusercontent.com/31949692/90599297-8b804100-e22f-11ea-9b4a-e83337f85531.png) | ![ex6](https://user-images.githubusercontent.com/31949692/90600067-dd759680-e230-11ea-97e2-0f267c5b874f.png) |

上記の画像は iPhone11 の画像ですが、  
実装の際には iPhone11 での表示だけではなく、必ず初代 iPhoneSE などの画面が小さい端末でも同じ表示になることを確認してください。

## 実装のヒント

以下は実装する上でのヒントになります。  
実装の方針が思いつかない場合等に参考にしてください。

### グルーピング

UIStackView を使用することで複数の部品をまとめることができます。  
まとめた部品をさらに UIStackView を使用してまとめることで、より複雑なレイアウトを実現することができます。  
入れ子にしていくようなイメージです。

まずは第一段階として、1つのまとまりとなるグループを見つけます。  
基本的に同じ軸の方向に並んでいる部品同士がグループになるようなイメージです。  
今回の場合は以下のグループに分けられそうです。

**グループA**  
縦に二つ並んだラベルをまとめたグループ

**グループB**  
横一列に並んだアバター画像、グループA、ボタンをまとめたグループ

| グループA | グループB |
| :--------: | :------: |
| <img width="828" alt="Frame 2" src="https://user-images.githubusercontent.com/31949692/90602541-e4060d00-e234-11ea-9404-eacb0ba26dda.png"> | <img width="828" alt="Frame 3" src="https://user-images.githubusercontent.com/31949692/90602569-eff1cf00-e234-11ea-82ab-5caef83174b1.png"> |

この分けたグループにそれぞれ UIStackView を適応させていきます。  
また、上記の画像をみてもらえば分かるかもしれませんが、制約の詳細の画像の赤とオレンジの枠はグループを表しています。

### UIStackView の利用方法

UIStackView を適応させる場合、まずは適応させる部品を **Shiftキー** を押しながら複数選択し、  
Xcode 画面下部のメニューから **Embed In** を選択し、**Stack View** の項目を選択することで複数選択した部品に適応させることができます。

| グループAに適応させる | グループBに適応させる |
| :----------------: | :---------------: |
| ![Aug-19-2020 15-43-43](https://user-images.githubusercontent.com/31949692/90601285-ed8e7580-e232-11ea-9f25-b8c638ec2fe7.gif) | ![Aug-19-2020 16-03-35](https://user-images.githubusercontent.com/31949692/90603025-9342e400-e235-11ea-8764-978b142ff243.gif) |

これでそれぞれのグループに UIStackView を適応させ、まとめることができました。

### UIStackView の設定
WIP

### Auto Layout の制約を追加
WIP

### UIStackView の威力を確認する
WIP

### UIStackView について参考記事

- [StackViewを賢く使ってらくちんAutoLayout](https://qiita.com/yucovin/items/ff58fcbd60ca81de77cb)
- [UIStackViewの5つのdistributionを理解する](https://qiita.com/taka1068/items/69273f05d34cfbeb3679)