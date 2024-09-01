require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    #original test validation
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})

    #adding facility functionality for iteration 2
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

    #adding registrant functionality for iteration 2
    @registrant_1 = Registrant.new('Bruce', 18, permit: true)
    @registrant_2 = Registrant.new('Penny', 16)
    @registrant_3 = Registrant.new('Tucker', 15)

  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#add a service to a facility' do
    it 'adds Vehicle Registration to facility 1' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['Vehicle Registration'])
    end
  end

  describe '#registered vehicles' do
    it 'registered vehicles is an array' do
      expect(@facility_1.registered_vehicles).to eq([])
    end
  end

  describe '#collected fees' do
    it 'collected fees is 0' do
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  describe '#register vehicle' do
    it 'registers a vehicle by adding it to the registered vehicles array' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@facility_1.collected_fees).to eq(100)
      expect(@cruz.registration_date).to eq(Date.today)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility_1.collected_fees).to eq(100)

      @facility_1.register_vehicle(@camaro)
      expect(@camaro.registration_date).to eq(Date.today)
      expect(@camaro.plate_type).to eq(:antique)

      @facility_1.register_vehicle(@bolt)
      expect(@bolt.registration_date).to eq(Date.today)
      expect(@bolt.plate_type).to eq(:EV)
      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe '#registered vehicle only in valid facillity' do
    it 'will only allow you to register a vehicle if the facility has that service' do
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      @facility_2.register_vehicle(@bolt)
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe 'registrant written tests' do
    it 'Tests written tests - updating registrants and facilities licensing' do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_1.permit?).to eq(true)
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)
      @facility_1.add_service("Written Test")
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
      
      expect(@registrant_2.age).to eq(16)
      expect(@registrant_2.permit?).to eq(false)
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)
      @registrant_2.earn_permit
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(true)

      expect(@registrant_3.age).to eq(15)
      expect(@registrant_3.permit?).to eq(false)
      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
      @registrant_3.earn_permit
      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
    end
  end

  describe 'registrant road test' do
    it 'Tests road tests - updating registrants and facilities licensing' do
      
    end
  end
end
