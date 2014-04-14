# Charles Zheng CS 142
# sort.rb

class String
    def to_ff
        temp=self[/[0-9]+\.?([0-9]*)/]
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

test1=["hello","fafa","-100x500","abc99.6"]
test1.funny_sort
test2=["snarles52","mcDoh33.3","pi.4.6.4.6","pii.4.5.4.5"]
test2.funny_sort
