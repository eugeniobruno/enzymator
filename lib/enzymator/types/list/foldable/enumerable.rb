module Enzymator
  module Types
    module List
      module Foldable
        module Enumerable

          def enzy_fold(empty, append)
            append = enzy_mappend if append == :mappend
            empty  = enzy_mempty  if empty  == :mempty

            reduce(empty, &append)
          end

          private

          def enzy_mappend
            enzy_inner_type.enzy_mappend
          end

          def enzy_mempty
            enzy_inner_type.enzy_mempty
          end

          def enzy_inner_type
            first_elem = first
            first_elem.nil? ? :missing_inner_type : first_elem.class
          end

        end
      end
    end
  end
end