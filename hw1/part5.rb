class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval "def #{attr_name}_setter_with_history(val) if @#{attr_name}_history.nil? \n @#{attr_name}_history =[nil] \n end; @#{attr_name}_history << val \n end"  
    class_eval "def #{attr_name}=(val) @#{attr_name} = val;  #{attr_name}_setter_with_history val end"
  end
end

class Foo
    attr_accessor_with_history :bar
    attr_accessor_with_history :car
end

