module Enzymator
  module Transformations
    class Config

      def initialize(config)
        @config = config.each_with_object({}) do |(k, v), hash|
          hash[k.to_sym] = v
        end
        .freeze
      end

      def method_missing(name, *args, &block)
        @config[name]
      end

      def respond_to_missing?(name, include_private = false)
        @config.has_key?(name) || super
      end

    end
  end
end