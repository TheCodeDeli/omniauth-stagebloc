require "spec_helper"

module OmniAuth
  module Strategies
    describe Stagebloc do

      let(:data) do
        {
          "id" => 8,
          "url" => "https:\/\/stagebloc.dev\/user\/testuser",
          "created" => "2009-10-27 14:29:16",
          "name" => "Test User",
          "username" => "testuser",
          "bio" => "Biography here...",
          "color" => "70,170,255",
          "birthday" => "1995-07-05",
          "gender" => "male",
          "email" => "testuser@sb.com",
          "photo" => {
            "width" => 525,
            "height" => 500,
            "images" => {
              "thumbnail_url" => "http://placekitten.com/300/300",
              "small_url" => "http://placekitten.com/300/300",
              "medium_url" => "http://placekitten.com/300/300",
              "large_url" => "http://placekitten.com/300/300",
              "original_url" => "http://placekitten.com/300/300"
            }
          }
        }
      end
      
      subject do
        subject = Stagebloc.new(data)
        allow(subject).to receive(:raw_info) { data }
        subject
      end

      describe "info" do
        context "created" do
          it "parses to UTC time" do
            expect(subject.info['created']).to eq(Time.new(2009, 10, 27, 14, 29, 16, '+00:00'))
          end
        end

        context "birthday" do
          it "parses to date" do
            expect(subject.info['birthday']).to eq(Time.new(1995, 07, 05))
          end
        end

        it { should have_info('id', 8) }
        it { should have_info('url', 'https://stagebloc.dev/user/testuser') }
        it { should have_info('name', 'Test User') }
        it { should have_info('username', 'testuser') }
        it { should have_info('bio', 'Biography here...') }
        it { should have_info('color', '70,170,255') }
        it { should have_info('gender', 'male') }
        it { should have_info('email', 'testuser@sb.com') }
        it do
          should have_info('photo', {
            'width' => 525,
            'height' => 500,
            'images' => {
              "thumbnail_url" => "http://placekitten.com/300/300",
              "small_url" => "http://placekitten.com/300/300",
              "medium_url" => "http://placekitten.com/300/300",
              "large_url" => "http://placekitten.com/300/300",
              "original_url" => "http://placekitten.com/300/300"
            }
          })
        end
      end

    end
  end
end
