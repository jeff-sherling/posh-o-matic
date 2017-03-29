# Generates new Consultant and Customer data.
class UserFactory
  class << self
    def get_name(length = 10)
      (get_random_string length).capitalize
    end

    def get_invalid_email(length = 15)
      bad_address = %w(
        @mailinator @@@mailinator.com @mailinator,,com @mailinator...com
        @:mailinator:com mailinator.com
      )
      get_random_string(length) + bad_address[rand(bad_address.size)]
    end

    def get_email(length = 10)
      # e.g., auto_kRtHdnpoQw.RAdckTkpks@mailinator.com
      'auto_' + get_random_string(length) + '.' + get_random_string(length) +
        '@mailinator.com'
    end

    def birth_date
      birth_month + '/' + birth_day + '/' + birth_year
    end

    def minor_birth_date
      '12/31/' + minor_birth_year
    end

    def birth_year
      ((Time.new.year - 80) + rand(66)).to_s
    end

    def minor_birth_year
      (Time.new.year - 15).to_s
    end

    def birth_month
      # Customer birth month (/user/register) w/ leading zero for single digits
      format '%02d', 1 + rand(12)
    end

    def birth_month_value
      # Customer birth month (/user/register) without leading zero
      (1 + rand(12)).to_s
    end

    def birth_day
      # Customer birth day (/user/register) with leading zero for single digits
      # Avoid '30 days hath September...' issues by returning values 1-28 only
      format '%02d', 1 + rand(28)
    end

    def birth_day_value
      # Customer birth day (/user/register) without leading zero
      # Avoid '30 days hath September...' issues by returning values 1-28 only
      (1 + rand(28)).to_s
    end

    def zip_code
      format '%05d', 1 + rand(99_999)
    end

    def phone
      format '%010d', 1 + rand(9_999_999_999)
    end

    def ssn
      format '%09d', 1 + rand(999_999_999)
    end

    def address1
      direction = %w(N S E W NW NE SE SW)
      street = %w(Alder Apple Ash Aspen Basswood Birch Buckeye Cedar Cherry
                  Chestnut Cottonwood Cypress Dogwood Elm Filbert Fir Hazel
                  Hawthorn Hemlock Holly Juniper Larch Locust Madrone Mahogany
                  Maple Myrtle Oak Pear Pine Plum Poplar Redwood Olive
                  Sequoia Spruce Sweetgum Sycamore Walnut Willow Yew)
      road = %w(Ave Blvd Ct Dr Ln Rd Pl St Trl Way)
      address = "#{1 + rand(9999)} " + direction[rand(direction.size)]
      address << " #{street[rand(street.size)]} #{road[rand(road.size)]}"
    end

    def address2
      dwelling = %w(Apt Flat Lot Office Room Studio Suite)
      dwelling[rand(dwelling.size)] + " #{1 + rand(999)}"
    end

    def state_province
      states = %w(AL AK AS AZ AR CA CO CT DC DE FL GA HI ID IL IN IA KS KY LA ME
                  MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA PR RI
                  SC SD TN TX UT VT VA WA WV WI WY)
      states[rand(states.size)]
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