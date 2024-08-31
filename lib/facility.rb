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
    #update registration date

    @registered_vehicles << vehicle
    # require 'pry'; binding.pry
  end

  def registered_vehicles
    @registered_vehicles
  end

  def collected_fees
    @collected_fees
  end
end