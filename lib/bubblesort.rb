def bubble_sort(ary)
    ary.length.times do
        ary.each_with_index do |val, ind|
            if (ary[ind] <=> ary[ind+1]) == 1
                ary[ind], ary[ind+1] = ary[ind+1], ary[ind]
            end
        end
    end
    p ary
end

bubble_sort([4, 3, 78, 2, 0, 2])

def bubble_sort_by(ary)
    ary.length.times do
        ary[0..-2].each_with_index do |val, ind|
            if yield(ary[ind], ary [ind+1]) > 0
                ary[ind], ary[ind+1] = ary[ind+1], ary[ind]
            end
        end
    end
    p ary
end

bubble_sort_by(["hi", "hey", "hello"]) do |left, right|
    left.length - right.length
end
