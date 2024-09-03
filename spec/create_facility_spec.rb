require 'spec_helper'

RSpec.describe CreateFacility do
    before(:each) do
        @new_facility = CreateFacility.new
    end

    describe '#initialize' do
        it 'can initialize the class' do
            expect(@new_facility).to be_an_instance_of(CreateFacility)
        end
    end

    describe '#co_dmv_office_locations' do
        it 'can create co dmv office locations' do
            co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
            @new_facility.create_facilities(co_dmv_office_locations)
        end
    end

    describe '#ny_dmv_office_locations' do
        it 'can create ny dmv office locations' do
            ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
            @new_facility.create_facilities(ny_dmv_office_locations)
        end
    end

    describe '#mo_dmv_office_locations' do
        it 'can create mo dmv office locations' do
            mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
            @new_facility.create_facilities(mo_dmv_office_locations)
        end
    end
end

