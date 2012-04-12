class ProtectedController < ApplicationController
  before_filter :authenticate_teacher!
end