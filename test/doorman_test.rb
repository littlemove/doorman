require File.dirname(__FILE__) + '/test_helper.rb'
require File.dirname(__FILE__) + '/../lib/doorman.rb'

class DoormanTest < ActiveSupport::TestCase
  include Doorman

  context "for values on the white list" do
    setup do
      # See test/doorman.yml to watch the rules defined
      Doorman::CONFIG_FILE_PATH = "#{File.dirname(File.expand_path(__FILE__))}/../test/doorman.yml"
    end

    should 'let them pass' do
      assert Doorman::Whitelist.come_in?('vicentin@email.com')
      assert Doorman::Whitelist.come_in?('diego@simplelogica.net')
    end

    should 'not pass' do
      assert !Doorman::Whitelist.come_in?('someone@email.com')
    end

  end

    context "for values on the black list" do
    setup do
      # See test/doorman.yml to watch the rules defined
      Doorman::CONFIG_FILE_PATH = "#{File.dirname(File.expand_path(__FILE__))}/../test/doorman.yml"
    end

    should 'let them pass' do
      assert Doorman::Blacklist.come_in?('vicentin@email.com')
      assert Doorman::Blacklist.come_in?('diego@simplelogica.net')
    end

    should 'not pass' do
      assert !Doorman::Blacklist.come_in?('loki@email.com')
      assert !Doorman::Blacklist.come_in?('rouco@comunistasnazis.net')
    end
    
  end

end
