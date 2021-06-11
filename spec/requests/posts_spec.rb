require 'rails_helper'

RSpec.describe '/posts' do
  include Committee::Rails::Test::Methods

  def committee_options
    @committee_options ||= { schema_path: Rails.root.join('openapi.yaml').to_s }
  end

  describe '#index' do
    before { Post.create(title: 'a', content: 'b') }
    subject { get '/posts.json' }

    it do
      subject
      expect(response).to have_http_status :ok
    end

    it 'confirm json schema' do
      subject
      assert_response_schema_confirm
    end
  end
end
