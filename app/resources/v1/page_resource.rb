module V1
  class PageResource < BaseResource
    attribute :url
    attribute :content

    class << self
      def creatable_fields(context)
        super - [:content]
      end

      def updatable_fields(context)
        []
      end
    end
  end
end
