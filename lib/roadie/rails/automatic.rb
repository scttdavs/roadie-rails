# frozen_string_literal: true

module Roadie
  module Rails
    module Automatic
      def mail(
        options = {},
        &block
      )
        email = super(options, &block)
        MailInliner.new(email, roadie_options).execute
      end

      def roadie_options
        ::Rails.application.config.roadie
      end
    end
  end
end
