

// Task1
print(minSplit(amount: 9))
print(minSplit(amount: 26))
print(minSplit(amount: 172))
      
// Task2
print(sumOfDigits(start: 7, end: 8))
print(sumOfDigits(start: 17, end: 20))
print(sumOfDigits(start: 10, end: 12))
    
// Task 3
print(isProperly(sequence: "(()())"))
print(isProperly(sequence: ")(()"))
print(isProperly(sequence: "(()())("))
      
//Task 4
print(countWays(n: 3, steps: [0, 1, 0]))
print(countWays(n: 4, steps: [0, 1, 1, 0]))
print(countWays(n: 5, steps: [1, 1, 0, 1, 1]))
      
// Task 5
print(zeros(N: 7))
print(zeros(N: 12))
print(zeros(N: 490))
      
      
      
// Task 1
      func minSplit(amount: Int) -> Int {
          let coins = [1, 5, 10, 20, 50]
          var dp = Array(repeating: Int.max, count: amount + 1)
          dp[0] = 0

          for coin in coins where coin <= amount {
              for i in stride(from: coin, through: amount, by: 1) {
                  if dp[i - coin] != Int.max {
                      dp[i] = min(dp[i], dp[i - coin] + 1)
                  }
              }
          }

          return dp[amount] == Int.max ? -1 : dp[amount]
      }
      
      
// Task 2
      func sumOfDigits(start: Int, end: Int) -> Int {
          guard start <= end else { return 0 }
          var totalSum = 0
          for num in start...end {
              var n = num
              while n > 0 {
                  totalSum += n % 10
                  n /= 10
              }
          }
          
          return totalSum
      }
      
      
// Task 3
      func isProperly(sequence: String) -> Bool {
          var stack = [Character]()
          
          for char in sequence {
              if char == "(" {
                  stack.append(char)
              } else if char == ")" {
                  if stack.isEmpty {
                      return false
                  }
                  stack.removeLast()
              }
          }
          return stack.isEmpty
      }


// Task 4
      func countWays(n: Int, steps: [Int]) -> Int {
          
          var dp = Array(repeating: 0, count: n + 1)
          dp[0] = 1
          
          dp[1] = steps[0] == 1 ? 1 : 0
          
          for i in 2...n {
              if steps[i-1] == 1 {
                  dp[i] = dp[i - 1] + dp[i - 2]
             }
          }
          return dp[n] + dp[n-1]
      }
      
      
// Task 5
      func zeros(N: Int) -> Int {
          var count = 0
          var num = N
          
          while num >= 5 {
              num /= 5
              count += num
          }
          
          return count
      }
