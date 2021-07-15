## Creating a Collection View using Compositional Flow Layout (Storyboard)

### Initial Setup of the Collection View

If you need to create a collection view via Interface Builder, then first you'd start by navigating to Main.storyboard and dragging a Collection View onto the canvas:

<img src="Images/CollectionViewUIElement.png" width="300">

You can then setup the auto layout constraints to pin the collection view to the leading, trailing, top and bottom edges of the storyboard:

<img src="Images/LayoutCollectionViewInStoryboard.png" width="350">

There are 2 types of ```UICollectionViewFlowLayout```'s that you can use with Collection Views:

1. Flow Layout (< iOS 13)
2. Compositional Layout (> iOS 13)

The next step is to create an IBOutlet from that Collection View to your View Controller (self-explanatory).

### Configuring the UICollectionViewLayout object in the Collection View

A collection view has a property called ```collectionViewLayout``` property where you need to set the type of layout you want to use.  We can set this property in ```viewDidLoad()```:

```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = configureLayout()
    }
```

The ```configureLayout()``` method will need to return a ```UICollectionViewCompositionalLayout``` object which is a subclass of ```UICollectionViewLayout```.

In Compositional Layouts, we have the concept of an ```item```, ```group``` and a ```section```.

An ```item``` is structured like this:

<img src="Images/Item.png" width="250">

So, an item is "sized" using an ```NSCollectionLayoutDimension```.  There are 3 ways of configuring an ```NSCollectionLayoutDimension```:

<img src="Images/NSCollectionLayoutDimension.png" width="250">

- estimated: useful for displaying items that display content; it's sized to the content it contains
- fractional: size according to a fractional size of the container it is in (values: 0 to 1)
- absolute: a fixed size in points (ie. 44 points)

As an example, here is how ```configureLayout()``` would work if we configured the item, group and section:

```swift
    func configureLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
```

**Note** the return statement.  You have to make call to ```UICollectionViewCompositionalLayout(section:)``` in order to return the proper object.

<img src="Images/ItemSize.png" width="400" height="400">

### Important Difference between Table Views and Collection Views

It's important to note that when you add a ```UITableView``` to your storyboard, a placeholder cell is created automatically.  Whereas, with ```UICollectionView```'s that is not the case.  You need to create the ```UICollectionViewCell``` yourself.

### Creating the UICollectionViewCell

You can set the Collection View Cell's size to "Custom" in the storyboard and give it a certain height and width, however, this doesn't necessarily mean that this size will be what you see when you run the app.  The UICollectionViewFlowLayout can override these settings.  

<em>So why do this in the storyboard?</em> It's used mainly to visually get an idea of what the cell __may__ look like.

<img src="Images/SizeInspector.png" width="250">

The next steps would be to:
1. Add any UI elements inside the prototype cell
2. Use Auto Layout to constrain those elements
3. Go to the Attributes Inspector (with the Collection View Cell highlighted in the Document Outline) and set the reuse identifier
4. Create a custom class that subclasses ```UICollectionViewCell```
5. Click on the Collection View cell in the Storyboard and go to the Attributes Inspector.  Set the class to the newly created class
6. Create any ```IBOutlet```s that you need to create in the new custom cell class

### Using Diffable Data Source




Links:
[collectionViewLayout](https://developer.apple.com/documentation/uikit/uicollectionview/1618047-collectionviewlayout#)
