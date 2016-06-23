require 'rails_helper'

RSpec.describe SnippetsController, type: :controller do
  describe 'GET #index' do
    before do
      @request.env['devise.mapping'] = Devise.mapping[:user]
    end

    let(:snippet) { FactoryGirl.create(:snippet, plain_code: 'hi') }
    let(:user) { FactoryGirl.create(:user) }

    context 'ログインしていない場合' do
      it 'ログイン画面にリダイレクトされる' do
        get 'index'
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it 'インスタンス変数に値がセットされている' do
        get 'index'
        expect(assigns[:snippets]).to eq [snippet]
      end
    end
  end
end
