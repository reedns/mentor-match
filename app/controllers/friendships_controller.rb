class FriendshipsController < ApplicationController
  def index
    # friendships = current_user.friends + current_user.inverse_friends
    # friends = current_user.friendships
    @friendships = current_user.accepted_friends.paginate(
      page: params[:page],
      per_page: 20)
  end

  def create
    user = User.find(params[:friend_id])
    @friendship = Friendship.new(friend_id: params[:friend_id],
                                 user_id: current_user.id, state: 'pending')
    if @friendship.save
      flash[:notice] = 'Request sent!'
      redirect_to root_path
    else
      flash[:notice] = 'Unable to send request.'
      redirect_to user_path(user)
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Succesfully deleted relationship'
    redirect_to root_path
  end

  def update
    @friendship = Friendship.find(params[:id])
    mentor = @friendship.find_mentor
    mentee = @friendship.find_mentee
    @friendship.accept
    @friendship.save!
    MentorshipMailer.acceptance_email_to_mentee(mentor, mentee).deliver_later!
    MentorshipMailer.acceptance_email_to_mentor(mentor, mentee).deliver_later!
    flash[:notice] = 'Mentorship approved'
    redirect_to root_path
  end
end
