class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable,
         :omniauthable, omniauth_providers: [ :google_oauth2 ]
  def self.from_omniauth(auth)
    # byebug
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.skip_confirmation!
      # user.name = auth.info.name   # se você tiver um campo name no seu modelo
      # Outros campos que você deseja copiar do auth.info...
    end
  end
end