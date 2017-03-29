require 'user_factory'

# Used for /start and /user/register pages.
class Customer
  def minor
    minor = customer
    minor[:birth_month] = '12'
    minor[:birth_day] = '31'
    minor[:birth_year] = UserFactory.minor_birth_year
    minor[:guardian_first] = UserFactory.get_name(12)
    minor[:guardian_middle] = UserFactory.get_name(1)
    minor[:guardian_last] = UserFactory.get_name(15)
    minor
  end

  def missing_guardian
    missing = minor
    missing.delete(:guardian_last)
    missing
  end

  def mismatched_passwords
    mismatched = customer
    mismatched[:confirm] = 'def456'
    mismatched
  end

  def customer
    customer = common
    customer[:first] = UserFactory.get_name(12)
    customer[:last] = UserFactory.get_name(15)
    customer[:birth_year] = UserFactory.birth_year
    customer[:birth_month] = UserFactory.birth_month_value
    customer[:birth_day] = UserFactory.birth_day_value
    customer
  end

  def common
    email_pwd = email
    email_pwd[:password] = 'abc123'
    email_pwd[:confirm] = email_pwd[:password]
    email_pwd[:accept] = true
    email_pwd
  end

  def email
    { email: UserFactory.get_email }
  end

  def invalid_email
    { email: UserFactory.get_invalid_email }
  end
end