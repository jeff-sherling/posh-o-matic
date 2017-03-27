require 'user_factory'

# Used for /join/signup form
class Consultant
  def disagree_consultant
    agree = valid_consultant
    agree[:terms] = false
    agree[:propay_terms] = false
    agree
  end

  def minor_consultant
    minor = valid_consultant
    minor[:birth_date] = UserFactory.minor_birth_date
    minor
  end

  def invalid_email
    invalid_email = valid_consultant
    invalid_email[:email] = UserFactory.get_invalid_email
    invalid_email[:confirm_email] = invalid_email[:email]
    invalid_email
  end

  def mismatched_email
    mismatch = valid_consultant
    mismatch[:confirm_email] = "bad_#{mismatch[:email]}"
    mismatch
  end

  def mismatched_password
    password = valid_consultant
    password[:confirm_password] = 'def456'
    password
  end

  def valid_consultant
    valid = address
    valid[:sponsor_name] = 'Amanda Williams'
    valid[:sponsor_zip] = '84101'
    valid[:rep_site] = "#{valid[:first]}#{valid[:last]}"
    valid[:propay_terms] = true
    valid
  end

  def address
    address = common
    address[:address1] = UserFactory.address1
    address[:address2] = UserFactory.address2
    address[:city] = UserFactory.get_name
    address[:state] = UserFactory.state_province
    address[:zip] = UserFactory.zip_code
    address[:terms] = true
    address
  end

  def common
    common = basic
    common[:first] = UserFactory.get_name
    common[:last] = UserFactory.get_name 12
    common[:email] = UserFactory.get_email
    common[:confirm_email] = common[:email]
    common[:password] = 'abc123'
    common[:confirm_password] = 'abc123'
    common
  end

  def basic
    basic = {}
    basic[:ssn] = UserFactory.ssn
    basic[:phone] = UserFactory.phone
    basic[:birth_date] = UserFactory.birth_date
    basic
  end
end