class InvitesController < ApplicationController

  layout 'index', :except => :address_popup
  layout 'plaxo', :only => :import_addresses
  before_filter :authenticate

  def address_popup
    
  end

  def import_addresses
    @invite = Invite.new
  end
  
  def create_invites
    user = session[:user]
    begin
        params[:invite][:recipient_list].split(',').each do |item|
          temp = Invite.new
          temp.user = user
          temp.email = item
          temp.save!
          email = InviteMailer.deliver_invite(temp)
          temp.email_sent = true unless email.date.nil?
          temp.save
    end

    rescue
      false
    end
    redirect_to :controller => :professionals, :action => :home
  end

  def join
    session[:invite_id] = params[:id] if Invite.find(params[:id]).valid_invite?
    redirect_to :controller => :jobyssey, :action => :index
  end

  def index
  end

  def new
  end

  def create
  end

end
