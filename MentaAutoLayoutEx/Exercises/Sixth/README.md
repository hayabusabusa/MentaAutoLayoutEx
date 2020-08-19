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
| ![Simulator Screen Shot - iPhone 11 - 2020-08-19 at 15 19 55](https://user-images.githubusercontent.com/31949692/90599297-8b804100-e22f-11ea-9b4a-e83337f85531.png) | ![ex6](https://user-images.githubusercontent.com/31949692/90626526-09574300-e256-11ea-90da-65a461735f08.png) |

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

UIStackView を適応し、グループ化することができましたが、  
このままでは UIStackView の設定が自動で設定されたものになっているので設定を編集します。

UIStackView を選択すると **Attribute Inspector** に以下のような設定が表示されます。

| UIStackView の設定  |
| :----------------: |
| ![スクリーンショット 2020-08-19 16 54 28](https://user-images.githubusercontent.com/31949692/90607785-ac02c800-e23c-11ea-959b-8e8e2118b70f.png) |

それぞれの設定は以下のようになっています。

- Axis: 軸の設定、縦並び、横並びを設定できます。
- Alignment: どのように並ぶかを設定できます。幅いっぱいに並ぶ **Fill** を使うことが多いです。
- Distribution: 並び方の詳細なオプションのようなものです。少し複雑なので、詳細は[参考記事](https://qiita.com/taka1068/items/69273f05d34cfbeb3679)を確認してください。
- Spacing: まとめた部品同士の間隔を設定できます。

この設定をグループA、グループBそれぞれ以下のようにします。

| グループAの設定 | グループBの設定 |
| :----------: | :-----------: |
| ![スクリーンショット 2020-08-19 19 57 30](https://user-images.githubusercontent.com/31949692/90626828-5dfabe00-e256-11ea-8ca9-35451f4f8152.png) | ![スクリーンショット 2020-08-19 19 57 44](https://user-images.githubusercontent.com/31949692/90626881-694de980-e256-11ea-81b5-3a9d22bbcfbc.png) |

### Auto Layout の制約を追加

このままでは複数の部品をまとめただけなので、  
最後に Auto Layout の制約を追加して固定します。

一番外側の UIStackView に対して**上下14pxの余白、左右16pxの余白**の制約を付けます。  
そのままでは ImageView とボタンのサイズが決まっていないため、ImageView には**幅、高さが 1:1 になる制約**、  
ボタンは**幅が80pxになる制約**を付ければ完成です。

なお 1:1 のように幅、高さを比率で設定するには **Control** キーを押しながら部品の上ではなすことでメニューが表示され、  
**Aspect Ratio** の項目から設定することができます。そのままでは現在の値が設定されているので、**Size Inspector** から値を 1:1 に編集します。

| Aspect Ration の設定 | 制約の編集 |
| :-----------------: | :------: |
| ![Aug-19-2020 20-39-27](https://user-images.githubusercontent.com/31949692/90630703-7d94e500-e25c-11ea-8149-243f897d2cda.gif) | ![スクリーンショット 2020-08-19 20 37 11](https://user-images.githubusercontent.com/31949692/90630758-91404b80-e25c-11ea-860c-4980c5f9ae0e.png) |

### UIStackView の威力を確認する

この状態で縦に並んだ二つのラベルの位置を交換してみます。  
やり方は簡単で、Storyboard 左の View の階層から部品の順番を入れ替えるだけです。

![Aug-19-2020 20-55-20](https://user-images.githubusercontent.com/31949692/90631802-56d7ae00-e25e-11ea-9012-312856723967.gif)

Auto Layout 等をリセットすることなく入れ替えることができるのでかなり強力ですが、  
ラベルとボタンの間に新しくボタンを挿入することも簡単にできます。

![Aug-19-2020 20-57-22](https://user-images.githubusercontent.com/31949692/90631979-9b634980-e25e-11ea-8b33-7f79e567e009.gif)

他にも `isHidden` プロパティを切り替えることで表示非表示 + トルツメをすることも可能です。  
また、グループにしてまとめたことにより Auto Layout の制約の数も大幅に少なくすることができます。  
このように UIStackView を使うことで多くのメリットがあるので、積極的に使用してください。

### UIStackView について参考記事

- [StackViewを賢く使ってらくちんAutoLayout](https://qiita.com/yucovin/items/ff58fcbd60ca81de77cb)
- [UIStackViewの5つのdistributionを理解する](https://qiita.com/taka1068/items/69273f05d34cfbeb3679)