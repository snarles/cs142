# squared.rb

class Numeric
    def squared
        return self**2
    end
end

puts 9.squared
puts 5.squared

# sort.rb

class String
    def to_ff
        temp=self[/\-?[0-9]\.?([0-9]*)/]
        if temp==nil
            return -1
        end
        return temp.to_f
    end
end

class Array
    def funny_sort
        self.sort_by {|v| v.to_ff}
    end
end
