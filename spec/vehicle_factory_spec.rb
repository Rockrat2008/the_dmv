require 'spec_helper'

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@factory).to be_an_instance_of(VehicleFactory)
        end
    end

    describe 'create vehicles' do
        it 'can create vehicles from wa_ev_registrations' do
            wa_ev_registrations = DmvDataService.new.wa_ev_registrations
            @factory.create_vehicles(wa_ev_registrations)
        end
    end
end