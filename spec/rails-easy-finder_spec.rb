require 'spec_helper'

module Rails
  module Easy
    describe Finder do

      context 'when extended in a class' do

        before :each do
          @class = Class.new do
            extend Rails::Easy::Finder
          end
        end

        describe 'the define_finder method' do

          it 'should exist as a singleton method' do
            @class.should respond_to(:define_finder)
          end

          it 'creates a finder method for the class' do
            @class.define_finder :find_foo
            @class.new.should respond_to(:find_foo)
          end

        end

      end

    end
  end
end