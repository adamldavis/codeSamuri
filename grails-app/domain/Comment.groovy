class Comment {
    String text
    int rating = 1
    Date created = new Date()
    User createdBy
    Response response

    static constraints = {
        text(size:10..200)
    }

    String toString() {
        text
    }
}
