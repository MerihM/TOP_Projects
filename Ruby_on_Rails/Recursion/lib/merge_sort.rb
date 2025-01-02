def merge_sort (arr)
    return arr if arr.length <= 1
    full = arr.length
    half = full/2
    a1 = merge_sort(arr[0...half])
    a2 = merge_sort(arr[half..full])
    a3 = []
    a1[0] < a2[0] ? a3 << a1.shift : a3 << a2.shift until a1.empty? || a2.empty? 
    a3 + a1 + a2
end
