Web.controllers :presentation_requests do

  # GET /presentation_requests
  get :index do
    @presentation_requests = PresentationRequest.all
    # Yeah, I don't know how to render in padrino.  Getting 1 for 2 arg errors
    # render "presentation_requests/index"
    @presentation_requests.first.content + @presentation_requests.last.content
  end

  # GET /presentation_requests/new
  # get :new do
  # end

  # POST /presentation_requests/new
  # post :new do
  # end

end
