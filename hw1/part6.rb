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
        return false unless self.respond_to?(:each)
        orig = self.each.map { |x| x}
        orig == orig.reverse
    end
end
