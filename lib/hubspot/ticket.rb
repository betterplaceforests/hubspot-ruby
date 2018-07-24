module Hubspot
  #
  # HubSpot Topics API
  #
  class Ticket
    TICKETS_PATH = "/crm-objects/v1/objects/tickets/paged"
    TICKET_PATH =  "/crm-objects/v1/objects/tickets/:id"
    CREATE_TICKET_PATH = "/crm-objects/v1/objects/tickets"

    class << self
      # Lists the tickets
      # https://developers.hubspot.com/docs/methods/tickets/get-all-tickets
      # @return [Hubspot::Ticket] array of tickets
      def list
        response = Hubspot::Connection.get_json(TICKETS_PATH, {})
        response['objects'].map { |t| new(t) }
      end

      # Finds the details for a specific ticket
      # {https://developers.hubspot.com/docs/methods/tickets/get_ticket_by_id }
      # @return Hubspot::Ticket
      def find_by_ticket_id(id)
        response = Hubspot::Connection.get_json(TICKET_PATH, { id: id })
        new(response)
      end

      def create!(params)
        response = Hubspot::Connection.post_json(CREATE_TICKET_PATH, params: {}, body: [params] )
        new(HashWithIndifferentAccess.new(response))
      end
    end

    attr_reader :properties

    def initialize(response_hash)
      @properties = response_hash #no need to parse anything, we have properties
    end
  end
end
