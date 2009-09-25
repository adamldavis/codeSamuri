class Comment {
    String text
    int rating = 1
    Date created = new Date()
    User createdBy

    static constraints = {
        text(size:10..150)
    }
}
