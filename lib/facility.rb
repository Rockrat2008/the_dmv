class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_specs)
    @name = facility_specs[:name]
    @address = facility_specs[:address]
    @phone = facility_specs[:phone]
    @services = []
    # require 'pry'; binding.pry
  end

  def add_service(service)
    @services << service
  end
end
