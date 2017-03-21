Title: A tour of Go
Tags: programming
Notebook: EVND

[TOC]

# A tour of go

## basics
+ 大文字で始まる名前は外部のパッケージから参照できる
+ `func add(x int, y int) int { return x + y }`  キモw
  + 宣言があとにある理由は[Go's declaration syntax](https://blog.golang.org/gos-declaration-syntax)（あとで読みたい）
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
