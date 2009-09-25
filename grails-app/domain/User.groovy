class User {
    String userId
    String password
    String email
    
    int rating
    int requestsMade 
    int responsesMade
    int commentsMade

    static hasMany = [ requests: Request, responses: Response ]

    static constraints = {
        userId(size:4..20,unique:true)
        email(size:4..100,unique:true)
        password(size:6..16)
    }
    static optionals = ["email"]

    String toString() {
        userId
    }
}
