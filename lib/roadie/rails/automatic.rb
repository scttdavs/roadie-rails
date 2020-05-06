# frozen_string_literal: true

module Roadie
  module Rails
    module Automatic
      def mail(
        options = {},
        final_roadie_options = roadie_options,
        &block
      )
        Mailer.roadie_mail(options, final_roadie_options, &block)
      end

      def roadie_options
        ::Rails.application.config.roadie
      end
    end
  end
end
