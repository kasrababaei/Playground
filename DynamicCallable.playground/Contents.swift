@dynamicMemberLookup
@dynamicCallable
class Counter {
    private var count: Int = 0
    
    // @dynamicMemberLookup
    subscript<T>(dynamicMember keyPath: KeyPath<Counter, T>) -> T {
        self[keyPath: keyPath]
    }
    
    subscript(dynamicMember member: String) -> Self {
        if member == "log" {
            print("Counter.count is: \(count)")
        } else if member == "increment" {
            count += 1
        } else if member == "decrement" {
            count -= 1
        } else {
            print("🚨 the member \"\(member)\" isn't handled.")
        }
        
        return self
    }
    
    // @dynamicCallable
    func dynamicallyCall(withKeywordArguments args: KeyValuePairs<String, Int>) {
        for (key, value) in args {
            if key == "increment" {
                count += value
            } else if key == "decrement" {
                count -= value
            } else {
                print("🚨 the key \"\(key)\" isn't handled.")
            }
        }
    }
}

let foo = Counter()

foo(increment: 3)
foo.log() // prints: Counter.count is: 3
foo.decrement()
foo.log() // prints: Counter.count is: 2
foo(decrement: foo.count)
foo.log() // prints: Counter.count is: 0
