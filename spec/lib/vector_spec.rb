require 'spec_helper'

describe Vector3 do
   subject { Vector3 }

   let(:vector_a) { subject.new(1.0, 2.0, 3.0) }
   let(:vector_b) { subject.new(4.0, 5.0, 6.0) }

   context "constructor" do
      let(:vector) { vector_a }

      it "assigns the x component" do
         vector.x.should == 1.0
      end

      it "assigns the y component" do
         vector.y.should == 2.0
      end

      it "assigns the z component" do
         vector.z.should == 3.0
      end
   end

   context "equivalence" do
      let(:vector) { vector_a }

      it "equals a vector with the same x, y, and z component" do
         vector.should == subject.new(1.0, 2.0, 3.0)
      end

      it "does not equal a vector with a different x component" do
         vector.should_not == subject.new(0, 2.0, 3.0)
      end

      it "does not equal a vector with a different y component" do
         vector.should_not == subject.new(1.0, 0, 3.0)
      end

      it "does not equal a vector with a different z component" do
         vector.should_not == subject.new(1.0, 2.0, 0)
      end
   end

   context "addition" do
      it "produces a vector with it's components added" do
         (vector_a + vector_b).should == subject.new(5.0, 7.0, 9.0)
      end
   end

   context "subtraction" do
      it "produces a vector with it's components subtracted" do
         (vector_a - vector_b).should == subject.new(-3.0, -3.0, -3.0)
      end
   end

   context "multiplication" do
      context "with a vector" do
         it "produces a vector with it's components multiplied" do
            (vector_a * vector_b).should == subject.new(4.0, 10.0, 18.0)
         end
      end

      context "with a number" do
         it "produces a vector with each component scaled" do
            (vector_a * 2).should == subject.new(2.0, 4.0, 6.0)
            (vector_a * 0.5).should == subject.new(0.5, 1.0, 1.5)
         end
      end
   end

   context "cross product" do
      it "produces a new vector with the cross product vector components" do
         (vector_a ^ vector_b).should == subject.new(-3.0, 6.0, -3.0)
      end

      it "is aliased as #cross_product" do
         vector_a.cross_product(vector_b).should == subject.new(-3.0, 6.0, -3.0)
      end
   end

   context "length" do
      it "returns the magnitude of the vector" do
         vector_a.length.should == Math.sqrt(14)
      end

      it "is aliased as #magnitude" do
         vector_a.magnitude.should == Math.sqrt(14)
      end
   end

   context "dot product" do
      it "returns the dot product of the vector and the given vector" do
         vector_a.dot_product(vector_b).should == 32
      end
   end

   context "#normalize" do
      it "returns the normalized vector" do
         norm = subject.new(3,3,3).normalize

         norm.x.should == norm.y
         norm.x.should == norm.z
      end

      it "returns a new vector" do
         vector_a.normalize.should_not eql vector_a
      end

      it "does not fail for the zero vector" do
         subject.new(0,0,0).normalize.should == subject.new(0,0,0)
      end
   end

   context "#normalize!" do
      it "normalizes the vector" do
         vector = subject.new(3,3,3)
         vector.normalize!

         vector.x.should == vector.y
         vector.x.should == vector.z
      end

      it "does not fail for the zero vector" do
         vector = subject.new(0,0,0)
         vector.normalize!
         vector.should == subject.new(0,0,0)
      end
   end
end