# frozen_string_literal: true

class ProfileController < ApplicationController
  def index
    @all_users = User.all
  end
end
