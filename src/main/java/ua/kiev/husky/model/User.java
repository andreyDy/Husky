package ua.kiev.husky.model;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;
import ua.kiev.husky.validation.RegistrationForm;
import ua.kiev.husky.validation.UserForm;

import javax.persistence.*;
import java.util.Set;


@Entity
@Table(name = "Users")
public class User {
    @Id
    @GeneratedValue
    private int id;

    @Column(name="first_name", nullable = false)
    private String firstName;

    @Column(name="last_name", nullable = false)
    private String lastName;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String password;

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    @Column(name="date_birth")
    private LocalDate birthday;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "UserCourses",
            joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "course_id", referencedColumnName = "id"))
    private Set<Course> courses;

    @OneToMany(mappedBy = "teacher", fetch = FetchType.EAGER)
    private Set<Course> ownCourses;

    protected User() {
    }

    public User(RegistrationForm userForm) {
        this.firstName = userForm.getFirstName();
        this.lastName = userForm.getLastName();
        this.email = userForm.getEmail();
        this.password = userForm.getPassword();
    }

    public User(UserForm userForm, String email) {
        this.firstName = userForm.getFirstName();
        this.lastName = userForm.getLastName();
        this.email = email;
        this.password = userForm.getPassword();
        this.birthday = userForm.getBirthday();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public Set<Course> getCourses() {
        return courses;
    }

    public void setCourses(Set<Course> courses) {
        this.courses = courses;
    }

    public Set<Course> getOwnCourses() {
        return ownCourses;
    }

    public void setOwnCourses(Set<Course> ownCourses) {
        this.ownCourses = ownCourses;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (id != user.id) return false;
        return email != null ? email.equals(user.email) : user.email == null;

    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (email != null ? email.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("User{");
        sb.append("id=").append(id);
        sb.append(", firstName='").append(firstName).append('\'');
        sb.append(", lastName='").append(lastName).append('\'');
        sb.append(", email='").append(email).append('\'');
        sb.append(", password='").append(password).append('\'');
        sb.append(", birthday=").append(birthday);
        sb.append(", courses=").append(courses);
        sb.append(", ownCourses=").append(ownCourses);
        sb.append('}');
        return sb.toString();
    }
}
