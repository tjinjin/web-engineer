class SnippetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @snippets = Snippet.all
    @snippets.each do |snippet|
      uri = URI.parse('http://pygments.simplabs.com/')
      request = Net::HTTP.post_form(uri, lang: snippet.language, code: snippet.plain_code)
      snippet.update(highlighted_code: request.body)
    end
  end
end
