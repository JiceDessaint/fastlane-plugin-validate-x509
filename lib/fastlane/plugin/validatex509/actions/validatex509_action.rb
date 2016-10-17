module Fastlane
  module Actions
    class ValidateX509Action < Action
      def self.run(params)
        certs_path = params[:certs_path]
        days_before_expiration  = params[:days_before_expiration].to_i * 86400
          Dir[File.expand_path "#{certs_path}/**/*.crt"].each{ |f| 
            res = system "openssl x509 -inform DER -checkend #{days_before_expiration} -in #{f} -noout"
            if !res 
              error_message = "Found certificate to expire: " + f
              UI.error error_message
              throw error_message
            else
              UI.message "checked #{f}"
            end
          }
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Validate every crt file to ensure they will still be available past x days (x is :days_before_expiration parameter)"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :certs_path,
                                       env_name: "FL_VALIDATE_CERT_DATES_CERTS_PATH",
                                       description: "Path for certificates to validate (allow ruby Glob syntax)", 
                                       is_string: true,
                                       verify_block: proc do |value|
                                          UI.user_error!("No certificates path for ValidateCertDatesAction given, pass using `certs_path: 'path'`") unless (value and not value.empty?)
                                       end),
          FastlaneCore::ConfigItem.new(key: :days_before_expiration,
                                       env_name: "FL_VALIDATE_CERT_DATES_DAYS_BEFORE_EXPIRATION",
                                       description: "Minimum numbers of days to checks certificates validity against",
                                       is_string: false, 
                                       default_value: 30)
        ]
      end

      def self.authors
        ["jcdessaint@gmail.com"]
      end

      def self.is_supported?(platform)
        platform == :ios
      end

    end
  end
end
