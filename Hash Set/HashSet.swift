public struct HashSet<T: Hashable> {
  fileprivate var dictionary = Dictionary<T, Bool>()

  public mutating func insert(_ element: T) {
    dictionary[element] = true
  }

  public mutating func remove(_ element: T) {
    dictionary[element] = nil
  }

  public func contains(_ element: T) -> Bool {
    return dictionary[element] != nil
  }

  public func allElements() -> [T] {
    return Array(dictionary.keys)
  }

  public var count: Int {
    return dictionary.count
  }

  public var isEmpty: Bool {
    return dictionary.isEmpty
  }
}

extension HashSet {
  public func union(_ otherSet: HashSet<T>) -> HashSet<T> {
    var combined = HashSet<T>()
    for obj in dictionary.keys {
      combined.insert(obj)
    }
    for obj in otherSet.dictionary.keys {
      combined.insert(obj)
    }
    return combined
  }

  public func intersect(_ otherSet: HashSet<T>) -> HashSet<T> {
    var common = HashSet<T>()
    for obj in dictionary.keys {
      if otherSet.contains(obj) {
        common.insert(obj)
      }
    }
    return common
  }

  public func difference(_ otherSet: HashSet<T>) -> HashSet<T> {
    var diff = HashSet<T>()
    for obj in dictionary.keys {
      if !otherSet.contains(obj) {
        diff.insert(obj)
      }
    }
    return diff
  }
}
