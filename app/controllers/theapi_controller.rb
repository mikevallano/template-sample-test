class TheapiController < ApplicationController
  skip_before_filter  :verify_authenticity_token

   def api_receiver_post
    @payload = request.body.read

    @parsedload = JSON.parse(@payload, symbolize_names: true)
# render text: "Thanks for sending a POST request! The payload is:: #{@payload}"

    @commit_username = @parsedload[:commits][0][:author][:username]
    @commit_message = @parsedload[:commits][0][:message]
    @commit_url = @parsedload[:commits][0][:url]
    render text: "There's been a p00sh made by #{@commit_username} with the message
     '#{@commit_message}', which can be viewed at #{@commit_url} ."


    #   respond_to do |format|
    #   format.html
    #   format.json { render json: @payload}
    #   format.xml { render xml: @payload}
    # end
  end

  def api_receiver_get
    render text: "Thanks for sending a GET request!"
  end

end
