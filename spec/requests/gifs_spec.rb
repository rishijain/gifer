require 'rails_helper'

RSpec.describe "Gifs", type: :request do
  describe "when user is logged in" do

    context "user should be able to" do
      before(:each) do
        user = build(:user)
        sign_in user
      end

      it "access index page" do
        get gifs_path
        expect(response.code).to eq('200')
      end

      it "create gif" do
        gif_count = Gif.count
        file = Rails.root.join('spec', 'icon.png')
        image = ActiveStorage::Blob.create_after_upload!(io: File.open(file, 'rb'), filename: 'icon.png', content_type: 'image/png').signed_id
        post "/gifs", :params => { :gif => {:name => "test1", :description => 'test desc', :file => image} }
        expect(Gif.count).to eq(gif_count + 1)
      end
    end
  end
end
