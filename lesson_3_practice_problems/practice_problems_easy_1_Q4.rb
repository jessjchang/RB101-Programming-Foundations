numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)
# => deletes the element at specified index 1. Would return 2, and since delete_at is destructive, numbers would be modified to [1, 3, 4, 5]
numbers.delete(1)
# => deletes all items equal to 1. Would return 1, and since delete_at is destructive, numbers would be modified to [2, 3, 4, 5]