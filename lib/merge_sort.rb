def merge_sort (arr)
    return arr if arr.length <= 1
    full = arr.length
    half = full/2
    if full > 1 
        a1 = merge_sort(arr[0...half])
        a2 = merge_sort(arr[half..full])
        a3 = []
        a1[0] < a2[0] ? a3 << a1.shift : a3 << a2.shift while a1.length >= 1 && a2.length >= 1 
        a1.length > 0 ? a3 << a1 : a3 << a2
        a3.flatten  
    else 
        arr
    end
end


p merge_sort [12, 2, 3, 1, 7, 8, 4, 2]