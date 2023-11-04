package personal_expense_tracker

import org.flywaydb.core.Flyway
import javax.sql.DataSource
import org.sqlite.SQLiteDataSource


class App {
    val greeting: String
        get() {
            return "Hello World!"
        }
}

fun main() {
    println(App().greeting)
    val dataSource: DataSource = SQLiteDataSource().apply {
        setUrl("jdbc:sqlite:personal_expense_tracker.db")
    }
    val flyway = Flyway.configure()
        .dataSource(dataSource)
        .locations("classpath:db/migration")
        .cleanDisabled(false)
        .load()
    
    flyway.migrate()
}
