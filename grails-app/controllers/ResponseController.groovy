

class ResponseController extends RatingsController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def up = {
        def responseInstance = Response.get( params.id )
        updateRating(responseInstance, 1)
    }

    def down = {
        def responseInstance = Response.get( params.id )
        updateRating(responseInstance, -1)
    }
    
    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ responseInstanceList: Response.list( params ), responseInstanceTotal: Response.count() ]
    }

    def show = {
        def responseInstance = Response.get( params.id )

        if(!responseInstance) {
            flash.message = "Response not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ responseInstance : responseInstance ] }
    }

    def delete = {
        def responseInstance = Response.get( params.id )
        if(responseInstance) {
            try {
                responseInstance.delete(flush:true)
                flash.message = "Response ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Response ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Response not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def responseInstance = Response.get( params.id )

        if(!responseInstance) {
            flash.message = "Response not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ responseInstance : responseInstance ]
        }
    }

    def update = {
        def responseInstance = Response.get( params.id )
        if(responseInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(responseInstance.version > version) {
                    
                    responseInstance.errors.rejectValue("version", "response.optimistic.locking.failure", "Another user has updated this Response while you were editing.")
                    render(view:'edit',model:[responseInstance:responseInstance])
                    return
                }
            }
            responseInstance.properties = params
            if(!responseInstance.hasErrors() && responseInstance.save()) {
                flash.message = "Response ${params.id} updated"
                redirect(action:show,id:responseInstance.id)
            }
            else {
                render(view:'edit',model:[responseInstance:responseInstance])
            }
        }
        else {
            flash.message = "Response not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        if (session.userId == null) {
            flash.message = "You must be logged in to create a Request"
            redirect(controller:'user', action:'login')
        }
        def responseInstance = new Response()
        responseInstance.properties = params
        return ['responseInstance':responseInstance]
    }

    def save = {
        def responseInstance = new Response(params)
        responseInstance.createdBy = User.findByUserId(session.userId)
        if(!responseInstance.hasErrors() && responseInstance.save()) {
            def user = User.findByUserId(session.userId)
            user.responsesMade++
            user.save()
            flash.message = "Response ${responseInstance.id} created"
            redirect(action:show,id:responseInstance.id)
        }
        else {
            render(view:'create',model:[responseInstance:responseInstance])
        }
    }
}
