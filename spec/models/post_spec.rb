require 'rails_helper'

describe Post do
  let(:post_1) { Post.create(
    title: "Test Post",
    article: "This is my test post.  It is great.",
    date: "07-09-2014",
    banner: "img",
    category: "music",
    )}

  it { is_expected.to validate_presence_of :title }

  it { is_expected.to validate_presence_of :date }

  it { is_expected.to belong_to :user }

  it { is_expected.to have_many :tags }

  it { is_expected.to validate_attachment_size  }


end
