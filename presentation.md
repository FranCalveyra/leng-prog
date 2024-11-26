---
marp: true
title: Go
theme: uncover
class:
- invert
backgroundColor: "#edf9f2"
color: Black
author: Francisco Calveyra
---
# The Go Programming Language

<img src="https://media.licdn.com/dms/image/
D5612AQE-CUMKCDv4XQ/article-cover_image-shrink_720_1280/
0/1713540159978?e=2147483647&v=beta&t=PwEugOUN9p4ZAddQp
-rrfyIeTbkwYw1xvtTr34r6_6I" alt="Go Image" style="width:500px; display: block; margin-left: auto; margin-right: auto;">

Author: Francisco Calveyra
Subject: Programming Languages
Teachers: E. Lopez Gabeiras, Matías Cicilia

---
# Go Programming Language History

- Created at Google in 2007 by Robert Griesemer, Rob Pike, and Ken Thompson.
- Officially announced in 2009.
- Designed to address issues in large-scale software development.
- Known for its simplicity and efficiency

---

# Languages that gave it origin

- Influenced by C, Pascal, and Modula.
- Simplified syntax inspired by Python and JavaScript.
- Draws concurrency ideas from CSP (Communicating Sequential Processes).

---

# Why Choose Go?

- Simple and concise syntax.
- High performance with minimal runtime overhead.
- Built-in support for concurrency.

---

# Go Main Features

- Static typing, strong type system, runtime efficiency (like C).
- Readability and usability (like Python)
- Garbage collection.
- Compiled
- Built-in support for concurrency (goroutines).
- Comprehensive standard library.
---

# Variables

- Declare with `var` when declaring type.
- Declare with shorthand `:=` when inferring type
- Example:
  ```go
  var x int = 10
  y := 20 // This is int type
  ```
  ### Constants
- Defined with `const`.
- 
  ```go
  const Pi = 3.14
  ```
---
# Types (Atomic Types, Type Inference)

<div style="overflow-y: auto; max-height: 400px;">

- Atomic types: `int`, `float64`, `string`, etc.
- Number types differ by size (like Rust)
    ```go
    name := "GoLang" // name's type is inferred
    var float64 x = 10.3
    var float32 y = x // This doesn't compile due to size difference
    ```
- Support for Generics
    ```go
    type MyType[T any] struct {
            Value T
    }
    ```
- Null values represented with `nil`

</div>

---

# Pointers

- Functionality similar to C pointers
- Pointer declaration:
  ```go
  var p *int
  ```
- Dereferencing and referencing with `*` and `&`.
- When passing to a function:
```go
// Note that if both types are the same, signature can be written like this
func swap(x, y *int) {
    // Void functions have no return type
    *x, *y = *y, *x
}
```

---

# Memory
 <!-- Allocation and Deallocation + Garbage Collection -->
- Use `new` and `make` for memory allocation.
- Garbage collection manages memory automatically.
- Example

<div style="overflow-y: auto; max-height: 250px;">

```go
import "fmt"

func main() {
    // Allocate memory for an integer
    p := new(int)
    *p = 42
    fmt.Println(*p) // Output: 42

    // Allocate memory for a slice
    s := make([]int, 5)
    s[0] = 1
    s[1] = 2
    fmt.Println(s) // Output: [1 2 0 0 0]

    // Garbage collection will automatically free memory
    // when p and s are no longer in use
}
```

</div>

---

# Control Flow

- `if`, `for`, `switch` statements.
- No ternary operator.
- `break` and `continue`.

---

# Arrays, Slices

- Arrays: Fixed size.
- Slices: Dynamic size, built on arrays.
    - Strings are also sliceable
<div style="overflow-y: auto; max-height: 250px;">
    
```go
    // Array
    var arr [3]int
    arr[0] = 1
    arr[1] = 2
    arr[2] = 3
    fmt.Println(arr) // Output: [1 2 3]

    // Slice
    s := []int{1, 2, 3}
    s = append(s, 4)
    fmt.Println(s) // Output: [1 2 3 4]
```
    
</div>

---

# Hash Tables, Maps

- Maps: Key-value pairs.
- Default implementation in Go: Hash Table
- Example:
  ```go
  m := map[string]int{"age": 25}
  ```

---

# Structs

- Custom data types.
- Example:
  ```go
  type Person struct {
      Name string
      Age  int
  }
  ```

---

# Functions (Call by Value, Reference)

- Call by value:
  ```go
  func square(x int) int { return x * x }
  ```
- Call by reference:
  ```go
  func increment(p *int) { *p++ }
  ```
- Void functions:
    ```go
    func helloWorld() {
        fmt.Println("Hello world!")}
    ```

---

# Passing Arrays and Slices

- Arrays are passed by value, meaning the function receives a copy.
- Slices are passed by reference, meaning the function can modify the original slice.
<div style="overflow-y: auto; max-height: 250px;">

```go
func printArray(arr [3]int) {
    // decompose array
    for i, v := range arr {
        fmt.Println(i, v)
    }
}

func main() {
    arr := [3]int{1, 2, 3}
    printArray(arr) // Output: 0 1, 1 2, 2 3
    s := []int{1, 2, 3}
    s = append(s, 4)
    fmt.Println(s) // Output: [1 2 3 4]
    }
```
    
</div>

---

# First-Class Values, Functions as a type
- Functions are another data type, therefore they can be assigned and returned
 ```go
// Assign
  add := func(a, b int) int { return a + b }
  // Function returns a functions
  func multiplier(x int) func(int) int {
      return func(y int) int { return x * y }
  }
```

---

# Variadic and Deferred

- Variadic functions: functions that can be called with any number of arguments. Best example is `fmt.Println()`
  ```go
  func sum(nums ...int) int {
    // Implementation here
   }
  ```
- Defer statements to delay execution.
```go
func main() {
    defer fmt.Println("World") // World should be printed after Hello
    fmt.Println("Hello")
}
```

---

# Encapsulation (Structs)
- No traditional classes; use structs.
- Encapsulation with capitalized field names for public access. Private fields with lowercase
```go
// (p *Person) is what's called a receiver, to create a struct method
func (p *Person) SetName(name string) { p.name = name }

func (p *Person) GetName() string { return p.name }

func (p *Person) SetAge(age int) { p.age = age }

func (p *Person) GetAge() int { return p.age }
john := Person{name: "John Doe", age: 24}
fmt.Println(john.name) //This doesn't work, name is a private field
fmt.Println(john.GetName()) //This works
```

---

# Polymorphism + Interfaces (Usage)

- Interfaces define behavior:
```go
  type Shape interface {
      Area() float64
  }
  // Implementation
  type Circle struct {
    radius float64
    }
    // By implementing all methods in interface,
    // Circle implements the Shape interface
  func (c *Circle) Area() float64 {
    return 3.14 * c.radius * c.radius }
```

---

# Type Assertions
<div style="overflow-y: auto; max-height: 500px;">

- Check if a value implements an interface:
    ```go
    if val, ok := i.(int); ok { //This is analog to Java type casting
            fmt.Println("Value is an int:", val)
    } else {
            fmt.Println("Value is not an int")
    }
    ```
- Use type switch for pattern matching:
    ```go
    switch v := i.(type) {
    case int:
            fmt.Println("Value is an int:", v)
    case string:
            fmt.Println("Value is a string:", v)
    default:
            fmt.Println("Unknown type")
    }
    ```
</div>

---

# Error Handling

- Errors as values.
- Example:
```go
  func divide(a, b float64) (float64, error) {
    if b == 0 {
        return 0, errors.New("division by zero")
        }
        return a / b, nil
    }

    result, err := divide(1.0, 0.0)
  if err != nil { log.Fatal(err) } //This will log the error
```

---

# Parallel Execution

- `runtime.GOMAXPROCS` for parallelism.
- Goroutines for concurrent tasks.
- Channels for communication between goroutines.

---

# Concurrency

- Goroutines as lightweight threads. Used with keyword `go`
- Channels for communication between goroutines.
- Scalable and efficient concurrency model.
---


# Processes, Scheduling

- Goroutines scheduled by Go runtime.
- Preemptive scheduling for fairness.
- No context switching overhead.

---

# Threads and Goroutines

- Goroutines are lightweight, managed by runtime.
- Much cheaper than OS threads.
- Goroutines are scheduled by runtime, not OS.

<div style="overflow-y: auto; max-height: 400px;">

```go
import (
  "fmt"
  "time"
)

func worker(id int, jobs <-chan int, results chan<- int) {
  for j := range jobs {
    fmt.Println("worker", id, "started  job", j)
    time.Sleep(time.Second)
    fmt.Println("worker", id, "finished job", j)
    results <- j * 2
  }
}

func main() {
  const numJobs = 5
  jobs := make(chan int, numJobs)
  results := make(chan int, numJobs)

  for w := 1; w <= 3; w++ {
    go worker(w, jobs, results)
  }

  for j := 1; j <= numJobs; j++ {
    jobs <- j
  }
  close(jobs)

  for a := 1; a <= numJobs; a++ {
    <-results
  }
}
```

</div>

---

# Interleavings

- Goroutines may execute in any order.
- Use synchronization to avoid data races.
<img src="https://web.mit.edu/6.005/www/fa16/classes/
19-concurrency/figures/time-slicing.png" alt="Interleavings" style="width:700px"/>

---

# Exiting Goroutines

- Use channels or context package to signal exit.
- All goroutines finish when main goroutine ends

---

# Basic Synchronization

- Mutexes for critical sections.
- Example:
  ```go
  var mu sync.Mutex
  mu.Lock()
  defer mu.Unlock()
  ```

---

# Wait Groups

- Coordinate multiple goroutines.
- Example:
  ```go
  var wg sync.WaitGroup
  wg.Add(1)
  go func() { // Inline goroutine
      defer wg.Done()
  }()
  wg.Wait()
  ```

---

# Communication (Channels, Blocking, Buffered)

- Channels for data sharing.
- Blocking:
  ```go
  ch <- value
  value := <-ch
  ```
- Buffered channels for limited capacity.

---

# End

Thank you!
