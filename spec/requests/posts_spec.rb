require 'spec_helper'

describe "Posts" do
  context ".index", js: true do
    context "new post" do
      it "creates a new post on submit" do
        visit posts_path
        wait_for_ajax_install

        page.click_on "New Post"

        page.fill_in 'Title', with: "Foo"
        page.fill_in 'Body', with: "Bar"

        expect {
          page.click_on "Create Post"
          # page.should have_css "#post_new_form", visible: false
          wait_for_ajax_stop
        }.to change(Post, :count).from(0).to(1)
      end
    end

    it "destroys a post on click" do
      post = Post.create(title: 'Foo', body: 'Bar')

      visit posts_path
      wait_for_ajax_install

      expect {
        page.click_on "Destroy"
        # page.should have_no_css "#post_#{post.id}"
        wait_for_ajax_stop
      }.to change(Post, :count).from(1).to(0)
    end
  end
end
