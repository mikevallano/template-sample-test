class TheapiController < ApplicationController
  require 'net/https'
  skip_before_filter  :verify_authenticity_token

   def api_receiver_post
    @slack_url = ENV["SLACK_WEBHOOK_URL"]
    @new_slack_url = "https://hooks.slack.com/services/#{@slack_url}"
    @maker_key = ENV["IFTTT_MAKER_KEY"]
    @new_maker_url = "https://maker.ifttt.com/trigger/gitpush/with/key/#{@maker_key}"


    @inpayload = request.body.read

    @parsedload = JSON.parse(@inpayload, symbolize_names: true)
    # render text: "Thanks for sending a POST request! The payload is:: #{@payload}"

    @commit_username = @parsedload[:commits][0][:author][:username]
    @commit_message = @parsedload[:commits][0][:message]
    @commit_url = @parsedload[:commits][0][:url]
    # render text: "There's been a p00sh made by #{@commit_username} with the message
    #  '#{@commit_message}', which can be viewed at #{@commit_url} ."

    slackuri = URI(@new_slack_url)
    @payload={"text": "#{@commit_username} just p00shed with with a commit message of:
      '#{@commit_message}'.\nYou can check out the commit <#{@commit_url}|here> to see it."}.to_json
    render text: "#{@payload}"
    slackres = Net::HTTP.post_form(slackuri, 'payload' => "#{@payload}")
    puts slackres.body

    # uri = URI(@new_maker_url)
    # res = Net::HTTP.post_form(uri, 'value1' => "#{@commit_username}", 'value2' => "#{@commit_message}", 'value3' => "#{@commit_url}")
    # puts res.body

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
