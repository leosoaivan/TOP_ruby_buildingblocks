def bubble_sort(ary)
  ary.length.times do
    ary.each_with_index do |val, ind|
      if (ary[ind] <=> ary[ind+1]) == 1
        ary[ind], ary[ind+1] = ary[ind+1], ary[ind]
      end
    end
  end
  ary
end

def bubble_sort_by(ary)
  ary.each_cons(2).with_index do |pair, ind|
    results = yield pair
    if results > 0 
      ary[ind], ary[ind+1] = ary[ind+1], ary[ind]
    end
  end
  ary
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end