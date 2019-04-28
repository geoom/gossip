class ApplicationController < ActionController::API
    include JsonResponseParser
    include ExceptionHandler
end
