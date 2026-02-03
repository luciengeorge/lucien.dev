module Administrate
  module Field
    class ActiveStorage < Administrate::Field::Base
      def attached?
        data&.attached?
      end

      def image?
        return false unless attached?

        data.blob&.content_type&.start_with?("image/")
      end
    end
  end
end
