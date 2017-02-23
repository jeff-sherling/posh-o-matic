require 'user_factory'

class Consultant
  class << self

    # Used for /join/signup form

    def get_disagree_consultant
      agree = get_valid_consultant
      agree[:terms] = false
      agree[:propay_terms] = false
      agree
    end

    def get_minor_consultant
      valid = get_valid_consultant
      valid[:birth_date] = UserFactory.get_minor_birth_date
      valid
    end

    def get_invalid_email
      info = get_valid_consultant
      info[:email] = UserFactory.get_invalid_email
      info[:confirm_email] = "#{info[:email]}"
      info
    end

    def get_mismatched_email
      info = get_valid_consultant
      info[:confirm_email] = "bad_#{info[:email]}"
      info
    end

    def get_mismatched_password
      info = get_valid_consultant
      info[:confirm_password] = 'def456'
      info
    end

    def get_valid_consultant
      valid = get_address
      valid[:sponsor_name] = 'Amanda Williams'
      valid[:sponsor_zip] = '84101'
      valid[:rep_site] = "#{valid[:first]}#{valid[:last]}"
      valid[:propay_terms] = true
      valid
    end

    def get_address
      address = get_common
      address[:address1] = UserFactory.get_address1
      address[:address2] = UserFactory.get_address2
      address[:city] = UserFactory.get_name
      address[:state] = UserFactory.get_state
      address[:zip] = UserFactory.get_zip_code
      address[:terms] = true
      address
    end

    def get_common
      common = get_basic
      common[:first] = UserFactory.get_name
      common[:last] = UserFactory.get_name 12
      common[:email] = UserFactory.get_email
      common[:confirm_email] = "#{common[:email]}"
      common[:password] = 'abc123'
      common[:confirm_password] = common[:password]
      common
    end

    def get_basic
      basic = {}
      basic[:ssn] = UserFactory.get_ssn
      basic[:phone] = UserFactory.get_phone
      basic[:birth_date] = UserFactory.get_birth_date
      basic
    end

  end

end