class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_specs)
    @name = facility_specs[:name]
    @address = facility_specs[:address]
    @phone = facility_specs[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      if vehicle.antique?
        @collected_fees += 25
        vehicle.plate_type = :antique
      elsif vehicle.electric_vehicle?
        @collected_fees += 200
        vehicle.plate_type = :EV
      else
        @collected_fees += 100
        vehicle.plate_type = :regular
      end
  
      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle
    end
    @registered_vehicles
  end

  def registered_vehicles
    @registered_vehicles
  end

  def collected_fees
    @collected_fees
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.age > 15 && registrant.permit == true
      registrant.license_data[:written] = true
      return true
    else
      false
    end
  end

  def administer_road_test(registrant)
    # checck to see if the written test has been passed
    # check to see if the facility offers the road test
    if @services.include?("Road Test") && registrant.license_data[:written] == true
      registrant.license_data[:license] = true
      return true
    else
      false
    end
  end
end