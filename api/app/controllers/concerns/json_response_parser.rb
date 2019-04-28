module JsonResponseParser
    def to_http_json(object, status = :ok)
        render json: object, status: status
    end
end