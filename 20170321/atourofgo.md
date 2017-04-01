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
  + ファイルを開いたりするときに使うっぽい
  + ただし、引数の内容はすぐに評価される
  + stackなので、LIFO
  + 詳しくは [Defer, Panic, and Recover \- The Go Blog](https://blog.golang.org/defer-panic-and-recover)

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

## MoreTypes
+ 型Tのポインタは*T, ゼロ値はnil
  + `&i` や `*p` は cと一緒
+ struct は fieldの集まり
  ```go
  type Vertex struct {
    X int
    Y int
  }
  ```
  + フィールドには `.` でアクセス (`v.X` など)
  + ポインタを通して、 `p.X` ともできる(`(*p).X`ともできる)
  + `Vertex{X:1}` のように、名前付きで列挙することも可能
+ 配列は、`var a [10]int` のようにする
  + サイズは変えられない
  + スライス `[]int` は可変長
  + スライスは配列の一部を指し示しているだけなので、もとの配列の変更が反映される
  + __スライスのリテラルは長さのない配列リテラルのようなもの__
  + `len(s)`は要素数、`cap(s)`はもとの配列の要素数
  + `a := make([]int, 5)` => 長さ5のゼロ化されたスライス
  + `append(s [T], vs ...T) []T` でappendできる
  + `range s` ってすると反復処理できる
    ```go
    var pow = []int{1, 2, 4, 8, 16, 32, 64, 128}
    for i, v := range pow {
      fmt.Printf("2**%d = %d\n", i, v)
    }
    ```
+ map[key T]val S でhashみたいなのが作れる
  + 初期化は`make(map[string]Vertex)`みたいな
  + 更新、取得はrubyとかと一緒
  + `delete(m, key)`
  + 2つめの返り値で存在確認 `elem, ok = m[key]`
+ 関数も変数!
  + 返り値に取れるので、
    ```go
    func compute(fn func(float64, float64) float64) float64 {
      return fn(3, 4)
    }
    ```
    みたいなことも可能
  + Goの関数はクロージャ!!
    ```go
    func adder() func(int) int {
      sum := 0
      return func(x int) int {
        sum += x
        return sum
      }
    }
    ```

### Exercise: Slices
```go
package main

import "golang.org/x/tour/pic"

func Pic(dx, dy int) [][]uint8 {
	pic := make([][]uint8, dy)
	for y, _ := range(pic) {
		pic[y] = make([]uint8, dx)
		for x, _ := range(pic[y]) {
			pic[y][x] = (uint8) (x^y)
		}
	}
	return pic
}

func main() {
	pic.Show(Pic)
}
```

### Exercise: Maps
```go
package main

import (
	"golang.org/x/tour/wc"
	"strings"
)

func WordCount(s string) map[string]int {
	m := make(map[string]int)
	for _, word := range(strings.Fields(s)) {
		m[word] += 1
	}
	return m
}

func main() {
	wc.Test(WordCount)
}
```

### Exercise: Fibonacci closure
```go
package main

import "fmt"

// fibonacci is a function that returns
// a function that returns an int.
func fibonacci() func() int {
	prev := 0
	now := 1
	idx := 0
	return func() int {
		defer func(){idx += 1}()
		switch(idx){
		case 0:
			return 0
		case 1:
			return 1
		default:
			prev, now = now, prev + now
			return now
		}
	}
}

func main() {
	f := fibonacci()
	for i := 0; i < 10; i++ {
		fmt.Println(f())
	}
}
```
