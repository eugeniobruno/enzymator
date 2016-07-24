module Enzymator
  module Aggregations
    class MapReduce < Base

      def initialize(config = {})
        super

        @transformation = begin
          stages = []

          if @config.map || @config.mapping
            stages << Enzymator::Transformations::Functor::Mapping.new({
              map: @config.map || @config.mapping
            })
          end

          stages << Enzymator::Transformations::Foldable::Reduction.new({
            append:  @config.append || @config.reduction,
            empty:   @config.empty
          })

          Enzymator::Transformations::Object::Pipelining.new({
            stages: stages
          })
        end

      end

    end
  end
end