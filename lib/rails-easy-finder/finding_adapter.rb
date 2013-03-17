require 'active_support/inflector'

module Rails
  module Easy

    class FindingAdapter

      def initialize(subject)
        @subject = subject
      end

      def scope
        case @subject
          when Symbol
            @subject.to_s.classify.constantize
          when String
            @subject.to_s.classify.constantize
          else
            @subject
        end
      end

      def method
        @subject.to_s.tableize.to_sym
      end


    end

  end
end