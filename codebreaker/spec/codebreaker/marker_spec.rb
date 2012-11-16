require 'spec_helper'

module Codebreaker
  describe Marker do
    describe "code:1234 guess:5577" do
      it "return '' " do
        marker = Marker.new('1234','5577')
        marker.exact_match_count.should == 0
        marker.number_match_count.should == 0
      end
    end
    describe "#exact_match_count" do
      context "with no matches" do
        it "return 0" do
          marker = Marker.new('1234', '4321')
          marker.exact_match_count.should == 0     
        end
      end

      context "with 1 exact match" do
        it "return 1" do 
          marker=Marker.new('1234','1367')
          marker.exact_match_count.should == 1
        end
      end
  
      context "with 1 number match " do
        it "return 0" do
          marker=Marker.new("1234",'2678')
          marker.exact_match_count.should == 0
        end
      end

      context "with 1 exact match and 1 number match" do
        it "return 1" do
          marker=Marker.new('1234','3278')
          marker.exact_match_count.should == 1
        end
      end
    end

    describe "#number_match_count" do
      context "with no matches" do
        it "return 0" do
           marker=Marker.new("1234",'6789')
           marker.number_match_count.should == 0
        end
      end
 
      context "with 1 number match" do
        it "return 1" do
          marker=Marker.new('1234','4678')
          marker.number_match_count.should == 1 
        end
      end

      context "with 1 exact match" do
        it "return 0" do
          marker= Marker.new('1234','1678')
          marker.number_match_count.should == 0
        end
      end
  
      context "with 1 exact match and 1 number match" do
        it "return 1" do
          marker = Marker.new('1234','1748')
          marker.number_match_count.should == 1
        end
      end
    end
  end
end
