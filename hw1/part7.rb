class CartesianProduct
  include Enumerable
  
    def initialize(list1,list2)
        @list1 = list1
        @list2 = list2
    end
    
    def each &blk
        cart = @list1.product @list2
        cart.each &blk
    end
end


c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }