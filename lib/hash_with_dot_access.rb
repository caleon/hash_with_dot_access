require File.expand_path('../hash_with_dot_access/hash',     __FILE__)

class HashWithDotAccess < Hash
# Because of the structure of the my_app.yml induced Hash, (which is a HashWithDotAccess), I didn't want to just make
# MyApp.payment_gateway? return true just because that hash had a key `payment_gateway`. This was okay earlier on when
# all that needed to be set was the boolean on that key to show whether or not that feature was enabled. Now, with more
# settings required of each feature (within the yaml file), it was nicer to scope things with the feature name and use
# an optional `enabled` or `disabled` (the latter taking precedence) key within the feature to denote its status.
#
# For instance, consider the following bit from the yaml:
#
#:points:
#  :enabled: true
#  # Number of quarters points are retained
#  :points_retention: 3
#  :currency: dollahs

  def self.new_from_hash_copying_default(old_hash)
    HashWithDotAccess.new(old_hash).tap do |new_hash|
      new_hash.default = old_hash.default
    end
  end
  
  def initialize(constructor = {})
    if constructor.is_a?(Hash)
      super()
      update(constructor)
    else
      super(constructor)
    end.each_pair { |k, v| self[k] = v.with_dot_access(true) if v.is_a?(Hash) }
    self
  end
  
  def dup
    HashWithDotAccess.new(self)
  end
  
  def values_with_filter
    except(:enabled, :disabled).values_without_filter.flatten
  end
  alias_method_chain :values, :filter
  
  def method_missing(method_symbol, *arguments, &block)
    @_results ||= {}
    return @_results[method_symbol]                         if @_results.key?(method_symbol)
    return @_results[method_symbol] = self[method_symbol]   if key?(method_symbol)
    
    if method_symbol.to_s.slice(-1) == "?" and keys.include?(part_symbol = method_symbol.to_s.slice(0..-2).intern)
      @_results[method_symbol] = self[part_symbol].if_a?(Hash) do |hsh|
        hsh.key?(:disabled) ? !hsh[:disabled] : hsh.key?(:enabled) ? hsh[:enabled] : true
      end.unless_a?(TrueClass, FalseClass) { |nobull| !!nobull } # at this point, the return is always a boolean.
    else
      return super
    end
  end
end