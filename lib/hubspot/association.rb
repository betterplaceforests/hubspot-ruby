module Hubspot
  #
  # HubSpot Topics API
  #
  class Association
    ASSOCIATION_PATH = "/crm-associations/v1/associations"
    
    class << self
      # https://developers.hubspot.com/docs/methods/crm-associations/associate-objects
      # association_type defines the to and the from objects
      def create!(from_object_id, to_object_id, association_type)
        params = {fromObjectId: from_object_id, toObjectId: to_object_id, definitionId: association_type, category: "HUBSPOT_DEFINED" }
        response = Hubspot::Connection.put_json(ASSOCIATION_PATH, params: {}, body: params )
        return response
      end

    end
  end
end
