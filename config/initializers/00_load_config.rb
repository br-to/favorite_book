file = "#{Rails.root}/config/secrets.yml"

SECRET_KEY =  YAML.load(ERB.new(File.read(file)).result)[Rails.env].deep_symbolize_keys