require 'rails_helper'

RSpec.describe Credential, type: :model do
  it { should belong_to :user }
  it { should validate_presence_of :name }
  it { should validate_presence_of :user }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
end
