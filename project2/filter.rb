# Charles Zheng CS 142
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
