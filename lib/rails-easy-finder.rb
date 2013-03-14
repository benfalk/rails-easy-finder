#require 'rails-easy-finder/version'

module Rails
  module Easy
    module Finder
      def define_finder(name,&block)
        @finder_sets ||= {}
        @finder_sets[name] ||= []
        define_singleton_method(name) do
          'ahhh'
        end
      end
    end
  end
end
