
/**
 *
 * @author Adam Davis
 */
class RatingsController {
	

    void updateRating(responseInstance, num) {
        if(!responseInstance) {
            flash.message = "Response not found with id ${params.id}"
            redirect(action:'list')
        }
        else {
            responseInstance.rating += num
            def user = User.get(responseInstance.createdBy.id)

            if(!responseInstance.hasErrors() && responseInstance.save()) {
                user.rating += num
                user.save()
                flash.message = "Rating changed to ${responseInstance.rating}"
                redirect(action:'show',id:responseInstance.id)
            }
            else {
                render(view:'show',model:[responseInstance:responseInstance])
            }
        }
    }
}

