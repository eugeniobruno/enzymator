module Enzymator
  module Aggregations
    class Sum < Base

      def initialize(config = {})
        super

        @transformation = Enzymator::Transformations::Foldable::Reduction.new
        # Summation is the default reduction operation for all numeric types
      end

    end
  end
end