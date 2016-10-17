module Fastlane
  module Helper
    class ValidateX509Helper
      # class methods that you define here become available in your action
      # as `Helper::ValidateX509Helper.your_method`
      #
      def self.show_message
        UI.message("Hello from the validate_x509 plugin helper!")
      end
    end
  end
end
