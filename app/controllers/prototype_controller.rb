class PrototypeController < ApplicationController
  def index
    @issues = Issue.all
  end
end
