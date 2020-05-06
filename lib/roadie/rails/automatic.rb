# frozen_string_literal: true

module Roadie
  module Rails
    module Automatic
      def mail(*args, &block)
        super.tap do |email|
          email.extend InlineOnDelivery
          email.roadie_options = roadie_options.try(:dup)
          Rails.logger.info("ROADIE #{roadie_options}")
        end
      end

      def roadie_options
        ::Rails.application.config.roadie
      end
    end
  end
end
