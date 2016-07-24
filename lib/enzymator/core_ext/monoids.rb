class Fixnum
  @enzy_mappend = ->(m, n) { m + n }.freeze
  @enzy_mempty = 0.freeze
  class << self
    attr_reader :enzy_mappend
    attr_reader :enzy_mempty
  end
end

class Float
  @enzy_mappend = ->(m, n) { m + n }.freeze
  @enzy_mempty = 0.to_f.freeze
  class << self
    attr_reader :enzy_mappend
    attr_reader :enzy_mempty
  end
end

class Rational
  @enzy_mappend = ->(m, n) { m + n }.freeze
  @enzy_mempty = 0.to_r.freeze
  class << self
    attr_reader :enzy_mappend
    attr_reader :enzy_mempty
  end
end

class Complex
  @enzy_mappend = ->(m, n) { m + n }.freeze
  @enzy_mempty = 0.to_c.freeze
  class << self
    attr_reader :enzy_mappend
    attr_reader :enzy_mempty
  end
end

class Array
  @enzy_mappend = ->(xs, ys) { xs + ys }.freeze
  @enzy_mempty = [].freeze
  class << self
    attr_reader :enzy_mappend
    #attr_reader :enzy_mempty
    def enzy_mempty
      @enzy_mempty.dup
    end
  end
end

class String
  @enzy_mappend = ->(s, t) { s + t }.freeze
  @enzy_mempty = ''.freeze
  class << self
    attr_reader :enzy_mappend
    attr_reader :enzy_mempty
  end
end

class Hash
  @enzy_mappend = ->(ps, qs) { ps.merge qs }.freeze
  @enzy_mempty = {}.freeze
  class << self
    attr_reader :enzy_mappend
    attr_reader :enzy_mempty
  end
end

if defined? HashWithIndifferentAccess
  class HashHashWithIndifferentAccess
    @enzy_mappend = ->(ps, qs) { ps.merge qs }.freeze
    @enzy_mempty = {}.freeze
    class << self
      attr_reader :enzy_mappend
      attr_reader :enzy_mempty
    end
  end
end
