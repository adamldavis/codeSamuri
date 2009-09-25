import java.util.Date;

class Request {
    String title
    String text
    int rating
    Date created =  new Date()
    User createdBy

    static hasMany = [responses: Response]

    static constraints = {
        title(size:10..50, unique:true)
        text(size:10..500)

    }

    String toString() {
        title
    }
}
