class RandomCustomer

  def get_valid_customer
    get_customer
  end

  def get_valid_minor
    get_minor
  end

  def get_missing_minor_guardian
    missing = get_minor
    missing.delete(:guardian_last)
    missing
  end

  def get_mismatched_passwords
    mismatched = get_customer
    mismatched[:confirm] = 'def456'
    mismatched
  end

  def get_missing_birth_date
    get_common
  end

  def get_email_and_password
    get_minimum
  end

  def get_email_only
    get_email_address
  end

  private

  def get_customer
    customer = get_common
    customer[:birth_year] = (1936 + rand(max = 66)).to_s
    customer[:birth_month] = (1 + rand(max = 12)).to_s
    customer[:birth_day] = (1 + rand(max = 28)).to_s
    customer
  end

  def get_minor
    minor = get_common
    minor[:birth_year] = (Time.new.year - 15).to_s
    minor[:birth_month] = '12'
    minor[:birth_day] = '31'
    minor[:guardian_first] = get_random_string(12)
    minor[:guardian_middle] = get_random_string(1).upcase
    minor[:guardian_last] = get_random_string(12)
    minor
  end

  def get_common
    common = get_minimum
    common[:first] = get_random_string(12)
    common[:last] = get_random_string(15)
    common
  end

  def get_minimum
    minimum = get_email_address
    minimum[:password] = 'abc123'
    minimum[:confirm] = 'abc123'
    minimum[:accept] = true
    minimum
  end

  def get_email_address
    email = {}
    email[:email] = 'auto_' + get_random_string + '.' + get_random_string + '@mailinator.com'
    email
  end

  def get_random_string(length = 10)
    chars = ('a'..'z').to_a + ('A'..'Z').to_a
    random_string = ''
    length.times { random_string << chars[rand(chars.size)] }
    random_string
  end

end