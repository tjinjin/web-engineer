class SnippetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @snippets = Snippet.all
    @snippets.each do |snippet|
      PygmentsWorker.perform_async(snippet.id) if snippet.highlighted_code.nil?
    end
  end
end
