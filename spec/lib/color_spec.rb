require 'spec_helper'

describe Color do
   subject { Color }

   let(:white) { subject.new(1,1,1) }

   context "constructor" do
      it "assigns the red component" do
         white.red.should == 1
      end

      it "assigns the green component" do
         white.green.should == 1
      end

      it "assigns the blue component" do
         white.blue.should == 1
      end
   end
end