require 'rake/testtask'

task default: [:test]

namespace 'selenium' do
  desc 'Run UI regression tests'
  task :test do
    FileList['test/*.rb'].each do |file|
      ruby file
    end
  end

  desc 'Run UI smoke tests'
  task :smoke do
    FileList['test/get_started_test.rb',
             'test/join_page_test.rb',
             'test/join_signup_step1_error_test.rb',
             'test/join_signup_step1_test.rb',
             'test/join_signup_step2_error_test.rb',
             'test/join_signup_step2_test.rb',
             'test/login_error_test.rb',
             'test/login_test.rb',
             'test/new_password_page_test.rb',
             'test/product_filter_test.rb',
             'test/product_page_test.rb',
             'test/shopping_cart_empty_test.rb',
             'test/shopping_cart_test.rb',
             'test/user_register_error_test.rb',
             'test/user_register_page_test.rb'].each do |file|
      puts "Running test #{file}..."
      ruby file
    end
  end

  desc 'Run common components tests'
  task :common do
    FileList['test/footer_main_menu_test.rb',
             'test/footer_social_test.rb',
             'test/footer_sub_menu_test.rb',
             'test/header_test.rb',
             'test/user_bar_test.rb'].each do |file|
      puts "Running test file #{file}..."
      ruby file
    end
  end

  desc 'Run static page tests'
  task :static do
    FileList['test/cancel_refund_policies_page_test.rb',
             'test/careers_page_test.rb',
             'test/company_about_page_test.rb',
             'test/ingredients_page_test.rb',
             'test/join_page_test.rb',
             'test/landing_page_test.rb',
             'test/meet_the_team_page_test.rb',
             'test/perks_rewards_page_test.rb',
             'test/privacy_policy_page_test.rb',
             'test/terms_page_test.rb'].each do |file|
      ruby file
    end
  end
end

# ruby -e $stdout.sync=true;$stderr.sync=true;load($0=ARGV.shift) -Ilib:test

namespace 'util' do
  desc 'Run unit tests'
  task :unit_test do
    FileList['test/unit/*.rb'].each do |file|
      ruby file
    end
  end
end
