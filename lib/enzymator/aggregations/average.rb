module Enzymator
  module Aggregations
    class Average < Base

      def initialize(config = {})
        super

        @transformation = begin
          stages = []

          stages << Enzymator::Transformations::Foldable::Reduction.new({
            append: ->(acum, n) { acum[:sum] += n; acum[:count] += 1; acum },
            empty: Hash.new(0)
          })

          stages << Enzymator::Transformations::Object::Application.new({
            function: ->(sum_and_count) { sum_and_count[:sum] / sum_and_count[:count] }
          })

          Enzymator::Transformations::Object::Pipelining.new({
            stages: stages
          })

        end

      end

    end
  end
end