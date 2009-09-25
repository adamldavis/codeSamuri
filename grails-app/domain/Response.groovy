class Response {
    String text
    int rating
    Date created = new Date()
    User createdBy
    Request request

    static hasMany = [comments: Comment]

    static constraints = {
        text(size:10..500) 

    }

    String toString() {
        "Rating ${rating}, User: ${createdBy}, Created: ${created}"
    }
}
