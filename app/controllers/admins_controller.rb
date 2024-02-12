class AdminsController < ApplicationController
    def index
        @all_users = User.all
        @all_properties = Property.all
        @all_assignments = Assignment.all
    end
end