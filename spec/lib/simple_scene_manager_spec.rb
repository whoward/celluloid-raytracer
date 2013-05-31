require 'spec_helper'

describe SimpleSceneManager do
   subject { described_class }

   let(:manager) { subject.new }

   it_behaves_like("a scene manager") { let(:scene_manager) { manager } }
end