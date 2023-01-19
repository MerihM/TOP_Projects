def bubble_sort(arr)
    p  arr
    for i in 0...arr.length-1
        for j in 0..arr.length-2
            arr[j], arr[j+1] = arr[j + 1], arr[j] if arr[j] > arr[j+1]
        end
    end
    arr
end

test_arr = [999, 42, 15, 12, 9, 8, 7, 4, 3, 1, 0]
p bubble_sort(test_arr)