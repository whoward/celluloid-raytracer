
shared_examples "a renderer" do
   let(:renderer) { described_class.new }

   context "#scene object" do
      it "allows setting the scene" do
         manager = SimpleSceneManager.new

         renderer.scene.should == nil
         renderer.scene = manager
         renderer.scene.should == manager
      end
   end

   context "#eye position" do
      it "allows setting the eye position" do
         renderer.eye.should == nil
         renderer.eye = Ray.new(Vector3::Origin, Vector3::PlusX)
         renderer.eye.should == Ray.new(Vector3::Origin, Vector3::PlusX)
      end
   end

   context "#up_vector" do
      it "sets the up vector by default to the positive Z axis" do
         renderer.up_vector.should == Vector3::PlusZ
      end
   end

   context "#background_color" do
      it "assigns black as the background color by default" do
         renderer.background_color.should == Color::Black
      end
   end

   context "#raytrace_depth" do
      it "assigns a default raytrace depth of 5" do
         renderer.raytrace_depth.should == 5
      end
   end

   context "#pixel_size" do
      it "assigns a default pixel size of 2" do
         renderer.pixel_size.should == 2
      end
   end

   context "#w_vector" do
      before { renderer.eye = Ray.new(Vector3::Origin, Vector3::PlusX) }

      it "returns the eye direction" do
         renderer.w_vector.should == Vector3::PlusX
      end
   end

   context "#u_vector" do
      before { renderer.eye = Ray.new(Vector3::Origin, Vector3::PlusX) }

      it "returns the cross product of the w vector and the up vector" do
         renderer.u_vector.should == Vector3::PlusX ^ Vector3::PlusZ
      end
   end
   
   context "#v_vector" do
      before { renderer.eye = Ray.new(Vector3::Origin, Vector3::PlusX) }

      it "returns the cross product of the w vector and the u vector" do
         renderer.v_vector.should == Vector3::PlusX ^ (Vector3::PlusX ^ Vector3::PlusZ)
      end
   end

   context "#render" do
      it "responds to :render" do
         renderer.should respond_to :render
      end
   end

end