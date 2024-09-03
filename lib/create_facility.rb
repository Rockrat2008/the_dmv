class CreateFacility

    def initialize
        @facility_info = []
    end

    def create_facilities(facility_info)
        facility_info.map do |facility|
          if facility[:state] == "CO"
            combined_addr = [facility[:address_li], facility[:address__1], facility[:city], facility[:state], facility[:zip]]
            @facility_info << Facility.new(name: facility[:dmv_office], address: combined_addr, phone: facility[:phone])
          elsif facility[:state] == "NY"
            combined_addr = [facility[:street_address_line_1], facility[:street_address_line_2], facility[:city], facility[:state], facility[:zip_code]]
            @facility_info << Facility.new(name: facility[:office_name], address: combined_addr, phone: facility[:public_phone_number])
          elsif facility[:state] == "MO"
            combined_addr = [facility[:address1], facility[:city], facility[:state], facility[:zipcode]]
            @facility_info << Facility.new(name: facility[:name], address: combined_addr, phone: facility[:phone])
          else
            puts "Not a vailid file"
          end
        end
    end
end