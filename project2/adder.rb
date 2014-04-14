# Charles Zheng CS 142
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
