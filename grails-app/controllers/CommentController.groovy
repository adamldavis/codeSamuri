

class CommentController {
    
    def index = { redirect(controller:'response', action:'list') }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def delete = {
        def commentInstance = Comment.get( params.id )
        if(commentInstance) {
            try {
                def rid = commentInstance.response.id
                commentInstance.delete(flush:true)
                flash.message = "Comment ${params.id} deleted"
                redirect(controller:'response', action:'show', id: rid)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Comment ${params.id} could not be deleted"
                redirect(action:edit,id:params.id)
            }
        }
        else {
            flash.message = "Comment not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def commentInstance = Comment.get( params.id )

        if(!commentInstance) {
            flash.message = "Comment not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ commentInstance : commentInstance ]
        }
    }

    def update = {
        def commentInstance = Comment.get( params.id )
        if(commentInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(commentInstance.version > version) {
                    
                    commentInstance.errors.rejectValue("version", "comment.optimistic.locking.failure", "Another user has updated this Comment while you were editing.")
                    render(view:'edit',model:[commentInstance:commentInstance])
                    return
                }
            }
            commentInstance.properties = params
            if(!commentInstance.hasErrors() && commentInstance.save()) {
                flash.message = "Comment updated"
                redirect(controller:'response', action:'show',
                    id:commentInstance.response.id)
            }
            else {
                render(view:'edit',model:[commentInstance:commentInstance])
            }
        }
        else {
            flash.message = "Comment not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        if (session.userId == null) {
            flash.message = "You must be logged in to create a Comment"
            redirect(controller:'user', action:'login')
        }
        def commentInstance = new Comment()
        commentInstance.properties = params
        return ['commentInstance':commentInstance]
    }

    def save = {
        def commentInstance = new Comment(params)
        commentInstance.createdBy = User.findByUserId(session.userId)
        if(!commentInstance.hasErrors() && commentInstance.save()) {
            def user = User.findByUserId(session.userId)
            user.commentsMade++
            user.save()
            flash.message = "Comment created"
            redirect(controller:'response', action:'show',
                id:commentInstance.response.id)
        }
        else {
            render(view:'create',model:[commentInstance:commentInstance])
        }
    }
}
