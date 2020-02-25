file = "#{Rails.root}/config/secrets.yml"

SECRET_KEY = YAML.load_file(file)[Rails.env].deep_symbolize_keys