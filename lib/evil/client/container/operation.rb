class Evil::Client
  #
  # Contains operation schema and settings along with DSL method [#call]
  # to sends a request to API and handle the response.
  #
  class Container::Operation < Container
    # Executes the operation and returns rack-compatible response
    #
    # @return [Array]
    #
    def call
      request    = Resolver::Request.call(schema, settings)
      middleware = Resolver::Middleware.call(schema, settings)
      connection = schema.client.connection(settings)
      stack      = middleware.inject(connection) { |app, layer| layer.new app }
      response   = stack.call request

      Resolver::Response.call schema, settings, response
    end
  end
end
