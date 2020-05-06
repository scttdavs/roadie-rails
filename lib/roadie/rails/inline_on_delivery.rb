# frozen_string_literal: true

module Roadie
  module Rails
    # Extend instances of Mail with this to have it inlined automatically when
    # delivered. You'll need to assign some #roadie_options for it to actually
    # do anything.
    module InlineOnDelivery
      attr_accessor :roadie_options

      def deliver
        inline_styles
        super
      end

      def deliver!
        inline_styles
        super
      end

      private

      def inline_styles
        if (@roadie_options)
          MailInliner.new(self, @roadie_options).execute
        end
      end
    end
  end
end
