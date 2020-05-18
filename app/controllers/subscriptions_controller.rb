class SubscriptionsController < ApplicationController
    before_action :logged_in?

    def create
        @subscription = Subscription.new(subscription_params)
        if @subscription.save
            redirect_to recipe_path(@subscription.recipe), notice: "Successfully subscribed"
        else
            redirect_to recipe_path(params[:recipe_id], alert: "Please enter a valid comment")
        end
    end

    private

    def subscription_params
        params.require(:subscription).permit(:sub_comment, :user_id, :recipe_id)
    end
end