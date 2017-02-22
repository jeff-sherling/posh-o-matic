class UserFactory
  class << self

    def get_name(length = 10)
      (get_random_string length).capitalize
    end

    def get_invalid_email(length = 15)
      bad_address = %w(@mailinator @@@mailinator.com @mailinator,,com @mailinator...com
          @:mailinator:com mailinator.com)
      "#{get_random_string(length)}" + bad_address[rand(bad_address.size)]
    end

    def get_email(length = 10)
      # e.g., auto_kRtHdnpoQw.RAdckTkpks@mailinator.com
      "auto_#{get_random_string(length)}.#{get_random_string(length)}@mailinator.com"
    end

    def get_birth_year
      "#{(Time.new.year - 80) + rand(max = 66)}"
    end

    def get_minor_birth_year
      "#{Time.new.year - 15}"
    end

    def get_birth_month
      "#{sprintf '%02d', 1 + rand(max = 12)}"
    end

    def get_birth_day
      # Avoid '30 days hath September...' issues by returning values 1-28 only
      "#{sprintf '%02d', 1 + rand(max = 28)}"
    end

    def get_zip_code
      "#{sprintf '%05d', 1 + rand(99999)}"
    end

    def get_phone
      "#{sprintf '%010d', 1 + rand(9999999999)}"
    end

    def get_ssn
      "#{sprintf '%09d', 1 + rand(999999999)}"
    end

    def get_address1
      direction = %w(N S E W NW NE SE SW)
      street = %w(Alder Apple Ash Aspen Basswood Birch Buckeye Cedar Cherry
                Chestnut Cottonwood Cypress Dogwood Elm Filbert Fir Hazel
                Hawthorn Hemlock Holly Juniper Larch Locust Madrone Mahogany
                Maple Myrtle Oak Pear Pine Plum Poplar Redwood Olive
                Sequoia Spruce Sweetgum Sycamore Walnut Willow Yew)
      road = %w(Ave Blvd Ct Dr Ln Rd Pl St Way)
      "#{1 + rand(9999)} #{direction[rand(direction.size)]} #{street[rand(street.size)]} #{road[rand(road.size)]}"
    end

    def get_address2
      dwelling = %w(Apt Flat Lot Office Room Studio Suite)
      "#{dwelling[rand(dwelling.size)]} #{1 + rand(999)}"
    end

    def get_state
      state = %w(AL AK AS AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS
               MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)
      "#{state[rand(state.size)]}"
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