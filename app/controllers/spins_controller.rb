class SpinsController < ApplicationController

    def create
		opinion = Opinion.find(params[:spined_id])
        current_user.spin(opinion)
        micropost = opinion.micropost
        @app = micropost.app
        create_notification_spin opinion
        redirect_to @app
    end

    def destroy
		opinion = Spin.find(params[:id]).spined
        current_user.unspin(opinion)
        micropost = opinion.micropost
        @app = micropost.app
        create_notification_unspin opinion
        redirect_to @app
    end

	private
	
	def create_notification_spin(opinion)
		Notification.create(notifier_id: current_user.id,
							notified_id: opinion.user_id,
							opinion_id: opinion.id,
							kind: "spin")
	end
	
	def create_notification_unspin(opinion)
		Notification.create(notifier_id: current_user.id,
							notified_id: opinion.user_id,
							opinion_id: opinion.id,
							kind: "unspin")
	end
end
