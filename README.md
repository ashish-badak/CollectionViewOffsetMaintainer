# CollectionViewOffsetMaintainer
Utility class to maintain collection view offset


- `CollectionViewOffsetMaintainer` class can be used to persist collection view scroll position.

- Ideal scenario is when we have multiple horizonatally scrollabale collection views which will be nested inside other collection view or table view then those horizontal collection views are reused based on scroll and placement; causing it to loose scroll offset.

- We can make use of `CollectionViewOffsetMaintainer` to maintain those scroll offsets.

- Refer `CollectionViewOffsetMaintainerDemo` for its uses.
