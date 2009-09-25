class BootStrap {

     def init = { servletContext ->
         final String ADMIN = 'adam'
         if (!User.findByUserId(ADMIN)) {
              new User(userId:ADMIN, password:'testing').save()
         }
     }
     def destroy = {
     }
} 