class DwellingItemsController < ApplicationController
	layout 'dwelling_layout'
	before_filter :logged_in?
	before_filter :load_upcoming_items
end
