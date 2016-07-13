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
            self.my_each { |k, v| hsh[k] = v if yield (k, v) }
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

end
