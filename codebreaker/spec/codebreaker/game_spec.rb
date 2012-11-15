require 'spec_helper'

module Codebreaker
  describe Game do
    let(:output) { double("output").as_null_object }
    let(:game) { Game.new(output) }
    describe "#start" do
  
   
#      before(:each) do
#        @output=double('output').as_null_object
#        @game=Game.new(@output)
#      end
   
      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to Codebreaker!')

        game.start('1234')
      end
      it "prompts for the first guess" do
        output.should_receive(:puts).with("Enter guess:")

        game.start('1234')
      end

     
    end

    describe "#guess" do
      context "with no matches" do
        it "sents a mark with ''" do
          game.start('1234')
          output.should_receive(:puts).with('')
          game.guess('5555')
        end
      end
    
      context "with 1 nubmer match" do
        it "sends a mark with '-'" do
          game.start('1234')
          output.should_receive(:puts).with('-')
          game.guess('2555')
        end
      end
  
      context "with 1 exact match" do
        it "sends a mark with '+'" do
          game.start('1234')
          output.should_receive(:puts).with('+')
          game.guess('1666')
        end
      end
      
      context "with 2 number matches" do
        it "sends a mark with '--' " do
          game.start('1234')
          output.should_receive(:puts).with('--')
          game.guess('2355')
        end
      end
     
      context "with 1 number match and 1 number exact match" do
        it "sends a mark with '+-' " do
          game.start('1234')
          output.should_receive(:puts).with('+-')
          game.guess('2839')
        end
      end
    end
  end
end
