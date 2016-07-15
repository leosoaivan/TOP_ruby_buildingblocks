module Enumerable

    def my_each
        return enum_for(:my_each) unless block_given?
        for i in self
            yield i
        end
    end

    def my_each_with_index
        return enum_for(:my_each_with_index) unless block_given?
        ind = 0
        for val in self
            yield val, ind
            ind += 1
        end
    end

    def my_select
        return enum_for(:my_select) unless block_given?
        if self.is_a? Array
            ary = []
            self.my_each { |x| ary << x if yield x }
            ary
        elsif self.is_a? Hash
            hsh = {}
            self.my_each { |k, v| hsh[k] = v if yield }
            hsh
        end
    end

    def my_all?
        status = TRUE
        self.my_each do |i|
            if not block_given?
                status = FALSE if (i == NIL || i == FALSE)
            else
                status = FALSE unless yield(i)
            end
        end
        status
    end

    def my_any?
        status = FALSE
        self.my_each do |i|
            if not block_given?
                status = TRUE if i
            else
                status = TRUE if yield(i)
            end
        end
        status
    end

    def my_none?
        status = TRUE
        self.my_each do |i|
            if not block_given?
                status = FALSE unless (i != TRUE && (i == FALSE || i == NIL))
            else
                status = FALSE if yield(i)
            end
        end
        status
    end

    def my_count (item = NIL)
        count = 0
        for i in self
            if block_given?
                count += 1 if yield(i)
            elsif item != NIL
                count += 1 if i == item
            else
                count += 1
            end
        end
        count
    end

    def my_map
        new_ary = []
        if block_given?
            for i in self
                new_ary << yield(i)
            end
        else return enum_for(:my_map)
        end
        return new_ary
    end

    def my_inject(init = NIL)
        ary = self.to_a
        if init.nil?
            init = self.first
            ary[1..-1].my_each { |i| init = yield(init, i) }
        else
            ary.my_each { |i| init = yield(init, i) }
        end
        init
    end

    def my_map2(proc = NIL)
        new_ary = []
        if (proc || block_given?)
            self.my_each do |i|
                new_ary << ( proc ? proc.call(i) : yield(i) )
            end
        else return enum_for(:my_map2)
        end
        return new_ary
    end

end

def multiply_els(ary)
    return ary.my_inject { |product, i| product * i }
end
