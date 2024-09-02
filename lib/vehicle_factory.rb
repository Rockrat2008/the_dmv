class VehicleFactory

    def initialize
        @wa_vehicles = []
    end
        
    def create_vehicles(vehicles)
        vehicles.map do |vehicle|
            @wa_vehicles << Vehicle.new(engine: :ev, make: vehicle[:make], model: vehicle[:model], plate_type: nil, registration_date: nil, vin: vehicle[:vin_1_10], year: vehicle[:model_year])
        end
    end
end