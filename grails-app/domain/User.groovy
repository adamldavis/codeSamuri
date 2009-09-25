class User {
    String userId
    String password
    String email

    static constraints = {
        userId(size:4..20,unique:true)
        email(size:4..100,unique:true)
        password(size:6..16)
    }
}
