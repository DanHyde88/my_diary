class InvitesController < ApplicationController
  def create
    @invite = Invite.new(attendee: current_user, attended_event: Event.find(params[:event_id]))
    @invite.save

    if @invite.save
      flash.notice = 'You are attending event'
      redirect_back(fallback_location: events_path)
    else
      flash.now.notice = 'Failed to save'
      render 'events_path'
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @invite = Invite.find_by(attendee: current_user, attended_event: @event)
    @invite.destroy if @invite != nil
    redirect_to event_path(@event)
  end
end
