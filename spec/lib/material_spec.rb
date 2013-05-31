require 'spec_helper'

describe Material do
   subject { Material }

   let(:material) { subject.new(Color::Red) }

   context "constructor" do
      it "assigns the color" do
         material.color.should == Color.new(1.0, 0.0, 0.0)
      end

      it "assigns a default ambient of 0.0" do
         material.ambient.should == 0.0
      end

      it "allows overriding the ambient" do
         subject.new(Color::Red, :ambient => 0.75).ambient.should == 0.75
      end

      it "assigns a default diffuse of 0.8" do
         material.diffuse.should == 0.8
      end

      it "allows overriding the diffuse" do
         subject.new(Color::Red, :diffuse => 1.0).diffuse.should == 1.0
      end

      it "assigns a default reflection of 0.0" do
         material.reflection.should == 0.0
      end

      it "allows overriding the reflection" do
         subject.new(Color::Red, :reflection => 0.75).reflection.should == 0.75
      end

      it "assigns a default phong exponent of 50.0" do
         material.phong_exponent.should == 50.0
      end

      it "allows overriding the phong exponent" do
         subject.new(Color::Red, :phong_exponent => 75).phong_exponent.should == 75
      end

      it "assigns a light value of false by default" do
         material.light.should == false
      end

      it "allows overriding the light" do
         subject.new(Color::Red, :light => true).light.should == true
      end
   end

   context "light?" do
      it "is true if the material is a light" do
         subject.new(Color::Red, :light => true).should be_light
      end
   end

   context "specular" do
      it "returns the specular percentage" do
         subject.new(Color::Red, :diffuse => 0.25).specular.should == 0.75
      end
   end
end