require 'spec_helper'

describe Ray do
   subject { Ray }

   let(:ray) { Ray.new(Vector3.new(5.0, 5.0, 5.0), Vector3.new(0.0, 1.0, 0.0)) }

   context "construction" do
      it "assigns the origin" do
         ray.origin.should == Vector3.new(5.0, 5.0, 5.0)
      end

      it "assigns the direction" do
         ray.direction.should == Vector3.new(0.0, 1.0, 0.0)
      end
   end
end