class Registrant
    attr_reader :name
    
    attr_accessor :age,
                  :permit,
                  :license_data

                  @name = name
    def initialize(name, age, license_data = {written: false, license: false, renewed: false}, permit: false)
        @name = name
        @age = age
        @permit = permit
        @license_data = license_data
    end

    def permit?
        @permit
    end

    def license_data
        @license_data
    end

    def earn_permit
        @permit = true
    end
end