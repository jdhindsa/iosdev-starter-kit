## Saving Data in iOS

In terms of saving data in iOS, different types of data can have vastly different storage requirements on disk:

<img src="Images/ByteMeasurements.png" width="200">


You can store different data types in iOS:

<img src="Images/DataTypes.png" width="150">

### FileManager
To access the user's documents directory, create an extension that contains a computed property to grab the user's document directory:
```swift
import Foundation

extension FileManager {
	static var documentDirectoryURL: URL {
		`default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
	}
}

print(FileManager.documentDirectoryURL)
```

Note: Since "default" is a static property of FileManager, you don't need to write it this way:
```swift
FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
```

We can exclude the "FileManager" part of that, but since "default" is a Swift keyword, we need to surround it with backticks to tell the compiler that it is escaping.

If you want to see what the path of the documents directory actually is, you can use the ```path``` property:

```swift
FileManager.documentsDirectoryURL.path
```

The ```path``` property just returns a string containing the actual path to the documents directory on disk.

Now, there are mainly 2 ways of creating a file in the documents directory:

**Method # 1:**
```swift
let remindersDataURL = URL(fileURLWithPath: "Reminders", relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("txt")

print(remindersDataURL.path)
```

The ```URL(fileURLWithPath:relativeTo:).appendingPathExtension(_:)``` method creates a new file with an extension that is specified inside the documents directory.

**Method # 2:**
```swift
let stringURL = FileManager.documentsDirectoryURL.appendingPathComponent("String").appendingPathExtension("txt")
print(stringURL.path)
```

In method # 2, we instead use ```appendingPathComponent(_:)``` and ```appendingPathExtension(_:)``` to create the file.

Both methods create the same result.

There is a handy property called ```lastPathComponent``` that will return you the filename and the extension as long as the URL is a file itself.

```swift
stringURL.lastPathComponent
```

### Files

### URLs
