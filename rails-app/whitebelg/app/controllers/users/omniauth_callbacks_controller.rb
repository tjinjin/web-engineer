class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
  end

  def github
    auth = request.env['omniauth.auth']
    @user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) ||
      User.create_with_omniauth(auth)

    octokit = Octokit::Client.new(access_token: @user.token)
    octokit.gists.each do |gist|
      unless Snippet.find_by(gist_id: gist[:id])
        gist[:files].to_hash.each do |filename, gist_info|
          language = gist[:files][filename][:language]
          response = HTTParty.get(gist[:files][filename][:raw_url])

          snippet = Snippet.create!(
            gist_id: gist[:id],
            gist_url: gist[:html_url],
            language: language.try(:downcase),
            plain_code: response.force_encoding('utf-8'),
            user: @user
          )
        end
      end
    end

    sign_in_and_redirect @user, event: :authentication
  end
end
