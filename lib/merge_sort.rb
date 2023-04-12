def merge_sort (arr)
    return if arr.length < 2
    merge_sort(arr[0...arr.length/2])
    merge_sort(arr[arr.length/2..arr.length])

end

merge_sort [2, 3, 1]