module Enzymator
  module Aggregations
    class Count < Base

      def initialize(config = {})
        super

        @transformation = begin
          Enzymator::Transformations::Object::Application.new({
          function: ->(objects) { objects.size }
        })
        end

      end

    end
  end
end