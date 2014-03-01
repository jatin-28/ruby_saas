class UnSupportedCurrencyError < StandardError ; end

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
    
    def in(method_id)
        singular_currency = method_id.to_s.gsub( /s$/, '')
        if @@currencies.has_key?(singular_currency)
            self / @@currencies[singular_currency]
        else singular_currency == "dollar"
            self
        end
    end
end

class String
    def palindrome?
        input = self.downcase.gsub(/([^a-z])/,"")
        input == input.reverse    
    end
end

module Enumerable
    def palindrome?
        self.reverse_each.map { |x| x} == self 
    end
end

module Enumerable
    def palindrome?
        tempArray = []
        self.each { |element| tempArray << element }        
        tempArray.reverse == self
    end
end

class ValidPalindromeTest
    include Enumerable
    
    def initialize(a, b)
        @a = a
        @b = b
    end                                                                             
    
    def each(&block)
        if block
            (@a..@b).each { |m| block.yield(m) }
            ((@b * -1)..(@a * -1)).each { |m| block.yield(-1 * m) }
            else                                                                            
            enum_for(:each)
        end
    end
end
