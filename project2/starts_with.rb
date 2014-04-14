# Charles Zheng CS 142
# starts_with.rb

def each_starts_with(ll, ff)
    ll.each do |v|
        if (v.match(/^#{ff}/))
            yield(v)
        end
    end
end

each_starts_with(["abcd","axyz","able","xyzab","qrst"],"ab") {|s| puts s}

