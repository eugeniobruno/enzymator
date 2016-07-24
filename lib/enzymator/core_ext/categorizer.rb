module Enzymator
  class Categorizer

    @@known_classes = Hash.new(0)

    def self.categorize(klass)
      unless @@known_classes.has_key? klass

        if klass.included_modules.include? Enumerable
          klass.send :include, Enzymator::Types::List::Functor::Enumerable
          klass.send :include, Enzymator::Types::List::Foldable::Enumerable
        end

        if klass <= Array
          klass.send :include, Enzymator::Types::List::Monad::Array
        end

        @@known_classes[klass] += 1
      end
    end

  end
end