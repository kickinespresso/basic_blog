require 'spec_helper'

describe BasicBlog::Post do

  describe "#to_partial_path" do
    before{ BasicBlog::BlogPost.instance_variable_set "@_to_partial_path", nil }
    after{ BasicBlog::BlogPost.instance_variable_set "@_to_partial_path", nil }

    it "includes site in the path" do
      allow(File).to receive(:exists?).and_return(true)

      site = FactoryGirl.create(:site, title: "Test Site")
      blog_post = FactoryGirl.create(:post, site: site)

      partial_path = blog_post.to_partial_path
      expect(partial_path).to eq("storytime/test-site/blog_posts/blog_post")
      Storytime::BlogPost.instance_variable_set "@_to_partial_path", nil
    end

    it "looks up the inheritance chain" do
      allow(File).to receive(:exists?).and_return(false)

      site = FactoryGirl.build(:site, title: "Test Site")
      video_post = VideoPost.new(site: site)
      partial_path = video_post.to_partial_path
      expect(partial_path).to eq("storytime/posts/post")
    end
  end

  it "sets the page slug on create" do
    post = FactoryGirl.create(:post)
    post.slug.should == post.title.parameterize
  end

  it "sets slug to user inputted value" do
    post = FactoryGirl.create(:post)

    post.slug = "random slug here"
    post.save

    post.slug.should == "random-slug-here"
  end

  it "does not allow the same slug" do
    post_1 = FactoryGirl.create(:post)
    post_2 = FactoryGirl.create(:post)

    post_2.slug = post_1.slug
    post_2.save

    post_2.slug.should_not == post_1.slug
    post_2.slug.should include(post_1.slug)
  end

  it "does not allow a blank slug" do
    post = FactoryGirl.create(:post)
    post.slug = ""
    post.save

    post.slug.should_not == ""
    post.slug.should == post.title.parameterize
  end



end