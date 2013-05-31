
shared_examples "a scene manager" do
   it "responds to :add" do
      scene_manager.should respond_to(:add)
   end

   it "responds to :raytrace" do
      scene_manager.should respond_to(:raytrace)
   end

   context "#raytrace" do
      let(:plane)  { Plane.new(Vector3::PlusZ,  -1.0, Material::FlatBlack) }
      let(:sphere) { Sphere.new(Vector3::Origin, 1.0, Material::FlatWhite) }

      let(:no_intersection_ray)  { Ray.new(Vector3.new(0, 0, 5),  Vector3::PlusZ)  }
      let(:one_intersection_ray) { Ray.new(Vector3.new(-5, 0, 0), Vector3::PlusX)  }
      let(:two_intersection_ray) { Ray.new(Vector3.new(0, 0, 10), Vector3::MinusZ) }

      before do
         scene_manager.add(sphere)
         scene_manager.add(plane)
      end

      it "returns an empty list for no intersections" do
         scene_manager.raytrace(no_intersection_ray).should == []
      end

      it "returns a list of a single item that it intersects with" do
         scene_manager.raytrace(one_intersection_ray).map(&:primitive).should == [sphere]
      end

      it "returns a list of two items that it intersects with" do
         results = scene_manager.raytrace(two_intersection_ray).map(&:primitive)
         results.should have(2).items
         results.should include plane
         results.should include sphere
      end
   end
end