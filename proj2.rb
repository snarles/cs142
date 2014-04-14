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

# starts_with.rb

def each_starts_with(ll, ff)
    ll.each do |v|
        if (v.match(/^#{ff}/))
            yield(v)
        end
    end
end

each_starts_with(["abcd","axyz","able","xyzab","qrst"],"ab") {|s| puts s}

# filter.rb

def filter(ll, min:nil, max:nil, odd:nil, even:nil, scale:1,printfunc:nil)
   conditionstrings=[]
   returnstring = "yield(v)"
   if min !=nil
       conditionstrings+=["(v >= #{min})"]
   end
   if max !=nil
       conditionstrings+=["(v <= #{max})"]
   end
   if odd !=nil
       conditionstrings+=["(v % 2==1)"]
   end
   if even != nil
       conditionstrings+=["(v % 2==0)"]
   end
   if scale != 1
       returnstring="yield(#{scale}*v)"
   end
   blockstring="\t"+returnstring
   if conditionstrings.length > 0
       conditions = conditionstrings.reduce { |s,v| s+" && "+v }
       blockstring = "\tif "+conditions+"\n\t\t"+returnstring+"\n\tend"
   end
   evalstring = "ll.each do |v|\n"+blockstring+"\nend"
   if printfunc !=nil
       puts evalstring
   end
   eval(evalstring)
end

filter([1,2,3,4,5,6,7]) {|v| puts v}
filter([1,2,3,4,5,6,7],:scale=>0.5,:printfunc=>1) {|v| puts v}
filter([1,2,3,4,5,6,7],:min=>5) {|v| puts v}
filter([1,2,3,4,5,6,7],:min=>2,:max=>7.7,:scale=>2,:odd=>1,:printfunc=>1) {|v| puts v}

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

# adder.rb

class Adder
    def initialize(x)
        @x=x
    end
    def method_missing(meth,*args,&block)
        if meth.to_s =~ /^plus([0-9]+)/
            num=meth.to_s[/([0-9]+)/]
            eval("def "+meth.to_s+"\n\treturn @x+"+num+"\nend")
            instance_eval("self."+meth.to_s)
        else
            super
        end
    end
end

x=Adder.new(5)
x.plus11