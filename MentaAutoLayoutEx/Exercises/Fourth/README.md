##  練習課題4 複数部品の固定について

これまでの課題で扱った制約を使用して複数の部品を固定します。  
今回はラベルとボタンを使用した Empty State (リスト系の結果がなかった場合の画面)のようなものを作成します。  

| 期待する画面 | 制約の詳細 |
| :--------: | :------: |
| ![Simulator Screen Shot - iPhone 11 - 2020-08-17 at 09 05 31](https://user-images.githubusercontent.com/31949692/90347492-cb96c680-e06b-11ea-9bbb-69fa3f177610.png) | ![ex4](https://user-images.githubusercontent.com/31949692/90349258-27fde400-e074-11ea-86a8-e7e50dc4a052.png) |

## 実装のヒント

以下は実装する上でのヒントになります。  
実装の方針が思いつかない場合等に参考にしてください。

### 基準となる部品の決定

複数の部品に対して Auto Layout の制約を設ける場合、  
まずは**基準となる部品**を見つけることがポイントです。

今回の場合、画面中心にラベルがあり、その下にボタンが位置しているので  
ラベルを先に固定し、固定したラベルを基準にボタンを下に固定させるとスムーズに進むと思います。

### 部品同士の固定について

部品同士の固定は今までの課題と同じように  
Xcode 下部のツールバー **Add New Constraints** から行えますが、  
他にも control キーを押したままドラッグアンドドロップすることで異なる部品間の制約を直感的に設定することができます。

| 今までと同じ方法 | キー操作を使用した方法 |
| :-----------: | :-----------------: |
| ![Aug-17-2020 09-49-29](https://user-images.githubusercontent.com/31949692/90348225-00a51800-e070-11ea-834c-02b087d4cb4e.gif) | ![Aug-17-2020 09-51-06](https://user-images.githubusercontent.com/31949692/90348243-1f0b1380-e070-11ea-81be-93cd50536a09.gif) |

キー操作を使用して設定した場合、  
現在の値がそのまま制約に反映されてしまいますが、Auto Layout の制約の値は **Size Inspector** から編集することができます。

<img height="300" alt="スクリーンショット 2020-08-17 9 55 58" src="https://user-images.githubusercontent.com/31949692/90348432-e881c880-e070-11ea-8cc6-25c07522cfcc.png">

### 制約の削除について

間違えて Auto Layout の制約を作成してしまった場合、  
Xcode 下部のツールバー **Resolve Auto Layout Issues** から削除することができます。  
制約を削除したい部品を選択した状態でメニューから **Clear Constraints** を選択すると削除されます。  

![スクリーンショット 2020-08-17 10 01 20](https://user-images.githubusercontent.com/31949692/90348606-b329aa80-e071-11ea-8298-e344ce5ec8dc.png)
