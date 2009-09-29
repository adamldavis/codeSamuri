class BootStrap {

     def init = { servletContext ->
         final String ADMIN = 'adam'
         if (!User.findByUserId(ADMIN)) {
              new User(userId:ADMIN, password:'testing', rating:50000).save()
         }
     }
     def destroy = {
     }
} 