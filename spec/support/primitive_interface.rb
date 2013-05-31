
shared_examples "a primitive" do
   it "responds to :intersection_with" do
      primitive.should respond_to :intersection_with
   end

   it "responds to :normal_at" do
      primitive.should respond_to :normal_at
   end

   it "responds to :material" do
      primitive.should respond_to :material
   end
end