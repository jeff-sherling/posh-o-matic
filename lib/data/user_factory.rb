class UserFactory
  class << self

    def get_name(length = 10)
      (get_random_string length).capitalize
    end

    def get_email
      "auto_#{get_random_string(10)}.#{get_random_string(10)}@mailinator.com"
    end

    def get_birth_year
      "#{(Time.new.year - 80) + rand(max = 66)}"
    end

    def get_minor_birth_year
      "#{Time.new.year - 15}"
    end

    def get_birth_month
      "#{1 + rand(max = 12)}"
    end

    def get_birth_day
      "#{1 + rand(max = 28)}"
    end

    def get_zip_code
      "#{sprintf '%05d', rand(100000)}"
    end

    private

    def get_random_string(length)
      unless length.class == Fixnum && length > 0
        raise 'Argument (length) is not a valid integer.'
      end
      chars = ('a'..'z').to_a
      random_string = ''
      length.times { random_string << chars[rand(chars.size)] }
      random_string
    end

  end

end