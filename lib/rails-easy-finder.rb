require 'rails-easy-finder/version'
require 'rails-easy-finder/finding_engine'

module Rails
  module Easy
    module Finder

      def define_finder(name,&block)

        finder_sets[name] ||= []
        define_method(name) do
          self.class.send( :finder_sets )[name].each do |set|

          end
        end
      end

      private

      def finder_sets
        @finder_sets ||= {}
      end


    end
  end
end
