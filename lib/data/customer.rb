require 'user_factory'

class Customer

  def get_minor
    minor = get_customer
    minor[:birth_month] = '12'
    minor[:birth_day] = '31'
    minor[:birth_year] = UserFactory.get_minor_birth_year
    minor[:guardian_first] = UserFactory.get_name(12)
    minor[:guardian_middle] = UserFactory.get_name(1)
    minor[:guardian_last] = UserFactory.get_name(15)
    minor
  end

  def get_missing_guardian
    missing = get_minor
    missing.delete(:guardian_last)
    missing
  end

  def get_mismatched_passwords
    mismatched = get_customer
    mismatched[:confirm] = 'def456'
    mismatched
  end

  def get_customer
    customer = get_common
    customer[:first] = UserFactory.get_name(12)
    customer[:last] = UserFactory.get_name(15)
    customer[:birth_year] = UserFactory.get_birth_year
    customer[:birth_month] = UserFactory.get_birth_month_value
    customer[:birth_day] = UserFactory.get_birth_day_value
    customer
  end

  def get_common
    email_pwd = get_email
    email_pwd[:password] = 'abc123'
    email_pwd[:confirm] = email_pwd[:password]
    email_pwd[:accept] = true
    email_pwd
  end

  def get_email
    email = { :email => UserFactory.get_email }
    email
  end

  def get_invalid_email
    email = { :email => UserFactory.get_invalid_email }
    email
  end

end