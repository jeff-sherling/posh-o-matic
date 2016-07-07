require 'user_factory'

class Consultant
  class << self

    def get_valid_consultant
      valid = get_common
      valid[:birth_month] = UserFactory.get_birth_month
      valid[:birth_day] = UserFactory.get_birth_day
      valid[:birth_year] = UserFactory.get_birth_year
      valid[:sponsor_name] = 'Top Consultant'
      valid[:sponsor_zip] = '84101'
      valid[:rep_site_url] = "Posh_#{valid[:last]}"
      valid[:t_shirt] = 'XXL'
      valid[:terms] = true
      valid[:policies] = true
      valid
    end

    def get_do_not_agree_consultant
      agree = get_valid_consultant
      agree[:terms] = false
      agree[:policies] = false
      agree
    end

    def get_valid_minor_consultant
      valid = get_valid_consultant
      valid[:birth_month] = '12'
      valid[:birth_day] = '31'
      valid[:birth_year] = UserFactory.get_minor_birth_year
      valid
    end

    def get_mismatched_email
      info = get_common
      info[:confirm_email] = "bad_#{info[:email]}"
      info
    end

    def get_mismatched_password
      info = get_common
      info[:confirm_password] = 'def456'
      info
    end

    def get_common
      common = {}
      common[:first] = UserFactory.get_name
      common[:last] = UserFactory.get_name 12
      common[:email] = UserFactory.get_email
      common[:confirm_email] = "#{common[:email]}"
      common[:password] = 'abc123'
      common[:confirm_password] = common[:password]
      common
    end

  end

end