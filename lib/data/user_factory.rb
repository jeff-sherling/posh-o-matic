# Generates new Consultant and Customer data.
class UserFactory
  class << self
    def get_name(length = 10)
      (get_random_string length).capitalize
    end

    def get_invalid_email(length = 15)
      bad_address = %w(@mailinator @@@mailinator.com @mailinator,,com
                       @mailinator...com @:mailinator:com mailinator.com)
      get_random_string(length) + bad_address.sample
    end

    def get_email(length = 10)
      # e.g., auto_kRtHdnpoQw.RAdckTkpks@mailinator.com
      first = get_random_string(length)
      last = get_random_string(length)
      "auto_#{first}.#{last}@mailinator.com"
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
      area_code + (format '%07d', 1_000_000 + rand(8_999_999))
    end

    def ssn
      format '%09d', 1 + rand(999_999_999)
    end

    def address1
      direction = %w(N S E W NW NE SE SW).sample
      street_name = %w(Alder Apple Ash Aspen Basswood Birch Buckeye Cedar
                       Cherry Chestnut Cottonwood Cypress Dogwood Elm Filbert
                       Fir Hazel Hawthorn Hemlock Holly Juniper Larch Locust
                       Madrone Mahogany Maple Myrtle Oak Pear Pine Plum Poplar
                       Redwood Olive Sequoia Spruce Sweetgum Sycamore Walnut
                       Willow Yew).sample
      road_type = %w(Ave Blvd Ct Dr Ln Rd Pl St Trl Way).sample
      address = "#{1 + rand(9999)} #{direction}"
      address << " #{street_name} #{road_type}"
    end

    def address2
      dwelling_type = %w(Apt Flat Lot Office Room Studio Suite).sample
      "#{dwelling_type} #{1 + rand(999)}"
    end

    def state_province
      %w(AL AK AZ AR CA CO CT DC DE FL GA HI ID IL IN IA KS KY LA
         MA MD ME MI MN MO MS MT NE NV NH NJ NM NY NC ND OH OK OR
         PA RI SC SD TN TX UT VT VA WA WV WI WY).sample
    end

    def area_code
      %w(201 203 205 206 207 208 212 213 214 215 216 217 218 219 240 301
         302 303 304 305 307 308 312 313 314 315 316 317 318 319 401 402
         404 405 406 407 408 409 412 413 414 415 417 419 501 502 503 504
         505 507 508 509 512 513 515 516 518 601 602 603 605 606 607 608
         609 612 614 615 616 617 618 701 702 703 704 706 707 708 712 713
         714 715 716 717 718 719 801 802 803 804 805 806 808 812 813 814
         815 816 817 818 901 904 906 907 908 910 912 913 914 915 916 917
         918 919).sample
    end

    private

    def get_random_string(length)
      unless length.class == Fixnum && length > 0
        raise ArgumentError, 'Argument (length) is not a valid integer.'
      end
      chars = ('a'..'z').to_a
      random_string = ''
      length.times { random_string << chars.sample }
      random_string
    end
  end
end