require "#{File.dirname(__FILE__)}/../spec_helper"

module Rails
  module Easy

    describe FindingEngine do

      it 'does not blow up' do
        @engine = FindingEngine.new do
          willing_to_travel_to the_job_request(:address)
          available_on the_job_request(:time)
        end
        @engine.the_job_request(:address).should == 'job_request.address'
      end


    end

  end
end