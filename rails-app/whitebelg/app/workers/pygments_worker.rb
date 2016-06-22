class PygmentsWorker
  include Sidekiq::Worker

  def perform(snippet_id)
    # Do something
    snippet = Snippet.find(snippet_id)
    uri = URI.parse('http://pygments.simplabs.com/')
    request = Net::HTTP.post_form(uri, lang: snippet.language, code: snippet.plain_code)
    snippet.update(highlighted_code: request.body)
  end
end
