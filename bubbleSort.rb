def bubble_sort(arr)
    num = arr.length
    temp_arr = arr
    for i in 1..num 
        for j in 0..num-2
            temp_arr[j], temp_arr[j+1] = temp_arr[j + 1], temp_arr[j] if temp_arr[j] > temp_arr[j+1]
        end
    end
    temp_arr
end

test_arr = [4, 3, 78, 2, 0, 2, 12, 44, 1, 421, 4, 2, 0]
p bubble_sort(test_arr)