# SwiftData-Todo
A simple TODO app using SwiftData and SwiftUI

This uses the latest framework [SwiftData](https://developer.apple.com/documentation/SwiftData) available in iOS 17. It also makes use of other new SwiftUI APIs such as [`ContentUnavailableView`](https://developer.apple.com/documentation/swiftui/contentunavailableview) for empty states.

The Task object is created as: 

```swift
@Model
final class Task {
  @Attribute(.unique)
  var id: UUID
	
  var name: String
  var createdAt: Date
  var completed: Bool
  var color: String
	
  init(name: String, createdAt: Date = Date(), completed: Bool = false, color: TaskColor) {
    self.id = UUID()
    self.name = name
    self.createdAt = createdAt
    self.completed = completed
    self.color = color.rawValue
  }
}
```

Then simply fetched in the list view as:

```swift
@Query(sort: \.createdAt, animation: .smooth)
private var tasks: [Task]
```

A new Task can be created and persisted like:

```swift
let newTask = Task(
  name: taskName,
  color: taskColor
)
context.insert(newTask)
		
do {
  try context.save()
} catch {
  print(error.localizedDescription)
}
```

----

<table>
  <tr>
    <th><img src="https://github.com/schmidyy/SwiftData-Todo/assets/22358682/d90bfe20-012d-4955-9a5b-558047fd6efb"></th>
    <th><img src="https://github.com/schmidyy/SwiftData-Todo/assets/22358682/0bd46a73-87cc-40af-b5da-029e8a209ec5"></th>
    <th><img src="https://github.com/schmidyy/SwiftData-Todo/assets/22358682/2097ecd9-9239-4e79-b33a-d0004bc3ac04"></th>
  </tr>
</table>

