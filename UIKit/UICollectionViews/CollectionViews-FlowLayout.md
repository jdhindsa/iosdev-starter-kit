## Creating a Collection View using Flow Layout (Storyboard)

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


