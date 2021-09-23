## Miscellaneous Language Features

### Key Paths

#### What are Key Paths?

Key paths, a language feature introduced in Swift 4, effectively stand in relation to properties the way function references stand in relation to function calls — they are a way of storing a reference to a property without actually accessing the property.

#### What problem do Key Paths solve?

Key paths solve the problem by permitting us to encapsulate the notion of accessing a particular property of a type, such as Product’s name or price, without actually performing the access.

#### Example:

Let's setup a struct and an enum:

```swift
struct Product {
	var name: String
	var kind: Kind
}

enum Kind {
	case phone
	case iPad
	case tv
}
```

We can use a key path as follows:

```swift
let keyPath = \Product.name
```

Now, let's instantiate some products:

```swift
var iPhone11 = Product(name: "iPhone 11", kind: .phone)
var iPadAir4 = Product(name: "iPad Air 4", kind: .iPad)
var appleTV = Product(name: "Apple TV", kind: .tv)
```

Using this keypath notation, we can access the product's name property since keyPath is defined as "\Product.name" without actually accessing this property:

```swift
let nameOfPhoneProduct = iPhone11[keyPath: keyPath]
print(nameOfPhoneProduct) // this will print "iPhone 11"
let nameOfiPadProduct = iPadAir4[keyPath: keyPath]
print(nameOfiPadProduct) // this will print "iPad Air 4"
```

We can also assign to a value using keypaths to a particular instance of an object:

```swift
iPhone11[keyPath: keyPath] = "iPhone XR"
print(iPhone11[keyPath: keyPath]) // this will print "iPhone XR"
```

---------------

We can use a handy extension on Sequence to sort an array using a key path, instead of using the typical method.  See below for an example.  Let's declare an array of ```Products```.

```swift
let products: [Product] = [
	iPhone11, iPadAir4, appleTV
]
```

Now, if we wanted to sort this array by the ```Product```'s name, we would typically do this:

```swift
let sortedProducts = products.sorted(by: { $0.name < $1.name })
print(sortedProducts)
```

The above print statement would print out:

```text
[
	key_paths.Product(name: "Apple TV", kind: key_paths.Kind.tv), 
	key_paths.Product(name: "iPad Air 4", kind: key_paths.Kind.iPad), 
	key_paths.Product(name: "iPhone XR", kind: key_paths.Kind.phone)
]
```

However, with the use of a handy extension on Sequence, we can make the sorted closure more succinct.  Here is the extension on Sequence:

```swift
extension Sequence {
	func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) ->  [Element] {
		sorted { a, b in
			a[keyPath: keyPath] < b[keyPath: keyPath]
		}
	}
}
```

Then, we can sort the ```Products``` like this:
```swift
let sortedProductsWithKeyPath = products.sorted(by: \.name) // More succinct!
```
