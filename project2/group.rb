# Charles Zheng CS 142
# group.rb

module Enumerable
    def each_group_by_first_letter
        h={}
        self.each do |v|
            if (h[v[0]]!=nil)
                h[v[0]]=h[v[0]]+[v]
            else
                h[v[0]]=[v]
            end
        end  
        h.keys.each {|k| yield(k,h[k])}
    end
end

x=["abcd","axyz","able","xyzab","qrst",[42,32],[33.5,2]]
x.each_group_by_first_letter do |letter,words|
    printf("%s: %s\n",letter,words.join(" "));
end
