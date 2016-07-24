module Enzymator
  module Types
    module List
      module Monad
        module Array
          include List::Functor::Enumerable
          def self.enzy_unit(object)
            [object]
          end
          def enzy_join
            flatten(1)
          end
        end
      end
    end
  end
end