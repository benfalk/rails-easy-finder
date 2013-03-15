require "#{File.dirname(__FILE__)}/../spec_helper"

module Rails
  module Easy

    describe FindingEngine do

      before :each do
        @scope = double('scope')
        @scope.as_null_object
      end

      it 'does not blow up' do
        @engine = FindingEngine.new(@scope) do
          willing_to_travel_to the_job_request(:address)
          available_on the_job_request(:time)
          trying_to_live for_the_money
          where :anything => for_the_love_of_money
        end

        @bind = double('bind')

        @engine.the_job_request(:address).should == 'job_request.address'

        @another = FindingEngine.new(@scope)
        @another.uses_the_solution do
          who_loves the_person
        end
      end

      context 'when bound to a scopeable searcher' do

        before :each do
          @obj = double('scope')
          @obj.as_null_object
          @engine = FindingEngine.new(@scope)
          @engine.bind(@obj)
        end

        it 'can fetch results from it' do
          @obj.should_receive(:scoped).and_return(@obj)
          @engine.results.should be(@obj)
        end

        it 'calls scoped searches from the bound object' do
          @obj.should_receive(:tested_by).and_return(@obj)
          @obj.should_receive(:person).and_return('test')
          @engine.uses_the_solution do
            tested_by the_person
          end
          @engine.results.should be(@obj)
        end

      end


    end

  end
end