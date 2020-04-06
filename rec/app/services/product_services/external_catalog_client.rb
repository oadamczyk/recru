module ProductServices
  class ExternalCatalogClient
    class MarginNotFoundError < StandardError; end
    # TODO: implement external client call for fetching b2c margin data
    def b2c_data
      raise NotImplementedError
    end
  end
end