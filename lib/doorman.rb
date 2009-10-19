# Doorman
module Doorman

  CONFIG_FILE_PATH = ""

  class Whitelist

    def self.come_in?(item)
      for rule in white_list do
        return true if Regexp.new(rule).match(item.to_s)
      end
      false
    end

    private

    def self.white_list
      yaml = YAML.parse_file(CONFIG_FILE_PATH)
      yaml['white'].transform
    end

  end

  class Blacklist

    def self.come_in?(item)
      for rule in black_list do
        return false if Regexp.new(rule).match(item.to_s)
      end
      true
    end

    private

    def self.black_list
      yaml = YAML.parse_file(CONFIG_FILE_PATH)
      yaml['black'].transform
    end
    
  end

end
