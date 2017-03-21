Title: A tour of Go
Tags: programming
Notebook: EVND

[TOC]

# A tour of go

## basics
+ 大文字で始まる名前は外部のパッケージから参照できる
+ `func add(x int, y int) int { return x + y }`  キモw
  + 宣言があとにある理由は[Go's declaration syntax](https://blog.golang.org/gos-declaration-syntax)
    + 左から右に読むほうが普通でしょって話っぽい
  + 省略して `add(x, y int)` としても良い
+ 名前付き戻り値をドキュメント的に使うことが推奨
  ```go
  func split(sum int) (x, y int) {
  	x = sum * 4 / 9
  	y = sum - x
  	return
  }
  ```
+ 変数宣言は `var i int = 1`とか、暗黙的な方宣言は `k := 2` とか
+ `const` は64-bit以上の整数を保持できる高精度な値

## flow control
+ forとかifは `()` がいらない
+ __for は while__
  ```go
  i := 0
  for i < 10 {
    i += 1
  }
  ```
+ if は条件の前に簡単なステートメントを書け、スコープはifの中だけ
  ```go
  if v := math.Pow(x, n); v < lim {
    return v
  }
  ```
+ switchはcaseの最後で自動で気にbrakeする
  + `if ... elslif ... elsif ...` のかわりに、`switch { case ... case ... }` を使うらしい
+ defer ステートメントを使うと、関数の実行を呼び出し元の終了まで遅延させる
  + ただし、引数の内容はすぐに評価される
  + stackなので、LIFO

### Exercise ニュートン法
10回繰り返す
```go
package main

import (
	"fmt"
)

func Sqrt(x float64) float64 {
	var z float64 = x
	for i := 0; i < 10; i++ {
		z = z - (z*z - x)/(2*z)
		fmt.Println(z)
	}
	return z
}

func main() {
	fmt.Println(Sqrt(2))
}
```

差が小さくなった時

```go
func Sqrt(x float64) float64 {
	var z float64 = x
	for {
		new_z := z - (z*z - x)/(2*z)
		fmt.Println(z)
    if diff := math.Abs(new_z - z); diff < 0.000001 {
        z = new_z
        break
    }
    z = new_z
	}
	return z
}

```
