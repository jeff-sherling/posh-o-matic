require 'user_factory'

class Customer

  def get_valid_minor
    minor = get_common
    minor[:birth_year] = UserFactory.get_minor_birth_year
    minor[:birth_month] = '12'
    minor[:birth_day] = '31'
    minor[:guardian_first] = UserFactory.get_name(12)
    minor[:guardian_middle] = UserFactory.get_name(1)
    minor[:guardian_last] = UserFactory.get_name(15)
    minor
  end

  def get_missing_guardian
    missing = get_valid_minor
    missing.delete(:guardian_last)
    missing
  end

  def get_mismatched_passwords
    mismatched = get_valid_customer
    mismatched[:confirm] = 'def456'
    mismatched
  end

  def get_valid_customer
    customer = get_common
    customer[:birth_year] = UserFactory.get_birth_year
    customer[:birth_month] = UserFactory.get_birth_month
    customer[:birth_day] = UserFactory.get_birth_day
    customer
  end

  def get_common
    missing = get_email_and_password
    missing[:first] = UserFactory.get_name(12)
    missing[:last] = UserFactory.get_name(15)
    missing
  end

  def get_email_and_password
    email_pwd = get_email_only
    email_pwd[:password] = 'abc123'
    email_pwd[:confirm] = email_pwd[:password]
    email_pwd[:accept] = true
    email_pwd
  end

  def get_email_only
    email = { :email => UserFactory.get_email }
    email
  end

end