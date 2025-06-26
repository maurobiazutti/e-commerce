require 'rails_helper'

RSpec.describe User, type: :model do
  context "Espero validar campos obligatorios" do
    it "Valida campos" do
      user = build(:user)
      expect(user.valid?). to eq(true)
    end

    it "Valida campos nome vazio" do
      user = build(:user, name: nil)
      expect(user.valid?).to eq(false)
    end
  end
end
