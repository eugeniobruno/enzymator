module Enzymator
  module Types
    module List
      module Functor
        module Enumerable
          def enzy_fmap(f)
            map(&f)
          end
        end
      end
    end
  end
end