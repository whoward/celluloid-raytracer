require 'spec_helper'

describe Intersection do
   let(:none)   { Intersection::None }
   let(:inside) { Intersection::Inside }
   let(:hit)    { Intersection.hit(30) }

   context "no intersection" do
      it "has a nil distance" do
         none.distance.should be_nil
      end

      it "is a miss" do
         none.should be_miss
      end
   end

   context "inside intersection" do
      it "has a distance of 0" do
         inside.distance.should == 0
      end

      it "is inside" do
         inside.should be_inside
      end
   end

   context "hit intersection" do
      it "is a hit" do
         hit.should be_hit
      end

      it "assigns the given distance" do
         hit.distance.should == 30
      end
   end
end