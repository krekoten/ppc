module Admins
  class SessionsController < Devise::SessionsController
    layout 'admins'
  end
end