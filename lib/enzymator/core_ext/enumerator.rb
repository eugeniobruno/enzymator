class Enumerator
  #
  # Skip the first n elements and return an Enumerator for the rest, or pass them
  # in succession to the block, if given.
  # Extracted from epitools: https://github.com/epitron/epitools
  #
  def skip(n)
    if block_given?
      each do |x|
        if n > 0
          n -= 1
        else
          yield x
        end
      end
    else
      to_enum(:skip, n)
    end
  end
end