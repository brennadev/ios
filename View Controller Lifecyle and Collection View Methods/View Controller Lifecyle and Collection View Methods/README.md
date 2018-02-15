#  View Controller Lifecycle and Collection View Methods
Interactively learn when view controller lifecyle methods, [`UICollectionViewDelegate`](https://developer.apple.com/documentation/uikit/uicollectionviewdelegate), and [`UICollectionViewDataSource`](https://developer.apple.com/documentation/uikit/uicollectionviewdatasource) methods are called. This demonstrates the common ones a new iOS developer is likely to encounter (therefore, this isn't designed to be an exhaustive list) - I used this in the past to help me learn these, and it's still a useful reference for me now. This is also a way I learn new concepts that can be more in-depth than what a tutorial can provide.

When each lifecycle method or delegate method is called, it'll print the method name in the console. Some print statements may also show useful information associated with the method.

#### The methods included are:
- [`UIViewController`](https://developer.apple.com/documentation/uikit/uiviewcontroller):
    - `viewDidLoad()`
    - `viewWillAppear(_:)`
    - `viewDidAppear(_:)`
    - `viewWillLayoutSubviews()`
    - `viewDidLayoutSubviews()`
    - `didReceiveMemoryWarning()`
    - `viewWillTransition(to:with:)`
    - `willTransition(to:with:)`
    - `prepare(for:sender:)`

- [`UICollectionViewDelegate`](https://developer.apple.com/documentation/uikit/uicollectionviewdelegate):
    - `collectionView(_:didHighlightItemAt:)`
    - `collectionView(_:didUnhighlightItemAt:)`
    - `collectionView(_:didSelectItemAt:)`
    - `collectionView(_:didDeselectItemAt:)`
    
- [`UICollectionViewDataSource`](https://developer.apple.com/documentation/uikit/uicollectionviewdatasource):
    - `numberOfSections(in:)`
    - `collectionView(_:numberOfItemsInSection:)`
    - `collectionView(_:cellForItemAt:)`

If you're wondering when [`UITableViewDelegate`](https://developer.apple.com/documentation/uikit/uitableviewdelegate) and [`UITableViewDataSource`](https://developer.apple.com/documentation/uikit/uitableviewdatasource) methods are called, they're very similar to [`UICollectionViewDelegate`](https://developer.apple.com/documentation/uikit/uicollectionviewdelegate) and [`UICollectionViewDataSource`](https://developer.apple.com/documentation/uikit/uicollectionviewdatasource), so the collection view methods shown in this code can be used as examples for those.

#### If you're unfamiliar with when these methods are called, try the following things and observe the console output:
- Initial output when first launching the app
- Tapping a collection view cell
- Tapping the back button after tapping a collection view cell
- Tapping different collection view cells (after tapping the back button each time)
- Scrolling the collection view but not actually tapping a cell
- Look at the documentation and find a method I haven't included and observe its behavior relative to the methods already in the code
