class Hash
  def with_dot_access(deep=false)
    HashWithDotAccess.new_from_hash_copying_default(self)
  end
end
