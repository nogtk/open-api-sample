require 'rails_helper'

RSpec.describe Post do
  it { expect(Post.new).to be_a Post }
end
