## Creating a Collection View using Flow Layout (Storyboard)

### Flow Layout Objects & Creating a Flow Layout in IB

There are advantages and disadvantages of using Compositional Layout.  A few disadvantages include:
- It is only available in iOS 13 and above
- It has limited functionality as it is still considered to be new (is this still the case in 2021?)

<img src="Images/NewSchool.png" width="300">

The old method of creating a UICollectionView include:

- Creating the flow layout
- Creating the data source

<img src="Images/OldSchool.png" width="300">

```UICollectionViewLayout``` has 2 concrete subclasses that can be used.  In iOS 12 and before, you would need to use ```UICollectionViewFlowLayout```.  In iOS 13 and above, you'd use ```UICollectionViewCompositionalLayout```.

<img src="Images/LayoutObject.png" width="300">

Here is how the Flow Layout lays out cells in your collection view:

<img src="Images/HowFlowLayoutWorks.png" width="300">

Features of Flow Layout:

<img src="Images/FeaturesOfFlowLayout.png" width="300">

You need to configure the item size through it's width and height properties so that the flow layout can layout the items.

<img src="Images/ConfigureItemSize.png" width="300">

We can also set inter item spacing and inter line spacing to give more breathing room to our cells.

<img src="Images/InterItemSpacingAndInterLineSpacing.png" width="300">

Section Insets can also be added to push the entire collection view inwards or outwards:

<img src="Images/SectionInsets.png" width="300">

Here are some differences between Flow Layout and Compositional Layout:

<img src="Images/Differences.png" width="300">

When creating a Compositional Layout, you specify the scroll direction at the group level.  Whereas, in a Flow Layout, you set it at the collection view level.

When the Scroll Direction property in Attributes Inspector is set to ```Vertical```, it means your collection view will be layed out in a series of rows.  ```Horizontal``` means columns.

<img src="Images/ScrollDirection.png" width="300">


A collection view's cell size (width & height), headers, footers and insets can all be configured within the Size Inspector:

<img src="Images/SizeInspector-2.png" width="300">

One big advantage of using a Flow Layout is that the properties to change the way the collection view looks are all baked into the Storyboard.  For example, you can change the number of prototype cells displayed in the storyboard and then modify the cell spacing or line spacing to visually see how this will look in your UI.

**Note**, changing the number of prototype cells has no effect on what actually happens when your app runs.  This is just a visual feature of Storyboards.

<img src="Images/AttributesInspector-SetNumCells.png" width="300">
<img src="Images/SizeInspector-CellSpacing.png" width="300">

### Setting up a Data Source

Remember, in a Flow Layout **any** object can act as the Collection View's data source.  Even the View Controller class that __contains__ the collection view can act as the collection view's data source.

