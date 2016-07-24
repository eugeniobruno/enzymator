module Enzymator
  module Aggregations
    class MergeHashes < Base

      def initialize(config = {})
        super

        @transformation = Enzymator::Transformations::Foldable::Reduction.new
        # Merge is the default reduction operation for hashes
      end

    end
  end
end