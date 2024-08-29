class Registrant
    attr_reader :name,
                :age,
                :permit,
                :license_data

    def initialize(name, age, license_data, permit: false)
        @name = name
        @age = age
        @permit = permit
        @license_data = license_data
    end

    def name
        @name
    end

    def age
        @age
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