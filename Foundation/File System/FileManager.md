## Saving Data in iOS

In terms of saving data in iOS, different types of data can have vastly different storage requirements on disk:

<img src="Images/ByteMeasurements.png" width="200">


You can store different data types in iOS:

<img src="Images/DataTypes.png" width="150">

### Files & Data
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

Note: Since ```default``` is a static property of ```FileManager```, you don't need to write it this way:
```swift
FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
```

We can exclude the ```FileManager``` part of that, but since ```default``` is a Swift keyword, we need to surround it with backticks to tell the compiler that it is escaping.

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

There is a temporary directory that FileManager can give you access to if you need a place to store short-term data that you do not ever plan on persisting between app launches:
```swift
let temporaryDirectoryURL = FileManager.default.temporaryDirectory
```

This directory called ```tmp``` is at the same level as the ```Documents``` directory in the user's sandbox.


#### Data Types
<img src="Images/DataTypes-2.png" width="250">

In order to read and write data from disk, you would do the following:
```swift
let favoriteBytes: [UInt8] = [
  240,          159,          152,          184,
  240,          159,          152,          185,
  0b1111_0000,  0b1001_1111,  0b1001_1000,  186,
  0xF0,         0x9F,         0x98,         187
]

// Convert to Data
let favoriteBytesData = Data(favoriteBytes)
// Create the URL for the exact file name where you will save this data
let favoriteBytesURL = URL(
  fileURLWithPath: "Favorite Bytes",
  relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("txt")

print(FileManager.documentsDirectoryURL.path)
print(favoriteBytesURL.lastPathComponent)

// Saving data to disk...
do {
  try favoriteBytesData.write(to: favoriteBytesURL)
} catch {
  print("Error occurred!")
}

// Loading data from disk...
var savedFavoriteBytesData: Data?
do {
  savedFavoriteBytesData = try Data(contentsOf: favoriteBytesURL)
} catch {
  print("Error occurred!")
}
```

You can also check that the saved data you've retrieved from disk is the same as the data you wrote to disk by using the equality operator ```==```

Now, if you know that the data you've saved to a file in the documents directory contains string data, you can retrieve that string data and print it's content or use it however you like:

```swift
if let savedData = savedFavoriteBytesData {
  let stringData = String(data: savedData, encoding: .utf8)
  print(stringData!)
}
```
In the above snippet, ```savedFavoriteBytesData``` was an optional Data variable, so I used optional binding to unwrap it first.

If you want to make sure the file gets written to disk and is not corrupted even in the event that the system should crash, this API call can be used:

```func write(to url: URL, atomically useAuxiliaryFile: Bool, encoding enc: UInt) throws```

Example:
```swift
try stringData?.write(to: catsURL, atomically: true, encoding: .utf8)
let catsChallengeString = try String(contentsOf: catsURL)
print(catsChallengeString)
```
<img src="Images/catsString.png" width="150">


### JSON

If JSON files are stored within your XCode project, you can access that JSON data using the below API call:

```Bundle.main.url(forResource: <String?>, withExtension: <String?>)```

- ```Bundle``` is a representation of your app, it's code and it's resources.
All the files you add in XCode under your app target are referred to as the "App Bundle"
- ```main``` represents the current executable (in this case, your app)
- ```forResource``` is the name of the parameter you want the URL for
- ```withExtension``` is the extension of the file

#### JSON Decoder
In order to decode JSON data, we'd use the following code (as an example):
```swift
let decoder = JSONDecoder()
do {
  let sampleData = try Data(contentsOf: sampleJSONData)
  let sample = try decoder.decode(Sample.self, from: sampleData)
} catch let error {
  print(error)
}
```

The ```Sample``` type in this example, must conform to the ```Codable``` protocol in order for the ```JSONDecoder``` to work.




### Property Lists
