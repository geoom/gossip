module RequestSpecHelper
    # Parse JSON response to ruby hash
    def response_as_hash
      JSON.parse(response.body)
    end
end