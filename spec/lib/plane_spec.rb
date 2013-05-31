require 'spec_helper'

describe Plane do
   subject { Plane }

   let(:plane) { Plane.new(Vector3::PlusZ, -10.0, Material::FlatWhite) }

   it_behaves_like("a primitive") { let(:primitive) { plane } }

   context "construction" do
      it "assigns a normal" do
         plane.normal.should == Vector3.new(0.0, 0.0, 1.0)
      end

      it "assigns the distance" do
         plane.distance.should == -10.0
      end

      it "assigns the material" do
         plane.material.should == Material::FlatWhite
      end
   end

   context "normal_at" do
      it "returns the plane's normal" do
         plane.normal_at(Vector3::Origin).should == Vector3::PlusZ
      end
   end

   context "intersection_with" do
      let(:parallel_ray) { Ray.new(Vector3::Origin, Vector3::PlusX) }
      let(:intersecting_ray) { Ray.new(Vector3::Origin, Vector3::MinusZ) }
      let(:away_ray) { Ray.new(Vector3::Origin, Vector3::PlusZ) }

      it "returns a miss if the ray is parallel to the plane" do
         plane.intersection_with(parallel_ray).should be_miss
      end

      it "returns a miss if the ray is moving away from the plane" do
         plane.intersection_with(away_ray).should be_miss
      end

      it "returns a hit if the ray intersects the plane" do
         intersection = plane.intersection_with(intersecting_ray)

         intersection.should be_hit
         intersection.distance.should == 10
      end
   end
end