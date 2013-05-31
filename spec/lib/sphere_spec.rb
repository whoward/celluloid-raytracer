require 'spec_helper'

describe Sphere do
   subject { Sphere }

   let(:sphere) { subject.new(Vector3::Origin, 5.0, Material::FlatWhite) }

   it_behaves_like("a primitive") { let(:primitive) { sphere } }

   context "constructor" do
      it "assigns the origin" do
         sphere.origin.should == Vector3.new(0,0,0)
      end

      it "assigns the radius" do
         sphere.radius.should == 5.0
      end

      it "assigns the material" do
         sphere.material.should == Material::FlatWhite
      end
   end

   context "#contains?" do
      it "contains any point inside it's volume" do
         sphere.should be_contains Vector3::Origin
      end

      it "does not contain a point outside it's volume" do
         sphere.should_not be_contains Vector3.new(10,0,0)
      end

      it "contains points on it's surface" do
         sphere.should be_contains Vector3.new(5,0,0)
      end
   end

   context "#normal_at" do
      it "returns the vector difference of the point and the origin normalized" do
         sphere.normal_at(Vector3.new(10, 0, 0)).should == Vector3::PlusX
      end
   end

   context "#intersection_with" do
      let(:contained_ray)    { Ray.new(Vector3::Origin, Vector3::PlusX) }
      let(:missing_ray)      { Ray.new(Vector3.new(10, 0, 0), Vector3::PlusX) }
      let(:intersecting_ray) { Ray.new(Vector3.new(10, 0, 0), Vector3::MinusX) }

      it "is :inside when the point is contained inside the sphere" do
         sphere.intersection_with(contained_ray).should be_inside
      end

      it "is :miss for a ray which does not hit it" do
         sphere.intersection_with(missing_ray).should be_miss
      end

      it "returns true for a ray pointed directly at it" do
         intersect = sphere.intersection_with(intersecting_ray)

         intersect.should be_hit
         intersect.distance.should == 5
      end
   end
end