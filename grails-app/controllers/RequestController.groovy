

class RequestController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ requestInstanceList: Request.list( params ), requestInstanceTotal: Request.count() ]
    }

    def show = {
        def requestInstance = Request.get( params.id )

        if(!requestInstance) {
            flash.message = "Request not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ requestInstance : requestInstance ] }
    }

    def delete = {
        def requestInstance = Request.get( params.id )
        if(requestInstance) {
            try {
                requestInstance.delete(flush:true)
                flash.message = "Request ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Request ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Request not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def requestInstance = Request.get( params.id )

        if(!requestInstance) {
            flash.message = "Request not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ requestInstance : requestInstance ]
        }
    }

    def update = {
        def requestInstance = Request.get( params.id )
        if(requestInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(requestInstance.version > version) {
                    
                    requestInstance.errors.rejectValue("version", "request.optimistic.locking.failure", "Another user has updated this Request while you were editing.")
                    render(view:'edit',model:[requestInstance:requestInstance])
                    return
                }
            }
            requestInstance.properties = params
            if(!requestInstance.hasErrors() && requestInstance.save()) {
                flash.message = "Request ${params.id} updated"
                redirect(action:show,id:requestInstance.id)
            }
            else {
                render(view:'edit',model:[requestInstance:requestInstance])
            }
        }
        else {
            flash.message = "Request not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def requestInstance = new Request()
        requestInstance.properties = params
        return ['requestInstance':requestInstance]
    }

    def save = {
        def requestInstance = new Request(params)
        if(!requestInstance.hasErrors() && requestInstance.save()) {
            flash.message = "Request ${requestInstance.id} created"
            redirect(action:show,id:requestInstance.id)
        }
        else {
            render(view:'create',model:[requestInstance:requestInstance])
        }
    }
}
